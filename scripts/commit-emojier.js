const { GoogleGenerativeAI, } = require("@google/generative-ai");
const fs = require("fs")

const apiKey = process.env.GEMINI_API_KEY;
const genAI = new GoogleGenerativeAI(apiKey);

const prompt = fs.readFileSync(`${__dirname}/prompt.txt`, { encoding: "utf-8" })

const model = genAI.getGenerativeModel({
    model: "gemini-1.5-flash",
    systemInstruction: prompt,
});

const generationConfig = {
    temperature: 1,
    topP: 0.95,
    topK: 64,
    maxOutputTokens: 8192,
    responseMimeType: "text/plain",
};

async function run() {
    const chatSession = model.startChat({
        generationConfig,
        history: [],
    });

    const args = process.argv.slice(2)
    const gitCommitMessage = args[0]
    const gitDiff = args[1]

    const message = {
        gitCommitMessage,
        gitDiff
    }

    const result = await chatSession.sendMessage(JSON.stringify(message));
    console.log(result.response.text().trim());
}

run();
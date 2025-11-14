<p align="left">
  <a href="README_en.md"><img src="https://img.shields.io/badge/English Mode-blue.svg" alt="English"></a>
  <a href="README.md"><img src="https://img.shields.io/badge/日本語 モード-red.svg" alt="日本語"></a>
</p>


# Introduction

This repository provides a prompt designed to generate technical articles (in Qiita format) based on specified information.

# Usage Instructions

## Prerequisites

This prompt assumes that you are using GitHub Copilot from within VS Code to have AI generate the article for you.
Please note that behavior may differ in other environments. <br>
Also, since copyright handling has not yet been implemented, **you must manually review** any generated articles yourself. <br>

## 1. Clone this repository

## 2. Provide technical information (text or URL) to the following prompt and execute it

```
/01_記事整理
```

## 3. Execute the following prompt

```
/02_記事セクション作成
```

## 4. Provide the desired word count to the following prompt and execute it

```
/03_記事作成
```

## 5. Execute the following prompt

```
/04_記事レビュー
```

---

# How to Create Writing Style & Tone

I’m planning to create a custom prompt that automatically extracts writing style and tone.
Until that’s ready, you can extract the “style & tone” using the method below.

## 1. Ask ChatGPT (the free plan is fine) to extract the style & tone by pasting the following:

```
Please extract the “writing style and tone” in Markdown format from the URL below.
I will use it as the “rules” for generating future AI-written articles.

https://qiita.com/ochtum/items/750413e44b0d296387ef
```

## 2. Paste the extracted “style & tone” into:

`.specify\memory\文体・トーン-constitution.md`

# Changing the Format

If you want a format other than Qiita, you can modify `templates\記事作成-template.md` to change the output format.

# About Article Design

The rules for article design are written in the section “Rules for Section Design” to “Steps, Notes, and Tips” inside
`.specify\memory\文体・トーン-constitution.md`<br>
You can change the design of your articles by editing this part.

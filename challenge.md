
# Backend Engineer Code Challenge - Levee

Through this challenge, we want to know your development skills and especially how you solve problems.

## No time to take the challenge?

You can send a pull request link with your contribution to any Open Source project or any project of your own that you believe demonstrates your technical level and the quality of your code.
Remember that the more code we view, the better it will be for us to evaluate you. :)

## About the challenge

We have a data subset with some job openings separated by category (file "jobs.txt"). See the structure below:


| partnerId | title  | categoryId | ExpiresAt |
| ---       | ---    | ---        | :--:      |
| 1123      | Seller | 3          | 1/21/2018 |


Based on this data, we want you to create 2 applications:

1. The first application must be a REST API for:
  - create, activate and list jobs;
  - list the percentage and number of active jobs by category.

2. The second application should be responsible for reading the file "jobs.txt", upload information regarding jobs, and serve application 1.

When loading this data, this application must be responsible for encrypting and storing it.

The information must travel between applications in an encrypted manner, consequently with application 1 having the ability to decrypt them. It is up to you to choose the way the applications will communicate.

Make sure:
- That the application is ʻidempotent`, for that you can consider that the partnerID attribute of each job is always unique during the import;
- Import only jobs where the date on which it will expire is greater than the date of import;
- That all newly created jobs have the 'draft' status.

### Endpoints

The endpoints available in the application are listed below. Those classified as `Protected` must require authentication, however the method used is at your discretion.

| Name       | Method    | URL                  | Protected |
| ---        | ---       | ---                  | :--:      |
| List       | GET       | /jobs                | ✓         |
| Create     | POST      | /jobs                | ✓         |
| Activate   | POST      | /jobs/{:id}/activate | ✓         |
| Percentage | GET       | /category/{:id}      | ✘         |

## Prerequisites

Your test must have a README with the necessary steps to:

- Install the dependencies;
- Run automated tests.
- Run the project;

### Technology

Ruby, Go or Python.

### We like:

- Structured commits;
- Documentation;
- Tests;
- Docker;
- CI;
- Message queues.

## What is being evaluated

Your ability to understand a problem, design a solution and apply it.
We want to see how you solve the proposed problem and your skills with the proposed technologies.

## Submission

To send us your code, you can:

- Fork this repository and send us a pull request.
- Give us access to your repository on github, bitbucket or gitlab. Add the user bonigauglitz.
- If you need to talk to us: engineering@levee.com

# AWS Resource Tracker 🛠️

A lightweight Bash script to generate a consolidated report of key AWS resource usage ( S3 buckets, EC2 instances, Lambda functions, and IAM users )  and log the output to a file.

---

## 📋 Overview

This script automates the process of querying your AWS environment and producing a clean, timestamped report. It's useful for quick audits, daily check-ins, or as a foundation for more advanced monitoring pipelines.

**Tracked Resources:**
- Amazon S3 Buckets
- EC2 Instances (with Availability Zone and State)
- Lambda Functions
- IAM Users

---

## 📁 Files

| File | Description |
|---|---|
| `aws_resource_tracker.sh` | Main Bash script that queries AWS and writes the report |
| `resourceTracker` | Output file where the report is appended on each run |

---

## ✅ Prerequisites

Before running the script, ensure the following are in place:

1. **AWS CLI** — installed and configured ([Installation Guide](https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2.html))
2. **AWS Credentials** — configured via `aws configure` and added the Access keys generated from the AWS Security Credentials

---

## 🚀 Usage

1. **Clone the repository:**
   ```bash
   git clone https://github.com/thiwanka-mpj/aws-bash-scripts.git
   cd aws-bash-scripts
   ```

2. **Make the script executable:**
   ```bash
   chmod +x aws_resource_tracker.sh
   ```

3. **Run the script:**
   ```bash
   ./aws_resource_tracker.sh
   ```

4. **View the report:**
   ```bash
   cat resourceTracker
   ```

Each run **overwrites** a new timestamped report to `resourceTracker`.

---

## 📄 Sample Output

```
==========================================
AWS Resource Report - Mon May 25 14:57:14 UTC 2026
==========================================
Print list of S3 buckets:
2026-05-25 10:31:18 thiwanka-bucket-1
2026-05-25 10:31:38 thiwanka-bucket-2
2026-05-25 10:31:44 thiwanka-bucket-3

Print list of EC2 Instances:
--------------------------------------------------
|                DescribeInstances               |
+-------------+-----------------------+----------+
|     AZ      |       Instance        |  State   |
+-------------+-----------------------+----------+
|  us-east-1a |  i-0f7ccdb0a30dd0901  |  running |
+-------------+-----------------------+----------+

Print list of Lambda Functions:

Print list of IAM Users:
```

---

## ⚙️ Configuration

The script uses `set -x` (debug mode) by default, which prints each command to stderr as it executes. If you want to disable this for cleaner terminal output, remove or comment out the `set -x` line at the top of the script:

```bash
# set -x
```

---

## 🔄 Automating with Cron

To run the tracker automatically on a schedule, add a cron job:

```bash
crontab -e
```

Example — run every day at 8:00 AM:
```
0 8 * * * /path/to/aws_resource_tracker.sh
```

---

## 📌 Notes

- The report is **overwitten** (not appended) to `resourceTracker` on every run. To append, change this in the script: `>> resourceTracker`
- Ensure the AWS CLI region is set correctly in your config (`~/.aws/config`) or by exporting `AWS_DEFAULT_REGION`

---

## 👤 Author

**Janith Thiwanka**  
Version: v1.0 - May 25, 2026

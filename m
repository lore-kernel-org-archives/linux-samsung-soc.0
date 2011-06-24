From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [PATCH V2 0/6] S5PV210: Update
Date: Fri, 24 Jun 2011 16:04:12 +0900
Message-ID: <1308899058-24318-1-git-send-email-kgene.kim@samsung.com>
Return-path: <cpufreq-owner@vger.kernel.org>
Sender: cpufreq-owner@vger.kernel.org
To: cpufreq@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: davej@redhat.com
List-Id: linux-samsung-soc@vger.kernel.org

Changes since v1:
- Address comments from Mark Brown (Thanks, Mark)

[PATCH V2 1/6] [CPUFREQ] S5PV210: Add additional symantics for "relation" in cpufreq with pm
[PATCH V2 2/6] [CPUFREQ] S5PV210: Add arm/int voltage control support
[PATCH V2 3/6] [CPUFREQ] S5PV210: Add pm_notifier to prevent system unstable
[PATCH V2 4/6] [CPUFREQ] S5PV210: Lock a mutex while changing the cpu frequency
[PATCH V2 5/6] [CPUFREQ] S5PV210: Adjust udelay prior to voltage scaling down
[PATCH V2 6/6] [CPUFREQ] S5PV210: Add reboot notifier to prevent system hang

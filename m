From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [PATCH 0/5] EXYNOS: Update and Cleanup for EXYNOS SoCs
Date: Tue,  6 Dec 2011 19:13:05 +0900
Message-ID: <1323166390-10980-1-git-send-email-kgene.kim@samsung.com>
Return-path: <cpufreq-owner@vger.kernel.org>
Sender: cpufreq-owner@vger.kernel.org
To: cpufreq@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: davej@redhat.com
List-Id: linux-samsung-soc@vger.kernel.org

This patch includes following.

- removed bus frequency feature
- changed frequency table for stability
- created common exynos cpufreq framework for support other EXYNOS SoCs
- and cleanup

[PATCH 1/5] [CPUFREQ] EXYNOS4210: Remove code about bus on cpufreq
[PATCH 2/5] [CPUFREQ] EXYNOS4210: Update frequency table for cpu divider
[PATCH 3/5] [CPUFREQ] EXYNOS4210: cpufreq code is changed for stable working
[PATCH 4/5] [CPUFREQ] EXYNOS: Make EXYNOS common cpufreq driver
[PATCH 5/5] [CPUFREQ] EXYNOS: Removed useless headers and codes

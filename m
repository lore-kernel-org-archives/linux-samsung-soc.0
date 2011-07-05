From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [PATCH 0/4] EXYNOS4210: Update exynos4210-cpufreq.c
Date: Tue,  5 Jul 2011 17:06:15 +0900
Message-ID: <1309853179-19438-1-git-send-email-kgene.kim@samsung.com>
Return-path: <cpufreq-owner@vger.kernel.org>
Sender: cpufreq-owner@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, cpufreq@vger.kernel.org
Cc: davej@redhat.com
List-Id: linux-samsung-soc@vger.kernel.org

This patch updates CPU table and divider to support 1.2GHz in stable and
removes unused codes like regarding bus freq codes.

[PATCH 1/4] [CPUFREQ] EXYNOS4210: Remove regarding busfreq codes
[PATCH 2/4] [CPUFREQ] EXYNOS4210: Change CPU table and divider
[PATCH 3/4] [CPUFREQ] EXYNOS4210: Cleanup sequence and unused codes
[PATCH 4/4] [CPUFREQ] EXYNOS4210: Add Support for DVS Lock

From: Jingoo Han <jg1.han@samsung.com>
Subject: [PATCH] cpufreq: exynos: add missing variable initialization
Date: Tue, 05 Feb 2013 11:26:54 +0900
Message-ID: <000301ce0348$43aec960$cb0c5c20$%han@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:30459 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754087Ab3BEC04 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 4 Feb 2013 21:26:56 -0500
Received: from epcpsbgm1.samsung.com (epcpsbgm1 [203.254.230.26])
 by mailout2.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MHQ00FK26SV87K0@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 05 Feb 2013 11:26:55 +0900 (KST)
Received: from DOJG1HAN02 ([12.23.120.99])
 by mmp2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0MHQ00ARV6SUNEA0@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 05 Feb 2013 11:26:54 +0900 (KST)
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Kukjin Kim' <kgene.kim@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, rjw@sisk.pl, jhbird.choi@samsung.com, 'Jingoo Han' <jg1.han@samsung.com>

Fixed build warning as below:

drivers/cpufreq/exynos-cpufreq.c: In function 'exynos_target':
drivers/cpufreq/exynos-cpufreq.c:182:2: warning: 'ret' may be used uninitialized in this function [-Wuninitialized]

Signed-off-by: Jingoo Han <jg1.han@samsung.com>
---
 drivers/cpufreq/exynos-cpufreq.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/cpufreq/exynos-cpufreq.c b/drivers/cpufreq/exynos-cpufreq.c
index 88401ba..4268e46 100644
--- a/drivers/cpufreq/exynos-cpufreq.c
+++ b/drivers/cpufreq/exynos-cpufreq.c
@@ -159,7 +159,7 @@ static int exynos_target(struct cpufreq_policy *policy,
 {
 	struct cpufreq_frequency_table *freq_table = exynos_info->freq_table;
 	unsigned int index;
-	int ret;
+	int ret = 0;
 
 	mutex_lock(&cpufreq_lock);
 
-- 
1.7.2.5

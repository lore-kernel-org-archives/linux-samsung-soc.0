From: Jonghwan Choi <jhbird.choi@samsung.com>
Subject: [PATCH 2/5 RESEND] cpufreq: exynos: Check old & new frequency early
Date: Mon, 10 Dec 2012 16:22:37 +0900
Message-ID: <002601cdd6a7$21d2ad70$65780850$%choi@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:33501 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752185Ab2LJHWj (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 10 Dec 2012 02:22:39 -0500
Received: from epcpsbgm1.samsung.com (epcpsbgm1 [203.254.230.26])
 by mailout1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MET0043O0GP4BU0@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 10 Dec 2012 16:22:38 +0900 (KST)
Received: from DOJHBIRDCHO03 ([12.23.118.55])
 by mmp2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0MET00EOA0HP5790@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 10 Dec 2012 16:22:38 +0900 (KST)
References: 
In-reply-to: 
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Jonghwan Choi' <jhbird.choi@samsung.com>, linux-samsung-soc@vger.kernel.org
Cc: 'Kukjin Kim' <kgene.kim@samsung.com>, 'Jaecheol Lee' <jc.lee@samsung.com>, "'Rafael J. Wysocki'" <rjw@sisk.pl>, 'Russell King' <linux@arm.linux.org.uk>

If old & new freq have the same frequency, no need to call
cpufreq notifier & regulator function.

Signed-off-by: Jonghwan Choi <jhbird.choi@samsung.com>
---
 drivers/cpufreq/exynos-cpufreq.c |    7 +++++--
 1 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/cpufreq/exynos-cpufreq.c
b/drivers/cpufreq/exynos-cpufreq.c
index 5888aee..82963a3 100644
--- a/drivers/cpufreq/exynos-cpufreq.c
+++ b/drivers/cpufreq/exynos-cpufreq.c
@@ -87,6 +87,9 @@ static int exynos_target(struct cpufreq_policy *policy,
 	freqs.new = freq_table[index].frequency;
 	freqs.cpu = policy->cpu;
 
+	if (freqs.new == freqs.old)
+		goto out;
+
 	/*
 	 * ARM clock source will be changed APLL to MPLL temporary
 	 * To support this level, need to control regulator for
@@ -112,8 +115,8 @@ static int exynos_target(struct cpufreq_policy *policy,
 	if (safe_arm_volt)
 		regulator_set_voltage(arm_regulator, safe_arm_volt,
 				      safe_arm_volt);
-	if (freqs.new != freqs.old)
-		exynos_info->set_freq(old_index, index);
+
+	exynos_info->set_freq(old_index, index);
 
 	cpufreq_notify_transition(&freqs, CPUFREQ_POSTCHANGE);
 
-- 
1.7.4.1

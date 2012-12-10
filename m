From: Jonghwan Choi <jhbird.choi@samsung.com>
Subject: [PATCH 5/5 RESEND] cpufreq: exynos: Add missing static
Date: Mon, 10 Dec 2012 16:22:12 +0900
Message-ID: <002301cdd6a7$131f3ff0$395dbfd0$%choi@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:33392 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751910Ab2LJHWO (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 10 Dec 2012 02:22:14 -0500
Received: from epcpsbgm1.samsung.com (epcpsbgm1 [203.254.230.26])
 by mailout1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MET0043O0GP4BU0@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 10 Dec 2012 16:22:13 +0900 (KST)
Received: from DOJHBIRDCHO03 ([12.23.118.55])
 by mmp1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0MET00HVL0H1BT00@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 10 Dec 2012 16:22:13 +0900 (KST)
References: 
In-reply-to: 
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Jonghwan Choi' <jhbird.choi@samsung.com>, linux-samsung-soc@vger.kernel.org
Cc: 'Kukjin Kim' <kgene.kim@samsung.com>, 'Jaecheol Lee' <jc.lee@samsung.com>, "'Rafael J. Wysocki'" <rjw@sisk.pl>, 'Russell King' <linux@arm.linux.org.uk>

Add missing 'static' qualifiers.

Signed-off-by: Jonghwan Choi <jhbird.choi@samsung.com>
---
 drivers/cpufreq/exynos-cpufreq.c     |    4 ++--
 drivers/cpufreq/exynos4210-cpufreq.c |    2 +-
 drivers/cpufreq/exynos4x12-cpufreq.c |    2 +-
 drivers/cpufreq/exynos5250-cpufreq.c |    2 +-
 4 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/cpufreq/exynos-cpufreq.c
b/drivers/cpufreq/exynos-cpufreq.c
index b0338e1..1bd3e3a 100644
--- a/drivers/cpufreq/exynos-cpufreq.c
+++ b/drivers/cpufreq/exynos-cpufreq.c
@@ -31,13 +31,13 @@ static unsigned int locking_frequency;
 static bool frequency_locked;
 static DEFINE_MUTEX(cpufreq_lock);
 
-int exynos_verify_speed(struct cpufreq_policy *policy)
+static int exynos_verify_speed(struct cpufreq_policy *policy)
 {
 	return cpufreq_frequency_table_verify(policy,
 					      exynos_info->freq_table);
 }
 
-unsigned int exynos_getspeed(unsigned int cpu)
+static unsigned int exynos_getspeed(unsigned int cpu)
 {
 	return clk_get_rate(exynos_info->cpu_clk) / 1000;
 }
diff --git a/drivers/cpufreq/exynos4210-cpufreq.c
b/drivers/cpufreq/exynos4210-cpufreq.c
index 250dcf0..de91755 100644
--- a/drivers/cpufreq/exynos4210-cpufreq.c
+++ b/drivers/cpufreq/exynos4210-cpufreq.c
@@ -114,7 +114,7 @@ static void exynos4210_set_apll(unsigned int index)
 	} while (tmp != (0x1 << EXYNOS4_CLKSRC_CPU_MUXCORE_SHIFT));
 }
 
-bool exynos4210_pms_change(unsigned int old_index, unsigned int new_index)
+static bool exynos4210_pms_change(unsigned int old_index, unsigned int
new_index)
 {
 	unsigned int old_pm = apll_freq_4210[old_index].mps >> 8;
 	unsigned int new_pm = apll_freq_4210[new_index].mps >> 8;
diff --git a/drivers/cpufreq/exynos4x12-cpufreq.c
b/drivers/cpufreq/exynos4x12-cpufreq.c
index 224445d..0661039 100644
--- a/drivers/cpufreq/exynos4x12-cpufreq.c
+++ b/drivers/cpufreq/exynos4x12-cpufreq.c
@@ -166,7 +166,7 @@ static void exynos4x12_set_apll(unsigned int index)
 	} while (tmp != (0x1 << EXYNOS4_CLKSRC_CPU_MUXCORE_SHIFT));
 }
 
-bool exynos4x12_pms_change(unsigned int old_index, unsigned int new_index)
+static bool exynos4x12_pms_change(unsigned int old_index, unsigned int
new_index)
 {
 	unsigned int old_pm = apll_freq_4x12[old_index].mps >> 8;
 	unsigned int new_pm = apll_freq_4x12[new_index].mps >> 8;
diff --git a/drivers/cpufreq/exynos5250-cpufreq.c
b/drivers/cpufreq/exynos5250-cpufreq.c
index 736a5cf..b934486 100644
--- a/drivers/cpufreq/exynos5250-cpufreq.c
+++ b/drivers/cpufreq/exynos5250-cpufreq.c
@@ -143,7 +143,7 @@ static void set_apll(unsigned int new_index,
 
 }
 
-bool exynos5250_pms_change(unsigned int old_index, unsigned int new_index)
+static bool exynos5250_pms_change(unsigned int old_index, unsigned int
new_index)
 {
 	unsigned int old_pm = apll_freq_5250[old_index].mps >> 8;
 	unsigned int new_pm = apll_freq_5250[new_index].mps >> 8;
-- 
1.7.4.1

From: Seungwhan Youn <sw.youn@samsung.com>
Subject: [PATCH 6/10] ARM: S5PV210: Add audio clocks as sysclk
Date: Mon,  4 Oct 2010 20:57:48 +0900
Message-ID: <1286193468-18510-1-git-send-email-sw.youn@samsung.com>
References: <1286191550-22197-1-git-send-email-sw.youn@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ganesha.gnumonks.org ([213.95.27.120]:47752 "EHLO
	ganesha.gnumonks.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755429Ab0JDMRq (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 4 Oct 2010 08:17:46 -0400
In-Reply-To: <1286191550-22197-1-git-send-email-sw.youn@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, alsa-devel@alsa-project.org
Cc: ben-linux@fluff.org, kgene.kim@samsung.com, lrg@slimlogic.co.uk, broonie@opensource.wolfsonmicro.com, jassi.brar@samsung.com, Seungwhan Youn <sw.youn@samsung.com>

This patch adds audio clocks(SCLK_AUDIO{0,1,2} and SCLK_AUDIO) to be
initial as a sysclk on boot-time.

Signed-off-by: Seungwhan Youn <sw.youn@samsung.com>
---
 arch/arm/mach-s5pv210/clock.c |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-s5pv210/clock.c b/arch/arm/mach-s5pv210/clock.c
index 195a088..3f3b7ba 100644
--- a/arch/arm/mach-s5pv210/clock.c
+++ b/arch/arm/mach-s5pv210/clock.c
@@ -997,6 +997,10 @@ static struct clksrc_clk *sysclks[] = {
 	&clk_sclk_dac,
 	&clk_sclk_pixel,
 	&clk_sclk_hdmi,
+	&clk_sclk_audio0,
+	&clk_sclk_audio1,
+	&clk_sclk_audio2,
+	&clk_sclk_spdif,
 };
 
 void __init_or_cpufreq s5pv210_setup_clocks(void)
-- 
1.6.2.5

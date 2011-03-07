From: Sangbeom Kim <sbkim73@samsung.com>
Subject: [PATCH V3 0/3] ARM: S5P: Add HRT support for s5p series
Date: Mon,  7 Mar 2011 09:09:11 +0900
Message-ID: <1299456554-15280-1-git-send-email-sbkim73@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ganesha.gnumonks.org ([213.95.27.120]:36549 "EHLO
	ganesha.gnumonks.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753218Ab1CGAjH (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 6 Mar 2011 19:39:07 -0500
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, ben-linux@fluff.org

Changes since v2:
 - Add S5P_HRT configuration for s5p_timer
 
Changes since v1:
 - Add sched_clock support (Linus Walleij)
 - Add clockevents_calc_mult_shift
 - Modify clk_get scheme
 - Default clockevent is PWM timer3
 
The patch series contains:

[PATCH V3 1/3] This patch adds support HR-Timer(High Resolution Timer)
[PATCH V3 2/3] This patch modify s5pv210_defconfig and s5p64x0_defconfig
[PATCH V3 3/3] This patch update mach-s5p64x0 and mach-s5pv210

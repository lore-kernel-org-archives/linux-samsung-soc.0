From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [PATCH 0/2] Add s5p_reset_hook() for S5P SoCs' SWRESET
Date: Fri, 23 Jul 2010 21:43:57 +0900
Message-ID: <1279889039-9718-1-git-send-email-kgene.kim@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ganesha.gnumonks.org ([213.95.27.120]:44041 "EHLO
	ganesha.gnumonks.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757709Ab0GWM4n (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 23 Jul 2010 08:56:43 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: ben-linux@fluff.org

This patch adds s5p_reset_hook() for S5P SoCs' SWRESET and
s5pv210_sw_reset() for S5PV210/S5PC110 SWRESET.

NOTE: depends on following patch set.

[PATCH 2/3] ARM: S5P: Add System define for arch_reset()
[PATCH 3/3] ARM: S5P: Add Support common arch_reset() for S5P SoCs

And this patch set includes the following patches:

[PATCH 1/2] ARM: S5P: Add s5p_reset_hook() for perform reset using SWRESET on S5P SoCs
[PATCH 2/2] ARM: S5PV210: Add s5pv210_sw_reset for SWRESET

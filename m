From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [PATCH] ARM: S5P: Add Support common arch_reset() for S5P SoCs
Date: Thu, 24 Jun 2010 07:31:54 +0900
Message-ID: <1277332317-30192-1-git-send-email-kgene.kim@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ganesha.gnumonks.org ([213.95.27.120]:60065 "EHLO
	ganesha.gnumonks.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753893Ab0FWWgT (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 23 Jun 2010 18:36:19 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: ben-linux@fluff.org

This patch adds system define for arch_reset() for S5P SoCs
such as S5P6440, S5P6442, S5PC100 and S5PV210/S5PC110.
Now perform reset using Watchdog reset, SWRESET support with
s5p_reset_hook() will be added later.

NOTE: depends on 'Add Watchdog support for S5PC100'

ARM: S5P6442: Add Watchdog Timer map for S5P6442
ARM: S5P: Add System define for arch_reset()
ARM: S5P: Add Support common arch_reset() for S5P SoCs

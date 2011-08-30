From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [PATCH 0/7] gpio/samsung: Add support Samsung GPIO with gpio-samsung.c
Date: Tue, 30 Aug 2011 21:27:22 +0900
Message-ID: <1314707249-12241-1-git-send-email-kgene.kim@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ganesha.gnumonks.org ([213.95.27.120]:59529 "EHLO
	ganesha.gnumonks.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753743Ab1H3Mop (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 30 Aug 2011 08:44:45 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: ben-linux@fluff.org

This patch merges existing many Samsung GPIO drivers into the one
drivers/gpio/gpio-samsung.c.

[PATCH 1/7 (RE-SEND)] gpio/s3c24xx: move gpio driver into drivers/gpio/
[PATCH 2/7 (RE-SEND)] gpio/s3c64xx: move gpio driver into drivers/gpio/
[PATCH 3/7 (RE-SEND)] gpio/s5p64x0: move gpio driver into drivers/gpio/
[PATCH 4/7] gpio/samsung: Remove useless old Samsung related GPIO drivers
[PATCH 5/7] gpio/samsung: Added gpio-samsung.c to support Samsung GPIOs
[PATCH 6/7] ARM: SAMSUNG: Update the name of regarding Samsung GPIO
[PATCH 7/7] ARM: SAMSUNG: Remove useless Samsung GPIO related CONFIGs

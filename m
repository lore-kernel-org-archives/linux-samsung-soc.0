From: Sangbeom Kim <sbkim73@samsung.com>
Subject: [PATCH 0/4] ARM: S5P64X0: Add Power Management Support
Date: Thu,  9 Dec 2010 17:11:53 +0900
Message-ID: <1291882317-20411-1-git-send-email-sbkim73@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ganesha.gnumonks.org ([213.95.27.120]:40881 "EHLO
	ganesha.gnumonks.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754578Ab0LII3n (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 9 Dec 2010 03:29:43 -0500
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, ben-linux@fluff.org

This patch adds suspend-to-ram support for S5P64X0
Note. This patch is confirmed on SMDK6440 and SMDK6450 board.
      S5P64X0 EINT patch is needed for this patch

[PATCH 1/4] ARM: S5P: Make the common S5P PM code conditionally compile
[PATCH 2/4] ARM: S5P64X0: Add Power Management support
[PATCH 3/4] ARM: S5P64X0: Fix incorrect serial clock name
[PATCH 4/4] ARM: S5P64X0: Enable pm save/restore functions for GPIO banks

From: Sangbeom Kim <sbkim73@samsung.com>
Subject: [PATCH 0/4] ARM: S5PV310: Add support FIMD
Date: Mon, 18 Oct 2010 21:55:24 +0900
Message-ID: <1287406528-15324-1-git-send-email-sbkim73@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ganesha.gnumonks.org ([213.95.27.120]:39782 "EHLO
	ganesha.gnumonks.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753939Ab0JRNCQ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 18 Oct 2010 09:02:16 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-fbdev@vger.kernel.org
Cc: ben-linux@fluff.org, kgene.kim@samsung.com, akpm@linux-foundation.org

This patch adds support FIMD(Fully Interactive Mobile Display) on S5PV310 and S5PC210.
The 3rd patch is update s3c-fb for it and others are for platform data.

[PATCH 1/4] ARM: S5PV310: Add FIMD resource definition
[PATCH 2/4] ARM: S5PV310: Add platform device and helper functions for FIMD
[PATCH 3/4] s3c-fb: Add support S5PV310 FIMD
[PATCH 4/4] ARM: S5PV310: Add platform data for S5PV310 FIMD and LTE480WV platform-lcd

From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [PATCH v4 0/0] Adds TSADC support for S3C64XX, S5P6440, and S5PV210
Date: Thu, 20 May 2010 11:39:51 +0900
Message-ID: <1274323194-16059-1-git-send-email-kgene.kim@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ganesha.gnumonks.org ([213.95.27.120]:56856 "EHLO
	ganesha.gnumonks.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751390Ab0ETCnE (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 19 May 2010 22:43:04 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: ben-linux@fluff.org

This patches add TSADC support for S3C64XX, S5P6440 and S5PV210 which were
made against Ben Dooks' tree on for-2635-2/samsung-ts branch.

Now SMDK6410, SMDK6440 and SMDKV210 are availabe and will add SMDKC110.

[PATCH v4 1/3] ARM: S3C64XX: Adds Touchscreen support for S3C64XX
[PATCH v4 2/3] ARM: S5P6440: Adds Touchscreen support for S5P6440
[PATCH v4 3/3] ARM: S5PV210: Adds Touchscreen support for S5PV210

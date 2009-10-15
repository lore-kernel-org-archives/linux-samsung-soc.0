From: Thomas Abraham <thomas.ab@samsung.com>
Subject: [PATCH v2 0/4] S3C: sdhci: Update Samsung 6410 SDHCI driver.
Date: Thu, 15 Oct 2009 14:22:57 +0900
Message-ID: <1255584177-4520-1-git-send-email-thomas.ab@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ganesha.gnumonks.org ([213.95.27.120]:46260 "EHLO
	ganesha.gnumonks.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751498AbZJOF2R (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 15 Oct 2009 01:28:17 -0400
Received: from uucp by ganesha.gnumonks.org with local-bsmtp (Exim 4.63)
	(envelope-from <thomas.ab@samsung.com>)
	id 1MyIsG-0005nG-HG
	for linux-samsung-soc@vger.kernel.org; Thu, 15 Oct 2009 07:27:40 +0200
Received: from localhost ([127.0.0.1] helo=localhost.localdomain)
	by meercat.kr.gnumonks.org with esmtp (Exim 4.68)
	(envelope-from <thomas.ab@samsung.com>)
	id 1MyInh-0001Co-BM
	for linux-samsung-soc@vger.kernel.org; Thu, 15 Oct 2009 14:22:57 +0900
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org

This patch set is updated version of the patch set
"[PATCH 0/8] s3c6410: sdhci: Update Samsung 6410 SDHCI driver". All the
comments from Ben Dooks and Jassi have been addressed in this patch set.

This patch set updates Samsung's 6410 SDHCI driver. This patch set
adds SDHCI controller clock configuration code, adds ADMA support and
adds module exit functionality. This patch set includes the following
patches

[PATCH v2 1/4] S3C: sdhci: Fix incorrect clock option for SDHCI base clock.
[PATCH v2 2/4] S3C: sdhci: Update sdhci platform data.
[PATCH v2 3/4] S3C: sdhci: Configure clock source and populate module exit function. 
[PATCH v2 4/4] S3C: sdhci: Enable ADMA feature in S3C sdhci controller. 

This patch sets depends on the following patches for proper functioning.

[PATCH 1/4] s3c6410: use correct divider_shift in setrate_clksrc()
[PATCH 2/4] s3c6410: update clk->parent when setting clock source
[PATCH 3/4] s3c6410: Fix divider value calculation in s3c64xx_roundrate_clksrc
[PATCH 4/4] s3c6410: Remove redundant mpll parent assignment
[PATCH] sdhci: Add new quirk in sdhci driver and update ADMA descriptor build

--
1.5.3.4

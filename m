From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [PATCH 0/5] ARM: S5P: Update DMA operation clock
Date: Thu, 21 Oct 2010 09:58:28 +0900
Message-ID: <1287622713-1657-1-git-send-email-kgene.kim@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ganesha.gnumonks.org ([213.95.27.120]:41931 "EHLO
	ganesha.gnumonks.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755286Ab0JUBHr (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 20 Oct 2010 21:07:47 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: ben-linux@fluff.org

This patch updates Peri-DMA (PL330) operation clock on S5P SoCs which
have PL330 DMAC. Basically, registered PDMA clocks as disabled clock
and enabled when called pl330-probe() in s3c-pl330.c.

[PATCH 1/5] ARM: S5P6442: Add DMA operation clock
[PATCH 2/5] ARM: S5PV210: Add DMA operation clock
[PATCH 3/5] ARM: S5P64X0: Set DMA clock disable as default
[PATCH 4/5] ARM: S5P: Reorder DMA platform device id
[PATCH 5/5] ARM: SAMSUNG: Add to enable/disable clock on S3C PL330

From: Boojin Kim <boojin.kim@samsung.com>
Subject: DMA: PL330: Merge PL330 drivers
Date: Thu,  8 Dec 2011 10:10:43 +0900
Message-ID: <1323306645-4003-1-git-send-email-boojin.kim@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ganesha.gnumonks.org ([213.95.27.120]:53704 "EHLO
	ganesha.gnumonks.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751497Ab1LJSKZ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 10 Dec 2011 13:10:25 -0500
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: Vinod Koul <vinod.koul@intel.com>, Kukjin Kim <kgene.kim@samsung.com>

In-Reply-To: 

PL330 driver is divided into 2 parts.
First is the PL330 API driver that located on driver/dma/.
Second is the low-level PL330 driver that is located on arch/arm/common/.
But, It's not needed anymore to divided PL330 driver into 2 parts
Low-level PL330 driver is only used for PL330 API driver on driver/dma
because samsung specific S3C-PL330 driver was gone.
So, This patch merges 'arch/arm/common/pl330' into 'driver/dma/pl330.c'.

[PATCH 1/2] DMA: PL330: Merge PL330 drivers
[PATCH 2/2] DMA: PL330: Remove an unused function

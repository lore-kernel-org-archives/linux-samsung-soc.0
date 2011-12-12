From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: PL330: Merge PL330 drivers
Date: Mon, 12 Dec 2011 09:56:10 +0900
Message-ID: <000601ccb868$d711f690$8535e3b0$%kim@samsung.com>
References: <1323306645-4003-1-git-send-email-boojin.kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:18287 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752628Ab1LLA4O (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 11 Dec 2011 19:56:14 -0500
Received: from epcpsbgm1.samsung.com (mailout1.samsung.com [203.254.224.24])
 by mailout1.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LW200BURFXC1Y00@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 12 Dec 2011 09:56:13 +0900 (KST)
Received: from DOKGENEKIM03 ([12.23.120.114])
 by mmp1.samsung.com (Oracle Communications Messaging Exchange Server 7u4-19.01
 64bit (built Sep  7 2010)) with ESMTPA id <0LW200FR9FXM1H90@mmp1.samsung.com>
 for linux-samsung-soc@vger.kernel.org; Mon, 12 Dec 2011 09:56:12 +0900 (KST)
In-reply-to: <1323306645-4003-1-git-send-email-boojin.kim@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Boojin Kim' <boojin.kim@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: 'Vinod Koul' <vinod.koul@intel.com>

Boojin Kim wrote:
> 
> In-Reply-To:
> 
> PL330 driver is divided into 2 parts.
> First is the PL330 API driver that located on driver/dma/.
> Second is the low-level PL330 driver that is located on arch/arm/common/.
> But, It's not needed anymore to divided PL330 driver into 2 parts
> Low-level PL330 driver is only used for PL330 API driver on driver/dma
> because samsung specific S3C-PL330 driver was gone.
> So, This patch merges 'arch/arm/common/pl330' into 'driver/dma/pl330.c'.
> 
> [PATCH 1/2] DMA: PL330: Merge PL330 drivers
> [PATCH 2/2] DMA: PL330: Remove an unused function

Hi all,

Since Boojin's git send-email has problem, this series re-submitted on
Sunday like following :(
Please kindly ignore this series.

[PATCH 1/3] ARM: EXYNOS: Support DMA driver for Exynos4x12 series
[PATCH 2/3] DMA: PL330: Merge PL330 drivers
[PATCH 3/3] DMA: PL330: Remove an unused function

Sorry for bothering.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.

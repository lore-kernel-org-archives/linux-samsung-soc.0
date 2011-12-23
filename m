From: Vinod Koul <vinod.koul@intel.com>
Subject: Re: DMA: PL330: Merge PL330 drivers
Date: Fri, 23 Dec 2011 21:11:03 +0530
Message-ID: <1324654863.1633.3.camel@vkoul-udesk3>
References: <1323306645-4003-1-git-send-email-boojin.kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mga09.intel.com ([134.134.136.24]:7427 "EHLO mga09.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752901Ab1LWPlA (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 23 Dec 2011 10:41:00 -0500
In-Reply-To: <1323306645-4003-1-git-send-email-boojin.kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Boojin Kim <boojin.kim@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Kukjin Kim <kgene.kim@samsung.com>

On Thu, 2011-12-08 at 10:10 +0900, Boojin Kim wrote:
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
You should try git --cover-letter for this :)

-- 
~Vinod

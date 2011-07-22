From: "Koul, Vinod" <vinod.koul@intel.com>
Subject: RE: [PATCH V4 00/13] To use DMA generic APIs for Samsung DMA
Date: Fri, 22 Jul 2011 17:37:20 +0530
Message-ID: <438BB0150E931F4B9CE701519A4463010871DC9B13@bgsmsx502.gar.corp.intel.com>
References: <1311158773-30314-1-git-send-email-boojin.kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mga11.intel.com ([192.55.52.93]:24499 "EHLO mga11.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753954Ab1GVMHu convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 22 Jul 2011 08:07:50 -0400
In-Reply-To: <1311158773-30314-1-git-send-email-boojin.kim@samsung.com>
Content-Language: en-US
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Boojin Kim <boojin.kim@samsung.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>
Cc: "Williams, Dan J" <dan.j.williams@intel.com>, Jassi Brar <jassisinghbrar@gmail.com>, Kukjin Kim <kgene.kim@samsung.com>

> 
> This patchset adds support DMA generic APIs for Samsung DMA.
> V4 doesn't has whole patch series and only has the patches differed from V3.
> 
> Changes from V3:
> - Divided 03-patch into two patchs.
> 	- First is 03-1-patch for DMA_SLAVE_CONFIG command.
> 	- Another is 03-2-patch for DMA_CYCLIC capability.
> - Code clean-up
> 	- Remove unnecessary variable referance.
> 	- Remove redunancy code
> 
> [PATCH V4 01/13] DMA: PL330: Add support runtime PM for PL330 DMAC
> [PATCH V4 03-1/13] DMA: PL330: Support DMA_SLAVE_CONFIG command
> [PATCH V4 03-2/13] DMA: PL330: Add DMA_CYCLIC capability
> [PATCH V4 05/13] ARM: SAMSUNG: Add common DMA operations

Can you pls send entire patchset again,
it makes things difficult to review patches

~Vinod

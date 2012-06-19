From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 3/3] ASoC: follow the updated samsung DMA common operations
Date: Tue, 19 Jun 2012 17:49:46 +0900
Message-ID: <019501cd4df8$7a56cef0$6f046cd0$%kim@samsung.com>
References: <011701cd42eb$a4209940$ec61cbc0$%kim@samsung.com>
 <20120607234540.GU14525@opensource.wolfsonmicro.com>
 <011101cd4de4$f41f59f0$dc5e0dd0$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:8250 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753760Ab2FSIts (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 19 Jun 2012 04:49:48 -0400
Received: from epcpsbgm1.samsung.com (mailout2.samsung.com [203.254.224.25])
 by mailout2.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0M5U004DNWELQO60@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 19 Jun 2012 17:49:47 +0900 (KST)
Received: from DOKGENEKIM03 ([12.23.119.152])
 by mmp2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0M5U00GSCWIYJM50@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 19 Jun 2012 17:49:46 +0900 (KST)
In-reply-to: <011101cd4de4$f41f59f0$dc5e0dd0$%kim@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Boojin Kim' <boojin.kim@samsung.com>, 'Mark Brown' <broonie@opensource.wolfsonmicro.com>
Cc: alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org, 'Russell King - ARM Linux' <linux@arm.linux.org.uk>, 'Vinod Koul' <vinod.koul@intel.com>, 'Grant Likely' <grant.likely@secretlab.ca>, spi-devel-general@lists.sourceforge.net, 'Dan Williams' <dan.j.williams@intel.com>, linux-arm-kernel@lists.infradead.org

Boojin Kim wrote:
> 
> Mark Brown wrote
> > > This patch uses config() function to configure DMA transmit options.
> >
> > Acked-by: Mark Brown <broonie@opensource.wolfsonmicro.com>
> >
Thanks for your ack and let me pick this up in Samsung tree.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.

> > It'd be good if we could get all the older Samsung platforms moved over
> to dmaengine...
> Thanks for your ack :)
> And, Our engineer's preparing to move the older Samsung dma driver into
> dmaengine.

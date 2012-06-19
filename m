From: Boojin Kim <boojin.kim@samsung.com>
Subject: RE: [PATCH 3/3] ASoC: follow the updated samsung DMA common operations
Date: Tue, 19 Jun 2012 15:30:00 +0900
Message-ID: <011101cd4de4$f41f59f0$dc5e0dd0$%kim@samsung.com>
References: <011701cd42eb$a4209940$ec61cbc0$%kim@samsung.com>
 <20120607234540.GU14525@opensource.wolfsonmicro.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:55829 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753756Ab2FSGaD (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 19 Jun 2012 02:30:03 -0400
Received: from epcpsbgm1.samsung.com (mailout1.samsung.com [203.254.224.24])
 by mailout1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0M5U00N1LQ1345S0@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 19 Jun 2012 15:30:01 +0900 (KST)
Received: from DOBOOJINKIM03 ([12.23.119.77])
 by mmp1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0M5U00CHUQ207160@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 19 Jun 2012 15:30:00 +0900 (KST)
In-reply-to: <20120607234540.GU14525@opensource.wolfsonmicro.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Mark Brown' <broonie@opensource.wolfsonmicro.com>
Cc: alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org, 'Russell King - ARM Linux' <linux@arm.linux.org.uk>, 'Vinod Koul' <vinod.koul@intel.com>, 'Grant Likely' <grant.likely@secretlab.ca>, kgene.kim@samsung.com, spi-devel-general@lists.sourceforge.net, 'Dan Williams' <dan.j.williams@intel.com>, linux-arm-kernel@lists.infradead.org

Mark Brown wrote
> > This patch uses config() function to configure DMA transmit options.
>
> Acked-by: Mark Brown <broonie@opensource.wolfsonmicro.com>
>
> It'd be good if we could get all the older Samsung platforms moved over to dmaengine...
Thanks for your ack :)
And, Our engineer's preparing to move the older Samsung dma driver into dmaengine.

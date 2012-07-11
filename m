From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [GIT PULL] Samsung devel-dma ops for v3.6
Date: Wed, 11 Jul 2012 08:18:03 +0000
Message-ID: <201207110818.04091.arnd@arndb.de>
References: <0c5001cd5e41$87daa1b0$978fe510$%kim@samsung.com> <201207101242.41867.arnd@arndb.de> <0e1301cd5f34$008fe1e0$01afa5a0$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from moutng.kundenserver.de ([212.227.126.171]:58589 "EHLO
	moutng.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750829Ab2GKIS3 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 11 Jul 2012 04:18:29 -0400
In-Reply-To: <0e1301cd5f34$008fe1e0$01afa5a0$%kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: 'Mark Brown' <broonie@opensource.wolfsonmicro.com>, 'Olof Johansson' <olof@lixom.net>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 'Grant Likely' <grant.likely@secretlab.ca>, w.sang@pengutronix.de, 'Boojin Kim' <boojin.kim@samsung.com>, 'Kyoungil Kim' <ki0351.kim@samsung.com>, 'Vinod Koul' <vinod.koul@intel.com>, 'Dan Williams' <dan.j.williams@intel.com>, 'Ben Dooks' <ben@simtec.co.uk>

On Wednesday 11 July 2012, Kukjin Kim wrote:
> Yeah, let me explain the status for Samsung SoCs' DMA. There are 3 different
> DMA IPs, samsung specific s3c24xx dma, pl080 and pl330. As you know, pl330
> already moved in drivers/dma for using common DMA engine and Alim is
> re-working on pl080
> (http://www.mail-archive.com/linux-samsung-soc@vger.kernel.org/msg10954.html
> ) and let me check its progress. But s3c24xx dma is not ready yet. When
> pl330 was moving, my colleague, Boojin Kim posted to use common DMA APIs for
> Samsung drivers which are using DMA such as spi and ASoC. But it was
> including too many ifdef for checking which DMA is used and it can occur
> breakage for multiplatform
> (http://www.spinics.net/lists/arm-kernel/msg131137.html). So we implemented
> to use some dma_ops after discussing with Grant Likely
> (http://lists.infradead.org/pipermail/linux-arm-kernel/2011-July/058171.html
> ).
> 
> Anyway, we will try to use common DMA APIs for all Samsung SoCs. But need
> more time ;)

Ok, sounds good. Thanks for the background information!

	Arnd

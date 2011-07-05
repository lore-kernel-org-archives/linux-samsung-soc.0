From: Russell King - ARM Linux <linux@arm.linux.org.uk>
Subject: Re: [PATCH 6/7] spi/s3c64xx: Add support DMA engine API
Date: Tue, 5 Jul 2011 12:27:55 +0100
Message-ID: <20110705112755.GZ8286@n2100.arm.linux.org.uk>
References: <1309781915-31549-1-git-send-email-kgene.kim@samsung.com> <201107041859.11548.heiko@sntech.de> <20110704170217.GH28042@ponder.secretlab.ca> <201107042151.44075.heiko@sntech.de> <20110704232758.GB12824@ponder.secretlab.ca> <00bd01cc3ae1$f1dbfac0$d593f040$%kim@samsung.com> <CABb+yY3UqrbBNS1J1X1gCxPLp8Kv8JSe92Pnb7JpE9x9kqTPiA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from caramon.arm.linux.org.uk ([78.32.30.218]:37691 "EHLO
	caramon.arm.linux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932176Ab1GEL2L (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 5 Jul 2011 07:28:11 -0400
Content-Disposition: inline
In-Reply-To: <CABb+yY3UqrbBNS1J1X1gCxPLp8Kv8JSe92Pnb7JpE9x9kqTPiA@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Jassi Brar <jassisinghbrar@gmail.com>
Cc: Kukjin Kim <kgene.kim@samsung.com>, linux-samsung-soc@vger.kernel.org, Heiko =?iso-8859-1?Q?St=FCbner?= <heiko@sntech.de>, Boojin Kim <boojin.kim@samsung.com>, Vinod Koul <vinod.koul@intel.com>, Mark Brown <broonie@opensource.wolfsonmicro.com>, Grant Likely <grant.likely@secretlab.ca>, Dan Williams <dan.j.williams@intel.com>, Liam Girdwood <lrg@ti.com>, linux-arm-kernel@lists.infradead.org

On Tue, Jul 05, 2011 at 04:46:47PM +0530, Jassi Brar wrote:
> Ideally, like PL330 for S5Pxxxx, drivers/dma/pl080 should be enabled
> for s3c64xx And new generic dma api drivers written for S3C24xx in
> drivers/dma/

Another solution would be to write a DMA engine driver which massages
the Samsung DMA API into the DMA engine way of doing things.  You can
then convert all the Samsung drivers to using DMA engine, and then
sort out the Samsung DMA API as a separate issue.

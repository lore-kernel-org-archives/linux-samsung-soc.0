From: Russell King - ARM Linux <linux@arm.linux.org.uk>
Subject: Re: [PATCH 12/15] spi/s3c64xx: Add support DMA engine API
Date: Sun, 21 Aug 2011 09:46:33 +0100
Message-ID: <20110821084633.GD12028@n2100.arm.linux.org.uk>
References: <1311744697-10264-1-git-send-email-boojin.kim@samsung.com> <1311744697-10264-13-git-send-email-boojin.kim@samsung.com> <CABb+yY3-d0xTO+s0cCPXPW8qGpTH5G2U+bp-0z4Se47eVvJ__w@mail.gmail.com> <CAGOxZ53BRa1=Bnb==jNg_dD0XT2pMSPo=QoHF++LnT6r5kO_Mw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from caramon.arm.linux.org.uk ([78.32.30.218]:54094 "EHLO
	caramon.arm.linux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752070Ab1HUIq4 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 21 Aug 2011 04:46:56 -0400
Content-Disposition: inline
In-Reply-To: <CAGOxZ53BRa1=Bnb==jNg_dD0XT2pMSPo=QoHF++LnT6r5kO_Mw@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Alim Akhtar <alim.akhtar@gmail.com>
Cc: Jassi Brar <jassisinghbrar@gmail.com>, Boojin Kim <boojin.kim@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>, Vinod Koul <vinod.koul@intel.com>, Mark Brown <broonie@opensource.wolfsonmicro.com>, Grant Likely <grant.likely@secretlab.ca>, linux-samsung-soc@vger.kernel.org, Dan Williams <dan.j.williams@intel.com>, linux-arm-kernel@lists.infradead.org, Linus Walleij <linus.walleij@linaro.org>, banajit.g@samsung.com

On Tue, Aug 09, 2011 at 09:43:32AM +0530, Alim Akhtar wrote:
> Exactly, spi_s3c64xx.c (including Sound driver) can not be used with
> pl080 and pl330 (DMAENGINE drivers) as it is.
> Recently I was trying to use PL080 DMAENGINE driver, and i was ended
> up using some #ifdef in the spi driver.
> something like
> #ifdef CONFIG_PL080
> sdd->tx_dmac.bus_id = dmatx_res->name;
> sdd->rx_dmac.bus_id = dmarx_res->name;
> #else
> sdd->tx_dmac.bus_id = dmatx_res->start;
> sdd->tx_dmac.bus_id = dmatx_res->start;
> #endif
> 
> This is because, Pl080 handle the channel as a char *(name) and pl330
> expect the channel to be enum (a number).

The alternative is that you do as the Primecell drivers do (which was
designed from the outset to be independent of the specific dmaengine),
and pass the DMA filter parameters as pointers via platform data.

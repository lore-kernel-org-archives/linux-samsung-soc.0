From: Heiko =?iso-8859-1?q?St=FCbner?= <heiko@sntech.de>
Subject: Re: [PATCH 6/7] spi/s3c64xx: Add support DMA engine API
Date: Mon, 4 Jul 2011 18:59:11 +0200
Message-ID: <201107041859.11548.heiko@sntech.de>
References: <1309781915-31549-1-git-send-email-kgene.kim@samsung.com> <1309781915-31549-7-git-send-email-kgene.kim@samsung.com> <20110704164251.GC28042@ponder.secretlab.ca>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from s15407518.onlinehome-server.info ([82.165.136.167]:48201 "EHLO
	s15407518.onlinehome-server.info" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1755997Ab1GDQ7R (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 4 Jul 2011 12:59:17 -0400
In-Reply-To: <20110704164251.GC28042@ponder.secretlab.ca>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Grant Likely <grant.likely@secretlab.ca>
Cc: Kukjin Kim <kgene.kim@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Vinod Koul <vinod.koul@intel.com>, Dan Williams <dan.j.williams@intel.com>, Jassi Brar <jassisinghbrar@gmail.com>, Liam Girdwood <lrg@ti.com>, Mark Brown <broonie@opensource.wolfsonmicro.com>, Boojin Kim <boojin.kim@samsung.com>

Am Montag 04 Juli 2011, 18:42:51 schrieb Grant Likely:
> On Mon, Jul 04, 2011 at 09:18:34PM +0900, Kukjin Kim wrote:
> > +#if defined(CONFIG_DMADEV_PL330)
> > +			memset(&slave_config, 0, sizeof(slave_config));
> > +			slave_config.direction = DMA_TO_DEVICE;
> > +			slave_config.src_addr = xfer->tx_dma;
> > +			slave_config.dst_addr =
> > +				sdd->sfr_start + S3C64XX_SPI_TX_DATA;
> > +			slave_config.dst_addr_width = sdd->cur_bpw / 8;
> > +			dmaengine_slave_config(sdd->tx_chan, &slave_config);
> > +
> > +			sg_init_table(&tx_sg, 1);
> > +			sg_set_page(&tx_sg, pfn_to_page(PFN_DOWN(xfer->tx_dma)),
> > +				xfer->len, offset_in_page(xfer->tx_dma));
> > +			sg_dma_len(&tx_sg) =  xfer->len;
> > +			sg_dma_address(&tx_sg) = xfer->tx_dma;
> > +			sdd->tx_desc =
> > +				sdd->tx_chan->device->device_prep_slave_sg(
> > +				sdd->tx_chan, &tx_sg, 1, DMA_TO_DEVICE,
> > +				DMA_PREP_INTERRUPT);
> > +			sdd->tx_desc->callback = s3c64xx_spi_dma_txcb;
> > +			sdd->tx_desc->callback_param = sdd;
> > +			dmaengine_submit(sdd->tx_desc);
> > +			dma_async_issue_pending(sdd->tx_chan);
> > +#else
> > 
> >  			s3c2410_dma_config(sdd->tx_dmach, sdd->cur_bpw / 8);
> >  			s3c2410_dma_enqueue(sdd->tx_dmach, (void *)sdd,
> >  			
> >  						xfer->tx_dma, xfer->len);
> >  			
> >  			s3c2410_dma_ctrl(sdd->tx_dmach, S3C2410_DMAOP_START);
> > 
> > +#endif
> 
> Hmmm, this is not pretty.  The driver behaviour is entirely different
> depending on if CONFIG_DMADEV_PL330 is enabled?  When we get to
> multiplatform kernels, is this going to break on some hardware?

> > @@ -802,8 +951,13 @@ static void s3c64xx_spi_work(struct work_struct
> > *work)
> > 
> >  	spin_unlock_irqrestore(&sdd->lock, flags);
> >  	
> >  	/* Free DMA channels */
> > 
> > +#if defined(CONFIG_DMADEV_PL330)
> > +	dma_release_channel(sdd->tx_chan);
> > +	dma_release_channel(sdd->rx_chan);
> > +#else
> > 
> >  	s3c2410_dma_free(sdd->tx_dmach, &s3c64xx_spi_dma_client);
> >  	s3c2410_dma_free(sdd->rx_dmach, &s3c64xx_spi_dma_client);
> > 
> > +#endif
> 
> Wow.  A lot of #ifdefs here.  It does not look multiplatform friendly
> at all.  Are the s3c2410_dma functions obsolete when DMADEV_PL330 is
> selected?  If so, can they be removed entirely, or are they required
> to support certain hardware?

The spi_s3c64xx driver can also support the SPI controller of the 
S3C2416/S3C2443 line of SoCs.
As I'm currently working on a S3C2416 based project, my small wish from the 
sidelines would be to not break this support with whatever solution you will 
decide on :-) .


Thanks
Heiko

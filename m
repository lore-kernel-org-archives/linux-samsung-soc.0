From: Heiko =?iso-8859-1?q?St=FCbner?= <heiko@sntech.de>
Subject: Re: [PATCH 6/7] spi/s3c64xx: Add support DMA engine API
Date: Mon, 4 Jul 2011 21:51:43 +0200
Message-ID: <201107042151.44075.heiko@sntech.de>
References: <1309781915-31549-1-git-send-email-kgene.kim@samsung.com> <201107041859.11548.heiko@sntech.de> <20110704170217.GH28042@ponder.secretlab.ca>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from s15407518.onlinehome-server.info ([82.165.136.167]:47508 "EHLO
	s15407518.onlinehome-server.info" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751585Ab1GDTvu convert rfc822-to-8bit
	(ORCPT <rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 4 Jul 2011 15:51:50 -0400
In-Reply-To: <20110704170217.GH28042@ponder.secretlab.ca>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Grant Likely <grant.likely@secretlab.ca>
Cc: Kukjin Kim <kgene.kim@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Vinod Koul <vinod.koul@intel.com>, Dan Williams <dan.j.williams@intel.com>, Jassi Brar <jassisinghbrar@gmail.com>, Liam Girdwood <lrg@ti.com>, Mark Brown <broonie@opensource.wolfsonmicro.com>, Boojin Kim <boojin.kim@samsung.com>

Am Montag 04 Juli 2011, 19:02:17 schrieb Grant Likely:
> On Mon, Jul 04, 2011 at 06:59:11PM +0200, Heiko St=FCbner wrote:
> > Am Montag 04 Juli 2011, 18:42:51 schrieb Grant Likely:
> > > On Mon, Jul 04, 2011 at 09:18:34PM +0900, Kukjin Kim wrote:
> > > > +#if defined(CONFIG_DMADEV_PL330)
> > > > +			memset(&slave_config, 0, sizeof(slave_config));
> > > > +			slave_config.direction =3D DMA_TO_DEVICE;
> > > > +			slave_config.src_addr =3D xfer->tx_dma;
> > > > +			slave_config.dst_addr =3D
> > > > +				sdd->sfr_start + S3C64XX_SPI_TX_DATA;
> > > > +			slave_config.dst_addr_width =3D sdd->cur_bpw / 8;
> > > > +			dmaengine_slave_config(sdd->tx_chan, &slave_config);
> > > > +
> > > > +			sg_init_table(&tx_sg, 1);
> > > > +			sg_set_page(&tx_sg, pfn_to_page(PFN_DOWN(xfer-
>tx_dma)),
> > > > +				xfer->len, offset_in_page(xfer->tx_dma));
> > > > +			sg_dma_len(&tx_sg) =3D  xfer->len;
> > > > +			sg_dma_address(&tx_sg) =3D xfer->tx_dma;
> > > > +			sdd->tx_desc =3D
> > > > +				sdd->tx_chan->device->device_prep_slave_sg(
> > > > +				sdd->tx_chan, &tx_sg, 1, DMA_TO_DEVICE,
> > > > +				DMA_PREP_INTERRUPT);
> > > > +			sdd->tx_desc->callback =3D s3c64xx_spi_dma_txcb;
> > > > +			sdd->tx_desc->callback_param =3D sdd;
> > > > +			dmaengine_submit(sdd->tx_desc);
> > > > +			dma_async_issue_pending(sdd->tx_chan);
> > > > +#else
> > > >=20
> > > >  			s3c2410_dma_config(sdd->tx_dmach, sdd->cur_bpw / 8);
> > > >  			s3c2410_dma_enqueue(sdd->tx_dmach, (void *)sdd,
> > > >  		=09
> > > >  						xfer->tx_dma, xfer->len);
> > > >  		=09
> > > >  			s3c2410_dma_ctrl(sdd->tx_dmach, S3C2410_DMAOP_START);
> > > >=20
> > > > +#endif
> > >=20
> > > Hmmm, this is not pretty.  The driver behaviour is entirely diffe=
rent
> > > depending on if CONFIG_DMADEV_PL330 is enabled?  When we get to
> > > multiplatform kernels, is this going to break on some hardware?
> > >=20
> > > > @@ -802,8 +951,13 @@ static void s3c64xx_spi_work(struct work_s=
truct
> > > > *work)
> > > >=20
> > > >  	spin_unlock_irqrestore(&sdd->lock, flags);
> > > >  =09
> > > >  	/* Free DMA channels */
> > > >=20
> > > > +#if defined(CONFIG_DMADEV_PL330)
> > > > +	dma_release_channel(sdd->tx_chan);
> > > > +	dma_release_channel(sdd->rx_chan);
> > > > +#else
> > > >=20
> > > >  	s3c2410_dma_free(sdd->tx_dmach, &s3c64xx_spi_dma_client);
> > > >  	s3c2410_dma_free(sdd->rx_dmach, &s3c64xx_spi_dma_client);
> > > >=20
> > > > +#endif
> > >=20
> > > Wow.  A lot of #ifdefs here.  It does not look multiplatform frie=
ndly
> > > at all.  Are the s3c2410_dma functions obsolete when DMADEV_PL330=
 is
> > > selected?  If so, can they be removed entirely, or are they requi=
red
> > > to support certain hardware?
> >=20
> > The spi_s3c64xx driver can also support the SPI controller of the
> > S3C2416/S3C2443 line of SoCs.
> > As I'm currently working on a S3C2416 based project, my small wish =
from
> > the sidelines would be to not break this support with whatever solu=
tion
> > you will decide on :-) .
>=20
> I will not merge a patch that either breaks a platform, or requires
> a compile time either/or choice of device support (enabling support
> for one device should not break support for another).

The patch above seems to contain the support for both SoCs (i.e. s3c241=
0_dma_*=20
for S3C2416 etc), so it wouldn't break the support.
But this form will definitly break future multiplatform kernels when th=
e 2416=20
and some variant using the DMADEV_PL330 are selected at the same time.

The 2416/2443 seem to be the first Samsung-SoCs to have a SPI-controlle=
r of=20
this type. Implementing the DMA engine stuff for these SoCs would obvio=
usly=20
solve the ifdef-problem but I don't know if this is possible to do.


Heiko

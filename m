From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [RFC 2/4] dma: add dmaengine driver for Samsung s3c24xx SoCs
Date: Wed, 15 May 2013 20:53:32 +0200
Message-ID: <CACRpkdaT195McX9NeccJYpmWbuYK-AZUTHr9AXKHnJdkf+Qzuw@mail.gmail.com>
References: <201305111330.05046.heiko@sntech.de>
	<201305111331.25405.heiko@sntech.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ie0-f176.google.com ([209.85.223.176]:34268 "EHLO
	mail-ie0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1759570Ab3EOSxc convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 15 May 2013 14:53:32 -0400
Received: by mail-ie0-f176.google.com with SMTP id at1so4335755iec.7
        for <linux-samsung-soc@vger.kernel.org>; Wed, 15 May 2013 11:53:32 -0700 (PDT)
In-Reply-To: <201305111331.25405.heiko@sntech.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: =?ISO-8859-1?Q?Heiko_St=FCbner?= <heiko@sntech.de>
Cc: Dan Williams <djbw@fb.com>, Vinod Koul <vinod.koul@intel.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Kukjin Kim <kgene.kim@samsung.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Russell King - ARM Linux <linux@arm.linux.org.uk>

On Sat, May 11, 2013 at 1:31 PM, Heiko St=FCbner <heiko@sntech.de> wrot=
e:

> This adds a new driver to support the s3c24xx dma using the dmaengine
> and make the old one in mach-s3c24xx obsolete in the long run.
>
> Conceptually the s3c24xx-dma feels like a distant relative of the pl0=
8x
> with numerous virtual channels being mapped to a lot less physical on=
es.
> The driver therefore borrows a lot from the amba-pl08x driver in this
> regard. Functionality-wise the driver gains a memcpy ability in addit=
ion
> to the slave_sg one.
>
> The driver currently only supports the "newer" SoCs which can use any
> physical channel for any dma slave. Support for the older SoCs where
> each channel only supports a subset of possible dma slaves will have =
to
> be added later.
>
> Tested on a s3c2416-based board, memcpy using the dmatest module and
> slave_sg partially using the spi-s3c64xx driver.
>
> Signed-off-by: Heiko Stuebner <heiko@sntech.de>
(...)
> +static u32 s3c24xx_dma_getbytes_chan(struct s3c24xx_dma_chan *s3ccha=
n)
> +{
> +       struct s3c24xx_dma_phy *phy =3D s3cchan->phy;
> +       struct s3c24xx_txd *txd =3D s3cchan->at;
> +       u32 tc =3D readl(phy->base + DSTAT) & DSTAT_CURRTC_MASK;
> +
> +       switch (txd->dcon & DCON_DSZ_MASK) {
> +       case DCON_DSZ_BYTE:
> +               return tc;
> +       case DCON_DSZ_HALFWORD:
> +               return tc * 2;
> +       case DCON_DSZ_WORD:
> +               return tc * 4;
> +       default:
> +               break;
> +       }
> +
> +       BUG();

Isn't that a bit nasty. This macro should be used with care and we
should recover if possible. dev_err()?

> +/*
> + * Set the initial DMA register values.
> + * Put them into the hardware and start the transfer.
> + */
> +static void s3c24xx_dma_start_next_txd(struct s3c24xx_dma_chan *s3cc=
han)
> +{
> +       struct s3c24xx_dma_engine *s3cdma =3D s3cchan->host;
> +       struct s3c24xx_dma_phy *phy =3D s3cchan->phy;
> +       struct virt_dma_desc *vd =3D vchan_next_desc(&s3cchan->vc);
> +       struct s3c24xx_txd *txd =3D to_s3c24xx_txd(&vd->tx);
> +       u32 dcon =3D txd->dcon;
> +       u32 val;
> +
> +       list_del(&txd->vd.node);
> +
> +       s3cchan->at =3D txd;
> +
> +       /* Wait for channel inactive */
> +       while (s3c24xx_dma_phy_busy(phy))
> +               cpu_relax();
> +
> +       /* transfer-size and -count from len and width */
> +       switch (txd->width) {
> +       case 1:
> +               dcon |=3D DCON_DSZ_BYTE | txd->len;
> +               break;
> +       case 2:
> +               dcon |=3D DCON_DSZ_HALFWORD | (txd->len / 2);
> +               break;
> +       case 4:
> +               dcon |=3D DCON_DSZ_WORD | (txd->len / 4);
> +               break;
> +       }
> +
> +       if (s3cchan->slave) {
> +               if (s3cdma->sdata->has_reqsel) {
> +                       int reqsel =3D s3cdma->pdata->reqsel_map[s3cc=
han->id];
> +                       writel((reqsel << 1) | DMAREQSEL_HW,
> +                              phy->base + DMAREQSEL);
> +               } else {
> +                       dev_err(&s3cdma->pdev->dev, "non-reqsel unsup=
ported\n");
> +                       return;
> +                       dcon |=3D DCON_HWTRIG;
> +               }
> +       } else {
> +               if (s3cdma->sdata->has_reqsel) {
> +                       writel(0, phy->base + DMAREQSEL);
> +               } else {
> +                       dev_err(&s3cdma->pdev->dev, "non-reqsel unsup=
ported\n");
> +                       return;
> +               }
> +       }
> +
> +       writel(txd->src_addr, phy->base + DISRC);
> +       writel(txd->disrcc, phy->base + DISRCC);
> +       writel(txd->dst_addr, phy->base + DIDST);
> +       writel(txd->didstc, phy->base + DIDSTC);
> +
> +       writel(dcon, phy->base + DCON);
> +
> +       val =3D readl(phy->base + DMASKTRIG);
> +       val &=3D ~DMASKTRIG_STOP;
> +       val |=3D DMASKTRIG_ON;
> +       writel(val, phy->base + DMASKTRIG);
> +
> +       /* trigger the dma operation for memcpy transfers */
> +       if (!s3cchan->slave) {
> +               val =3D readl(phy->base + DMASKTRIG);
> +               val |=3D DMASKTRIG_SWTRIG;
> +               writel(val, phy->base + DMASKTRIG);
> +       }
> +}

Since you have a few readl() and writel() in potentially
time-critical code, consider using readl_relaxed() and
writel_relaxed().

> +static irqreturn_t s3c24xx_dma_irq(int irq, void *data)
> +{
> +       struct s3c24xx_dma_phy *phy =3D data;
> +       struct s3c24xx_dma_chan *s3cchan =3D phy->serving;
> +       struct s3c24xx_txd *txd;
> +
> +       dev_dbg(&phy->host->pdev->dev, "interrupt on channel %d\n", p=
hy->id);
> +
> +       if (!s3cchan) {
> +               dev_err(&phy->host->pdev->dev, "interrupt on unused c=
hannel %d\n",
> +                       phy->id);
> +               return IRQ_NONE;
> +       }
> +
> +       spin_lock(&s3cchan->vc.lock);
> +       txd =3D s3cchan->at;
> +       if (txd) {
> +               s3cchan->at =3D NULL;
> +               vchan_cookie_complete(&txd->vd);
> +
> +               /*
> +                * And start the next descriptor (if any),
> +                * otherwise free this channel.
> +                */
> +               if (vchan_next_desc(&s3cchan->vc))
> +                       s3c24xx_dma_start_next_txd(s3cchan);
> +               else
> +                       s3c24xx_dma_phy_free(s3cchan);
> +       }
> +       spin_unlock(&s3cchan->vc.lock);
> +
> +       return IRQ_HANDLED;
> +}

OK so one IRQ per channel. Is there really no status
register to check or flag to clear on these IRQs?

Apart from these smallish things it looks good to me:
Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

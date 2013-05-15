From: Heiko =?iso-8859-1?q?St=FCbner?= <heiko@sntech.de>
Subject: Re: [RFC 2/4] dma: add dmaengine driver for Samsung s3c24xx SoCs
Date: Wed, 15 May 2013 22:31:52 +0200
Message-ID: <201305152231.52423.heiko@sntech.de>
References: <201305111330.05046.heiko@sntech.de> <201305111331.25405.heiko@sntech.de> <CACRpkdaT195McX9NeccJYpmWbuYK-AZUTHr9AXKHnJdkf+Qzuw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from gloria.sntech.de ([95.129.55.99]:41609 "EHLO gloria.sntech.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754709Ab3EOUcF (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 15 May 2013 16:32:05 -0400
In-Reply-To: <CACRpkdaT195McX9NeccJYpmWbuYK-AZUTHr9AXKHnJdkf+Qzuw@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Dan Williams <djbw@fb.com>, Vinod Koul <vinod.koul@intel.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Kukjin Kim <kgene.kim@samsung.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Russell King - ARM Linux <linux@arm.linux.org.uk>

Am Mittwoch, 15. Mai 2013, 20:53:32 schrieb Linus Walleij:
> On Sat, May 11, 2013 at 1:31 PM, Heiko St=FCbner <heiko@sntech.de> wr=
ote:
> > This adds a new driver to support the s3c24xx dma using the dmaengi=
ne
> > and make the old one in mach-s3c24xx obsolete in the long run.
> >=20
> > Conceptually the s3c24xx-dma feels like a distant relative of the p=
l08x
> > with numerous virtual channels being mapped to a lot less physical =
ones.
> > The driver therefore borrows a lot from the amba-pl08x driver in th=
is
> > regard. Functionality-wise the driver gains a memcpy ability in add=
ition
> > to the slave_sg one.
> >=20
> > The driver currently only supports the "newer" SoCs which can use a=
ny
> > physical channel for any dma slave. Support for the older SoCs wher=
e
> > each channel only supports a subset of possible dma slaves will hav=
e to
> > be added later.
> >=20
> > Tested on a s3c2416-based board, memcpy using the dmatest module an=
d
> > slave_sg partially using the spi-s3c64xx driver.
> >=20
> > Signed-off-by: Heiko Stuebner <heiko@sntech.de>
>=20
> (...)
>=20
> > +static u32 s3c24xx_dma_getbytes_chan(struct s3c24xx_dma_chan *s3cc=
han)
> > +{
> > +       struct s3c24xx_dma_phy *phy =3D s3cchan->phy;
> > +       struct s3c24xx_txd *txd =3D s3cchan->at;
> > +       u32 tc =3D readl(phy->base + DSTAT) & DSTAT_CURRTC_MASK;
> > +
> > +       switch (txd->dcon & DCON_DSZ_MASK) {
> > +       case DCON_DSZ_BYTE:
> > +               return tc;
> > +       case DCON_DSZ_HALFWORD:
> > +               return tc * 2;
> > +       case DCON_DSZ_WORD:
> > +               return tc * 4;
> > +       default:
> > +               break;
> > +       }
> > +
> > +       BUG();
>=20
> Isn't that a bit nasty. This macro should be used with care and we
> should recover if possible. dev_err()?

runtime_config already denies any settings not in the 1,2 or 4bytes ran=
ge -=20
the default-part should therefore never be reached. So if any other val=
ue=20
magically appears in the register and triggers the default-part, someth=
ing is=20
seriously wrong. So my guess is, the BUG might be appropriate.

On the other hand the whole default+BUG part could also simply go away,=
 for=20
the same reasons.


> > +/*
> > + * Set the initial DMA register values.
> > + * Put them into the hardware and start the transfer.
> > + */
> > +static void s3c24xx_dma_start_next_txd(struct s3c24xx_dma_chan *s3=
cchan)
> > +{
> > +       struct s3c24xx_dma_engine *s3cdma =3D s3cchan->host;
> > +       struct s3c24xx_dma_phy *phy =3D s3cchan->phy;
> > +       struct virt_dma_desc *vd =3D vchan_next_desc(&s3cchan->vc);
> > +       struct s3c24xx_txd *txd =3D to_s3c24xx_txd(&vd->tx);
> > +       u32 dcon =3D txd->dcon;
> > +       u32 val;
> > +
> > +       list_del(&txd->vd.node);
> > +
> > +       s3cchan->at =3D txd;
> > +
> > +       /* Wait for channel inactive */
> > +       while (s3c24xx_dma_phy_busy(phy))
> > +               cpu_relax();
> > +
> > +       /* transfer-size and -count from len and width */
> > +       switch (txd->width) {
> > +       case 1:
> > +               dcon |=3D DCON_DSZ_BYTE | txd->len;
> > +               break;
> > +       case 2:
> > +               dcon |=3D DCON_DSZ_HALFWORD | (txd->len / 2);
> > +               break;
> > +       case 4:
> > +               dcon |=3D DCON_DSZ_WORD | (txd->len / 4);
> > +               break;
> > +       }
> > +
> > +       if (s3cchan->slave) {
> > +               if (s3cdma->sdata->has_reqsel) {
> > +                       int reqsel =3D
> > s3cdma->pdata->reqsel_map[s3cchan->id]; +                     =20
> > writel((reqsel << 1) | DMAREQSEL_HW,
> > +                              phy->base + DMAREQSEL);
> > +               } else {
> > +                       dev_err(&s3cdma->pdev->dev, "non-reqsel
> > unsupported\n"); +                       return;
> > +                       dcon |=3D DCON_HWTRIG;
> > +               }
> > +       } else {
> > +               if (s3cdma->sdata->has_reqsel) {
> > +                       writel(0, phy->base + DMAREQSEL);
> > +               } else {
> > +                       dev_err(&s3cdma->pdev->dev, "non-reqsel
> > unsupported\n"); +                       return;
> > +               }
> > +       }
> > +
> > +       writel(txd->src_addr, phy->base + DISRC);
> > +       writel(txd->disrcc, phy->base + DISRCC);
> > +       writel(txd->dst_addr, phy->base + DIDST);
> > +       writel(txd->didstc, phy->base + DIDSTC);
> > +
> > +       writel(dcon, phy->base + DCON);
> > +
> > +       val =3D readl(phy->base + DMASKTRIG);
> > +       val &=3D ~DMASKTRIG_STOP;
> > +       val |=3D DMASKTRIG_ON;
> > +       writel(val, phy->base + DMASKTRIG);
> > +
> > +       /* trigger the dma operation for memcpy transfers */
> > +       if (!s3cchan->slave) {
> > +               val =3D readl(phy->base + DMASKTRIG);
> > +               val |=3D DMASKTRIG_SWTRIG;
> > +               writel(val, phy->base + DMASKTRIG);
> > +       }
> > +}
>=20
> Since you have a few readl() and writel() in potentially
> time-critical code, consider using readl_relaxed() and
> writel_relaxed().

You're right of course.

If I understand the writel semantics and the thread from you from 2011 =
[0]=20
correctly, only the writel to DMASKTRIG mustn't be relaxed to make sure=
 the=20
settings registers are written to before, so like:

       writel_relaxed(txd->src_addr, phy->base + DISRC);
       writel_relaxed(txd->disrcc, phy->base + DISRCC);
       writel_relaxed(txd->dst_addr, phy->base + DIDST);
       writel_relaxed(txd->didstc, phy->base + DIDSTC);
       writel_relaxed(dcon, phy->base + DCON);

       val =3D readl_relaxed(phy->base + DMASKTRIG);
       val &=3D ~DMASKTRIG_STOP;
       val |=3D DMASKTRIG_ON;
       writel(val, phy->base + DMASKTRIG);


And note to self: check if the memcpy-speciality can move into the firs=
t=20
DMASKTRIG write.

> > +static irqreturn_t s3c24xx_dma_irq(int irq, void *data)
> > +{
> > +       struct s3c24xx_dma_phy *phy =3D data;
> > +       struct s3c24xx_dma_chan *s3cchan =3D phy->serving;
> > +       struct s3c24xx_txd *txd;
> > +
> > +       dev_dbg(&phy->host->pdev->dev, "interrupt on channel %d\n",
> > phy->id); +
> > +       if (!s3cchan) {
> > +               dev_err(&phy->host->pdev->dev, "interrupt on unused
> > channel %d\n", +                       phy->id);
> > +               return IRQ_NONE;
> > +       }
> > +
> > +       spin_lock(&s3cchan->vc.lock);
> > +       txd =3D s3cchan->at;
> > +       if (txd) {
> > +               s3cchan->at =3D NULL;
> > +               vchan_cookie_complete(&txd->vd);
> > +
> > +               /*
> > +                * And start the next descriptor (if any),
> > +                * otherwise free this channel.
> > +                */
> > +               if (vchan_next_desc(&s3cchan->vc))
> > +                       s3c24xx_dma_start_next_txd(s3cchan);
> > +               else
> > +                       s3c24xx_dma_phy_free(s3cchan);
> > +       }
> > +       spin_unlock(&s3cchan->vc.lock);
> > +
> > +       return IRQ_HANDLED;
> > +}
>=20
> OK so one IRQ per channel. Is there really no status
> register to check or flag to clear on these IRQs?

Nope there are none. The only status you get from the controller is bus=
y/non-
busy and remaining transfers for the transaction - the DSTAT register i=
n the=20
code. And not listed in the code the current memory addresses (source a=
nd=20
destination) in use. There are no other registers at all.

And the irq itself only triggers when all transfers of the transaction =
are=20
done (transfer_count is 0).


> Apart from these smallish things it looks good to me:
> Acked-by: Linus Walleij <linus.walleij@linaro.org>

really? Cool.
Part of me was expecting tomatoes or other vegetables to be thrown ;-) =
=2E


Thanks for looking thru the driver.
Heiko


[0] http://comments.gmane.org/gmane.linux.ports.arm.kernel/117626

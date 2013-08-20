From: Vinod Koul <vinod.koul@intel.com>
Subject: Re: [PATCH v2 2/4] dmaengine: add driver for Samsung s3c24xx SoCs
Date: Tue, 20 Aug 2013 13:50:49 +0530
Message-ID: <20130820082049.GD5810@intel.com>
References: <201308141359.13872.heiko@sntech.de>
 <201308141400.25681.heiko@sntech.de>
 <20130819044811.GR32147@intel.com>
 <201308201023.50594.heiko@sntech.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mga03.intel.com ([143.182.124.21]:51944 "EHLO mga03.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751382Ab3HTJEV (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 20 Aug 2013 05:04:21 -0400
Content-Disposition: inline
In-Reply-To: <201308201023.50594.heiko@sntech.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Heiko =?iso-8859-1?Q?St=FCbner?= <heiko@sntech.de>
Cc: kgene.kim@samsung.com, Dan Williams <djbw@fb.com>, linus.walleij@linaro.org, Tomasz Figa <tomasz.figa@gmail.com>, Sylwester Nawrocki <sylvester.nawrocki@gmail.com>, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org

On Tue, Aug 20, 2013 at 10:23:49AM +0200, Heiko St=FCbner wrote:
> Hi Vinod,
>=20
> Am Montag, 19. August 2013, 06:48:12 schrieb Vinod Koul:
> > On Wed, Aug 14, 2013 at 02:00:25PM +0200, Heiko St=FCbner wrote:
> > > This adds a new driver to support the s3c24xx dma using the dmaen=
gine
> > > and makes the old one in mach-s3c24xx obsolete in the long run.
> > >=20
> > > Conceptually the s3c24xx-dma feels like a distant relative of the=
 pl08x
> > > with numerous virtual channels being mapped to a lot less physica=
l ones.
> > > The driver therefore borrows a lot from the amba-pl08x driver in =
this
> > > regard. Functionality-wise the driver gains a memcpy ability in a=
ddition
> > > to the slave_sg one.
> >=20
> > If that is the case why cant we have this driver supported from pl0=
8x
> > driver? If the delta is only mapping then can that be seprated or b=
oth
> > mapping hanlded? Maybe you and Linus have already though about that=
?
>=20
> Yes we have ... As Tomasz has already written the hardware itself is =
very much=20
> different. It's only the concept of mapping virtual channels to physi=
cal=20
> channels that is somehow similar.
>=20
> It seems my patch message is lacking in making this clearer ;-) .
The above made me believ they are similar contrlllers with differnt map=
ping!,
hence the question...

> > > +#define DMASKTRIG_STOP		(1 << 2)
> > > +#define DMASKTRIG_ON		(1 << 1)
> > > +#define DMASKTRIG_SWTRIG	(1 << 0)
> > > +
> > > +#define DMAREQSEL		(0x24)
> > > +#define DMAREQSEL_HW		(1 << 0)
> >=20
> > This is proper namespacing...
>=20
> Hmm, I don't understand meaning of this sentence. Is it a suggestion =
to change=20
> anything?
Sorry above should be read as "this need proper namespacing". The macro=
s like
DMAREQSEL asre farliy egneric and can collide with others. SO the recom=
mendation
is to use something like S3_DMAREQSEL etc

> > > +static irqreturn_t s3c24xx_dma_irq(int irq, void *data)
> > > +{
> > > +	struct s3c24xx_dma_phy *phy =3D data;
> > > +	struct s3c24xx_dma_chan *s3cchan =3D phy->serving;
> > > +	struct s3c24xx_txd *txd;
> > > +
> > > +	dev_dbg(&phy->host->pdev->dev, "interrupt on channel %d\n", phy=
->id);
> > > +
> > > +	if (!s3cchan) {
> > > +		dev_err(&phy->host->pdev->dev, "interrupt on unused channel=20
> %d\n",
> > > +			phy->id);
> > > +		return IRQ_NONE;
> >=20
> > hmmm, these channles belong to you. So if one of them is behvaing b=
adly,
> > then not handling the interrupt will make things worse...
>=20
> hmm ... I'm not sure what a valid handling would be for this.
>=20
> The interrupt is only asserted when a transfer is completed - there a=
re no=20
> other interrupt-triggers. But when phy->serving is NULL, this also me=
ans that=20
> the clock of the channel is disabled at this time. So this _should_ n=
ever=20
> happen.
if that is the case we dont need above, but you added that just for the=
 small
iota of if

> And as written above, the interrupt is only triggered when a transfer=
 was=20
> completed and the channel is idle again, so if there is no virtual ch=
annel=20
> being served, there is nothing else to do.
But if we do get such an interrupt, it means:
a) bug in SW
b) erratic hw behaviour

if you handle and dump the issue at least you have recovered. Rather th=
an
returning and controller asserting interrupt again and again as it is n=
ot
cleared.

~Vinod

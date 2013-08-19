From: Tomasz Figa <t.figa@samsung.com>
Subject: Re: [PATCH v2 2/4] dmaengine: add driver for Samsung s3c24xx SoCs
Date: Mon, 19 Aug 2013 12:20:23 +0200
Message-ID: <2108924.tnr1vBaclB@amdc1227>
References: <201308141359.13872.heiko@sntech.de>
 <201308141400.25681.heiko@sntech.de> <20130819044811.GR32147@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <20130819044811.GR32147@intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Vinod Koul <vinod.koul@intel.com>
Cc: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>, kgene.kim@samsung.com, Dan Williams <djbw@fb.com>, linus.walleij@linaro.org, Tomasz Figa <tomasz.figa@gmail.com>, Sylwester Nawrocki <sylvester.nawrocki@gmail.com>, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

On Monday 19 of August 2013 10:18:12 Vinod Koul wrote:
> On Wed, Aug 14, 2013 at 02:00:25PM +0200, Heiko St=FCbner wrote:
> > This adds a new driver to support the s3c24xx dma using the dmaengi=
ne
> > and makes the old one in mach-s3c24xx obsolete in the long run.
> >=20
> > Conceptually the s3c24xx-dma feels like a distant relative of the p=
l08x
> > with numerous virtual channels being mapped to a lot less physical
> > ones.
> > The driver therefore borrows a lot from the amba-pl08x driver in th=
is
> > regard. Functionality-wise the driver gains a memcpy ability in
> > addition
> > to the slave_sg one.
>=20
> If that is the case why cant we have this driver supported from pl08x
> driver? If the delta is only mapping then can that be seprated or bot=
h
> mapping hanlded? Maybe you and Linus have already though about that?

Well, the similarity here is only conceptual. Both controllers are=20
completely different in terms of their programming interfaces, not even=
=20
mentioning that s3c24xx-dma doesn't support LLIs and this must be handl=
ed=20
in software.

Best regards,
Tomasz

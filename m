From: Kukjin Kim <kgene@kernel.org>
Subject: RE: [PATCH v5 2/4] dmaengine: add driver for Samsung s3c24xx SoCs
Date: Tue, 08 Oct 2013 08:22:32 +0900
Message-ID: <0f4401cec3b4$19648230$4c2d8690$@org>
References: <201309182118.28391.heiko@sntech.de>
 <201309182119.54560.heiko@sntech.de> <20131007143351.GK2954@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:28835 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751197Ab3JGXWe convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 7 Oct 2013 19:22:34 -0400
In-reply-to: <20131007143351.GK2954@intel.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Vinod Koul' <vinod.koul@intel.com>, =?ISO-8859-1?Q?'Heiko_St=FCbner'?= <heiko@sntech.de>
Cc: 'Dan Williams' <djbw@fb.com>, linus.walleij@linaro.org, 'Tomasz Figa' <tomasz.figa@gmail.com>, 'Sylwester Nawrocki' <sylvester.nawrocki@gmail.com>, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org

Vinod Koul wrote:
>=20
> On Wed, Sep 18, 2013 at 09:19:54PM +0200, Heiko St=FCbner wrote:
> > This adds a new driver to support the s3c24xx dma using the dmaengi=
ne
> > and makes the old one in mach-s3c24xx obsolete in the long run.
> >
> > Conceptually the s3c24xx-dma feels like a distant relative of the p=
l08x
> > with numerous virtual channels being mapped to a lot less physical =
ones.
> > The driver therefore borrows a lot from the amba-pl08x driver in th=
is
> > regard. Functionality-wise the driver gains a memcpy ability in add=
ition
> > to the slave_sg one.
> >
> > The driver supports both the method for requesting the peripheral u=
sed
> > by SoCs before the S3C2443 and the different method for S3C2443 and
> later.
> >
> > On earlier SoCs the hardware channels usable for specific periphera=
ls is
> > constrainted while on later SoCs all channels can be used for any
> peripheral.
> >
> > Tested on a s3c2416-based board, memcpy using the dmatest module an=
d
> > slave_sg partially using the spi-s3c64xx driver.
> >
> > Signed-off-by: Heiko Stuebner <heiko@sntech.de>
> > Acked-by: Linus Walleij <linus.walleij@linaro.org>
> Acked-by: Vinod Koul <vinod.koul@intel.com>
>=20
Vinod, thanks for your ack :-)

Applied this whole series.
Kukjin

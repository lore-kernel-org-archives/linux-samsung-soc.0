From: Tomasz Figa <t.figa@samsung.com>
Subject: Re: [RFC 2/4] dma: add dmaengine driver for Samsung s3c24xx SoCs
Date: Tue, 14 May 2013 16:21:36 +0200
Message-ID: <3254712.MAHxRAdAN5@amdc1227>
References: <201305111330.05046.heiko@sntech.de>
 <201305111331.25405.heiko@sntech.de>
 <CACRpkda-wQyo8aYxbW9RJNcR3Kwe2w5AhaAuUHfaxBksa_Pm2A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:30973 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755592Ab3ENOVx convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 14 May 2013 10:21:53 -0400
In-reply-to: <CACRpkda-wQyo8aYxbW9RJNcR3Kwe2w5AhaAuUHfaxBksa_Pm2A@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>, Russell King - ARM Linux <linux@arm.linux.org.uk>, Dan Williams <djbw@fb.com>, Vinod Koul <vinod.koul@intel.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Kukjin Kim <kgene.kim@samsung.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>

Hi Linus, Heiko,

On Tuesday 14 of May 2013 14:47:19 Linus Walleij wrote:
> On Sat, May 11, 2013 at 1:31 PM, Heiko St=FCbner <heiko@sntech.de> wr=
ote:
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
> So have I understood correctly if I assume that *some* S3C
> variants, i.e. this: arch/arm/mach-s3c64xx/dma.c
> have a vanilla, unmodified, or just slightly modified
> PL08x block, while this DMAC is something probably based on
> the PL08x where some ASIC engineer has had a good time hacking
> around in the VHDL code to meet some feature requirements.
> Correct? Or plausible guess?
>=20
> Exactly *how* far away from the pl08x hardware is it?

AFAIK the DMAC of S3C24xx is completely different from PL08x. I think H=
eiko=20
just meant that it uses similar concepts, like virtual channels.

> I guess you have already come to the conclusion that the
> amba-pl08x.c driver cannot be augmented to handle this hardware
> after some educated reading of that code?
>=20
> But are really no parts reusable?
>=20
> For example, if the LLIs have the same layout, could we split
> out the LLI handling from amba-pl08x into a separate file and reuse
> that?
>=20
> The more you share with amba-pl08x the better for everyone,
> I am positively sure. And please include Russell on the review
> chain, he wrote the virtual channel abstraction.
>=20
> If I was given the option amongst S3C work I would definatley
> have augmented the amba-pl08x.c to handle the stuff in
> arch/arm/mach-s3c64xx/dma.c *first* then started to work on
> this driver, but I guess you might not be working on s3c64xx?

Well, I still hope that someone will pick up the work on adapting PL08x=
 driver=20
to support PL080s of S3C64xx as well, but most likely it will end up wi=
th me=20
doing it, as a part of DT support for S3C64xx.

Best regards,
--=20
Tomasz Figa
Samsung Poland R&D Center
SW Solution Development, Kernel and System Framework

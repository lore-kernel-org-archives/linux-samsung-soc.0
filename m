From: Heiko =?iso-8859-1?q?St=FCbner?= <heiko@sntech.de>
Subject: Re: [RFC 2/4] dma: add dmaengine driver for Samsung s3c24xx SoCs
Date: Tue, 14 May 2013 15:51:23 +0200
Message-ID: <201305141551.24375.heiko@sntech.de>
References: <201305111330.05046.heiko@sntech.de> <201305111331.25405.heiko@sntech.de> <CACRpkda-wQyo8aYxbW9RJNcR3Kwe2w5AhaAuUHfaxBksa_Pm2A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from gloria.sntech.de ([95.129.55.99]:55548 "EHLO gloria.sntech.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754732Ab3ENNvf (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 14 May 2013 09:51:35 -0400
In-Reply-To: <CACRpkda-wQyo8aYxbW9RJNcR3Kwe2w5AhaAuUHfaxBksa_Pm2A@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Russell King - ARM Linux <linux@arm.linux.org.uk>, Dan Williams <djbw@fb.com>, Vinod Koul <vinod.koul@intel.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Kukjin Kim <kgene.kim@samsung.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>

Am Dienstag, 14. Mai 2013, 14:47:19 schrieb Linus Walleij:
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

You're guess is at good as mine :-) . The public s3c64xx (ARM11 based)=20
documentation says that it is using s PL080 as dma controller while the=
=20
s3c24xx (ARM9 based) SoCs have this one, which doesn't come with any la=
bel in=20
the manuals.
Similar to the s3c64xx using a vic, while the s3c24xx uses something=20
homegrown.

The relationship description was more based on the concepts used, i.e. =
the=20
virtual channel concept and general handling of dma transfers feel some=
how=20
similar - as I said these are my first steps into this, so I still need=
 to=20
understand a lot.


> Exactly *how* far away from the pl08x hardware is it?
>=20
> I guess you have already come to the conclusion that the
> amba-pl08x.c driver cannot be augmented to handle this hardware
> after some educated reading of that code?
>=20
> But are really no parts reusable?
>=20
> For example, if the LLIs have the same layout, could we split
> out the LLI handling from amba-pl08x into a separate file and reuse
> that?

The s3c24xx-dma doesn't have these. You simply put source and destinati=
on=20
addresses on the bus, tell it the number of transfers and start it, whi=
le the=20
pl080 seems to split these then into the LLIs, which seems to be some k=
ind of=20
hardware feature.

=46or the rest, the register-layout of the controller is completely dif=
ferent (I=20
checked the PL080 manual), each channel has its own interrupt and the a=
bove=20
mentioned missing LLIs.

Both drivers share somehow how they handle end of transfers, i.e. how t=
hey=20
reuse the physical channel for a possible waiting virtual channel. But =
it=20
didn't look like anything worth factoring out.


> The more you share with amba-pl08x the better for everyone,
> I am positively sure. And please include Russell on the review
> chain, he wrote the virtual channel abstraction.

I think the best feature is already factored out - the virtual channel=20
handling, which was very nice to have.

I used the list from get_maintainer.pl, so sorry for forgetting Russel.


> If I was given the option amongst S3C work I would definatley
> have augmented the amba-pl08x.c to handle the stuff in
> arch/arm/mach-s3c64xx/dma.c *first* then started to work on
> this driver, but I guess you might not be working on s3c64xx?

correct, my pet-project is s3c2416-based [0], so I haven't seen any oth=
er=20
Samsung stuff at all.


Heiko


[0] http://www.youtube.com/user/mmind81

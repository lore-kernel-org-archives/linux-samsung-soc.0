From: Russell King - ARM Linux <linux@arm.linux.org.uk>
Subject: Re: [PATCH] Improve slave/cyclic DMA engine documentation (was:
	[PATCH V4 04/14] DMA: PL330: Add DMA_CYCLIC capability)
Date: Tue, 26 Jul 2011 19:16:40 +0100
Message-ID: <20110726181640.GF1655@n2100.arm.linux.org.uk>
References: <1311590884.29703.2.camel@vkoul-mobl4> <20110725105754.GG9653@n2100.arm.linux.org.uk> <1311591717.29703.7.camel@vkoul-mobl4> <20110725113926.GH9653@n2100.arm.linux.org.uk> <1311595303.29703.31.camel@vkoul-mobl4> <20110726075720.GL9653@n2100.arm.linux.org.uk> <1311672933.24316.1.camel@vkoul-mobl4> <CABb+yY1P21hbMD2mG_cCvW3N5WqWzc2ZVt-HTOrC1J3dc5RbhA@mail.gmail.com> <20110726172027.GD1655@n2100.arm.linux.org.uk> <CABb+yY31N6ubWcjQnMqze5hH66eoSxPQCaRVqf7=jZ3L_h+P6Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from caramon.arm.linux.org.uk ([78.32.30.218]:54307 "EHLO
	caramon.arm.linux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751306Ab1GZSQy (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 26 Jul 2011 14:16:54 -0400
Content-Disposition: inline
In-Reply-To: <CABb+yY31N6ubWcjQnMqze5hH66eoSxPQCaRVqf7=jZ3L_h+P6Q@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Jassi Brar <jassisinghbrar@gmail.com>
Cc: Vinod Koul <vkoul@infradead.org>, vinod.koul@intel.com, linux-samsung-soc@vger.kernel.org, Boojin Kim <boojin.kim@samsung.com>, Grant Likely <grant.likely@secretlab.ca>, Kukjin Kim <kgene.kim@samsung.com>, Mark Brown <broonie@opensource.wolfsonmicro.com>, Dan Williams <dan.j.williams@intel.com>, linux-arm-kernel@lists.infradead.org

On Tue, Jul 26, 2011 at 11:25:13PM +0530, Jassi Brar wrote:
> On Tue, Jul 26, 2011 at 10:50 PM, Russell King - ARM Linux
> <linux@arm.linux.org.uk> wrote:
> > On Tue, Jul 26, 2011 at 08:07:44PM +0530, Jassi Brar wrote:
> >> Dear Vinod,
> >>
> >> =A0Since it came from the RMK, most probably it'll be the best.
> >>
> >> But applying patches upon personal timeout seems very dangerous.
> >
> > Ehh what? =A0Is there any contention over this documentation patch?
> I haven't yet read it... even after reading I would object only if I =
found
> your patch disturbing enough to disrupt my bowel movements. Which
> I don't think would be the case.
>=20
> I just observed it is second time that Vinod applied a patch without =
any
> ack or prior alert.

That's what happens - no one says "I'm going to apply this patch" befor=
e
they apply it.  They just apply it to their tree and move on.  Vinod,
being the nominated maintainer for the slave DMA engine support has the
authority to do that for that area of code.

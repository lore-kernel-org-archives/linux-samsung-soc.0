From: Russell King - ARM Linux <linux@arm.linux.org.uk>
Subject: Re: [PATCH 07/15] ARM: EXYNOS4: Use generic DMA PL330 driver
Date: Sun, 21 Aug 2011 09:51:08 +0100
Message-ID: <20110821085108.GE12028@n2100.arm.linux.org.uk>
References: <1311744697-10264-1-git-send-email-boojin.kim@samsung.com> <1311744697-10264-8-git-send-email-boojin.kim@samsung.com> <CAJuYYwT0R+VXWvWuV6KK=m_knoxBnBf=GLVimPoe002mcvqqeA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from caramon.arm.linux.org.uk ([78.32.30.218]:37494 "EHLO
	caramon.arm.linux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751266Ab1HUIvY (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 21 Aug 2011 04:51:24 -0400
Content-Disposition: inline
In-Reply-To: <CAJuYYwT0R+VXWvWuV6KK=m_knoxBnBf=GLVimPoe002mcvqqeA@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Thomas Abraham <thomas.abraham@linaro.org>
Cc: Boojin Kim <boojin.kim@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Vinod Koul <vinod.koul@intel.com>, Dan Williams <dan.j.williams@intel.com>, Jassi Brar <jassisinghbrar@gmail.com>, Kukjin Kim <kgene.kim@samsung.com>, Mark Brown <broonie@opensource.wolfsonmicro.com>, Grant Likely <grant.likely@secretlab.ca>

On Mon, Aug 15, 2011 at 07:45:48PM +0530, Thomas Abraham wrote:
> > +struct dma_pl330_peri pdma0_peri[28] =3D {
> > + =A0 =A0 =A0 {
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .peri_id =3D (u8)DMACH_PCM0_RX,
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .rqtype =3D DEVTOMEM,
> > + =A0 =A0 =A0 }, {
>=20
> The client driver specifies the direction of the transfer
> (DMA_TO_DEVICE or DMA_FROM_DEVICE) when requesting for a dma channel.
> So, is the rqtype parameter required in the platform data for the dma
> driver?

That was done initially too with PL080, which has 8 uncommitted DMA
channels.  Peripheral drivers still had to pass the DMA direction.  So
it turned out to be entirely redundant information, so it got killed of=
f,
along with other channel specific configuration which drivers should've
been doing via the slave configuration callback.

Passing lots of information via platform data which should come via
other routes makes dmaengine users fragile - you can't tell whether
they are passing the correct and full information necessary to work wit=
h
other dmaengine drivers.  So, the DMA engine platform data should only
contain the absolute _minimum_ of information.

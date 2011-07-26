From: Russell King - ARM Linux <linux@arm.linux.org.uk>
Subject: Re: [PATCH V4 06/14] ARM: SAMSUNG: Add common DMA operations
Date: Tue, 26 Jul 2011 09:02:33 +0100
Message-ID: <20110726080233.GN9653@n2100.arm.linux.org.uk>
References: <1311557312-26107-1-git-send-email-boojin.kim@samsung.com> <1311557312-26107-7-git-send-email-boojin.kim@samsung.com> <CABb+yY0nWLpdVGqTJPO2YwkGWiDw5tRjC2xn7Le0bO0ZNFHC_g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from caramon.arm.linux.org.uk ([78.32.30.218]:49008 "EHLO
	caramon.arm.linux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751246Ab1GZIC4 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 26 Jul 2011 04:02:56 -0400
Content-Disposition: inline
In-Reply-To: <CABb+yY0nWLpdVGqTJPO2YwkGWiDw5tRjC2xn7Le0bO0ZNFHC_g@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Jassi Brar <jassisinghbrar@gmail.com>
Cc: Boojin Kim <boojin.kim@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>, Vinod Koul <vinod.koul@intel.com>, Mark Brown <broonie@opensource.wolfsonmicro.com>, Grant Likely <grant.likely@secretlab.ca>, linux-samsung-soc@vger.kernel.org, Dan Williams <dan.j.williams@intel.com>, linux-arm-kernel@lists.infradead.org

On Mon, Jul 25, 2011 at 05:21:44PM +0530, Jassi Brar wrote:
> On Mon, Jul 25, 2011 at 6:58 AM, Boojin Kim <boojin.kim@samsung.com> =
wrote:
>=20
> > +
> > +static bool pl330_filter(struct dma_chan *chan, void *param)
> > +{
> > + =A0 =A0 =A0 struct dma_pl330_peri *peri =3D (struct dma_pl330_per=
i *)chan->private;
> > + =A0 =A0 =A0 unsigned dma_ch =3D (unsigned)param;
> > +
> > + =A0 =A0 =A0 if (peri->peri_id !=3D dma_ch)
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return false;
> > +
> > + =A0 =A0 =A0 return true;
> > +}
> This is what I meant... if we keep chan_id for paltform assigned IDs,
> these filter functions could simply become
>=20
> static bool pl330_filter(struct dma_chan *chan, void *param)
> {
>         return chan->chan_id =3D=3D param
> }
>=20
> And ideally in the long run, we could just drop the filter callback
> and add expected channel ID to the request_channel call.

So what if you have a PL080 and PL330 drivers registered with the DMA
engine code, and you need to match a specific PL330 channel?

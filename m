From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH] ARM: SAMSUNG: dma: Remove unnecessary code
Date: Tue, 5 Feb 2013 11:13:22 +0000
Message-ID: <201302051113.22720.arnd@arndb.de>
References: <1359967675-624-1-git-send-email-padma.v@samsung.com> <201302041743.55029.arnd@arndb.de> <CAAgF-BfaYo7FoYyFHo1eW-bUGOYdvcfskf7_7UhmCOzASoreYg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from moutng.kundenserver.de ([212.227.126.186]:62108 "EHLO
	moutng.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751119Ab3BELN2 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 5 Feb 2013 06:13:28 -0500
In-Reply-To: <CAAgF-BfaYo7FoYyFHo1eW-bUGOYdvcfskf7_7UhmCOzASoreYg@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Padma Venkat <padma.kvr@gmail.com>
Cc: Padmavathi Venna <padma.v@samsung.com>, linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, sbkim73@samsung.com, broonie@opensource.wolfsonmicro.com, kgene.kim@samsung.com, jassisinghbrar@gmail.com, vinod.koul@intel.com, grant.likely@secretlab.ca, jon-hunter@ti.com, boojin.kim@samsung.com, thomas.abraham@linaro.org

On Tuesday 05 February 2013, Padma Venkat wrote:
> On Mon, Feb 4, 2013 at 11:13 PM, Arnd Bergmann <arnd@arndb.de> wrote:
> > On Monday 04 February 2013, Padmavathi Venna wrote:
> >> diff --git a/arch/arm/plat-samsung/dma-ops.c b/arch/arm/plat-samsu=
ng/dma-ops.c
> >> index 71d58dd..ec0d731 100644
> >> --- a/arch/arm/plat-samsung/dma-ops.c
> >> +++ b/arch/arm/plat-samsung/dma-ops.c
> >> @@ -23,23 +23,15 @@ static unsigned samsung_dmadev_request(enum dm=
a_ch dma_ch,
> >>                               struct device *dev, char *ch_name)
> >>  {
> >>       dma_cap_mask_t mask;
> >> -     void *filter_param;
> >>
> >>       dma_cap_zero(mask);
> >>       dma_cap_set(param->cap, mask);
> >>
> >> -     /*
> >> -      * If a dma channel property of a device node from device tr=
ee is
> >> -      * specified, use that as the fliter parameter.
> >> -      */
> >> -     filter_param =3D (dma_ch =3D=3D DMACH_DT_PROP) ?
> >> -             (void *)param->dt_dmach_prop : (void *)dma_ch;
> >> -
> >>       if (dev->of_node)
> >>               return (unsigned)dma_request_slave_channel(dev, ch_n=
ame);
> >>       else
> >>               return (unsigned)dma_request_channel(mask, pl330_fil=
ter,
> >> -                                                     filter_param=
);
> >> +                                                     (void *)dma_=
ch);
> >>  }
> >
> > This still looks wrong to me, because the pl330_filter function now=
 tkes
> > a struct dma_pl330_filter_args pointer argument, not dma_ch name.
>=20
> Below is my understanding about generic dma and our discussion on
> previous versions of my patches.
>=20
> I can=92t pass single dma channel number(may be not dma_ch name in yo=
ur
> comment above) as void* argument to pl330_filter.  Because I also nee=
d
> to compare against the dma controller device node, as my requested
> channel can belong to any of the available dma controller on SoC.  So
> I either need to pass pointer to dma_spec as void* argument which
> holds the dma controller node and required channel number or I can
> pass pointer to dma_pl330_filter_args as per your dw_dmac patches.

Right.

> If I pass pointer to dma_spec I can have a check like below in my
> filter function
> return ((chan->private =3D=3D dma_spec->np) && (chan->chan_id =3D=3D =
dma_spec->args[0]))
>=20
> Or if I pass dma_pl330_filter_args I can have a check like below.
> return ((chan->device =3D=3D &fargs->pdmac->ddma) && (chan->chan_id =3D=
=3D
> fargs->chan_id));
>=20
> I modified  the pl330_filter function based on your dw_dmac patches.
> Indeed I don=92t need to pass pointer to pdmac object as 3rd arg in
> of_dma_controller_register .  Even I pass NULL here works for me.
> Can I pass NULL here as the third argument in of_dma_controller_regis=
ter?

These are all not the issues I am referring to in my comment above.
I think it works either way, even if you pass NULL to
of_dma_controller_register, although using it for the pdmac object
seems cleaner to me.

> Please clarify me which is best way of doing this and correct me if m=
y
> understanding is wrong.

My point was that in the samsung_dmadev_request quoted above, you
refer to the same pl330_filter filter function, but the argument there
is a pointer to 'enum dma_ch', which is not compatible with any of
the methods you list, neither the dma_pl330_filter_args nor the
raw property.

Also, if you change the calling conventions for the pl330_filter
function, you should change both the caller and the function in the
same patch.

	Arnd

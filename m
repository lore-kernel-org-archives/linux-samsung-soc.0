From: Inki Dae <inki.dae-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: RE: [PATCH 1/7] drm/exynos: move hdmiphy related code to hdmiphy driver
Date: Tue, 01 Oct 2013 13:40:24 +0900
Message-ID: <053d01cebe60$580eb5e0$082c21a0$%dae@samsung.com>
References: <1377845974-28373-1-git-send-email-rahul.sharma@samsung.com>
 <CAAQKjZPtxLAJOz6573+hEPZokEnvGF8BTMXoxcYUQ8zySAn-OA@mail.gmail.com>
 <5248A4EE.9000708@gmail.com> <3343111.VLAUx0FRXN@flatron>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <3343111.VLAUx0FRXN@flatron>
Content-language: ko
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: 'Tomasz Figa' <tomasz.figa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, 'Sylwester Nawrocki' <sylvester.nawrocki-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: 'Rahul Sharma' <r.sh.open-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, 'linux-samsung-soc' <linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "'sw0312.kim'" <sw0312.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, 'sunil joshi' <joshi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, 'dri-devel' <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "'kgene.kim'" <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, 'Shirish S' <shirish-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, 'Sylwester Nawrocki' <s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, 'Rahul Sharma' <rahul.sharma-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, 'Stephen Warren' <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, 'Mark Rutland' <Mark.Rutland-5wv7dgnIgG8@public.gmane.org>, 'Kumar Gala' <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, 'Pawel Moll' <Pawel.Moll-5wv7dgnIgG8@public.gmane.org>, 'Rob Herring' <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, 'Sean Paul' <seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org



> -----Original Message-----
> From: linux-samsung-soc-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org [mailto:linux-samsung-soc-
> owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org] On Behalf Of Tomasz Figa
> Sent: Monday, September 30, 2013 8:13 AM
> To: Sylwester Nawrocki
> Cc: Inki Dae; Rahul Sharma; devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; linux-samsung-soc;
> sw0312.kim; sunil joshi; dri-devel; kgene.kim; Shirish S; Sylwester
> Nawrocki; Rahul Sharma; Stephen Warren; Mark Rutland; Kumar Gala; Pawel
> Moll; Rob Herring; Sean Paul
> Subject: Re: [PATCH 1/7] drm/exynos: move hdmiphy related code to hdmiphy
> driver
> 
> On Monday 30 of September 2013 00:08:46 Sylwester Nawrocki wrote:
> > On 09/28/2013 06:10 PM, Inki Dae wrote:
> > >> Any opinion from Device-Tree folks?
> > >>
> > >> IMO, we should have same consensus on Shirish patches before
> > >> proceeding.>
> > > Rahul, it seems that DT people have no interest in this issue. So
> > > let's
> > > have a consensus about this issue internally.
> > >
> > > To Mr. Kyungmin, Sylwester, Kukjin Kim, and Tomasz,
> > > How about keeping hdmiphy config data in each board dts file?
> >
> > Please don't use HTML and quote only relevant part of e-mails. Otherwise
> > there are good chances your messages end up in people's spam box.
> >
> > It often helps to Cc a DT binding maintainer directly.
> >
> > Then, you consider moving the HDMI phy configuration to the device tree.
> > As Sean suggested in this thread:
> >
> > ">> +static struct hdmiphy_config hdmiphy_4210_configs[] = {
> 
> I'd like to only add that patches introducing or modifying a device tree
> binding need to be acked by at least one DT binding maintainer to be
> merged.
> 
> > >> +       {
> > >> +               .pixel_clock = 27000000,
> > >> +               .conf = {
> > >> +                       0x01, 0x05, 0x00, 0xD8, 0x10, 0x1C, 0x30,
> > >> 0x40,
> > >> +                       0x6B, 0x10, 0x02, 0x51, 0xDF, 0xF2, 0x54,
> > >> 0x87,
> > >> +                       0x84, 0x00, 0x30, 0x38, 0x00, 0x08, 0x10,
> > >> 0xE0,
> > >> +                       0x22, 0x40, 0xE3, 0x26, 0x00, 0x00, 0x00,
> > >> 0x00,
> > >> +               },
> > >> +       },
> >
> > [trimmed couple more entries]
> >
> > >> +};
> > >
> > > Are you aware of the effort to move these to dt? Since these are
> > > board-specific values, it seems incorrect to apply them universally.
> > > Shirish has uploaded a patch to the chromium review site to push these
> > > into dt (https://chromium-review.googlesource.com/#/c/65581). Maybe
> > > you can work that into your patch set?"
> >
> > The configuration data is 64 bytes of the register values IIUC. Would it
> > be possible to figure out exact meaning of each byte ?
> 
> This is definitely something that I would go for. Then for board specific
> data appropriate device tree properties could be defined, not just a
> binary blob.
> 

Agree. Thanks for your opinion.

Thanks,
Inki Dae

> Best regards,
> Tomasz
> 
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsung-
> soc" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

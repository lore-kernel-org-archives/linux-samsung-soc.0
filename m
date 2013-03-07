From: Inki Dae <inki.dae@samsung.com>
Subject: RE: [PATCH RFC] drm/exynos: hdmi: move hdmiphy related code to hdmiphy
 driver
Date: Thu, 07 Mar 2013 17:35:13 +0900
Message-ID: <016801ce1b0e$b0782900$11687b00$%dae@samsung.com>
References: <1361971327-7459-1-git-send-email-rahul.sharma@samsung.com>
 <CAOw6vbLp1d8X6oKsbTVa0_5DqtFJATaM6-qt_+O+RO8y3uH2WQ@mail.gmail.com>
 <CAPdUM4Ox0VtLDf=sv7WwL-RnHsYetzcJKA5ew_3bSsR-pGuVUQ@mail.gmail.com>
 <5137FF12.3070808@samsung.com>
 <CAAQKjZMSqaD60vqM-wjuLU8O=uPsDkFKGugbOc-uKdF6QfmA7w@mail.gmail.com>
 <CAPdUM4MhLaw=c_MKedHzSJ4irk1d_dXcmdfi15GSRSmhvH4_TQ@mail.gmail.com>
 <51383BC5.4090201@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ks_c_5601-1987
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:24758 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754794Ab3CGIfR convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 7 Mar 2013 03:35:17 -0500
Received: from epcpsbgr1.samsung.com
 (u141.gpu120.samsung.co.kr [203.254.230.141])
 by mailout1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MJA00H6T7UII0Z0@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 07 Mar 2013 17:35:15 +0900 (KST)
Received: from NOINKIDAE02 ([10.90.8.52])
 by mmp1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0MJA00LNV7UQHJ10@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 07 Mar 2013 17:35:14 +0900 (KST)
In-reply-to: <51383BC5.4090201@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: sw0312.kim@samsung.com, 'Rahul Sharma' <r.sh.open@gmail.com>
Cc: linux-samsung-soc@vger.kernel.org, 'Sean Paul' <seanpaul@google.com>, 'sunil joshi' <joshi@samsung.com>, dri-devel@lists.freedesktop.org, 'Rahul Sharma' <rahul.sharma@samsung.com>



> -----Original Message-----
> From: =B1=E8=BD=C2=BF=EC [mailto:sw0312.kim@samsung.com]
> Sent: Thursday, March 07, 2013 4:04 PM
> To: Rahul Sharma
> Cc: Inki Dae; linux-samsung-soc@vger.kernel.org; Sean Paul; sunil jos=
hi;
> dri-devel@lists.freedesktop.org; Rahul Sharma; sw0312.kim@samsung.com
> Subject: Re: [PATCH RFC] drm/exynos: hdmi: move hdmiphy related code =
to
> hdmiphy driver
>=20
>=20
>=20
> On 2013=B3=E2 03=BF=F9 07=C0=CF 15:45, Rahul Sharma wrote:
> > Thanks Seung Woo, Mr. Dae,
> >
> > On Thu, Mar 7, 2013 at 10:13 AM, Inki Dae <inki.dae@samsung.com> wr=
ote:
> >> 2013/3/7 =B1=E8=BD=C2=BF=EC <sw0312.kim@samsung.com>:
> >>>
> >>>
> >>> On 2013=B3=E2 03=BF=F9 04=C0=CF 23:05, Rahul Sharma wrote:
> >>>> Thanks Sean,
> >>>>
> >>>> On Wed, Feb 27, 2013 at 9:47 PM, Sean Paul <seanpaul@google.com>
> wrote:
> >>>>> On Wed, Feb 27, 2013 at 8:22 AM, Rahul Sharma
> <rahul.sharma@samsung.com> wrote:
> >>>>>> Right now hdmiphy operations and configs are kept inside hdmi
> driver. hdmiphy related
> >>>>>> code is tightly coupled with hdmi ip driver. Physicaly they ar=
e
> different devices and
> >>>>>
> >>>>> s/Physicaly/Physically/
> >>>>>
> >>>>>> should be instantiated independently.
> >>>>>>
> >>>>>> In terms of versions/mapping/configurations Hdmi and hdmiphy a=
re
> independent of each
> >>>>>> other. It is preferred to isolate them and maintained
independently.
> >>>>>>
> >>>>>> This implementations is tested for:
> >>>>>> 1) Resolutions supported by exynos4 and 5 hdmi.
> >>>>>> 2) Runtime PM and S2R scenarions for exynos5.
> >>>>>>
> >>>>>
> >>>>> I don't like the idea of spawning off yet another driver in her=
e. It
> >>>>> adds more globals, more suspend/resume ordering issues, and mor=
e
> >>>>> implicit dependencies. I understand, however, that this is the
> Chosen
> >>>>> Way for the exynos driver, so I will save my rant.
> >>>>>
> >>>>
> >>>> I agree to it. splitting phy to a new driver will complicate the
> power related
> >>>> scenarios. But in upcoming SoC,s, Phy is changing considerably i=
n
> terms of
> >>>> config values, mapping (i2c/platform bus) etc. Handling this
> diversity
> >>>> inside hdmi driver is complicating it with unrelated changes.
> >>>
> >>> Basically, I agree with the idea to split hdmiphy from hdmi. And =
it
> >>> seems that already existing hdmiphy i2c device is just reused and
> >>> hdmiphy_power_on is reorganized to hdmiphy dpms operation: even
> calling
> >>> flow of power operations is reordered.
> >>>
> >>> But I'm not sure exynos_hdmiphy_driver_register() really need to =
be
> >>> called from exynos_drm_init() of exynos_drm_drv.c. IMO, it is eno=
ugh
> to
> >>> call exynos_hdmiphy_driver_register() from hdmi_probe() because
> hdmiphy
> >>> is only used from hdmi.
> >>>
> >>
> >> I agree with Seung-Woo. The hdmiphy is just one part of HDMI subsy=
stem.
> >>
> >
> > I agree to the Seung Woo's point that hdmi-phy used to be solely
> accessed by
> > hdmi driver.  But in this RFC, hdmi-phy is not called by hdmi drive=
r
> > anymore. Phy
> > ops will be called from drm-common-hdmi platform driver along with =
mixer
> and
> > hdmi ops.
>=20
> Considering this, exynos_drm_hdmi_probe() is more proper position.
>=20
> >
> > The rational behind my implementation is that I am projecting hdmi-=
phy
> as
> > a device which is peer to hdmi ip and mixer. These 3 devices togeth=
er
> makes
> > DRM HDMI subsystem.
> >
> > Even physically hdmi-phy doesn't seems to be a part of hdmi ip thou=
gh
> > configurations are listed under hdmi ip user manual. It looks like =
a
> > isolated module accessed by i2c.
> >
> > Though I don't find anything wrong with Seung Woo suggestion but ab=
ove
> > placement of hdmi-phy (parallel to hdmi and mixer) makes more sense
> > to me.
> >
> > Please have a another look at it and let me know your opinion.
> >
> > Another things which bothers me is registering mixer, hdmi driver i=
nside
> > exynos_drm_init(). If we strictly follow the hierarchy inside drm,
> > exynos_drm_init()
> > should register drm-common-hdmi only. drm-common-hdmi should regist=
er
> > mixer and hdmi (or hdmi-phy as well).
>=20
> Yes, it makes sense. All real hw blocks for hdmi including mixer, hdm=
i,
> and hdmiphy shoulde be registered in exynos_drm_hdmi (drm-common-hdmi
> for exynos).
>=20

Ideally, right. But the reason I designed and implemented hdmi subsyste=
m
framework like this, is that there was one issue that
platform_device_register() can't be called at probe(). On other words, =
when
one platform device driver is being probed, anyone can't be probed. Any=
way,
existing way needs to be improved. So let's find better way and improve=
 the
hdmi subsystem framework this time. :)

Thanks,
Inki Dae

> Thanks and Regards,
> - Seung-Woo Kim
>=20
> >
> > regards,
> > Rahul Sharma.
> >
> >> Thanks,
> >> Inki Dae
> >>
> >>> Thanks and Regards,
> >>> - Seung-Woo Kim
> >>>
> >>>>
> >>>> I have tested this RFC for Runtime PM / S2R. But if we see any m=
ajor
> roadblock
> >>>> we should re-factor this by explicitly calling power related
> callbacks
> >>>> of mixer, phy,
> >>>> hdmi drivers in a required order. We can call them from exynos-d=
rm-
> hdmi plf
> >>>> device. AFAIR something like this is already in place in chrome-
> kernel.
> >>>>
> >>>>> I've made some comments below.
> >>>>>
> >>>>>> This patch is dependent on
> >>>>>> http://www.mail-archive.com/dri-
> devel@lists.freedesktop.org/msg34733.html
> >>>>>> http://www.mail-archive.com/dri-
> devel@lists.freedesktop.org/msg34861.html
> >>>>>> http://www.mail-archive.com/dri-
> devel@lists.freedesktop.org/msg34862.html
> >>>>>>
> >>>>>> Signed-off-by: Rahul Sharma <rahul.sharma@samsung.com>
> >>>>>> ---
> >>>>>> It is based on exynos-drm-next-todo branch at
> >>>>>> git://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-
> exynos.git
> >>>>>>
> >>>>>>  drivers/gpu/drm/exynos/exynos_drm_drv.c  |   8 +
> >>>>>>  drivers/gpu/drm/exynos/exynos_drm_drv.h  |   6 +
> >>>>>>  drivers/gpu/drm/exynos/exynos_drm_hdmi.c |  58 ++-
> >>>>>>  drivers/gpu/drm/exynos/exynos_drm_hdmi.h |  11 +
> >>>>>>  drivers/gpu/drm/exynos/exynos_hdmi.c     | 375 ++------------=
-----
-
> >>>>>>  drivers/gpu/drm/exynos/exynos_hdmi.h     |   1 -
> >>>>>>  drivers/gpu/drm/exynos/exynos_hdmiphy.c  | 586
> ++++++++++++++++++++++++++++++-
> >>>>>>  drivers/gpu/drm/exynos/regs-hdmiphy.h    |  61 ++++
> >>>>>>  8 files changed, 738 insertions(+), 368 deletions(-)
> >>>>>>  create mode 100644 drivers/gpu/drm/exynos/regs-hdmiphy.h
> >>>>>>
> >>>
> >>> <snip>
> >>>
> >>> --
> >>> Seung-Woo Kim
> >>> Samsung Software R&D Center
> >>> --
> >>>
> >>> _______________________________________________
> >>> dri-devel mailing list
> >>> dri-devel@lists.freedesktop.org
> >>> http://lists.freedesktop.org/mailman/listinfo/dri-devel
> >
> >
> >
>=20
> --
> Seung-Woo Kim
> Samsung Software R&D Center
> --

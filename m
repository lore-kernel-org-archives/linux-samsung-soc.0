From: Rahul Sharma <r.sh.open@gmail.com>
Subject: Re: [PATCH RFC] drm/exynos: hdmi: move hdmiphy related code to
 hdmiphy driver
Date: Fri, 8 Mar 2013 14:02:42 +0530
Message-ID: <CAPdUM4OkzDd6_TPnCU8JZWtObnKvBzuOrmJdHTESTNHiBCZLLA@mail.gmail.com>
References: <1361971327-7459-1-git-send-email-rahul.sharma@samsung.com>
	<CAOw6vbLp1d8X6oKsbTVa0_5DqtFJATaM6-qt_+O+RO8y3uH2WQ@mail.gmail.com>
	<CAPdUM4Ox0VtLDf=sv7WwL-RnHsYetzcJKA5ew_3bSsR-pGuVUQ@mail.gmail.com>
	<5137FF12.3070808@samsung.com>
	<CAAQKjZMSqaD60vqM-wjuLU8O=uPsDkFKGugbOc-uKdF6QfmA7w@mail.gmail.com>
	<CAPdUM4MhLaw=c_MKedHzSJ4irk1d_dXcmdfi15GSRSmhvH4_TQ@mail.gmail.com>
	<51383BC5.4090201@samsung.com>
	<016801ce1b0e$b0782900$11687b00$%dae@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=EUC-KR
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wi0-f171.google.com ([209.85.212.171]:44697 "EHLO
	mail-wi0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755553Ab3CHIco convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 8 Mar 2013 03:32:44 -0500
Received: by mail-wi0-f171.google.com with SMTP id hn17so1257184wib.10
        for <linux-samsung-soc@vger.kernel.org>; Fri, 08 Mar 2013 00:32:42 -0800 (PST)
In-Reply-To: <016801ce1b0e$b0782900$11687b00$%dae@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Inki Dae <inki.dae@samsung.com>
Cc: sw0312.kim@samsung.com, linux-samsung-soc@vger.kernel.org, Sean Paul <seanpaul@google.com>, sunil joshi <joshi@samsung.com>, dri-devel@lists.freedesktop.org, Rahul Sharma <rahul.sharma@samsung.com>

On Thu, Mar 7, 2013 at 2:05 PM, Inki Dae <inki.dae@samsung.com> wrote:
>
>
>> -----Original Message-----
>> From: =B1=E8=BD=C2=BF=EC [mailto:sw0312.kim@samsung.com]
>> Sent: Thursday, March 07, 2013 4:04 PM
>> To: Rahul Sharma
>> Cc: Inki Dae; linux-samsung-soc@vger.kernel.org; Sean Paul; sunil jo=
shi;
>> dri-devel@lists.freedesktop.org; Rahul Sharma; sw0312.kim@samsung.co=
m
>> Subject: Re: [PATCH RFC] drm/exynos: hdmi: move hdmiphy related code=
 to
>> hdmiphy driver
>>
>>
>>
>> On 2013=B3=E2 03=BF=F9 07=C0=CF 15:45, Rahul Sharma wrote:
>> > Thanks Seung Woo, Mr. Dae,
>> >
>> > On Thu, Mar 7, 2013 at 10:13 AM, Inki Dae <inki.dae@samsung.com> w=
rote:
>> >> 2013/3/7 =B1=E8=BD=C2=BF=EC <sw0312.kim@samsung.com>:
>> >>>
>> >>>
>> >>> On 2013=B3=E2 03=BF=F9 04=C0=CF 23:05, Rahul Sharma wrote:
>> >>>> Thanks Sean,
>> >>>>
>> >>>> On Wed, Feb 27, 2013 at 9:47 PM, Sean Paul <seanpaul@google.com=
>
>> wrote:
>> >>>>> On Wed, Feb 27, 2013 at 8:22 AM, Rahul Sharma
>> <rahul.sharma@samsung.com> wrote:
>> >>>>>> Right now hdmiphy operations and configs are kept inside hdmi
>> driver. hdmiphy related
>> >>>>>> code is tightly coupled with hdmi ip driver. Physicaly they a=
re
>> different devices and
>> >>>>>
>> >>>>> s/Physicaly/Physically/
>> >>>>>
>> >>>>>> should be instantiated independently.
>> >>>>>>
>> >>>>>> In terms of versions/mapping/configurations Hdmi and hdmiphy =
are
>> independent of each
>> >>>>>> other. It is preferred to isolate them and maintained
> independently.
>> >>>>>>
>> >>>>>> This implementations is tested for:
>> >>>>>> 1) Resolutions supported by exynos4 and 5 hdmi.
>> >>>>>> 2) Runtime PM and S2R scenarions for exynos5.
>> >>>>>>
>> >>>>>
>> >>>>> I don't like the idea of spawning off yet another driver in he=
re. It
>> >>>>> adds more globals, more suspend/resume ordering issues, and mo=
re
>> >>>>> implicit dependencies. I understand, however, that this is the
>> Chosen
>> >>>>> Way for the exynos driver, so I will save my rant.
>> >>>>>
>> >>>>
>> >>>> I agree to it. splitting phy to a new driver will complicate th=
e
>> power related
>> >>>> scenarios. But in upcoming SoC,s, Phy is changing considerably =
in
>> terms of
>> >>>> config values, mapping (i2c/platform bus) etc. Handling this
>> diversity
>> >>>> inside hdmi driver is complicating it with unrelated changes.
>> >>>
>> >>> Basically, I agree with the idea to split hdmiphy from hdmi. And=
 it
>> >>> seems that already existing hdmiphy i2c device is just reused an=
d
>> >>> hdmiphy_power_on is reorganized to hdmiphy dpms operation: even
>> calling
>> >>> flow of power operations is reordered.
>> >>>
>> >>> But I'm not sure exynos_hdmiphy_driver_register() really need to=
 be
>> >>> called from exynos_drm_init() of exynos_drm_drv.c. IMO, it is en=
ough
>> to
>> >>> call exynos_hdmiphy_driver_register() from hdmi_probe() because
>> hdmiphy
>> >>> is only used from hdmi.
>> >>>
>> >>
>> >> I agree with Seung-Woo. The hdmiphy is just one part of HDMI subs=
ystem.
>> >>
>> >
>> > I agree to the Seung Woo's point that hdmi-phy used to be solely
>> accessed by
>> > hdmi driver.  But in this RFC, hdmi-phy is not called by hdmi driv=
er
>> > anymore. Phy
>> > ops will be called from drm-common-hdmi platform driver along with=
 mixer
>> and
>> > hdmi ops.
>>
>> Considering this, exynos_drm_hdmi_probe() is more proper position.
>>
>> >
>> > The rational behind my implementation is that I am projecting hdmi=
-phy
>> as
>> > a device which is peer to hdmi ip and mixer. These 3 devices toget=
her
>> makes
>> > DRM HDMI subsystem.
>> >
>> > Even physically hdmi-phy doesn't seems to be a part of hdmi ip tho=
ugh
>> > configurations are listed under hdmi ip user manual. It looks like=
 a
>> > isolated module accessed by i2c.
>> >
>> > Though I don't find anything wrong with Seung Woo suggestion but a=
bove
>> > placement of hdmi-phy (parallel to hdmi and mixer) makes more sens=
e
>> > to me.
>> >
>> > Please have a another look at it and let me know your opinion.
>> >
>> > Another things which bothers me is registering mixer, hdmi driver =
inside
>> > exynos_drm_init(). If we strictly follow the hierarchy inside drm,
>> > exynos_drm_init()
>> > should register drm-common-hdmi only. drm-common-hdmi should regis=
ter
>> > mixer and hdmi (or hdmi-phy as well).
>>
>> Yes, it makes sense. All real hw blocks for hdmi including mixer, hd=
mi,
>> and hdmiphy shoulde be registered in exynos_drm_hdmi (drm-common-hdm=
i
>> for exynos).
>>
>
> Ideally, right. But the reason I designed and implemented hdmi subsys=
tem
> framework like this, is that there was one issue that
> platform_device_register() can't be called at probe(). On other words=
, when
> one platform device driver is being probed, anyone can't be probed. A=
nyway,
> existing way needs to be improved. So let's find better way and impro=
ve the
> hdmi subsystem framework this time. :)

Mr. Dae,

if we move exynos_drm_drv.o towards last in the makefile, we can
conveniently move all driver(or plf device for drm-comon-hdmi) registra=
tions
from exynos_drm_init to module_init of the respective drivers.

I verified above changes for hdmi and S2R scenarios.

regards,
Rahul Sharma

>
> Thanks,
> Inki Dae
>
>> Thanks and Regards,
>> - Seung-Woo Kim
>>
>> >
>> > regards,
>> > Rahul Sharma.
>> >
>> >> Thanks,
>> >> Inki Dae
>> >>
>> >>> Thanks and Regards,
>> >>> - Seung-Woo Kim
>> >>>
>> >>>>
>> >>>> I have tested this RFC for Runtime PM / S2R. But if we see any =
major
>> roadblock
>> >>>> we should re-factor this by explicitly calling power related
>> callbacks
>> >>>> of mixer, phy,
>> >>>> hdmi drivers in a required order. We can call them from exynos-=
drm-
>> hdmi plf
>> >>>> device. AFAIR something like this is already in place in chrome=
-
>> kernel.
>> >>>>
>> >>>>> I've made some comments below.
>> >>>>>
>> >>>>>> This patch is dependent on
>> >>>>>> http://www.mail-archive.com/dri-
>> devel@lists.freedesktop.org/msg34733.html
>> >>>>>> http://www.mail-archive.com/dri-
>> devel@lists.freedesktop.org/msg34861.html
>> >>>>>> http://www.mail-archive.com/dri-
>> devel@lists.freedesktop.org/msg34862.html
>> >>>>>>
>> >>>>>> Signed-off-by: Rahul Sharma <rahul.sharma@samsung.com>
>> >>>>>> ---
>> >>>>>> It is based on exynos-drm-next-todo branch at
>> >>>>>> git://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-
>> exynos.git
>> >>>>>>
>> >>>>>>  drivers/gpu/drm/exynos/exynos_drm_drv.c  |   8 +
>> >>>>>>  drivers/gpu/drm/exynos/exynos_drm_drv.h  |   6 +
>> >>>>>>  drivers/gpu/drm/exynos/exynos_drm_hdmi.c |  58 ++-
>> >>>>>>  drivers/gpu/drm/exynos/exynos_drm_hdmi.h |  11 +
>> >>>>>>  drivers/gpu/drm/exynos/exynos_hdmi.c     | 375 ++-----------=
------
> -
>> >>>>>>  drivers/gpu/drm/exynos/exynos_hdmi.h     |   1 -
>> >>>>>>  drivers/gpu/drm/exynos/exynos_hdmiphy.c  | 586
>> ++++++++++++++++++++++++++++++-
>> >>>>>>  drivers/gpu/drm/exynos/regs-hdmiphy.h    |  61 ++++
>> >>>>>>  8 files changed, 738 insertions(+), 368 deletions(-)
>> >>>>>>  create mode 100644 drivers/gpu/drm/exynos/regs-hdmiphy.h
>> >>>>>>
>> >>>
>> >>> <snip>
>> >>>
>> >>> --
>> >>> Seung-Woo Kim
>> >>> Samsung Software R&D Center
>> >>> --
>> >>>
>> >>> _______________________________________________
>> >>> dri-devel mailing list
>> >>> dri-devel@lists.freedesktop.org
>> >>> http://lists.freedesktop.org/mailman/listinfo/dri-devel
>> >
>> >
>> >
>>
>> --
>> Seung-Woo Kim
>> Samsung Software R&D Center
>> --
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsu=
ng-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html



--=20
Regards,
Rahul Sharma,
email to: rahul.sharma@samsung.com
Samsung India.

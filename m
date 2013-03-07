From: Rahul Sharma <r.sh.open@gmail.com>
Subject: Re: [PATCH RFC] drm/exynos: hdmi: move hdmiphy related code to
 hdmiphy driver
Date: Thu, 7 Mar 2013 12:15:15 +0530
Message-ID: <CAPdUM4MhLaw=c_MKedHzSJ4irk1d_dXcmdfi15GSRSmhvH4_TQ@mail.gmail.com>
References: <1361971327-7459-1-git-send-email-rahul.sharma@samsung.com>
	<CAOw6vbLp1d8X6oKsbTVa0_5DqtFJATaM6-qt_+O+RO8y3uH2WQ@mail.gmail.com>
	<CAPdUM4Ox0VtLDf=sv7WwL-RnHsYetzcJKA5ew_3bSsR-pGuVUQ@mail.gmail.com>
	<5137FF12.3070808@samsung.com>
	<CAAQKjZMSqaD60vqM-wjuLU8O=uPsDkFKGugbOc-uKdF6QfmA7w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=EUC-KR
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wg0-f44.google.com ([74.125.82.44]:38023 "EHLO
	mail-wg0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751084Ab3CGGpR convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 7 Mar 2013 01:45:17 -0500
Received: by mail-wg0-f44.google.com with SMTP id dr12so95849wgb.11
        for <linux-samsung-soc@vger.kernel.org>; Wed, 06 Mar 2013 22:45:15 -0800 (PST)
In-Reply-To: <CAAQKjZMSqaD60vqM-wjuLU8O=uPsDkFKGugbOc-uKdF6QfmA7w@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Inki Dae <inki.dae@samsung.com>
Cc: sw0312.kim@samsung.com, linux-samsung-soc@vger.kernel.org, Sean Paul <seanpaul@google.com>, sunil joshi <joshi@samsung.com>, dri-devel@lists.freedesktop.org, Rahul Sharma <rahul.sharma@samsung.com>

Thanks Seung Woo, Mr. Dae,

On Thu, Mar 7, 2013 at 10:13 AM, Inki Dae <inki.dae@samsung.com> wrote:
> 2013/3/7 =B1=E8=BD=C2=BF=EC <sw0312.kim@samsung.com>:
>>
>>
>> On 2013=B3=E2 03=BF=F9 04=C0=CF 23:05, Rahul Sharma wrote:
>>> Thanks Sean,
>>>
>>> On Wed, Feb 27, 2013 at 9:47 PM, Sean Paul <seanpaul@google.com> wr=
ote:
>>>> On Wed, Feb 27, 2013 at 8:22 AM, Rahul Sharma <rahul.sharma@samsun=
g.com> wrote:
>>>>> Right now hdmiphy operations and configs are kept inside hdmi dri=
ver. hdmiphy related
>>>>> code is tightly coupled with hdmi ip driver. Physicaly they are d=
ifferent devices and
>>>>
>>>> s/Physicaly/Physically/
>>>>
>>>>> should be instantiated independently.
>>>>>
>>>>> In terms of versions/mapping/configurations Hdmi and hdmiphy are =
independent of each
>>>>> other. It is preferred to isolate them and maintained independent=
ly.
>>>>>
>>>>> This implementations is tested for:
>>>>> 1) Resolutions supported by exynos4 and 5 hdmi.
>>>>> 2) Runtime PM and S2R scenarions for exynos5.
>>>>>
>>>>
>>>> I don't like the idea of spawning off yet another driver in here. =
It
>>>> adds more globals, more suspend/resume ordering issues, and more
>>>> implicit dependencies. I understand, however, that this is the Cho=
sen
>>>> Way for the exynos driver, so I will save my rant.
>>>>
>>>
>>> I agree to it. splitting phy to a new driver will complicate the po=
wer related
>>> scenarios. But in upcoming SoC,s, Phy is changing considerably in t=
erms of
>>> config values, mapping (i2c/platform bus) etc. Handling this divers=
ity
>>> inside hdmi driver is complicating it with unrelated changes.
>>
>> Basically, I agree with the idea to split hdmiphy from hdmi. And it
>> seems that already existing hdmiphy i2c device is just reused and
>> hdmiphy_power_on is reorganized to hdmiphy dpms operation: even call=
ing
>> flow of power operations is reordered.
>>
>> But I'm not sure exynos_hdmiphy_driver_register() really need to be
>> called from exynos_drm_init() of exynos_drm_drv.c. IMO, it is enough=
 to
>> call exynos_hdmiphy_driver_register() from hdmi_probe() because hdmi=
phy
>> is only used from hdmi.
>>
>
> I agree with Seung-Woo. The hdmiphy is just one part of HDMI subsyste=
m.
>

I agree to the Seung Woo's point that hdmi-phy used to be solely access=
ed by
hdmi driver.  But in this RFC, hdmi-phy is not called by hdmi driver
anymore. Phy
ops will be called from drm-common-hdmi platform driver along with mixe=
r and
hdmi ops.

The rational behind my implementation is that I am projecting hdmi-phy =
as
a device which is peer to hdmi ip and mixer. These 3 devices together m=
akes
DRM HDMI subsystem.

Even physically hdmi-phy doesn't seems to be a part of hdmi ip though
configurations are listed under hdmi ip user manual. It looks like a
isolated module accessed by i2c.

Though I don't find anything wrong with Seung Woo suggestion but above
placement of hdmi-phy (parallel to hdmi and mixer) makes more sense
to me.

Please have a another look at it and let me know your opinion.

Another things which bothers me is registering mixer, hdmi driver insid=
e
exynos_drm_init(). If we strictly follow the hierarchy inside drm,
exynos_drm_init()
should register drm-common-hdmi only. drm-common-hdmi should register
mixer and hdmi (or hdmi-phy as well).

regards,
Rahul Sharma.

> Thanks,
> Inki Dae
>
>> Thanks and Regards,
>> - Seung-Woo Kim
>>
>>>
>>> I have tested this RFC for Runtime PM / S2R. But if we see any majo=
r roadblock
>>> we should re-factor this by explicitly calling power related callba=
cks
>>> of mixer, phy,
>>> hdmi drivers in a required order. We can call them from exynos-drm-=
hdmi plf
>>> device. AFAIR something like this is already in place in chrome-ker=
nel.
>>>
>>>> I've made some comments below.
>>>>
>>>>> This patch is dependent on
>>>>> http://www.mail-archive.com/dri-devel@lists.freedesktop.org/msg34=
733.html
>>>>> http://www.mail-archive.com/dri-devel@lists.freedesktop.org/msg34=
861.html
>>>>> http://www.mail-archive.com/dri-devel@lists.freedesktop.org/msg34=
862.html
>>>>>
>>>>> Signed-off-by: Rahul Sharma <rahul.sharma@samsung.com>
>>>>> ---
>>>>> It is based on exynos-drm-next-todo branch at
>>>>> git://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos.=
git
>>>>>
>>>>>  drivers/gpu/drm/exynos/exynos_drm_drv.c  |   8 +
>>>>>  drivers/gpu/drm/exynos/exynos_drm_drv.h  |   6 +
>>>>>  drivers/gpu/drm/exynos/exynos_drm_hdmi.c |  58 ++-
>>>>>  drivers/gpu/drm/exynos/exynos_drm_hdmi.h |  11 +
>>>>>  drivers/gpu/drm/exynos/exynos_hdmi.c     | 375 ++---------------=
---
>>>>>  drivers/gpu/drm/exynos/exynos_hdmi.h     |   1 -
>>>>>  drivers/gpu/drm/exynos/exynos_hdmiphy.c  | 586 +++++++++++++++++=
+++++++++++++-
>>>>>  drivers/gpu/drm/exynos/regs-hdmiphy.h    |  61 ++++
>>>>>  8 files changed, 738 insertions(+), 368 deletions(-)
>>>>>  create mode 100644 drivers/gpu/drm/exynos/regs-hdmiphy.h
>>>>>
>>
>> <snip>
>>
>> --
>> Seung-Woo Kim
>> Samsung Software R&D Center
>> --
>>
>> _______________________________________________
>> dri-devel mailing list
>> dri-devel@lists.freedesktop.org
>> http://lists.freedesktop.org/mailman/listinfo/dri-devel



--=20
Regards,
Rahul Sharma,
email to: rahul.sharma@samsung.com
Samsung India.

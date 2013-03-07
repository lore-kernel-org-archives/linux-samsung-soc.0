From: Rahul Sharma <r.sh.open@gmail.com>
Subject: Re: [PATCH RFC] drm/exynos: hdmi: move hdmiphy related code to
 hdmiphy driver
Date: Thu, 7 Mar 2013 15:23:11 +0530
Message-ID: <CAPdUM4M_kKtJ+68g7hRn5R1ZsOiiiWMt-0RLU9g3-x=itRe3ig@mail.gmail.com>
References: <1361971327-7459-1-git-send-email-rahul.sharma@samsung.com>
	<CAOw6vbLp1d8X6oKsbTVa0_5DqtFJATaM6-qt_+O+RO8y3uH2WQ@mail.gmail.com>
	<CAPdUM4Ox0VtLDf=sv7WwL-RnHsYetzcJKA5ew_3bSsR-pGuVUQ@mail.gmail.com>
	<5137FF12.3070808@samsung.com>
	<CAAQKjZMSqaD60vqM-wjuLU8O=uPsDkFKGugbOc-uKdF6QfmA7w@mail.gmail.com>
	<CACP_E+LpW7VrWjek0M3+_UrYY9NuZWyarfDJSOdGaCjaJmvt9w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wg0-f44.google.com ([74.125.82.44]:61399 "EHLO
	mail-wg0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751049Ab3CGJxN convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 7 Mar 2013 04:53:13 -0500
Received: by mail-wg0-f44.google.com with SMTP id dr12so381351wgb.11
        for <linux-samsung-soc@vger.kernel.org>; Thu, 07 Mar 2013 01:53:11 -0800 (PST)
In-Reply-To: <CACP_E+LpW7VrWjek0M3+_UrYY9NuZWyarfDJSOdGaCjaJmvt9w@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: =?ISO-8859-1?Q?St=E9phane_Marchesin?= <stephane.marchesin@gmail.com>
Cc: Inki Dae <inki.dae@samsung.com>, sw0312.kim@samsung.com, linux-samsung-soc@vger.kernel.org, Sean Paul <seanpaul@google.com>, sunil joshi <joshi@samsung.com>, dri-devel@lists.freedesktop.org, Rahul Sharma <rahul.sharma@samsung.com>

On Thu, Mar 7, 2013 at 12:37 PM, St=C3=A9phane Marchesin
<stephane.marchesin@gmail.com> wrote:
> On Wed, Mar 6, 2013 at 8:43 PM, Inki Dae <inki.dae@samsung.com> wrote=
:
>> 2013/3/7 =EA=B9=80=EC=8A=B9=EC=9A=B0 <sw0312.kim@samsung.com>:
>>>
>>>
>>> On 2013=EB=85=84 03=EC=9B=94 04=EC=9D=BC 23:05, Rahul Sharma wrote:
>>>> Thanks Sean,
>>>>
>>>> On Wed, Feb 27, 2013 at 9:47 PM, Sean Paul <seanpaul@google.com> w=
rote:
>>>>> On Wed, Feb 27, 2013 at 8:22 AM, Rahul Sharma <rahul.sharma@samsu=
ng.com> wrote:
>>>>>> Right now hdmiphy operations and configs are kept inside hdmi dr=
iver. hdmiphy related
>>>>>> code is tightly coupled with hdmi ip driver. Physicaly they are =
different devices and
>>>>>
>>>>> s/Physicaly/Physically/
>>>>>
>>>>>> should be instantiated independently.
>>>>>>
>>>>>> In terms of versions/mapping/configurations Hdmi and hdmiphy are=
 independent of each
>>>>>> other. It is preferred to isolate them and maintained independen=
tly.
>>>>>>
>>>>>> This implementations is tested for:
>>>>>> 1) Resolutions supported by exynos4 and 5 hdmi.
>>>>>> 2) Runtime PM and S2R scenarions for exynos5.
>>>>>>
>>>>>
>>>>> I don't like the idea of spawning off yet another driver in here.=
 It
>>>>> adds more globals, more suspend/resume ordering issues, and more
>>>>> implicit dependencies. I understand, however, that this is the Ch=
osen
>>>>> Way for the exynos driver, so I will save my rant.
>>>>>
>>>>
>>>> I agree to it. splitting phy to a new driver will complicate the p=
ower related
>>>> scenarios. But in upcoming SoC,s, Phy is changing considerably in =
terms of
>>>> config values, mapping (i2c/platform bus) etc. Handling this diver=
sity
>>>> inside hdmi driver is complicating it with unrelated changes.
>>>
>>> Basically, I agree with the idea to split hdmiphy from hdmi. And it
>>> seems that already existing hdmiphy i2c device is just reused and
>>> hdmiphy_power_on is reorganized to hdmiphy dpms operation: even cal=
ling
>>> flow of power operations is reordered.
>>>
>>> But I'm not sure exynos_hdmiphy_driver_register() really need to be
>>> called from exynos_drm_init() of exynos_drm_drv.c. IMO, it is enoug=
h to
>>> call exynos_hdmiphy_driver_register() from hdmi_probe() because hdm=
iphy
>>> is only used from hdmi.
>>>
>>
>> I agree with Seung-Woo. The hdmiphy is just one part of HDMI subsyst=
em.
>>
>
> But this is probably going to break dpms and/or suspend/resume
> functionality. Has that been tested?
>
> St=C3=A9phane
>
Hi St=C3=A9phane

This has been tested for dpms and suspend/resume scenarios for exynos5.=
 I
have yet to try with hdmi, mixer, phy driver registration moved to
common-drm-hdmi.

regards,
Rahul Sharma.

>> Thanks,
>> Inki Dae
>>
>>> Thanks and Regards,
>>> - Seung-Woo Kim
>>>
>>>>
>>>> I have tested this RFC for Runtime PM / S2R. But if we see any maj=
or roadblock
>>>> we should re-factor this by explicitly calling power related callb=
acks
>>>> of mixer, phy,
>>>> hdmi drivers in a required order. We can call them from exynos-drm=
-hdmi plf
>>>> device. AFAIR something like this is already in place in chrome-ke=
rnel.
>>>>
>>>>> I've made some comments below.
>>>>>
>>>>>> This patch is dependent on
>>>>>> http://www.mail-archive.com/dri-devel@lists.freedesktop.org/msg3=
4733.html
>>>>>> http://www.mail-archive.com/dri-devel@lists.freedesktop.org/msg3=
4861.html
>>>>>> http://www.mail-archive.com/dri-devel@lists.freedesktop.org/msg3=
4862.html
>>>>>>
>>>>>> Signed-off-by: Rahul Sharma <rahul.sharma@samsung.com>
>>>>>> ---
>>>>>> It is based on exynos-drm-next-todo branch at
>>>>>> git://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos=
=2Egit
>>>>>>
>>>>>>  drivers/gpu/drm/exynos/exynos_drm_drv.c  |   8 +
>>>>>>  drivers/gpu/drm/exynos/exynos_drm_drv.h  |   6 +
>>>>>>  drivers/gpu/drm/exynos/exynos_drm_hdmi.c |  58 ++-
>>>>>>  drivers/gpu/drm/exynos/exynos_drm_hdmi.h |  11 +
>>>>>>  drivers/gpu/drm/exynos/exynos_hdmi.c     | 375 ++--------------=
----
>>>>>>  drivers/gpu/drm/exynos/exynos_hdmi.h     |   1 -
>>>>>>  drivers/gpu/drm/exynos/exynos_hdmiphy.c  | 586 ++++++++++++++++=
++++++++++++++-
>>>>>>  drivers/gpu/drm/exynos/regs-hdmiphy.h    |  61 ++++
>>>>>>  8 files changed, 738 insertions(+), 368 deletions(-)
>>>>>>  create mode 100644 drivers/gpu/drm/exynos/regs-hdmiphy.h
>>>>>>
>>>
>>> <snip>
>>>
>>> --
>>> Seung-Woo Kim
>>> Samsung Software R&D Center
>>> --
>>>
>>> _______________________________________________
>>> dri-devel mailing list
>>> dri-devel@lists.freedesktop.org
>>> http://lists.freedesktop.org/mailman/listinfo/dri-devel
>> _______________________________________________
>> dri-devel mailing list
>> dri-devel@lists.freedesktop.org
>> http://lists.freedesktop.org/mailman/listinfo/dri-devel
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

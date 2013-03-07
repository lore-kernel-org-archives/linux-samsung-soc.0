From: Inki Dae <inki.dae@samsung.com>
Subject: Re: [PATCH RFC] drm/exynos: hdmi: move hdmiphy related code to
 hdmiphy driver
Date: Thu, 7 Mar 2013 13:43:55 +0900
Message-ID: <CAAQKjZMSqaD60vqM-wjuLU8O=uPsDkFKGugbOc-uKdF6QfmA7w@mail.gmail.com>
References: <1361971327-7459-1-git-send-email-rahul.sharma@samsung.com>
	<CAOw6vbLp1d8X6oKsbTVa0_5DqtFJATaM6-qt_+O+RO8y3uH2WQ@mail.gmail.com>
	<CAPdUM4Ox0VtLDf=sv7WwL-RnHsYetzcJKA5ew_3bSsR-pGuVUQ@mail.gmail.com>
	<5137FF12.3070808@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=EUC-KR
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-la0-f54.google.com ([209.85.215.54]:44762 "EHLO
	mail-la0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754718Ab3CGEn7 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 6 Mar 2013 23:43:59 -0500
Received: by mail-la0-f54.google.com with SMTP id gw10so28480lab.27
        for <linux-samsung-soc@vger.kernel.org>; Wed, 06 Mar 2013 20:43:56 -0800 (PST)
In-Reply-To: <5137FF12.3070808@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: sw0312.kim@samsung.com
Cc: Rahul Sharma <r.sh.open@gmail.com>, linux-samsung-soc@vger.kernel.org, Sean Paul <seanpaul@google.com>, sunil joshi <joshi@samsung.com>, dri-devel@lists.freedesktop.org, Rahul Sharma <rahul.sharma@samsung.com>

2013/3/7 =B1=E8=BD=C2=BF=EC <sw0312.kim@samsung.com>:
>
>
> On 2013=B3=E2 03=BF=F9 04=C0=CF 23:05, Rahul Sharma wrote:
>> Thanks Sean,
>>
>> On Wed, Feb 27, 2013 at 9:47 PM, Sean Paul <seanpaul@google.com> wro=
te:
>>> On Wed, Feb 27, 2013 at 8:22 AM, Rahul Sharma <rahul.sharma@samsung=
=2Ecom> wrote:
>>>> Right now hdmiphy operations and configs are kept inside hdmi driv=
er. hdmiphy related
>>>> code is tightly coupled with hdmi ip driver. Physicaly they are di=
fferent devices and
>>>
>>> s/Physicaly/Physically/
>>>
>>>> should be instantiated independently.
>>>>
>>>> In terms of versions/mapping/configurations Hdmi and hdmiphy are i=
ndependent of each
>>>> other. It is preferred to isolate them and maintained independentl=
y.
>>>>
>>>> This implementations is tested for:
>>>> 1) Resolutions supported by exynos4 and 5 hdmi.
>>>> 2) Runtime PM and S2R scenarions for exynos5.
>>>>
>>>
>>> I don't like the idea of spawning off yet another driver in here. I=
t
>>> adds more globals, more suspend/resume ordering issues, and more
>>> implicit dependencies. I understand, however, that this is the Chos=
en
>>> Way for the exynos driver, so I will save my rant.
>>>
>>
>> I agree to it. splitting phy to a new driver will complicate the pow=
er related
>> scenarios. But in upcoming SoC,s, Phy is changing considerably in te=
rms of
>> config values, mapping (i2c/platform bus) etc. Handling this diversi=
ty
>> inside hdmi driver is complicating it with unrelated changes.
>
> Basically, I agree with the idea to split hdmiphy from hdmi. And it
> seems that already existing hdmiphy i2c device is just reused and
> hdmiphy_power_on is reorganized to hdmiphy dpms operation: even calli=
ng
> flow of power operations is reordered.
>
> But I'm not sure exynos_hdmiphy_driver_register() really need to be
> called from exynos_drm_init() of exynos_drm_drv.c. IMO, it is enough =
to
> call exynos_hdmiphy_driver_register() from hdmi_probe() because hdmip=
hy
> is only used from hdmi.
>

I agree with Seung-Woo. The hdmiphy is just one part of HDMI subsystem.

Thanks,
Inki Dae

> Thanks and Regards,
> - Seung-Woo Kim
>
>>
>> I have tested this RFC for Runtime PM / S2R. But if we see any major=
 roadblock
>> we should re-factor this by explicitly calling power related callbac=
ks
>> of mixer, phy,
>> hdmi drivers in a required order. We can call them from exynos-drm-h=
dmi plf
>> device. AFAIR something like this is already in place in chrome-kern=
el.
>>
>>> I've made some comments below.
>>>
>>>> This patch is dependent on
>>>> http://www.mail-archive.com/dri-devel@lists.freedesktop.org/msg347=
33.html
>>>> http://www.mail-archive.com/dri-devel@lists.freedesktop.org/msg348=
61.html
>>>> http://www.mail-archive.com/dri-devel@lists.freedesktop.org/msg348=
62.html
>>>>
>>>> Signed-off-by: Rahul Sharma <rahul.sharma@samsung.com>
>>>> ---
>>>> It is based on exynos-drm-next-todo branch at
>>>> git://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos.g=
it
>>>>
>>>>  drivers/gpu/drm/exynos/exynos_drm_drv.c  |   8 +
>>>>  drivers/gpu/drm/exynos/exynos_drm_drv.h  |   6 +
>>>>  drivers/gpu/drm/exynos/exynos_drm_hdmi.c |  58 ++-
>>>>  drivers/gpu/drm/exynos/exynos_drm_hdmi.h |  11 +
>>>>  drivers/gpu/drm/exynos/exynos_hdmi.c     | 375 ++----------------=
--
>>>>  drivers/gpu/drm/exynos/exynos_hdmi.h     |   1 -
>>>>  drivers/gpu/drm/exynos/exynos_hdmiphy.c  | 586 ++++++++++++++++++=
++++++++++++-
>>>>  drivers/gpu/drm/exynos/regs-hdmiphy.h    |  61 ++++
>>>>  8 files changed, 738 insertions(+), 368 deletions(-)
>>>>  create mode 100644 drivers/gpu/drm/exynos/regs-hdmiphy.h
>>>>
>
> <snip>
>
> --
> Seung-Woo Kim
> Samsung Software R&D Center
> --
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> http://lists.freedesktop.org/mailman/listinfo/dri-devel

From: Inki Dae <inki.dae@samsung.com>
Subject: Re: [PATCH v2 0/7] drm/exynos: add pm runtime support
Date: Wed, 04 Nov 2015 20:46:31 +0900
Message-ID: <5639F017.7000006@samsung.com>
References: <1446547629-12521-1-git-send-email-inki.dae@samsung.com>
 <5638B57E.9070702@samsung.com>
 <CAAQKjZOUBE5Grz=pPtwx9oF19-yoRX-UFtv9C+GxQgNy_sSRag@mail.gmail.com>
 <5639B2AE.6020601@samsung.com> <5639BA2E.6090707@samsung.com>
 <5639DA5F.2000302@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:50386 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752292AbbKDLqe convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 4 Nov 2015 06:46:34 -0500
Received: from epcpsbgr3.samsung.com
 (u143.gpu120.samsung.co.kr [203.254.230.143])
 by mailout1.samsung.com (Oracle Communications Messaging Server 7.0.5.31.0
 64bit (built May  5 2014))
 with ESMTP id <0NXA00W76GPJVM60@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 04 Nov 2015 20:46:31 +0900 (KST)
In-reply-to: <5639DA5F.2000302@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Andrzej Hajda <a.hajda@samsung.com>
Cc: DRI mailing list <dri-devel@lists.freedesktop.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>



2015=EB=85=84 11=EC=9B=94 04=EC=9D=BC 19:13=EC=97=90 Andrzej Hajda =EC=9D=
=B4(=EA=B0=80) =EC=93=B4 =EA=B8=80:
> On 11/04/2015 08:56 AM, Inki Dae wrote:
>>
>> 2015=EB=85=84 11=EC=9B=94 04=EC=9D=BC 16:24=EC=97=90 Andrzej Hajda =EC=
=9D=B4(=EA=B0=80) =EC=93=B4 =EA=B8=80:
>>> On 11/03/2015 04:38 PM, Inki Dae wrote:
>>>> =20
>>>> 2015-11-03 22:24 GMT+09:00 Andrzej Hajda <a.hajda@samsung.com
>>>> <mailto:a.hajda@samsung.com>>:
>>>>> Hi Inki,
>>>>>
>>>>> On 11/03/2015 11:47 AM, Inki Dae wrote:
>>>>>> This patch series adds pm runtime support for Exynos drm.
>>>>>>
>>>>>> Originally, this patch was posted by Gustavo but there was no an=
y
>>>>>> answer about some comments. So I rebased this patch series on to=
p of
>>>>>> exynos-drm-next, removed unnecessary patches and modified wrong =
macro.
>>>>> I have sent comment to original patchset[1], but for some strange=
 reasons
>>>>> it went only to mailing lists.
>>>>> My concerns were as follows:
>>>>> - exynos_drm has already pm_runtime support via exynos_drm_drv pm=
 ops,
>>>>>   why should we add per component support?
>>>> =20
>>>> For this, I think I already mentioned enough,
>>>>         http://www.spinics.net/lists/linux-samsung-soc/msg47695.ht=
ml
>>>>
>>>> In brief, exynos_drm_drv doesn't control each power domain of each=
 kms device.
>>>> It means that we cannot power off fully without pm runtime interfa=
ce of each
>>>> kms device - just they can only control their clock not power doma=
in. So
>>>> question. How we could control power domain of each kms device wit=
hout runtime
>>>> pm interface?
>>> Hmm, but to enable pm_runtime in components it is enough to use
>>> pm_runtime_enable/disable and pm_runtime_get/put(_sync), there is n=
o need to add
>>> pm callbacks.
>> That is this patch series does, and pm callback is implemented in ex=
ynos_drm_drv not in component drivers.
>=20
> But this patchset adds runtime_pm ops to each component. Runtime_pm s=
upport does
> not require
> implementing runtime_pm ops, they just increases complexity of the co=
de, and I
> see no gain in splitting
> power off/on sequence between drm enable/disable callbacks and suspen=
d/resume
> callbacks.

Seems reasonable but if there is no any implemention of runtime pm ops =
and
only runtime pm api is called in enable or disable callbacks of each co=
mpoment
driver, then we wouldn't know which component driver runtime pm request=
 failed
at - we could check if the power domain of each compoment device is ena=
bled
or disabled correctly by checking each compoment's runtime pm suspend/r=
esume call.

So I think it'd be better to implement component's runtime pm ops to ma=
ke sure
to check if the runtime pm call successed, and I think also to fulfill
the use of runtime pm api correctly.

Anyway, I'd like to open this patchset for more review for a while befo=
re going to -next.
Welcome to any opinions.

Thanks,
Inki Dae

>=20
> Regards
> Andrzej
>=20
>>
>>> In fact most of the components already supports runtime pm,  but qu=
ick grep
>>> shows that it is not implemented in:
>>> exynos_drm_dsi.c, exynos_dp_core.c, exynos_drm_mic.c.
>> exynos_dp_core already has runtime pm interface with this patch seri=
es. For dsi and mic, we need to add the runtime pm interfaces.
>>
>>> So I guess adding pm_runtime support by adding calls pm_runtime_ena=
ble/disable
>>> and pm_runtime_get/put(_sync) in appropriate places should be enoug=
h.
>>>
>>>>> - component suspend sequence is non deterministic, but in case of
>>>>>   video pipelines, specification often requires fixed order,
>>>> Can your show me an example? I think component suspend and resume =
are invoked
>>>> by only drm dpms interface, and the dpms interface has a fixed ord=
er - when
>>>> dpms goes to off, encoder first, and when dpms goes to on, crtc fi=
rst.
>>> Now as I understand you do not want to remove exynos_drm_drv pm cal=
lbacks so
>>> they will disable devices properly, after that clock disabling orde=
r should not
>>> matter, so the whole point is not valid.
>> In this case, the dpms actually is invoked by SLEEP PM of Linux powe=
r management framework. DRM KMS has a interface to control power of kms=
 device, which is really different from SLEEP PM.
>> So this request can be done by userspace in runtime - just Display p=
ower off/on.
>>
>>>> My only concern is that runtime pm interface of each kms driver is=
 called
>>>> within pm sleep context of Exynos drm driver. So I will look into =
this no problem.
>>>>
>>>>> - the patchset adds implicit dependency on PM_SLEEP.
>>>>>
>>>>>
>>>>> Current solution should work correctly and it was OK last time I =
have tested it.
>>>>> I am not sure about atomic requirements, are there special ones?
>>>> Not related to atomic feature.
>>>>
>>>>> There are other issues with current solution, rather easy to solv=
e:
>>>>> - it assumes that exynos-drm device will be suspended first - it =
should be true,
>>>>>  as it is created at the end and suspend order is reverse to crea=
tion order, but
>>>>>  I am not sure if we can rely on it - some solution is to add pm =
callbacks to
>>>>>  all components, and from those callbacks call one centralized pm=
 routine,
>>>> You mean pm callbacks are pm sleep interface? And you mean let's a=
dd sleep pm
>>>> interface to each kms driver?  If so, I'm not agree with you becau=
se sleep pm
>>>> should be controlled by only drm top like single driver does.
>>> Lets look at an example:
>>> Assume we have present only fimd and dsi components.
>>> In such case kernel creates two platform devices for fimd and dsi i=
n early stage
>>> of parsing device tree blob.
>>> During exynos_drm_drv initialization exynos-drm platform device is =
created, the
>>> important thing it is created after fimd and dsi.
>>> Now when platform enters sleep mode suspend callbacks are called, t=
he important
>>> thing here is
>>> in which order. If I remember correctly PM guarantees only that chi=
ldren will be
>>> handled before parents.
>>> Since we have no parent-child relation between exynos-drm, fimd and=
 dsi, the
>>> order is unknown.
>> exynos-drm is not real hardware. So the order is only valid for kms =
devices - components.
>> The only thing exynos-drm does is to invoke dpms so that kms devices=
 are enabled or disabled in fixed order.
>>
>> And as I mentioned before, my only concern is that runtime pm interf=
ace of each kms driver is called
>> within pm sleep context of Exynos drm driver. So required for more r=
eview and test.
>>
>>> So it will be possible that component will enter sleep mode before =
exynos-drm
>> How component can enter sleep mode before exynos-drm? compoments hav=
e no sleep pm interfaces but only runtime pm interface,
>> and even the runtime pm interfaces will be called by pm interfaces o=
f exynos-drm only when sleep pm is requested.
>> Otherwise, the runtime pm interface of each component will be called=
 by dpms request from userspace.
>>
>>> and in such case system can even
>>> hang if exynos-drm callbacks will try to access registers of such c=
omponent.
>> So seems not true.
>>
>>> Fortunately in current implementation of PM order of suspending is =
reversed
>>> order of device creation, so
>>> it will be always exynos-drm first.
>>>
>>> So in short we rely here on implementation detail of PM framework.
>>>
>>>>> - suspend/resume callbacks theoretically can be called during com=
ponent
>>>>>   master initialization/deinitailization it could be racy,
>>>> I'm not sure what you mean but component master
>>>> initialization/deinitailization mean bind and unbind? If so, bind/=
unbind
>>>> interfaces of all components will never call pm relevant interface=
s but the
>>>> the pm relevant interfaces are called by only dpms interface.
>>> exynos_drm_sys_suspend and exynos_drm_sys_resume takes pointer
>>> to drm_device and uses it. It is possible that in the same time drm=
_driver
>>> is destroyed for some reason it will result in invalid pointer in r=
esume/suspend
>>> callbacks.
>> Not sure but seems like to need more review and test anyway.
>>
>>> The problem is common for componentized drivers and was already rep=
orted [1],
>>> but there
>>> is no general solution for it. On the other side probability it wil=
l ever happen
>>> seems to be very low.
>>>
>>> [1]: http://permalink.gmane.org/gmane.comp.video.dri.devel/115820
>>>
>>>>> - exynos_drm_sys_suspend/resume calls exynos_drm_suspend/resume
>>>>>   for historical reasons, these function can be merged together.
>>>> Also can you show me more detail?
>>> This is quite simple, I will post patch for it.
>> Thanks for sharing.
>>
>> Anyway, I believe Gustavo to take care of this patch series after ba=
ck from his vacation.
>>
>> Thanks,
>> Inki Dae
>>
>>> Regards
>>> Andrzej
>>>
>>>> Thanks,
>>>> Inki Dae
>>>>
>>>>> [1]: http://permalink.gmane.org/gmane.linux.kernel.samsung-soc/48=
395
>>>>>
>>>>> Regards
>>>>> Andrzej
>>>>>
>>>>>> Changelog v2:
>>>>>> - Remove patch 5 and 6.
>>>>>>   . commit callback are already removed so isn't required anymor=
e.
>>>>>> - Remove patch 8 which makes dp clock enabled directly from FIMD=
=2E
>>>>>>   . Really not mendatory for FIMD uses DP, and it could be diffe=
rent
>>>>>>     according to Board.
>>>>>> - Modified CONFIG_PM_SLEEP to CONFIG_PM.
>>>>>>   . In case of runtime pm, CONFIG_PM macro should be used instea=
d of
>>>>>>     CONFIG_PM_SLEEP.
>>>>>>
>>>>>> Gustavo Padovan (7):
>>>>>>   drm/exynos: do not start enabling DP at bind() phase
>>>>>>   drm/exynos: add pm_runtime to DP
>>>>>>   drm/exynos: add pm_runtime to HDMI
>>>>>>   drm/exynos: add pm_runtime to Mixer
>>>>>>   drm/exynos: add pm_runtime to FIMD
>>>>>>   drm/exynos: add pm_runtime to DECON 5433
>>>>>>   drm/exynos: add pm_runtime to DECON 7
>>>>>>
>>>>>>  drivers/gpu/drm/exynos/exynos5433_drm_decon.c |  54 ++++++---
>>>>>>  drivers/gpu/drm/exynos/exynos7_drm_decon.c    | 125 +++++++++--=
--------
>>>>>>  drivers/gpu/drm/exynos/exynos_dp_core.c       | 165 +++++++++++=
++++++++-------
>>>>>>  drivers/gpu/drm/exynos/exynos_dp_core.h       |   1 +
>>>>>>  drivers/gpu/drm/exynos/exynos_drm_fimd.c      |  91 ++++++-----=
---
>>>>>>  drivers/gpu/drm/exynos/exynos_hdmi.c          |  56 ++++++---
>>>>>>  drivers/gpu/drm/exynos/exynos_mixer.c         | 125 ++++++++++-=
--------
>>>>>>  7 files changed, 352 insertions(+), 265 deletions(-)
>>>>>>
>>>>> _______________________________________________
>>>>> dri-devel mailing list
>>>>> dri-devel@lists.freedesktop.org <mailto:dri-devel@lists.freedeskt=
op.org>
>>>>> http://lists.freedesktop.org/mailman/listinfo/dri-devel
>>>> =20
>>>> =20
>>>
>=20
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsu=
ng-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>=20

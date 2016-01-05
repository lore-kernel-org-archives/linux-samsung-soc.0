From: Inki Dae <inki.dae@samsung.com>
Subject: Re: [PATCH] drm/exynos: fix kernel panic issue at drm releasing
Date: Tue, 05 Jan 2016 21:30:10 +0900
Message-ID: <568BB752.7050603@samsung.com>
References: <1450948214-14688-1-git-send-email-inki.dae@samsung.com>
 <CAPj87rMUrt55rBSXiFAsJ=vKUjohDmZPeC2CTMbTNAbVkCgYBg@mail.gmail.com>
 <568A5E3A.8090601@samsung.com>
 <CAPj87rOjMnCRsThp3vjOpik4nYcJdV_M1eEJxTOAUVHA700YCg@mail.gmail.com>
 <568BA138.3050504@samsung.com> <20160105110811.GB8076@phenom.ffwll.local>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:39487 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751603AbcAEMaN (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 5 Jan 2016 07:30:13 -0500
Received: from epcpsbgr3.samsung.com
 (u143.gpu120.samsung.co.kr [203.254.230.143])
 by mailout2.samsung.com (Oracle Communications Messaging Server 7.0.5.31.0
 64bit (built May  5 2014))
 with ESMTP id <0O0H01NC6C2AXQ70@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 05 Jan 2016 21:30:11 +0900 (KST)
In-reply-to: <20160105110811.GB8076@phenom.ffwll.local>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Daniel Vetter <daniel@ffwll.ch>
Cc: Daniel Stone <daniel@fooishbar.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>, Rob Clark <robdclark@gmail.com>

+ Rob Clark,

Hi Daniel and Rob,

2016=EB=85=84 01=EC=9B=94 05=EC=9D=BC 20:08=EC=97=90 Daniel Vetter =EC=9D=
=B4(=EA=B0=80) =EC=93=B4 =EA=B8=80:
> On Tue, Jan 05, 2016 at 07:55:52PM +0900, Inki Dae wrote:
>> Hi Daniel,
>>
>> 2016=EB=85=84 01=EC=9B=94 05=EC=9D=BC 05:24=EC=97=90 Daniel Stone =EC=
=9D=B4(=EA=B0=80) =EC=93=B4 =EA=B8=80:
>>> Hi Inki,
>>>
>>> On 4 January 2016 at 12:57, Inki Dae <inki.dae@samsung.com> wrote:
>>>> 2015=EB=85=84 12=EC=9B=94 24=EC=9D=BC 22:32=EC=97=90 Daniel Stone =
=EC=9D=B4(=EA=B0=80) =EC=93=B4 =EA=B8=80:
>>>>> On 24 December 2015 at 09:10, Inki Dae <inki.dae@samsung.com> wro=
te:
>>>>>> +void exynos_drm_crtc_cancel_page_flip(struct drm_crtc *crtc)
>>>>>> +{
>>>>>> +       struct exynos_drm_crtc *exynos_crtc =3D to_exynos_crtc(c=
rtc);
>>>>>> +       unsigned long flags;
>>>>>> +
>>>>>> +       spin_lock_irqsave(&crtc->dev->event_lock, flags);
>>>>>> +       exynos_crtc->event =3D NULL;
>>>>>> +       spin_unlock_irqrestore(&crtc->dev->event_lock, flags);
>>>>>> +}
>>>>>
>>>>> This will leak the event and event space; you should call
>>>>> event->base.destroy() here. With that fixed:
>>>>
>>>> Right. we don't use exynos specific page flip function anymore whi=
ch managed the event as a list so that the event objects can be freed b=
y postclose callback.
>>>> Anyway, would it be better for event->base.destory() to be called =
between spin lock/unlock?
>>>
>>> You must increment event->base.file_priv->event_space (see
>>> drm_atomic.c:destroy_vblank_event), as well as calling
>>
>> Reasonable to me. Seems other DRM drivers don't increment event_spac=
e.
>>
>>> event->base.destroy (see drm_fops.c:drm_read) underneath event_lock=
,
>>> yes.
>>
>> In addition, only event objects belonging to the request process sho=
uld be destroyed.
>=20
> Just random comment out of the far left field, but robclark had a bun=
ch of
> patches to clean up all that event alloc/cleanup code a bit and extra=
ct it
> into core functions. Might be good to ping him on irc to figure out w=
here
> that series is and whether you could take it over.

Good news. I'll try to ping him on irc.

To Rob,
Can you let me know where your bunch of patches are? I'd like to look i=
nto the patches. I'd planned to have pull request so that this patch ca=
n go to 4.4.
As you had already relevant patch set maybe, we would need to check whe=
ther my patch can be replaced with your patch set or there is any corne=
r case.

Thanks,
Inki Dae

>=20
> Cheers, Daniel
>=20

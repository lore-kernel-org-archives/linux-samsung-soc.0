From: Joonyoung Shim <jy0922.shim@samsung.com>
Subject: Re: [PATCH v7 12/13] drm/exynos: atomic dpms support
Date: Fri, 29 May 2015 15:20:52 +0900
Message-ID: <55680544.2000404@samsung.com>
References: <1432309253-18572-1-git-send-email-gustavo@padovan.org>
 <1432309253-18572-13-git-send-email-gustavo@padovan.org>
 <5565B817.6080001@samsung.com> <20150527202749.GC20774@joana>
 <5566AA04.4080400@samsung.com> <5566D0A9.2000109@samsung.com>
 <556701B9.5030505@samsung.com> <20150528213648.GD20774@joana>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:9211 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753580AbbE2GUz (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 29 May 2015 02:20:55 -0400
Received: from epcpsbgr2.samsung.com
 (u142.gpu120.samsung.co.kr [203.254.230.142])
 by mailout2.samsung.com (Oracle Communications Messaging Server 7.0.5.31.0
 64bit (built May  5 2014))
 with ESMTP id <0NP300IQOLMK2J90@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 29 May 2015 15:20:45 +0900 (KST)
In-reply-to: <20150528213648.GD20774@joana>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Gustavo Padovan <gustavo@padovan.org>, Inki Dae <inki.dae@samsung.com>, linux-samsung-soc@vger.kernel.org, dri-devel@lists.freedesktop.org, tjakobi@math.uni-bielefeld.de, Gustavo Padovan <gustavo.padovan@collabora.co.uk>

On 05/29/2015 06:36 AM, Gustavo Padovan wrote:
> 2015-05-28 Joonyoung Shim <jy0922.shim@samsung.com>:
>=20
>> On 05/28/2015 05:24 PM, Joonyoung Shim wrote:
>>> On 05/28/2015 02:39 PM, Inki Dae wrote:
>>>> Hi Gustavo,
>>>>
>>>> On 2015=EB=85=84 05=EC=9B=94 28=EC=9D=BC 05:27, Gustavo Padovan wr=
ote:
>>>>> Hi Inki,
>>>>>
>>>>> 2015-05-27 Inki Dae <inki.dae@samsung.com>:
>>>>>
>>>>>> Hi Gustavo,
>>>>>>
>>>>>> On 2015=EB=85=84 05=EC=9B=94 23=EC=9D=BC 00:40, Gustavo Padovan =
wrote:
>>>>>>> From: Gustavo Padovan <gustavo.padovan@collabora.co.uk>
>>>>>>>
>>>>>>> Run dpms operations through the atomic intefaces. This basicall=
y removes
>>>>>>> the .dpms() callback from econders and crtcs and use .disable()=
 and
>>>>>>> .enable() to turn the crtc on and off.
>>>>>>>
>>>>>>> v2: Address comments by Joonyoung:
>>>>>>> 	- make hdmi code call ->disable() instead of ->dpms()
>>>>>>> 	- do not use WARN_ON on crtc enable/disable
>>>>>>>
>>>>>>> v3: - Fix build failure after the hdmi change in v2
>>>>>>>     - Change dpms helper of ptn3460 bridge
>>>>>>>
>>>>>>> Signed-off-by: Gustavo Padovan <gustavo.padovan@collabora.co.uk=
>
>>>>>>> Reviewed-by: Joonyoung Shim <jy0922.shim@samsung.com>
>>>>>>> Tested-by: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
>>>>>>> ---
>>>>>>>  drivers/gpu/drm/bridge/ps8622.c             |  2 +-
>>>>>>>  drivers/gpu/drm/bridge/ptn3460.c            |  2 +-
>>>>>>>  drivers/gpu/drm/exynos/exynos_dp_core.c     |  2 +-
>>>>>>>  drivers/gpu/drm/exynos/exynos_drm_crtc.c    | 95 +++++++++++++=
+++-------------
>>>>>>>  drivers/gpu/drm/exynos/exynos_drm_dpi.c     |  2 +-
>>>>>>>  drivers/gpu/drm/exynos/exynos_drm_drv.h     |  4 +-
>>>>>>>  drivers/gpu/drm/exynos/exynos_drm_dsi.c     |  2 +-
>>>>>>>  drivers/gpu/drm/exynos/exynos_drm_encoder.c | 27 ++------
>>>>>>>  drivers/gpu/drm/exynos/exynos_drm_vidi.c    |  2 +-
>>>>>>>  drivers/gpu/drm/exynos/exynos_hdmi.c        |  6 +-
>>>>>>>  10 files changed, 69 insertions(+), 75 deletions(-)
>>>>>>>
>>>>>>> diff --git a/drivers/gpu/drm/bridge/ps8622.c b/drivers/gpu/drm/=
bridge/ps8622.c
>>>>>>> index b604326..d686235 100644
>>>>>>> --- a/drivers/gpu/drm/bridge/ps8622.c
>>>>>>> +++ b/drivers/gpu/drm/bridge/ps8622.c
>>>>>>> @@ -499,7 +499,7 @@ static void ps8622_connector_destroy(struct=
 drm_connector *connector)
>>>>>>>  }
>>>>>>> =20
>>>>>>>  static const struct drm_connector_funcs ps8622_connector_funcs=
 =3D {
>>>>>>> -	.dpms =3D drm_helper_connector_dpms,
>>>>>>> +	.dpms =3D drm_atomic_helper_connector_dpms,
>>>>>>>  	.fill_modes =3D drm_helper_probe_single_connector_modes,
>>>>>>>  	.detect =3D ps8622_detect,
>>>>>>>  	.destroy =3D ps8622_connector_destroy,
>>>>>>> diff --git a/drivers/gpu/drm/bridge/ptn3460.c b/drivers/gpu/drm=
/bridge/ptn3460.c
>>>>>>> index 8ed3617..260bc9f 100644
>>>>>>> --- a/drivers/gpu/drm/bridge/ptn3460.c
>>>>>>> +++ b/drivers/gpu/drm/bridge/ptn3460.c
>>>>>>> @@ -260,7 +260,7 @@ static void ptn3460_connector_destroy(struc=
t drm_connector *connector)
>>>>>>>  }
>>>>>>> =20
>>>>>>>  static struct drm_connector_funcs ptn3460_connector_funcs =3D =
{
>>>>>>> -	.dpms =3D drm_helper_connector_dpms,
>>>>>>> +	.dpms =3D drm_atomic_helper_connector_dpms,
>>>>>>>  	.fill_modes =3D drm_helper_probe_single_connector_modes,
>>>>>>>  	.detect =3D ptn3460_detect,
>>>>>>>  	.destroy =3D ptn3460_connector_destroy,
>>>>>>> diff --git a/drivers/gpu/drm/exynos/exynos_dp_core.c b/drivers/=
gpu/drm/exynos/exynos_dp_core.c
>>>>>>> index 195fe60..c9995b1 100644
>>>>>>> --- a/drivers/gpu/drm/exynos/exynos_dp_core.c
>>>>>>> +++ b/drivers/gpu/drm/exynos/exynos_dp_core.c
>>>>>>> @@ -954,7 +954,7 @@ static void exynos_dp_connector_destroy(str=
uct drm_connector *connector)
>>>>>>>  }
>>>>>>> =20
>>>>>>
>>>>>> [--snip--]
>>>>>>
>>>>>>> =20
>>>>>>>  static struct drm_crtc_helper_funcs exynos_crtc_helper_funcs =3D=
 {
>>>>>>> -	.dpms		=3D exynos_drm_crtc_dpms,
>>>>>>> -	.prepare	=3D exynos_drm_crtc_prepare,
>>>>>>> -	.commit		=3D exynos_drm_crtc_commit,
>>>>>>> +	.enable		=3D exynos_drm_crtc_enable,
>>>>>>> +	.disable	=3D exynos_drm_crtc_disable,
>>>>>>>  	.mode_fixup	=3D exynos_drm_crtc_mode_fixup,
>>>>>>>  	.mode_set	=3D drm_helper_crtc_mode_set,
>>>>>>>  	.mode_set_nofb	=3D exynos_drm_crtc_mode_set_nofb,
>>>>>>
>>>>>> I think it'd be better to use atomic_flush callback to enable gl=
obal dma
>>>>>> like commit callback did. Is there any reason that you don't use
>>>>>> atomic_begin and atomic_flush callbacks?
>>>>>>
>>>>>> atomic relevant codes I looked into do as follows,
>>>>>>
>>>>>> atomic_begin();
>>>>>>
>>>>>> atomic_update();  /* this will call win_commit callback to set a=
 overlay
>>>>>> relevant registers and enable its dma channel. */
>>>>>>
>>>>>> atomic_flush();
>>>>>>
>>>>>> So atomic overlay updating between atomic_begin() ~ atomic_flush=
() will
>>>>>> be guaranteed.
>>>>>
>>>>> I think we can go down that road, but I'd suggest we push the ato=
mic
>>>>> patches v8 (with the lastest comments from Joonyoung fixed) and t=
hen=20
>>>>> work on the change you are proposing as a follow-up together with=
 the=20
>>>>> other improvements for atomic I already have queued here. This wa=
y
>>>>> we don't take the risk of missing one more merge window.
>>>>
>>>> We(I and Joonyoung) will have discussion about this patch series. =
=46or
>>>> this, we have already started to analyze entire atomic features
>>>> including your patch set so I'd merge it at end of next week accor=
ding
>>>> to the discussion. I'm not kind of sure yet but I will merge it as=
 long
>>>> as there is no big problem.
>>>>
>>>
>>> Actually i agree to opinion of Gustavo and will repost the patchset=
 of
>>> Gustavo with some patches fixed by me.
>>>
>>
>> Hmm, i meet problem of operations order. It's called .atomic_update
>> before enable crtc and called .atomic_disable after disable crtc. It
>> means .win_commit and .win_disable just return 0 without any operati=
ons
>> because e.g. mixer_ctx->powered is 0 in mixer driver, so we cannot
>> enable or disable overlay normally.
>=20
> The removal of the extra win_commit() from exynos_drm_crtc_enable() t=
hat
> you pointed out in the last review round led to this issue. The
> win_commit() call was hiding the issue since we were calling it a sec=
ond
> time with the FIMD device already enabled.
>=20
> I think we can solve this by creating a specific exynos atomic_commit=
()
> callback that does call
>=20
> drm_atomic_helper_commit_modeset_enables(dev, state);                =
  =20
>=20
> before
>=20
> drm_atomic_helper_commit_planes(dev, state);
>=20
>=20
> This is the opposite order of what drm atomic default implementation
> would do, but we won't hit the issue of having the FIMD clks disabled
> when trying to setup the plane. This similar to rcar-du solution to t=
he=20
> same problem.
>=20

Yeah, but it can solve only enable operation order, disable operation
order still is wrong. It's not big problem yet because drm drivers
internally disable planes when crtc is disabled so try to disable again
already disabled plane.

I'm not sure this is workaround but it seems be simple solution at
present.

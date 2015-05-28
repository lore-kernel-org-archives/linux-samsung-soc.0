From: Inki Dae <inki.dae@samsung.com>
Subject: Re: [PATCH v7 12/13] drm/exynos: atomic dpms support
Date: Thu, 28 May 2015 14:39:16 +0900
Message-ID: <5566AA04.4080400@samsung.com>
References: <1432309253-18572-1-git-send-email-gustavo@padovan.org>
 <1432309253-18572-13-git-send-email-gustavo@padovan.org>
 <5565B817.6080001@samsung.com> <20150527202749.GC20774@joana>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:48489 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751068AbbE1FjS (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 28 May 2015 01:39:18 -0400
Received: from epcpsbgr4.samsung.com
 (u144.gpu120.samsung.co.kr [203.254.230.144])
 by mailout1.samsung.com (Oracle Communications Messaging Server 7.0.5.31.0
 64bit (built May  5 2014))
 with ESMTP id <0NP101UCAP1BNZ20@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 28 May 2015 14:39:11 +0900 (KST)
In-reply-to: <20150527202749.GC20774@joana>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Gustavo Padovan <gustavo@padovan.org>, linux-samsung-soc@vger.kernel.org, dri-devel@lists.freedesktop.org, jy0922.shim@samsung.com, tjakobi@math.uni-bielefeld.de, Gustavo Padovan <gustavo.padovan@collabora.co.uk>

Hi Gustavo,

On 2015=EB=85=84 05=EC=9B=94 28=EC=9D=BC 05:27, Gustavo Padovan wrote:
> Hi Inki,
>=20
> 2015-05-27 Inki Dae <inki.dae@samsung.com>:
>=20
>> Hi Gustavo,
>>
>> On 2015=EB=85=84 05=EC=9B=94 23=EC=9D=BC 00:40, Gustavo Padovan wrot=
e:
>>> From: Gustavo Padovan <gustavo.padovan@collabora.co.uk>
>>>
>>> Run dpms operations through the atomic intefaces. This basically re=
moves
>>> the .dpms() callback from econders and crtcs and use .disable() and
>>> .enable() to turn the crtc on and off.
>>>
>>> v2: Address comments by Joonyoung:
>>> 	- make hdmi code call ->disable() instead of ->dpms()
>>> 	- do not use WARN_ON on crtc enable/disable
>>>
>>> v3: - Fix build failure after the hdmi change in v2
>>>     - Change dpms helper of ptn3460 bridge
>>>
>>> Signed-off-by: Gustavo Padovan <gustavo.padovan@collabora.co.uk>
>>> Reviewed-by: Joonyoung Shim <jy0922.shim@samsung.com>
>>> Tested-by: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
>>> ---
>>>  drivers/gpu/drm/bridge/ps8622.c             |  2 +-
>>>  drivers/gpu/drm/bridge/ptn3460.c            |  2 +-
>>>  drivers/gpu/drm/exynos/exynos_dp_core.c     |  2 +-
>>>  drivers/gpu/drm/exynos/exynos_drm_crtc.c    | 95 ++++++++++++++++-=
------------
>>>  drivers/gpu/drm/exynos/exynos_drm_dpi.c     |  2 +-
>>>  drivers/gpu/drm/exynos/exynos_drm_drv.h     |  4 +-
>>>  drivers/gpu/drm/exynos/exynos_drm_dsi.c     |  2 +-
>>>  drivers/gpu/drm/exynos/exynos_drm_encoder.c | 27 ++------
>>>  drivers/gpu/drm/exynos/exynos_drm_vidi.c    |  2 +-
>>>  drivers/gpu/drm/exynos/exynos_hdmi.c        |  6 +-
>>>  10 files changed, 69 insertions(+), 75 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/bridge/ps8622.c b/drivers/gpu/drm/brid=
ge/ps8622.c
>>> index b604326..d686235 100644
>>> --- a/drivers/gpu/drm/bridge/ps8622.c
>>> +++ b/drivers/gpu/drm/bridge/ps8622.c
>>> @@ -499,7 +499,7 @@ static void ps8622_connector_destroy(struct drm=
_connector *connector)
>>>  }
>>> =20
>>>  static const struct drm_connector_funcs ps8622_connector_funcs =3D=
 {
>>> -	.dpms =3D drm_helper_connector_dpms,
>>> +	.dpms =3D drm_atomic_helper_connector_dpms,
>>>  	.fill_modes =3D drm_helper_probe_single_connector_modes,
>>>  	.detect =3D ps8622_detect,
>>>  	.destroy =3D ps8622_connector_destroy,
>>> diff --git a/drivers/gpu/drm/bridge/ptn3460.c b/drivers/gpu/drm/bri=
dge/ptn3460.c
>>> index 8ed3617..260bc9f 100644
>>> --- a/drivers/gpu/drm/bridge/ptn3460.c
>>> +++ b/drivers/gpu/drm/bridge/ptn3460.c
>>> @@ -260,7 +260,7 @@ static void ptn3460_connector_destroy(struct dr=
m_connector *connector)
>>>  }
>>> =20
>>>  static struct drm_connector_funcs ptn3460_connector_funcs =3D {
>>> -	.dpms =3D drm_helper_connector_dpms,
>>> +	.dpms =3D drm_atomic_helper_connector_dpms,
>>>  	.fill_modes =3D drm_helper_probe_single_connector_modes,
>>>  	.detect =3D ptn3460_detect,
>>>  	.destroy =3D ptn3460_connector_destroy,
>>> diff --git a/drivers/gpu/drm/exynos/exynos_dp_core.c b/drivers/gpu/=
drm/exynos/exynos_dp_core.c
>>> index 195fe60..c9995b1 100644
>>> --- a/drivers/gpu/drm/exynos/exynos_dp_core.c
>>> +++ b/drivers/gpu/drm/exynos/exynos_dp_core.c
>>> @@ -954,7 +954,7 @@ static void exynos_dp_connector_destroy(struct =
drm_connector *connector)
>>>  }
>>> =20
>>
>> [--snip--]
>>
>>> =20
>>>  static struct drm_crtc_helper_funcs exynos_crtc_helper_funcs =3D {
>>> -	.dpms		=3D exynos_drm_crtc_dpms,
>>> -	.prepare	=3D exynos_drm_crtc_prepare,
>>> -	.commit		=3D exynos_drm_crtc_commit,
>>> +	.enable		=3D exynos_drm_crtc_enable,
>>> +	.disable	=3D exynos_drm_crtc_disable,
>>>  	.mode_fixup	=3D exynos_drm_crtc_mode_fixup,
>>>  	.mode_set	=3D drm_helper_crtc_mode_set,
>>>  	.mode_set_nofb	=3D exynos_drm_crtc_mode_set_nofb,
>>
>> I think it'd be better to use atomic_flush callback to enable global=
 dma
>> like commit callback did. Is there any reason that you don't use
>> atomic_begin and atomic_flush callbacks?
>>
>> atomic relevant codes I looked into do as follows,
>>
>> atomic_begin();
>>
>> atomic_update();  /* this will call win_commit callback to set a ove=
rlay
>> relevant registers and enable its dma channel. */
>>
>> atomic_flush();
>>
>> So atomic overlay updating between atomic_begin() ~ atomic_flush() w=
ill
>> be guaranteed.
>=20
> I think we can go down that road, but I'd suggest we push the atomic
> patches v8 (with the lastest comments from Joonyoung fixed) and then=20
> work on the change you are proposing as a follow-up together with the=
=20
> other improvements for atomic I already have queued here. This way
> we don't take the risk of missing one more merge window.

We(I and Joonyoung) will have discussion about this patch series. For
this, we have already started to analyze entire atomic features
including your patch set so I'd merge it at end of next week according
to the discussion. I'm not kind of sure yet but I will merge it as long
as there is no big problem.

Thanks,
Inki Dae

>=20
> 	Gustavo
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsu=
ng-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>=20

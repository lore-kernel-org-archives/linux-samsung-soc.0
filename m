From: Gustavo Padovan <gustavo@padovan.org>
Subject: Re: [PATCH v7 12/13] drm/exynos: atomic dpms support
Date: Fri, 29 May 2015 18:33:40 -0300
Message-ID: <20150529213340.GE20774@joana>
References: <1432309253-18572-1-git-send-email-gustavo@padovan.org>
 <1432309253-18572-13-git-send-email-gustavo@padovan.org>
 <5565B817.6080001@samsung.com>
 <20150527202749.GC20774@joana>
 <5566AA04.4080400@samsung.com>
 <5566D0A9.2000109@samsung.com>
 <556701B9.5030505@samsung.com>
 <20150528213648.GD20774@joana>
 <55680544.2000404@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vn0-f41.google.com ([209.85.216.41]:33655 "EHLO
	mail-vn0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756718AbbE2Vdr convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 29 May 2015 17:33:47 -0400
Received: by vnbf190 with SMTP id f190so9818006vnb.0
        for <linux-samsung-soc@vger.kernel.org>; Fri, 29 May 2015 14:33:47 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <55680544.2000404@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Joonyoung Shim <jy0922.shim@samsung.com>
Cc: Inki Dae <inki.dae@samsung.com>, linux-samsung-soc@vger.kernel.org, dri-devel@lists.freedesktop.org, tjakobi@math.uni-bielefeld.de, Gustavo Padovan <gustavo.padovan@collabora.co.uk>

2015-05-29 Joonyoung Shim <jy0922.shim@samsung.com>:

> On 05/29/2015 06:36 AM, Gustavo Padovan wrote:
> > 2015-05-28 Joonyoung Shim <jy0922.shim@samsung.com>:
> >=20
> >> On 05/28/2015 05:24 PM, Joonyoung Shim wrote:
> >>> On 05/28/2015 02:39 PM, Inki Dae wrote:
> >>>> Hi Gustavo,
> >>>>
> >>>> On 2015=EB=85=84 05=EC=9B=94 28=EC=9D=BC 05:27, Gustavo Padovan =
wrote:
> >>>>> Hi Inki,
> >>>>>
> >>>>> 2015-05-27 Inki Dae <inki.dae@samsung.com>:
> >>>>>
> >>>>>> Hi Gustavo,
> >>>>>>
> >>>>>> On 2015=EB=85=84 05=EC=9B=94 23=EC=9D=BC 00:40, Gustavo Padova=
n wrote:
> >>>>>>> From: Gustavo Padovan <gustavo.padovan@collabora.co.uk>
> >>>>>>>
> >>>>>>> Run dpms operations through the atomic intefaces. This basica=
lly removes
> >>>>>>> the .dpms() callback from econders and crtcs and use .disable=
() and
> >>>>>>> .enable() to turn the crtc on and off.
> >>>>>>>
> >>>>>>> v2: Address comments by Joonyoung:
> >>>>>>> 	- make hdmi code call ->disable() instead of ->dpms()
> >>>>>>> 	- do not use WARN_ON on crtc enable/disable
> >>>>>>>
> >>>>>>> v3: - Fix build failure after the hdmi change in v2
> >>>>>>>     - Change dpms helper of ptn3460 bridge
> >>>>>>>
> >>>>>>> Signed-off-by: Gustavo Padovan <gustavo.padovan@collabora.co.=
uk>
> >>>>>>> Reviewed-by: Joonyoung Shim <jy0922.shim@samsung.com>
> >>>>>>> Tested-by: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
> >>>>>>> ---
> >>>>>>>  drivers/gpu/drm/bridge/ps8622.c             |  2 +-
> >>>>>>>  drivers/gpu/drm/bridge/ptn3460.c            |  2 +-
> >>>>>>>  drivers/gpu/drm/exynos/exynos_dp_core.c     |  2 +-
> >>>>>>>  drivers/gpu/drm/exynos/exynos_drm_crtc.c    | 95 +++++++++++=
+++++-------------
> >>>>>>>  drivers/gpu/drm/exynos/exynos_drm_dpi.c     |  2 +-
> >>>>>>>  drivers/gpu/drm/exynos/exynos_drm_drv.h     |  4 +-
> >>>>>>>  drivers/gpu/drm/exynos/exynos_drm_dsi.c     |  2 +-
> >>>>>>>  drivers/gpu/drm/exynos/exynos_drm_encoder.c | 27 ++------
> >>>>>>>  drivers/gpu/drm/exynos/exynos_drm_vidi.c    |  2 +-
> >>>>>>>  drivers/gpu/drm/exynos/exynos_hdmi.c        |  6 +-
> >>>>>>>  10 files changed, 69 insertions(+), 75 deletions(-)
> >>>>>>>
> >>>>>>> diff --git a/drivers/gpu/drm/bridge/ps8622.c b/drivers/gpu/dr=
m/bridge/ps8622.c
> >>>>>>> index b604326..d686235 100644
> >>>>>>> --- a/drivers/gpu/drm/bridge/ps8622.c
> >>>>>>> +++ b/drivers/gpu/drm/bridge/ps8622.c
> >>>>>>> @@ -499,7 +499,7 @@ static void ps8622_connector_destroy(stru=
ct drm_connector *connector)
> >>>>>>>  }
> >>>>>>> =20
> >>>>>>>  static const struct drm_connector_funcs ps8622_connector_fun=
cs =3D {
> >>>>>>> -	.dpms =3D drm_helper_connector_dpms,
> >>>>>>> +	.dpms =3D drm_atomic_helper_connector_dpms,
> >>>>>>>  	.fill_modes =3D drm_helper_probe_single_connector_modes,
> >>>>>>>  	.detect =3D ps8622_detect,
> >>>>>>>  	.destroy =3D ps8622_connector_destroy,
> >>>>>>> diff --git a/drivers/gpu/drm/bridge/ptn3460.c b/drivers/gpu/d=
rm/bridge/ptn3460.c
> >>>>>>> index 8ed3617..260bc9f 100644
> >>>>>>> --- a/drivers/gpu/drm/bridge/ptn3460.c
> >>>>>>> +++ b/drivers/gpu/drm/bridge/ptn3460.c
> >>>>>>> @@ -260,7 +260,7 @@ static void ptn3460_connector_destroy(str=
uct drm_connector *connector)
> >>>>>>>  }
> >>>>>>> =20
> >>>>>>>  static struct drm_connector_funcs ptn3460_connector_funcs =3D=
 {
> >>>>>>> -	.dpms =3D drm_helper_connector_dpms,
> >>>>>>> +	.dpms =3D drm_atomic_helper_connector_dpms,
> >>>>>>>  	.fill_modes =3D drm_helper_probe_single_connector_modes,
> >>>>>>>  	.detect =3D ptn3460_detect,
> >>>>>>>  	.destroy =3D ptn3460_connector_destroy,
> >>>>>>> diff --git a/drivers/gpu/drm/exynos/exynos_dp_core.c b/driver=
s/gpu/drm/exynos/exynos_dp_core.c
> >>>>>>> index 195fe60..c9995b1 100644
> >>>>>>> --- a/drivers/gpu/drm/exynos/exynos_dp_core.c
> >>>>>>> +++ b/drivers/gpu/drm/exynos/exynos_dp_core.c
> >>>>>>> @@ -954,7 +954,7 @@ static void exynos_dp_connector_destroy(s=
truct drm_connector *connector)
> >>>>>>>  }
> >>>>>>> =20
> >>>>>>
> >>>>>> [--snip--]
> >>>>>>
> >>>>>>> =20
> >>>>>>>  static struct drm_crtc_helper_funcs exynos_crtc_helper_funcs=
 =3D {
> >>>>>>> -	.dpms		=3D exynos_drm_crtc_dpms,
> >>>>>>> -	.prepare	=3D exynos_drm_crtc_prepare,
> >>>>>>> -	.commit		=3D exynos_drm_crtc_commit,
> >>>>>>> +	.enable		=3D exynos_drm_crtc_enable,
> >>>>>>> +	.disable	=3D exynos_drm_crtc_disable,
> >>>>>>>  	.mode_fixup	=3D exynos_drm_crtc_mode_fixup,
> >>>>>>>  	.mode_set	=3D drm_helper_crtc_mode_set,
> >>>>>>>  	.mode_set_nofb	=3D exynos_drm_crtc_mode_set_nofb,
> >>>>>>
> >>>>>> I think it'd be better to use atomic_flush callback to enable =
global dma
> >>>>>> like commit callback did. Is there any reason that you don't u=
se
> >>>>>> atomic_begin and atomic_flush callbacks?
> >>>>>>
> >>>>>> atomic relevant codes I looked into do as follows,
> >>>>>>
> >>>>>> atomic_begin();
> >>>>>>
> >>>>>> atomic_update();  /* this will call win_commit callback to set=
 a overlay
> >>>>>> relevant registers and enable its dma channel. */
> >>>>>>
> >>>>>> atomic_flush();
> >>>>>>
> >>>>>> So atomic overlay updating between atomic_begin() ~ atomic_flu=
sh() will
> >>>>>> be guaranteed.
> >>>>>
> >>>>> I think we can go down that road, but I'd suggest we push the a=
tomic
> >>>>> patches v8 (with the lastest comments from Joonyoung fixed) and=
 then=20
> >>>>> work on the change you are proposing as a follow-up together wi=
th the=20
> >>>>> other improvements for atomic I already have queued here. This =
way
> >>>>> we don't take the risk of missing one more merge window.
> >>>>
> >>>> We(I and Joonyoung) will have discussion about this patch series=
=2E For
> >>>> this, we have already started to analyze entire atomic features
> >>>> including your patch set so I'd merge it at end of next week acc=
ording
> >>>> to the discussion. I'm not kind of sure yet but I will merge it =
as long
> >>>> as there is no big problem.
> >>>>
> >>>
> >>> Actually i agree to opinion of Gustavo and will repost the patchs=
et of
> >>> Gustavo with some patches fixed by me.
> >>>
> >>
> >> Hmm, i meet problem of operations order. It's called .atomic_updat=
e
> >> before enable crtc and called .atomic_disable after disable crtc. =
It
> >> means .win_commit and .win_disable just return 0 without any opera=
tions
> >> because e.g. mixer_ctx->powered is 0 in mixer driver, so we cannot
> >> enable or disable overlay normally.
> >=20
> > The removal of the extra win_commit() from exynos_drm_crtc_enable()=
 that
> > you pointed out in the last review round led to this issue. The
> > win_commit() call was hiding the issue since we were calling it a s=
econd
> > time with the FIMD device already enabled.
> >=20
> > I think we can solve this by creating a specific exynos atomic_comm=
it()
> > callback that does call
> >=20
> > drm_atomic_helper_commit_modeset_enables(dev, state);              =
    =20
> >=20
> > before
> >=20
> > drm_atomic_helper_commit_planes(dev, state);
> >=20
> >=20
> > This is the opposite order of what drm atomic default implementatio=
n
> > would do, but we won't hit the issue of having the FIMD clks disabl=
ed
> > when trying to setup the plane. This similar to rcar-du solution to=
 the=20
> > same problem.
> >=20
>=20
> Yeah, but it can solve only enable operation order, disable operation
> order still is wrong. It's not big problem yet because drm drivers
> internally disable planes when crtc is disabled so try to disable aga=
in
> already disabled plane.
>=20
> I'm not sure this is workaround but it seems be simple solution at
> present.

This is not workaround, is a valid change according to the atomic doc:

 * For compatability with legacy crtc helpers this should be called bef=
ore     =20
 * drm_atomic_helper_commit_planes(), which is what the default commit =
function=20
 * does. But drivers with different needs can group the modeset commits=
 together
 * and do the plane commits at the end. This is useful for drivers doin=
g runtime
 * PM since planes updates then only happen when the CRTC is actually e=
nabled.

So it is completely fine to go ahead with this change as we are now ful=
ly ported
to the atomic helpers.

	Gustavo

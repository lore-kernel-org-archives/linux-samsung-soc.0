From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH] drm/atomic: only run atomic_check() if crtc is active
Date: Fri, 13 Nov 2015 16:34:45 +0200
Message-ID: <20151113143445.GW4437@intel.com>
References: <1447422358-18891-1-git-send-email-gustavo@padovan.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mga09.intel.com ([134.134.136.24]:54536 "EHLO mga09.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753799AbbKMOet (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 13 Nov 2015 09:34:49 -0500
Content-Disposition: inline
In-Reply-To: <1447422358-18891-1-git-send-email-gustavo@padovan.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Gustavo Padovan <gustavo@padovan.org>
Cc: linux-samsung-soc@vger.kernel.org, Gustavo Padovan <gustavo.padovan@collabora.co.uk>, dri-devel@lists.freedesktop.org

On Fri, Nov 13, 2015 at 11:45:58AM -0200, Gustavo Padovan wrote:
> From: Gustavo Padovan <gustavo.padovan@collabora.co.uk>
>=20
> Fixes an regression added by 3ae2436 (drm/exynos/mixer: replace
> direct cross-driver call with drm mode) and while this regression was
> caused by a change in the exynos driver it makes sense to add the
> check on atomic core to benefit other drivers as well.
>=20
> The whole atomic update fails if the exynos hdmi display is not
> present/active.  Add a test to only run atomic_check() if the CRTC is
> active.

The check must be performed even when the crtc is not active.

Especially important for the (enabled && !active) case (ie. DPMS off)
since "DPMS on" must not fail, so any state change while in DPMS off
must be checked as if the crtc was active.

But even for the !enabled case we want to do the check so that
everything gets properly recomputed when fully disabling a crtc.

I suppose we might be able to get away with not checking in the
!enabled -> !enabled case. But I doubt that's really a useful
optimization.

>=20
> Signed-off-by: Gustavo Padovan <gustavo.padovan@collabora.co.uk>
> ---
>  drivers/gpu/drm/drm_atomic_helper.c | 3 +++
>  1 file changed, 3 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/dr=
m_atomic_helper.c
> index 0c6f621..7e3cb48 100644
> --- a/drivers/gpu/drm/drm_atomic_helper.c
> +++ b/drivers/gpu/drm/drm_atomic_helper.c
> @@ -510,6 +510,9 @@ drm_atomic_helper_check_planes(struct drm_device =
*dev,
>  	for_each_crtc_in_state(state, crtc, crtc_state, i) {
>  		const struct drm_crtc_helper_funcs *funcs;
> =20
> +		if (!crtc_state->active)
> +			continue;
> +
>  		funcs =3D crtc->helper_private;
> =20
>  		if (!funcs || !funcs->atomic_check)
> --=20
> 2.1.0
>=20
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> http://lists.freedesktop.org/mailman/listinfo/dri-devel

--=20
Ville Syrj=E4l=E4
Intel OTC

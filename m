Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50BC7242D70;
	Wed,  9 Jul 2025 20:12:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752091959; cv=none; b=HdYCzFdwRwxGxJfAgCgGLUqVv/8PxUERVJ+fpWlonyLDkeJf2HSMZk1Mqe/THcRhBEyYTbxR8tIKBU4UT00fhsXX6TxeTffY52pXqxdHig43LHLbHVweYF6Rd2bcfB8nD5zWKoLMw2fx316vIeHNE0j8GBZWRkeyaH5fmh0SGkU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752091959; c=relaxed/simple;
	bh=2nqDSuR0WVKbc6ZhgkUGTS6FjeJdDWr5ffg0NN5mU1w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Tz4eu1UG1kDtGOq5pDG6uafwbngEmqiahHNYUhZpc4A/0OUFN1NSd6OMfHueLDOqwywYzwwbEb3zPn8lYOBfnuTJU1ORDFKziop8E8B2UeDFC9NEc2mCRoqNicrFINpUIUolIou7Z9yzEH6IffMBMZnyKLTaJhftYoZrU2jaCfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=DNSHEZw4; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="DNSHEZw4"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=N/toHkVpq5LggOD6b8zz+uspZ81zoDnz2v1z+PgrMD0=; b=DNSHEZw4BymD6PssVNCmF5xBld
	+onC/2Xi9Wsb1lQvLjY3kueI6oFAB1bEFZ3F0EC7YexGzUVrbMStjX4sJIJ/QwdIQWjwufqMPEzgB
	6Fi/3Szt9XKCXgxIH6jHXaie5ifGQ4vqCySAvGA+Gxt+3pu27Si62X8s4vFpkzjRTDAywxo86CNTo
	+2vawRGvpcKFESbdXzYuAqnJP2A1nIUniYhLtMgHPF+CTApd9tycmDUEmCUdhgZfUkaxw/YOxe8ek
	yt9WI9PbdtnJMYBBsPEsttDnSRrSdMp8s9KY8sjNfGb46QRf1WxkLAa2ZrmjCwIJNnFphMoLM/R6u
	H0AfbQSQ==;
Received: from i53875a79.versanet.de ([83.135.90.121] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uZb94-0006oW-DP; Wed, 09 Jul 2025 22:11:58 +0200
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
 Damon Ding <damon.ding@rock-chips.com>
Cc: Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 jingoohan1@gmail.com, inki.dae@samsung.com, sw0312.kim@samsung.com,
 kyungmin.park@samsung.com, krzk@kernel.org, alim.akhtar@samsung.com,
 hjc@rock-chips.com, andy.yan@rock-chips.com,
 dmitry.baryshkov@oss.qualcomm.com, l.stach@pengutronix.de,
 dianders@chromium.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-rockchip@lists.infradead.org,
 Damon Ding <damon.ding@rock-chips.com>
Subject:
 Re: [PATCH v2 12/12] drm/bridge: analogix_dp: Apply drm_bridge_connector
 helper
Date: Wed, 09 Jul 2025 22:11:57 +0200
Message-ID: <6140569.FjKLVJYuhi@diego>
In-Reply-To: <20250709070139.3130635-13-damon.ding@rock-chips.com>
References:
 <20250709070139.3130635-1-damon.ding@rock-chips.com>
 <20250709070139.3130635-13-damon.ding@rock-chips.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Am Mittwoch, 9. Juli 2025, 09:01:39 Mitteleurop=C3=A4ische Sommerzeit schri=
eb Damon Ding:
> Apply drm_bridge_connector helper for Analogix DP driver.
>=20
> The following changes have been made:
> - Remove &analogix_dp_device.connector and change
>   &analogix_dp_device.bridge from a pointer to an instance.
> - Apply devm_drm_bridge_alloc() to allocate &analogix_dp_device that
>   contains &drm_bridge.
> - Apply drm_bridge_connector helper to get rid of &drm_connector_funcs
>   and &drm_connector_helper_funcs.
>=20
> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
>=20
> ------
>=20
> Changes in v2:
> - For &drm_bridge.ops, remove DRM_BRIDGE_OP_HPD and add
>   DRM_BRIDGE_OP_EDID.
> - Add analogix_dp_bridge_edid_read().
> - Move &analogix_dp_plat_data.skip_connector deletion to the previous
>   patches.
> ---
>  .../drm/bridge/analogix/analogix_dp_core.c    | 169 ++++++++----------
>  .../drm/bridge/analogix/analogix_dp_core.h    |   4 +-
>  2 files changed, 80 insertions(+), 93 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers=
/gpu/drm/bridge/analogix/analogix_dp_core.c
> index abc64cc17e4c..fb510e55ef06 100644
> --- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> +++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> @@ -23,6 +23,7 @@
>  #include <drm/drm_atomic.h>
>  #include <drm/drm_atomic_helper.h>
>  #include <drm/drm_bridge.h>
> +#include <drm/drm_bridge_connector.h>
>  #include <drm/drm_crtc.h>
>  #include <drm/drm_device.h>
>  #include <drm/drm_edid.h>
> @@ -948,23 +949,13 @@ static int analogix_dp_disable_psr(struct analogix_=
dp_device *dp)
>  	return analogix_dp_send_psr_spd(dp, &psr_vsc, true);
>  }
> =20
> -static int analogix_dp_get_modes(struct drm_connector *connector)
> +static int analogix_dp_bridge_get_modes(struct drm_bridge *bridge, struc=
t drm_connector *connector)
>  {
> -	struct analogix_dp_device *dp =3D to_dp(connector);
> -	const struct drm_edid *drm_edid;
> +	struct analogix_dp_device *dp =3D to_dp(bridge);
>  	int num_modes =3D 0;
> =20
>  	if (dp->plat_data->panel) {
>  		num_modes +=3D drm_panel_get_modes(dp->plat_data->panel, connector);

here is one example where a panel_bridge would help :-)

I.e. I'd think without it the code would need some sort of

  	if (dp->plat_data->bridge) {
  		num_modes +=3D drm_bridge_get_modes(dp->plat_data->bridge, connector);

thing?

> -	} else {
> -		drm_edid =3D drm_edid_read_ddc(connector, &dp->aux.ddc);
> -
> -		drm_edid_connector_update(&dp->connector, drm_edid);
> -
> -		if (drm_edid) {
> -			num_modes +=3D drm_edid_connector_add_modes(&dp->connector);
> -			drm_edid_free(drm_edid);
> -		}
>  	}
> =20
>  	if (dp->plat_data->get_modes)




Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6870A6AAD;
	Mon,  2 Dec 2024 13:27:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733146072; cv=none; b=EufkPsaQQhptRjjVEM1VLOHsORRqKPsaHBmPaYYUkMNeQChx7w9vJiwCkgSP+Z5JuOgWmbu0JezGWdtcdvSfqZWoOovH+SzcIkz1Y8iee5HeDNkR80JbfiBU2+VXn3RRhPWN9A8csdJlZVwhWLLFidFdTsNLZVlwpP3zatTxbJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733146072; c=relaxed/simple;
	bh=KiXJWPoIAFp9VW8Wp81Eon9RxfYCjyDx9DTkjVp31GE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JmkS3TQcikMd3gTmweuKxoVp37Tyu/85ZfjLBlYjVRWMeZb5LxhMHK44Sf2rNK1rBNsCIbzKNJBGG10WfvzXx9UNSNBZnFwVqDO8W3a5D3BtlidA770MU2T1ibowQvdfn97UOaSbp4BxC+dxqOykdHHQUsH1v7WBtZZ+5Q0tLOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EyJgIR+5; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EyJgIR+5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5CA79C4CED9;
	Mon,  2 Dec 2024 13:27:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733146071;
	bh=KiXJWPoIAFp9VW8Wp81Eon9RxfYCjyDx9DTkjVp31GE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EyJgIR+5km5eYBiOcnl4Xd0qxh5NcL09MRzRE8iaObRYaKvxyPhgd6vLysyjYMGSU
	 3I92YLyq93EErMpJowvzmdcqUNTfu/nXqDUZyOzvlzL9h63ZXUffg6V+yBZZ8FmCS2
	 YtKicdtr1EWqPxEzLqRSHQtCWEQ5HpXwDTaGicQxuBDsPKuVlgmlkYzALFjZXdWsiS
	 k5GaGuqwN1KsG8pp5V1VZzgg4bB+4YPKqkJ8dLmsNklTGUvbecH6Z3d5IG0BiFrQfv
	 ZHbas7b2ccomblsCiJECsZ73qK97J6PxGmyPgffVHbOP2jBaLdfeCQ21KgJVq2wls+
	 RmhqOq6jHy0VQ==
Date: Mon, 2 Dec 2024 14:27:49 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Phong LE <ple@baylibre.com>, 
	Inki Dae <inki.dae@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, 
	Kyungmin Park <kyungmin.park@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Russell King <linux@armlinux.org.uk>, 
	Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Sandy Huang <hjc@rock-chips.com>, 
	Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>, Andy Yan <andy.yan@rock-chips.com>, 
	Alain Volmat <alain.volmat@foss.st.com>, Raphael Gallais-Pou <rgallaispou@gmail.com>, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>, =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>, 
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, Jani Nikula <jani.nikula@linux.intel.com>, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v5 9/9] drm/vc4: hdmi: use
 drm_atomic_helper_connector_hdmi_update_edid()
Message-ID: <20241202-married-bald-raven-7acd83@houat>
References: <20241201-drm-bridge-hdmi-connector-v5-0-b5316e82f61a@linaro.org>
 <20241201-drm-bridge-hdmi-connector-v5-9-b5316e82f61a@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="sr6qnc7nl34mpskl"
Content-Disposition: inline
In-Reply-To: <20241201-drm-bridge-hdmi-connector-v5-9-b5316e82f61a@linaro.org>


--sr6qnc7nl34mpskl
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v5 9/9] drm/vc4: hdmi: use
 drm_atomic_helper_connector_hdmi_update_edid()
MIME-Version: 1.0

Hi,

On Sun, Dec 01, 2024 at 02:44:13AM +0200, Dmitry Baryshkov wrote:
> Use the helper function to update the connector's information. This
> makes sure that HDMI-related events are handled in a generic way.
> Currently it is limited to the HDMI state reporting to the sound system.
>=20
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/gpu/drm/vc4/vc4_hdmi.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdm=
i.c
> index d0a9aff7ad43016647493263c00d593296a1e3ad..d83f587ab69f4b8f7d5c37a00=
777f11da8301bc1 100644
> --- a/drivers/gpu/drm/vc4/vc4_hdmi.c
> +++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
> @@ -401,13 +401,16 @@ static void vc4_hdmi_handle_hotplug(struct vc4_hdmi=
 *vc4_hdmi,
>  	 */
> =20
>  	if (status =3D=3D connector_status_disconnected) {
> +		drm_atomic_helper_connector_hdmi_update_edid(connector, NULL);
>  		cec_phys_addr_invalidate(vc4_hdmi->cec_adap);
>  		return;
>  	}
> =20
>  	drm_edid =3D drm_edid_read_ddc(connector, vc4_hdmi->ddc);
> =20
> -	drm_edid_connector_update(connector, drm_edid);
> +	// TODO: use drm_atomic_helper_connector_hdmi_update() once it gains
> +	// CEC support
> +	drm_atomic_helper_connector_hdmi_update_edid(connector, drm_edid);

So, it's not just about EDID, and I think we shouldn't really focus on
that either.

As that patch points out, even if we only consider EDID's, we have
different path depending on the connector status. It shouldn't be up to
the drivers to get this right.

What I had in mind was something like a
drm_atomic_helper_connector_hdmi_hotplug function that would obviously
deal with EDID only here, but would expand to CEC, scrambling, etc.
later on.

And would cover both the connected/disconnected cases.

Maxime

--sr6qnc7nl34mpskl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZ0211QAKCRAnX84Zoj2+
dn5LAYD+jqdGwkC0H4iYlSaYETAxZCK9kHnKkNn2ev/+nMCHDbBE52F7rnC+3dq7
dYCcnzsBf2FnxN2dGnbsJhfLKxYoZJ4Z5apDoHE9vrcc7fB6iJ+TU/Q2sOPTfXFD
RjebkV+GjQ==
=UIM2
-----END PGP SIGNATURE-----

--sr6qnc7nl34mpskl--

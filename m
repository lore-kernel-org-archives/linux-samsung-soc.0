Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68F932AD0D;
	Fri,  6 Jun 2025 12:03:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749211401; cv=none; b=uC1nhaE0ino8Bo+yNVX6HWuOaAgl0snungOlMgn6yL5f70/nz/uuDeMCbi7TFg+ana6HvCWGm5CUUVWeveq75I/bokzHaSOZ4UdCdlqYE4DVUo+QdU3vGVcL/zBlX2ZTGpIqekgSK3OoomdlFH38IA41G9EMjzjrsdukxCkupYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749211401; c=relaxed/simple;
	bh=6oz9cLgBpq1+bwaTR5/JwtLIYahXmjDOpJo1Ih+IxD4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j48qAd5dumekbKi3PNIiZadCZj9ycyUryleQTRBiKRDPNjuK69cJUvtWJWEvF4d4lo/0gfj1uPb0Ixdyhp1IpX5AQ7Ue3OVVofSZVdJMqiMhwC1RazwKvZO+SqdPiwyP4SbtbWk77IVhRXwLLo7/4qtBCDdw5avbtrUd5q5lfvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SeNM+vw6; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SeNM+vw6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C16BFC4CEEB;
	Fri,  6 Jun 2025 12:03:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749211401;
	bh=6oz9cLgBpq1+bwaTR5/JwtLIYahXmjDOpJo1Ih+IxD4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SeNM+vw6o2R/VlOg+xOelhhzCXW9usTQ42ANhiV95Y2x9Zn03fWe3qeJLHG/Irx/V
	 Ql+SwV5H4mHoIKAcoaq2UwshrQHD6bGBm4u6t2zp9iHtjOBL0ZO9RabpIdByFPnF0h
	 nqzutpLb25wSNP2wH9Foo26YdAFUOUXmRhUVtbiPA3qPycHZ1fc6C8cXHnKZfVN+WK
	 xT3fOBQgnFjYwte/ANAF2HV/22aK4vTebfl33KbuQ5bPgOrZYwCk0Z72Q37FigH+8c
	 eqeO+OdQDej06AfYvflVWtrLcZWKoxbZUqoCCKaYZuYGy8Kmsvx7XGjdirdcgiNxpO
	 sdTSFPhyYXnPQ==
Date: Fri, 6 Jun 2025 14:03:18 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Anusha Srivatsa <asrivats@redhat.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
	Jessica Zhang <quic_jesszhan@quicinc.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Inki Dae <inki.dae@samsung.com>, 
	Jagan Teki <jagan@amarulasolutions.com>, Marek Szyprowski <m.szyprowski@samsung.com>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Chen-Yu Tsai <wens@csie.org>, 
	Samuel Holland <samuel@sholland.org>, Seung-Woo Kim <sw0312.kim@samsung.com>, 
	Kyungmin Park <kyungmin.park@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH 2/4] drm/panel/samsung-dsicm: Keep up with refcounting
Message-ID: <20250606-radical-rigorous-buzzard-ca09cd@houat>
References: <20250604-of_drm_find_panel_part1-v1-0-c632e12e131d@redhat.com>
 <20250604-of_drm_find_panel_part1-v1-2-c632e12e131d@redhat.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="naqzmlhexuyovrm5"
Content-Disposition: inline
In-Reply-To: <20250604-of_drm_find_panel_part1-v1-2-c632e12e131d@redhat.com>


--naqzmlhexuyovrm5
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 2/4] drm/panel/samsung-dsicm: Keep up with refcounting
MIME-Version: 1.0

On Wed, Jun 04, 2025 at 10:45:11PM -0500, Anusha Srivatsa wrote:
> Put the panel reference back when driver is no
> longer using it.
>=20
> Signed-off-by: Anusha Srivatsa <asrivats@redhat.com>
> ---
>  drivers/gpu/drm/bridge/samsung-dsim.c | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/brid=
ge/samsung-dsim.c
> index 0014c497e3fe7d8349a119dbdda30d65d816cccf..3667855ff0d6d1b608c579573=
de657af7fd14388 100644
> --- a/drivers/gpu/drm/bridge/samsung-dsim.c
> +++ b/drivers/gpu/drm/bridge/samsung-dsim.c
> @@ -1748,6 +1748,7 @@ static int samsung_dsim_host_attach(struct mipi_dsi=
_host *host,
>  			dsi->out_bridge =3D ERR_PTR(-EINVAL);
>  	}
> =20
> +	drm_panel_put(panel);
>  	of_node_put(remote);
> =20
>  	if (IS_ERR(dsi->out_bridge)) {

Explaining in your commit log why you think it's a good idea to put it
there would be really nice. In particular, it looks super odd to me that
you would put the panel reference in attach.

Also, your patch doesn't work, and you have a reference inbalance. You
have one taken by the panel driver, put in remove. You have one in
drm_panel_add, put in drm_panel_remove. Which reference do you put here?

This applies to your other patches too.

Maxime

--naqzmlhexuyovrm5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaELY/wAKCRAnX84Zoj2+
diBYAXwKsnGG/hDaACTi2QF85rFrKiFaFWibUe+aygZ2K7/QBjFUhuAmCr4gs9ij
KBDYTjQBgNXlwuo0a1Tzh+JZDgdPXgj1NZYl1UppVoWcYCBkxzww5vfwCw0+YexU
o1W0BPKmpA==
=VbEd
-----END PGP SIGNATURE-----

--naqzmlhexuyovrm5--

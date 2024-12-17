Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62A281F76C6;
	Tue, 17 Dec 2024 17:28:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734456499; cv=none; b=FtZqxwnK+ttwbNkb28qoefv0K3K5vVK4KJTNgyTBghiZwYfOxKI9oHfwMyWqrBwpCN+dtDGNPTt0ojlFyB3iOW6xXKfE/H7zN+6+rGoFgCkb7IUWakIWSLlC2/2kp2oobEZdRFZNaWi+fgOMqIOVF+ENLszzTm6YXzyRB3PbFMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734456499; c=relaxed/simple;
	bh=P/KXH1pSlSgGIDmW0SOLRT8l0k0mjwSPqWkZeKUOdFI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b1W2a7SeIbj+2Kb8YMMZFT/wC9rE3RG6bQkIQy5naBuBFz1lpfX4DCdA7/7QLJNglfoVwPJ06u3+Us3eACojWWADdXpkbjnuKMi0kRpFI3UwtZK6OxJ7xS2tfMJPZ68s49VSNIF98g4hD0C1n+3F7Bs00yO2qzI1caHbnr5vBb0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lqmpa3fE; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lqmpa3fE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA22DC4CED7;
	Tue, 17 Dec 2024 17:28:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734456499;
	bh=P/KXH1pSlSgGIDmW0SOLRT8l0k0mjwSPqWkZeKUOdFI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lqmpa3fENx0zrOO023bHko0eiu2JdCGJVjMp+cDsf95+sUdBq873OISdo3k5u0+zJ
	 SDzXXS1qpc64h4NVMQbsmADKdtQq3SqiOURq10XbW9zep/n/VRNblYp39EXYzbQBt7
	 ajdUu3epTOHdLTZo7BeQDAXxxCXPjS5kB9cwXcT17Bju8DgdMeu0aQUowzBXyHTBxE
	 usP3qx1BZy5rwZLo+fIo2hy85kWuTM7NDs0I6N8LsYRGZ2c2qng/3ujgZ96q5FNHAB
	 E2mf51SdCyXZsmZ8r2lVuaZhtYaYRlGwn+0IZCMgQHZ9ekBX41FrCVG0/ESumtr9t9
	 LEjJYNSX2u+pw==
Date: Tue, 17 Dec 2024 18:28:16 +0100
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
Subject: Re: [PATCH v7 10/10] drm/vc4: hdmi: use
 drm_atomic_helper_connector_hdmi_hotplug_edid()
Message-ID: <20241217-orthodox-jellyfish-from-ganymede-a1d136@houat>
References: <20241217-drm-bridge-hdmi-connector-v7-0-cb9df2b6a515@linaro.org>
 <20241217-drm-bridge-hdmi-connector-v7-10-cb9df2b6a515@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="4poat5rh7ip5k2pz"
Content-Disposition: inline
In-Reply-To: <20241217-drm-bridge-hdmi-connector-v7-10-cb9df2b6a515@linaro.org>


--4poat5rh7ip5k2pz
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v7 10/10] drm/vc4: hdmi: use
 drm_atomic_helper_connector_hdmi_hotplug_edid()
MIME-Version: 1.0

On Tue, Dec 17, 2024 at 02:40:32AM +0200, Dmitry Baryshkov wrote:
> Use the helper function to update the connector's information. This
> makes sure that HDMI-related events are handled in a generic way.
> Currently it is limited to the HDMI state reporting to the sound system.
>=20
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

drm_atomic_helper_connector_hdmi_hotplug_edid in the commit title doesn't e=
xist anymore :)

With that fixed, and assuming it's been tested
Acked-by: Maxime Ripard <mripard@kernel.org>

Maxime

--4poat5rh7ip5k2pz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZ2G0sAAKCRAnX84Zoj2+
dvgTAYDXWRRNriha0ReNmEhaMolS8cMgKCv2UWzwTM8m3zgibCHDKFgri0Pqm9Wj
kq7o4DoBgOuYsZCZJQ6vnGSi6pHkFZxYFNADG4GFFiA2JE2JPWZ+/G3BQX8XkCyN
VYp4weCILg==
=kZ/S
-----END PGP SIGNATURE-----

--4poat5rh7ip5k2pz--

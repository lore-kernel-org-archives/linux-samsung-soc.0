Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1899206280;
	Mon, 16 Dec 2024 17:15:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734369330; cv=none; b=ZCTBndtS0l2//SFFOmu9f8X9G5IPHX90fsaoiUfmAVm+R1arAOMiZT0gb/Gkuh/GFh/PpwEchjbtIHrlL2OxU/F5+uJHPfrL8GKTLU31VGBlZevKePw9c2NF5yP3uLeTjw1SmOsq/Dsse+NaAfWlvn5//EKwdESyl6EFKUExYpg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734369330; c=relaxed/simple;
	bh=BYWVPSTco7NxgCFt7PuAti5s7WPTbsps5ogniby27jM=;
	h=Message-ID:Date:From:To:Subject:In-Reply-To:References:Cc; b=k8fK96qbfEff0H95kONANT8nNGzrsI+WbDlcNMdoQIMNGEvw2Vi8BvtCqQdWhq+BBWIlQ3I7Xg4jFF79DMYi/XZdbJ/fo331Kx5mYkV5gY+AACJb2MSc6KGoGZdHp3Iw9EU0saRTLPALDM3HXeKhEMcJQgABP9Jc8LWnIrAGRAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nd1NNY4q; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nd1NNY4q"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09C27C4CED0;
	Mon, 16 Dec 2024 17:15:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734369329;
	bh=BYWVPSTco7NxgCFt7PuAti5s7WPTbsps5ogniby27jM=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
	b=nd1NNY4qp5FoANXFQI8jCl/U7QtYaUohcli8BfdPGQhJzh01UHC+HcmogZYSsT7QU
	 69UXwbb6NkJd1NWQtrLCrkFZtUbg6KMHus5WC2vPghoUvpDKvhxFQcKMAIXVXtqBcJ
	 Urpm771eXTc0JS24NfDfDeNj3MWe90SEwqu9O+UnJbkbisJ88uWI7r7NYpIQHidcsS
	 iyv9asoeEcQ1G09ZVL9ay2P6aLFDDMdml9MVivVG608IoNQ7ugTD7Rrrhom82fog+m
	 uh1/lMkXyD4yD8Vvn8i3oalWIAS4ne4pmLKmdcxMTavYzcn3KZDXYXhrOMhrS6Gdhh
	 ZvBbn8M1/VcHg==
Message-ID: <05419690edbfe859f02d8675c57d3f8f@kernel.org>
Date: Mon, 16 Dec 2024 17:15:26 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Dmitry Baryshkov" <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v6 05/10] drm/bridge: lt9611: switch to using the DRM
 HDMI codec framework
In-Reply-To: <20241206-drm-bridge-hdmi-connector-v6-5-50dc145a9c06@linaro.org>
References: <20241206-drm-bridge-hdmi-connector-v6-5-50dc145a9c06@linaro.org>
Cc: dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-sound@vger.kernel.org, "Alain
 Volmat" <alain.volmat@foss.st.com>, "Alim Akhtar" <alim.akhtar@samsung.com>, "Andrzej
 Hajda" <andrzej.hajda@intel.com>, "Andy Yan" <andy.yan@rock-chips.com>, "AngeloGioacchino
 Del Regno" <angelogioacchino.delregno@collabora.com>, "Chun-Kuang Hu" <chunkuang.hu@kernel.org>, "Dave
 Stevenson" <dave.stevenson@raspberrypi.com>, "David Airlie" <airlied@gmail.com>,
 =?utf-8?b?SGVpa28gU3TDvGJuZXI=?= <heiko@sntech.de>, "Inki Dae" <inki.dae@samsung.com>, "Jani
 Nikula" <jani.nikula@linux.intel.com>, "Jaroslav Kysela" <perex@perex.cz>, "Jernej
 Skrabec" <jernej.skrabec@gmail.com>, "Jonas Karlman" <jonas@kwiboo.se>, "Krzysztof
 Kozlowski" <krzk@kernel.org>, "Kyungmin Park" <kyungmin.park@samsung.com>, "Laurent
 Pinchart" <Laurent.pinchart@ideasonboard.com>, "Liam Girdwood" <lgirdwood@gmail.com>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>, "Mark Brown" <broonie@kernel.org>, "Matthias
 Brugger" <matthias.bgg@gmail.com>, "Maxime Ripard" <mripard@kernel.org>,
 =?utf-8?b?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>, "Neil Armstrong" <neil.armstrong@linaro.org>, "Philipp
 Zabel" <p.zabel@pengutronix.de>, "Phong LE" <ple@baylibre.com>, "Raphael
 Gallais-Pou" <rgallaispou@gmail.com>, "Raspberry Pi Kernel Maintenance" <kernel-list@raspberrypi.com>, "Robert
 Foss" <rfoss@kernel.org>, "Russell King" <linux@armlinux.org.uk>, "Sandy
 Huang" <hjc@rock-chips.com>, "Seung-Woo Kim" <sw0312.kim@samsung.com>, "Simona
 Vetter" <simona@ffwll.ch>, "Takashi Iwai" <tiwai@suse.com>, "Thomas
 Zimmermann" <tzimmermann@suse.de>
Content-Transfer-Encoding: 7bit
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>

On Fri, 6 Dec 2024 12:15:59 +0200, Dmitry Baryshkov wrote:
> Make the Lontium LT9611 DSI-to-HDMI bridge driver use the DRM HDMI Codec
> framework. This enables programming of Audio InfoFrames using the HDMI
> Connector interface and also enables support for the missing features,
> including the ELD retrieval and better hotplug support.
> 
> 
> [ ... ]

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime

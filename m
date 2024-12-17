Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E2671F709A;
	Tue, 17 Dec 2024 17:25:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734456309; cv=none; b=XcncERpOkZURrqqiAEsugq+VKf1ufJT95VisUCA8z906Dpmy29RIwGsmlEFwoNN/9C3z96RUdNeviPdjTB9PYRQwhVpLxkd0iyV1Ng5ao98G9Gx9z11zhkXMJYkdJinsKcQ1YR6wsY5Z28bk+HCF2ox6v/hnADFoLLTqvkY2T/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734456309; c=relaxed/simple;
	bh=nCvy4GS2XUqGmqTA94soHiboSzyVX7nHBtkKXyCp+Cw=;
	h=Message-ID:Date:From:To:Subject:In-Reply-To:References:Cc; b=Y8TxjVKGUCmYVphkyI7i6kRrDGUypARJHLgbni3SC2BCCh846JFr6qlb9kP6uYtRQFYN0QLsPog44yBMaralm0Wo9uLHIsVVGmWJtiT0zWtxTMx7qkn3Tzu2q71JwuhVZrYjeLbUeCjxWuk2q1Fm033qB5YVYi24seagjiAggSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IXeMSPbb; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IXeMSPbb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70CBCC4CEE2;
	Tue, 17 Dec 2024 17:25:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734456309;
	bh=nCvy4GS2XUqGmqTA94soHiboSzyVX7nHBtkKXyCp+Cw=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
	b=IXeMSPbb3US4V7xq2w1X5bwx6pWIgZ1xAGN84LaSw+VEEftIbRMCd01KUZ5qcUAjg
	 G1jk8Rt5EUqTwLddGOxGxiddJ4ShkICVMy2YcaF10CzWd2RxBSar788si2r9ARNs6c
	 SgB59cekKqtIDCouRcMPnHWTFbeEj6CzKP5gUL/IDRfI/4jZZeqaXIvFRd/nB1AkJ+
	 SMzNWBYv6x53Fo92UjsXX/SlszevX4pGC9xvsLAFsGdmZ/POgQvP9jLhNAc3f3SSYE
	 Ac0jgrgXf6ngEt3C0M0M0/ud0oNx/c0mZgyv9+f1JDI5YcENrN1CK5HwuneZd4Jn09
	 l+f3EDeTJTHAA==
Message-ID: <b2ad15d2d5049701f34099e0df7fb727@kernel.org>
Date: Tue, 17 Dec 2024 17:25:06 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Dmitry Baryshkov" <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v7 07/10] drm/bridge_connector: hook
 drm_atomic_helper_connector_hdmi_hotplug()
In-Reply-To: <20241217-drm-bridge-hdmi-connector-v7-7-cb9df2b6a515@linaro.org>
References: <20241217-drm-bridge-hdmi-connector-v7-7-cb9df2b6a515@linaro.org>
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

On Tue, 17 Dec 2024 02:40:29 +0200, Dmitry Baryshkov wrote:
> Extend drm_bridge_connector code to read the EDID and use it to update
> connector status if the bridge chain implements HDMI bridge. Performing
> it from the generic location minimizes individual bridge's code and
> enforces standard behaviour from all corresponding drivers.
> 
> 
> [ ... ]

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime

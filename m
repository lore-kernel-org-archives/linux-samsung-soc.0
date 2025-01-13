Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4186E1BFE05;
	Mon, 13 Jan 2025 22:16:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736806562; cv=none; b=jX4ekCBnJanQL4WBC/KpULeKtneV/lR8OCSrFWwlwp2bjuGDCRQg9hXV6HPZj7KOS/iKo1XlE+Bc5/UDUJG9Lm3xUcBI+ofvMkubqRYSs1sa137bHP8GGy6wvjKQ61h0mpFXpBiS7NySWeleSl/vjA6Pq/HcTaouDlDV+d5elX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736806562; c=relaxed/simple;
	bh=Y5S6E31vGrZp2WWQp+J7+BjHJQAeXUygSkYTQTvX4XU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=ankeBSuOOFeGE+3dj9NOkMLoBpmfHn38YM3Mevd8B9IdB7KNSfNnqr3DqQHNiBCSvUNGmvATsMWpKnq1w3ry6AZKGjUqlYsdFAQ1YOTfKJnRXBeXnk5Y7kkFKld0HHKA2K0fgK15IIlOyurwkYdyW/AdUInOD3kNlQPfitjlHD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kE0rJD9s; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kE0rJD9s"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25987C4CEDD;
	Mon, 13 Jan 2025 22:15:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736806561;
	bh=Y5S6E31vGrZp2WWQp+J7+BjHJQAeXUygSkYTQTvX4XU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=kE0rJD9sWlhLiE0AKOajjAvKjJxRX3Gsf3vizIKpCPynwBqUdiks0Vk8Ka8rFTODf
	 piPCBzzT61CxjMeovlpRz7RxSMgCF0Vi9A4MrwJs4Y6JDUdRDBmnCnjBW+YWYkzJGv
	 bK91aUE0oDE9WO/HUpuN7l7IGMV+C4Cn5PIuQVa/6vfNNyaIC5tEeQ9AL8/i9N1VW2
	 BQTVM5qT/d+Jz7E0oETwP9wptZgia5mQ9eueT6ae3E+xMm2MzyXyUM2UVcMV7jxzyk
	 /ZoGu+hS5LuMm+jBkxkvbP0vzPpPw1esO63l5zeJxhJqUSwdASLVpR/zov3QfpQqRq
	 1GTXWl7lQ74PA==
From: Mark Brown <broonie@kernel.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Phong LE <ple@baylibre.com>, 
 Inki Dae <inki.dae@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, 
 Kyungmin Park <kyungmin.park@samsung.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Russell King <linux@armlinux.org.uk>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, Alain Volmat <alain.volmat@foss.st.com>, 
 Raphael Gallais-Pou <rgallaispou@gmail.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Jani Nikula <jani.nikula@linux.intel.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 linux-rockchip@lists.infradead.org
In-Reply-To: <20241224-drm-bridge-hdmi-connector-v10-0-dc89577cd438@linaro.org>
References: <20241224-drm-bridge-hdmi-connector-v10-0-dc89577cd438@linaro.org>
Subject: Re: (subset) [PATCH v10 00/10] drm: add DRM HDMI Codec framework
Message-Id: <173680655387.149204.17517246537828613856.b4-ty@kernel.org>
Date: Mon, 13 Jan 2025 22:15:53 +0000
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-1b0d6

On Tue, 24 Dec 2024 03:47:52 +0200, Dmitry Baryshkov wrote:
> While porting lt9611 DSI-to-HDMI bridge driver to use HDMI Connector
> framework, I stumbled upon an issue while handling the Audio InfoFrames.
> The HDMI codec callbacks weren't receiving the drm_atomic_state, so
> there was no simple way to get the drm_connector that stayed at the end
> of the bridge chain. At the same point the drm_hdmi_connector functions
> expected to get drm_connector instance.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[01/10] ASoC: hdmi-codec: pass data to get_dai_id too
        commit: a8e792d3f0bbecb87ab05e9592cadf0b178ab952
[02/10] ASoC: hdmi-codec: move no_capture_mute to struct hdmi_codec_pdata
        commit: 5b0779ae13de345b405a67c71cbb63705cadb295

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark


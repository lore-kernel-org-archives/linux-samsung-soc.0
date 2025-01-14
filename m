Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com [209.85.219.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 326AF3597A
	for <linux-samsung-soc@vger.kernel.org>; Tue, 14 Jan 2025 01:45:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736819129; cv=none; b=gHa/9xoDcrmLYCkEraIjECKqE5TnXkFhaETNR2oQgyjlD2lXUgxH45OCjVHec/136LjWKY37o40nx09dPE9TNO5PaEvRGaNqwWaK1Fm1VQxRy8qI91gQ+lGcFGe4ModvuzhtTOrZXxKRSGQfUPu274LI9Ufx7qdo0LMzHZiu5L0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736819129; c=relaxed/simple;
	bh=8qCaCSt4CoqQaIzxSrPBfhSLyWDhw17eSm8QRaz5Uwg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mX4k9SrPLPX3104EygW5X95OPG8atMVTAcXXf0bMFu6VI18AXAY8cWJowsmHCti7uXr2RTLOlNVGkQJU+hr4XvUKpru5/90h/rUfsdh4QXTSKe8IY4sNzbS0Yz6YEciZrMQ6nYZsqFAA+CYZ1JPkVuDNQk7gpKYefb9fMM550MA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ALpd0eEW; arc=none smtp.client-ip=209.85.219.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ALpd0eEW"
Received: by mail-yb1-f179.google.com with SMTP id 3f1490d57ef6-e461015fbd4so7117461276.2
        for <linux-samsung-soc@vger.kernel.org>; Mon, 13 Jan 2025 17:45:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736819126; x=1737423926; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=N+8EgI35uv9hF/0OPf+vuhBaBLFzRkr/a46A2Dy1sAk=;
        b=ALpd0eEWVX7IMZigddzhJqImikQD79yzGN7r9/L7muq0kWdqPHYG/WvedTwZnPvsho
         nMup1nm8VoWJCWMH3S2yzzeAMGJzIUD+YZMa4oPt21w1iXMBqupW2ycVGygfmCpTlGPp
         IUj9XnRMQHJrZ2DNYomg1HCLU+61yre9Wu66WsawIznpHQFTLbV1mppLtsXXKYY8oSIJ
         /S1kaYvLfq0w58vJM6wRKIvdF4DUBub+rsFyASzMiwmE6/EboS5MCfT68rUXIy00hYYc
         Qeh0yFO4wbcfr+e1Pg9VmWlSuL5aIYwInVt2HOSRP5l/EAnbwbb+S4epCSWtpxTCziZP
         K+2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736819126; x=1737423926;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N+8EgI35uv9hF/0OPf+vuhBaBLFzRkr/a46A2Dy1sAk=;
        b=Tjcb8oLc/8zOyT5A0mXC8PTjtb89M9sl1DleAI39O3TrYmuerm8t7/M6Hvxy8pKcYi
         7yPJjlhv0HBfcRZ/TkeAwOOPstcjAS7ohhP0N3IEUn3Fy+EswBzzOgnJ28O7h1PBSJ3n
         wo9ybP0os7qUc23jW8cg+1rv8OITcZiIv4SqjYsyD2HWIRN1Z1Vd3Y7t4Zjl3AR0o9yJ
         5Bo/SKyBg9AMvFpUkPSPyQ+E5vOyvn5ub+GtAXucf6ODZUhV1iO2lZy9spNs5z7EUSXL
         DAiRhEn7gYRgp8LTtKYadFqtV19U1DXp75hVmm0DzOyngki30yprEMiGVXIJ0d5FuSqF
         SWsQ==
X-Forwarded-Encrypted: i=1; AJvYcCUepPfE/FhOyLZwCfq0Tf8uYjLZ+b5h3qvC8CRPfVVhZbvzI9b8eH770PVTnuRGfui1D4/at252A/zlVywPULpVKQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+Ea9MQx2NZaFiJvDZltwBtWevvRrVXb394MHeRczjcrCuGzzi
	5GUo8Wcf+TzoC2lZSwfOY9ORwGbqHiDrEOma79LK9pexz/94wuSFQuuzIsYarHTCtbjRaekmB7l
	ZI/68VEuowzEnDeFvQ6ajfaWMbABJ4lyMfx5FtQ==
X-Gm-Gg: ASbGncvCaAVOeWik5ucHxbUxwSaJa0pFWoBizV4+fUawmBhj20+Ls2QP/amXFDEwvRD
	5dP6xMAWYSOaswCh0oWGBpEShrPq9iZT452HL9FNAfdzdJAt9FopKFBo7t14DVA8FckHteA==
X-Google-Smtp-Source: AGHT+IFw+8EJH3+sYLytBcSM829UVF01V8OV1UAI+CzwsaCh0PJQpMGC1iXxd5V1WhnvSyXdw+9iFPxRIV5QmN5E1YE=
X-Received: by 2002:a25:2055:0:b0:e39:8482:5d5f with SMTP id
 3f1490d57ef6-e54ee2026femr12527255276.46.1736819125705; Mon, 13 Jan 2025
 17:45:25 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241224-drm-bridge-hdmi-connector-v10-0-dc89577cd438@linaro.org> <173680655387.149204.17517246537828613856.b4-ty@kernel.org>
In-Reply-To: <173680655387.149204.17517246537828613856.b4-ty@kernel.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 14 Jan 2025 03:45:15 +0200
X-Gm-Features: AbW1kvZk-xrGSPiMdguMFD_hc9SYyHKa4i2bZt-kcCNVjxqbFCr5K6kr1tPBECs
Message-ID: <CAA8EJprDaOTEOYf5JHC7UYwqRn2vXUH9FT==HjZg1QNfDMmBcA@mail.gmail.com>
Subject: Re: (subset) [PATCH v10 00/10] drm: add DRM HDMI Codec framework
To: Mark Brown <broonie@kernel.org>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Phong LE <ple@baylibre.com>, Inki Dae <inki.dae@samsung.com>, 
	Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Russell King <linux@armlinux.org.uk>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Sandy Huang <hjc@rock-chips.com>, 
	=?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
	Andy Yan <andy.yan@rock-chips.com>, Alain Volmat <alain.volmat@foss.st.com>, 
	Raphael Gallais-Pou <rgallaispou@gmail.com>, Dave Stevenson <dave.stevenson@raspberrypi.com>, 
	=?UTF-8?B?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>, 
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, Jani Nikula <jani.nikula@linux.intel.com>, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-rockchip@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 14 Jan 2025 at 00:16, Mark Brown <broonie@kernel.org> wrote:
>
> On Tue, 24 Dec 2024 03:47:52 +0200, Dmitry Baryshkov wrote:
> > While porting lt9611 DSI-to-HDMI bridge driver to use HDMI Connector
> > framework, I stumbled upon an issue while handling the Audio InfoFrames.
> > The HDMI codec callbacks weren't receiving the drm_atomic_state, so
> > there was no simple way to get the drm_connector that stayed at the end
> > of the bridge chain. At the same point the drm_hdmi_connector functions
> > expected to get drm_connector instance.
> >
> > [...]
>
> Applied to
>
>    https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
>
> Thanks!
>
> [01/10] ASoC: hdmi-codec: pass data to get_dai_id too
>         commit: a8e792d3f0bbecb87ab05e9592cadf0b178ab952
> [02/10] ASoC: hdmi-codec: move no_capture_mute to struct hdmi_codec_pdata
>         commit: 5b0779ae13de345b405a67c71cbb63705cadb295

Mark, they had your Acks, so they were picked into drm-misc-next.
Would that be a problem?

>
> All being well this means that it will be integrated into the linux-next
> tree (usually sometime in the next 24 hours) and sent to Linus during
> the next merge window (or sooner if it is a bug fix), however if
> problems are discovered then the patch may be dropped or reverted.
>
> You may get further e-mails resulting from automated or manual testing
> and review of the tree, please engage with people reporting problems and
> send followup patches addressing any issues that are reported if needed.
>
> If any updates are required or you are submitting further changes they
> should be sent as incremental updates against current git, existing
> patches will not be replaced.
>
> Please add any relevant lists and maintainers to the CCs when replying
> to this mail.
>
> Thanks,
> Mark
>


-- 
With best wishes
Dmitry

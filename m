Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76B3E204F81
	for <linux-samsung-soc@vger.kernel.org>; Mon,  2 Dec 2024 14:59:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733151553; cv=none; b=sYG9NRAkZo5PqTxuqbBIEvs63QRvn/Us9wShhnLQMI0aWxIe85kTmQvWuJSdlSqcqzkwNBz6qH52RA6i+NVJVHep8KR1ElfLvrmrbIYieopsZFyxS1+LGCo8f8GnD7mHz210PNlPq/P01hj/4NJYDjA0Ojgprm3BJCIuETO+hBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733151553; c=relaxed/simple;
	bh=vorR0NUgMIxpLB6XnGO1J1hmkZxBZip3sa3UgLPBo2Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hwhTIeDHllpY4+Uf3uC0AOFA3875H9vgO9Zeqem63ye6jyst3SH5n/Z81xiVcfyOH/Rj15kacsiqq4tbCIC2lZNkT+goRQ1B5giiGCj6NC/7Gs8cc9lJjOqBDd84SSq0yK4LYctgOXXFER/GZ8kAEG7Eb+SvlkTxr95ulKznSx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YAr0pe+x; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YAr0pe+x"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-53de5ec22adso5357748e87.3
        for <linux-samsung-soc@vger.kernel.org>; Mon, 02 Dec 2024 06:59:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733151549; x=1733756349; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Rju8sEpE6sdROgx04VbEZEe0Z4Dqml8d9fp2hAHZz1Q=;
        b=YAr0pe+xAUndygXKR8wcvyjPgw6c+Z9XNrMtfghZaWt4OyjOLPtWUXN9z+V+yVPnrE
         vsPfDskivzysC0sD3fljGfR1kAfsXIP32eIEheL1lkJaHEYDj4nzPfrNQuOc0zk4zGg4
         VlnTE0BvEyw4cpRuc9rOof13zW0fbeCB0mUBfPIrpVzqlqkB+jE2mytkbzz5ccqTTdXl
         67/G04S3AT4DnbWpm6/FFTwHHOeDnAz0yfU049qyK6UlNNe/6SkzVe88ezWhvpyrklI/
         PR1/VvQ5VmlOtHW5R/dvu2VbW5YGKw8wsgQyw3pLsaHkZLrugE68NKjNufacGiPLP7EY
         ozRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733151549; x=1733756349;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Rju8sEpE6sdROgx04VbEZEe0Z4Dqml8d9fp2hAHZz1Q=;
        b=C5D002OAilS9+3KFx6+HQhdMakhAd2nT489yQIZBapDBYfDa+XyaA1gDzjfUnirjL4
         vA2fCUk4mvQZPh6Qd1vNh8oSyfkai8QiQ8Qv502Ub0rDYuvHwqBT2Tnu52xY9dUqHFCF
         MVEOXFKDqSBsjsZGyQBzuZMTbYCnupVvuS6voHZGBrvfNbITiA2g0G1A+m6peim9hxJE
         Llo+P/iumEd5X8ym9i/Qb3+FDguiWBRC8vPa13fXnZsn3JrptIRH3NNSsELKsisbRhsQ
         Pv5w9JsYFKxPfRNE9y9VoKIN0EHBHHSgUPqUZKurDMS1vdoBKf1reVUPoP79Iz8xHVOO
         iazA==
X-Forwarded-Encrypted: i=1; AJvYcCUQT2PGYb3Pat93QrXSn2Nr3gO1I+4y5Bioh2aIiapM2Yg9/YSZlKpzMoXOndpr+tVMOM1jVFL/2F5Lr9xVypk1MQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5ZSRZQ8XkcC/U749EuPDw2BbF84qnP/BySLIVXI+xPpwiet9z
	wt4VRMz8Y1YwBnz7QiQK1NUhMKt2NdEFazkPHc1gysz1shtKkImK15/TuHq4Bcc=
X-Gm-Gg: ASbGncsRJuBwG3qevXAShV6XVTLbcdYEUMfYlJh1xGj7HNCzzrrkhvCezmoAXgY85ps
	5oV/yigP5e079Ojuk9VC4dXLzFaStxoA8ha3roQOVnbPzYcxwl2P82OxedGPbTaV2gQD19Q5EqY
	c9ixOiZcCddex9AfFCnhk3/EkK2FAm36Kw5VwYPvkJV7gXLV5Kqlquy+COmT7HXbrXFH9BSKMqQ
	8fDZTpvjQeob4PGt37VaZbfboc+4RTLGMzhlcQE609OYs1g/jPsySPn1EK3G0Xpn6Pmirit+vsI
	I6FhrwixYOd4+z8E967m4BMOEhmG3A==
X-Google-Smtp-Source: AGHT+IFqUZg6UxbmPBpmmNDChC/PhM5ksog1SlPE5I3zx5OIy0xNoMEVpgKx1uItUxOnsjp3icE8UQ==
X-Received: by 2002:a05:6512:b26:b0:53d:edba:d40b with SMTP id 2adb3069b0e04-53df00dc8d7mr12039335e87.33.1733151549347;
        Mon, 02 Dec 2024 06:59:09 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53df646f2c3sm1480384e87.126.2024.12.02.06.59.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Dec 2024 06:59:07 -0800 (PST)
Date: Mon, 2 Dec 2024 16:59:06 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Maxime Ripard <mripard@kernel.org>
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
Subject: Re: [PATCH v5 2/9] ASoC: hdmi-codec: move no_capture_mute to struct
 hdmi_codec_pdata
Message-ID: <onq2djvtvxvr3a52s6sin3dstwdctyyz2lxpx47lk7ndxtza33@odldgvhryw4d>
References: <20241201-drm-bridge-hdmi-connector-v5-0-b5316e82f61a@linaro.org>
 <20241201-drm-bridge-hdmi-connector-v5-2-b5316e82f61a@linaro.org>
 <20241202-bald-just-guan-c5d41b@houat>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241202-bald-just-guan-c5d41b@houat>

On Mon, Dec 02, 2024 at 01:06:09PM +0100, Maxime Ripard wrote:
> Hi,
> 
> On Sun, Dec 01, 2024 at 02:44:06AM +0200, Dmitry Baryshkov wrote:
> > The no_capture_mute flag might differ from platform to platform,
> > especially in the case of the wrapping implementations, like the
> > upcoming DRM HDMI Codec framework. Move the flag next to all other flags
> > in struct hdmi_codec_pdata.
> > 
> > Acked-by: Mark Brown <broonie@kernel.org>
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 
> I appreciate it might be a dumb question, but I never really understood
> what no_capture_mute was all about. And in that context, why some
> drivers would need / use it, and some won't.

Some platforms can not mute the HDMI capture (ARC?) path. See the
following patches:
- https://lore.kernel.org/all/1606372608-2329-1-git-send-email-shengjiu.wang@nxp.com/
- https://lore.kernel.org/all/1606372608-2329-1-git-send-email-shengjiu.wang@nxp.com/

Russell added a way to disable capture / playback support, but only TDA
driver uses those. I think generally we should change those flags to be
opt-in for capture, but that requires carefully reviewing all the
platforms (and is a separate topic anyway).

-- 
With best wishes
Dmitry

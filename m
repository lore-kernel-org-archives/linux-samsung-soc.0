Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01ACE1D90AD
	for <linux-samsung-soc@vger.kernel.org>; Tue, 17 Dec 2024 12:31:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734438714; cv=none; b=qMYQ19Xgq6lgxswuQpALmiaTxvCSZugXfFpSJ1lSHeO3jEmi1ZCkhHFMXkf2S+7QQVuFcDkFKn4m80DKmHiG2rfYLIL231jBs5B8aZubXrFIAv2z8nDnDJFtAjB/wYQJmzCu1DbV8x7CUByX4ohr3kdCqPUzRGxePOsM9sttHEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734438714; c=relaxed/simple;
	bh=7N9XWsRRznkPFIWEExuMVt17UZ3nd7QjBaGJxD0x96k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BI6wKgCRegIQdOC2bvHRgCkbTOHtLqwKVdwGZp+gNuZELPppXiiWtDHFwXLSwznCoF8ZqatFPR/4va1WRjnagUrbQtOaPxXqV6O5J1kH0N47M26HvQvN5ePKu4GH6THE0gKfANHJtbF9A8VFTd8DaT2GAStHV6wr8C3i7iEOvMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XkG+fhJl; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XkG+fhJl"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5401c68b89eso5687693e87.0
        for <linux-samsung-soc@vger.kernel.org>; Tue, 17 Dec 2024 04:31:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734438711; x=1735043511; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=OD2airYmXEIM5XCQfXb6/TEVO/ZX203WR6AY+SunHbs=;
        b=XkG+fhJl+eUSXWdZkTmsAlBgluEsHe0alVEhyTB74yQcx59zfSDfyQl+a908jfGkAO
         ydDfBpbfYtMjDbiwzzYflqlKfaaCc5zb/WuOYS1Zf/KGGa/cQ1NPTk4NnrY0uaoWUCc2
         +T4gFEB5Kvn8sJg0RYG8gnwULLKhniANWcMu9tgTDZg2AeO9iLGSsx47Ccv3u0O+OPTF
         JXAhG5ttfjigvwNloQEnMf6shTMubp5LWGfjh8YOfAC8QLV6EnCa3FYDdwvz7FhswMxC
         Ze7YRIT8EUhYEW6jlzPcdfKuQI0zSvhBlKxim65mwiXqFipPjSK7w6l6ltNErBteAsUD
         RTZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734438711; x=1735043511;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OD2airYmXEIM5XCQfXb6/TEVO/ZX203WR6AY+SunHbs=;
        b=YIVylzwbDVVDfcwG3xGkLwyGD1WlOuNYW4xzTapN0nm5WJwT7TKT/ANE9bMm0PajEy
         tV/nkS9gZee0204irsLUHykpBKQfetEDUnzcoadWfwUat76rF1pisFGBgLnTL3nfj/S6
         HbQwv6RsUwApKoj8xIec8yGiGteJG5wbIz7dTarFZphM4cbpbgmySI9446Id92J1nmXQ
         HPC5UDr4Am5YGNVqAzD18bxEXyZ/vB3WSLHHF/V3XTojMJQn00H5tonHitOPhVCyRMZ9
         Xf+gDvUX5YA8p+rJlRCE28HAvzN6mfGpztqwjTxmq8/+2nL3PfZQP+4b2FUhL3n4eGKj
         Kuyg==
X-Forwarded-Encrypted: i=1; AJvYcCVLe3bsw3RjcshnEoQKO5RqNijawbtBvhftpIQUEuXs3CbuQxTbOmMcW5R2Fmv6Q/2ETcNkSPBdL3s9Q/i2y8wu9Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YyJfqEiQOn2NIIER6OZuOmnaMNXTxD/StMHa4KoXU2D1wlDg2kN
	isOQvvy3tjiKCDsd1hByMcQiShcda6Y5b9+W7XgFeQnIViZjAiYh5wJ/GpVou5c=
X-Gm-Gg: ASbGncsqoNvo1zc88vXqGd+6pqtmwckV2Jc201Qym3xeUY2v6J6y2Cqxtwk4loOLvyM
	+NYuzEu+euMYO0Ix8tocRmtldtDQ172tkKuQUQgEQqwY8i+YgCu/n8weoSTKwlpuhuSH8aWk/Wr
	NxxWEIDt8os/KyaEAl7gYgkbDwYbQT2WB53+aJCn7GM1REkB9s7tpstWoBO9rzn+axyw3dV8jcX
	jBj3qQBp8ayQkJN3v1zu+rXtNQekCNnYFUDf9CEKlJJ9F2ijfhKRd7jv+Q+IWxwMOA6vI4LuEmV
	zMigHsn3sIR4Z+lqRswJF96I38QaFqWBmrqb
X-Google-Smtp-Source: AGHT+IGLqNfuo6dVnZwB0IG9CYkUL75QpM9W/HERVzyQaVYoG4TeHcNOZSSbW2843k7yE5uyrSEtJA==
X-Received: by 2002:a05:6512:3e0c:b0:540:1fec:f331 with SMTP id 2adb3069b0e04-541315ac7a5mr947299e87.27.1734438711130;
        Tue, 17 Dec 2024 04:31:51 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54120b9f3d0sm1145293e87.30.2024.12.17.04.31.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Dec 2024 04:31:49 -0800 (PST)
Date: Tue, 17 Dec 2024 14:31:47 +0200
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
Subject: Re: [PATCH v6 03/10] drm/connector: implement generic HDMI codec
 helpers
Message-ID: <buem3nnscnyh7latovvnsbhp2ci6pbjpckfmrft2267afzwdwq@2roahluiow7t>
References: <20241206-drm-bridge-hdmi-connector-v6-0-50dc145a9c06@linaro.org>
 <20241206-drm-bridge-hdmi-connector-v6-3-50dc145a9c06@linaro.org>
 <20241216-heretic-mackerel-of-wholeness-fcfed7@houat>
 <exocd3b65cy6cy5w47cwx3ykn54ncf34hwyj7ffihs5jjzean5@y677uywnlah2>
 <20241217-heretic-hopeful-jaguar-aeabec@houat>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241217-heretic-hopeful-jaguar-aeabec@houat>

On Tue, Dec 17, 2024 at 08:43:10AM +0100, Maxime Ripard wrote:
> Hi,
> 
> On Mon, Dec 16, 2024 at 07:47:32PM +0200, Dmitry Baryshkov wrote:
> > On Mon, Dec 16, 2024 at 06:04:41PM +0100, Maxime Ripard wrote:
> > > > +struct drm_connector_hdmi_codec_funcs {
> > > > +	/**
> > > > +	 * @audio_startup:
> > > > +	 *
> > > > +	 * Called when ASoC starts an audio stream setup. The
> > > > +	 * @hdmi_audio_startup is optional.
> > > > +	 *
> > > > +	 * Returns:
> > > > +	 * 0 on success, a negative error code otherwise
> > > > +	 */
> > > > +	int (*audio_startup)(struct drm_connector *connector);
> > > > +
> > > > +	/**
> > > > +	 * @prepare:
> > > > +	 * Configures HDMI-encoder for audio stream. Can be called
> > > > +	 * multiple times for each setup. Mandatory.
> > > > +	 *
> > > > +	 * Returns:
> > > > +	 * 0 on success, a negative error code otherwise
> > > > +	 */
> > > > +	int (*prepare)(struct drm_connector *connector,
> > > > +		       struct hdmi_codec_daifmt *fmt,
> > > > +		       struct hdmi_codec_params *hparms);
> > > 
> > > Missing newline
> > > 
> > > > +	/**
> > > > +	 * @audio_shutdown:
> > > > +	 *
> > > > +	 * Shut down the audio stream. Mandatory.
> > > > +	 *
> > > > +	 * Returns:
> > > > +	 * 0 on success, a negative error code otherwise
> > > > +	 */
> > > > +	void (*audio_shutdown)(struct drm_connector *connector);
> > > 
> > > And thus we can probably just call that one shutdown?
> > 
> > It should be called automatically by the sound system. I'd rather not
> > call items directly that we are not supposed to call.
> 
> I meant that with my suggestion to call the function
> drm_connector_hdmi_audio_init, that structure would be called
> drm_connector_hdmi_audio_funcs, and thus the audio prefix in
> audio_shutdown is redundant.

I see. I posted the next iteration already, but I'll try to remember
this change for the next iteration.

-- 
With best wishes
Dmitry

Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA12A33C9
	for <linux-samsung-soc@vger.kernel.org>; Tue, 31 Dec 2024 02:34:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735612496; cv=none; b=bvxBRr3Bc5Ya9QrI8tvlUopg7dmxOnpG0W43RUIGAH3SGqHPvqWPAFK2j/pIZGNqvzuTJ3bhrpiyZlDG+Ox4mk/yaI/bI6yDajtB69ZVYErV1kLcwekr9LwlXENgAfgNTVlKlnSQ0tu/bjbxSI3fR4nI3ThRWp9rOkMHa1lrv/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735612496; c=relaxed/simple;
	bh=Ae9/lvO1stBPVGUEAvqBEm1gf+pkvtjIMKWgwUc+1/8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jEcAcIJH41VTvyYa3uX/mMjjhfcWQs0r1E2ppwAuH/0F/uAggVbYtHSjLDzCcJ0AL1SLTRIzKkIqqcoBnyrj6/cIc8F+sB+KPTo8ZoPXfZOlq4ONJzDphRLx3nl+cSBUfSCLWRfxVBkqY5iGqGwR1eJrC59mzDagAu8kfLs2kPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GGg/V7iJ; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GGg/V7iJ"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-53f22fd6832so11013614e87.1
        for <linux-samsung-soc@vger.kernel.org>; Mon, 30 Dec 2024 18:34:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735612491; x=1736217291; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RI+7nbA0Mzu0ksJ91JaVgtOoMaDibvKyhcyw54LCMU4=;
        b=GGg/V7iJtrlPPyKhqMoqNwpo82vNW1tkutxzLklsgktRtXmjIfsWr5IDVj5kpns9Pi
         yhFH3Zz0UxCQCzdIvTGNGon2wiwUn062Jeu8X9YaUE7ap/N5Xf0cLJ7dKbl/P+CVHK3h
         tHL9csp3jLntfRoZqacoR7RTOScd5wQp3tnGbG0Qh4DNOspBZ/fE3uBCLL0BIGMapesR
         il6yrcPE3OZHpv5mvLq1DnEYIF/kYBGZ8CImjJX67tYiXVPq4YpQchOcoi8jbrTZTonf
         gJP4P0TDd/jVOEuaHXdqN4uL+z4RPJ1t8gGkXLq9s5Wd9AZIWYpuiY+16fvA0FMwQdJd
         YNqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735612491; x=1736217291;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RI+7nbA0Mzu0ksJ91JaVgtOoMaDibvKyhcyw54LCMU4=;
        b=DSZVuajUBYpBSq+qMDe5Yx5dP7PLHWbOPZgnAmZC0g7NHqOrVQz82jqmEOEHwJuDdU
         XFkng+2fdln3Jt76q5KYlkUkn1/67PMr3FgRoBOYzutsxE9EhDRazDfsKgFN1MGM815+
         Ga3vjWIHYI/4FcdN/WZYm7Q8fZREjdKzCWOU+EvzYxHuNobBkR+Eyr/XK/Xjiog8xzB8
         SbuCE6Nt/LUZ8mfYwE6j+y/vt95A4OSczcC7NiwiU+3SGVay/A7+3sRD0k3FIYdtWNLd
         uXMrJ4pQIeJvJ84RwLWF6vS4/U0BKtD6TaNMLJZWuj3eNNZ0z9vNlAxqMn1hXkQto0/M
         69ww==
X-Forwarded-Encrypted: i=1; AJvYcCWpU+uiUittzQ0y9GgN+jHCJn2vTKkDrKW0RbCJl7DJu2OwuOWOqp7ffNy04SFP1Y700/+cMvyxBHhO/UqQqT6mAQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxS8QByOBb+MAMn/0uk4rSqLjT0imBmtjTejFGqyZ+G5Zwu50z9
	NZVm4WOAJ4tthSrJ3VJ/0EKwK944NklgwswfV6oopTZEae1sRyP305srabpl0qo=
X-Gm-Gg: ASbGncviF3Rtr2Nl3RJhy08bM1gBfeWRkpJXA0+so0l92SWxbMmSaO1Zk4VIF6/5B1b
	V83hFYN5g9kdjZeFRRYQa/WxjJnpmRFwRqL5bpDIunJMhE1Za41HO7fGyo4VF5cSdGVpSCG+Z6A
	UPoiCYJtnE50Pe3HJNyzTubtXxEJ/xHHiwEe7y0nfo5ktHkkFmWH/qtfFrwtgJYWU98KaCmmKmf
	VQxsuu9WTthuDvx3MjdT7O57vkgGh6nb9NsQZm9QBOSmT1XCa3OiNVcaZ80kjUZosprbq5Ucu5s
	9pvWoIVWaaMpLNkOqCP2yK5BG31g+3p3EPF4
X-Google-Smtp-Source: AGHT+IEQngwlXfM9dt8rjOdrOkpWLx4+BQSwZSDQz+VJSVqmUl9GZRZw3hBdn7Zi64KM99/WDZ1KDg==
X-Received: by 2002:a05:6512:3405:b0:542:2a8b:d56f with SMTP id 2adb3069b0e04-5422a8bd614mr11921584e87.4.1735612490788;
        Mon, 30 Dec 2024 18:34:50 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5424c72cf59sm980707e87.271.2024.12.30.18.34.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Dec 2024 18:34:49 -0800 (PST)
Date: Tue, 31 Dec 2024 04:34:47 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Laurent.pinchart@ideasonboard.com, airlied@gmail.com, 
	alain.volmat@foss.st.com, alim.akhtar@samsung.com, andrzej.hajda@intel.com, 
	andy.yan@rock-chips.com, angelogioacchino.delregno@collabora.com, broonie@kernel.org, 
	chunkuang.hu@kernel.org, dave.stevenson@raspberrypi.com, dri-devel@lists.freedesktop.org, 
	heiko@sntech.de, hjc@rock-chips.com, inki.dae@samsung.com, 
	jani.nikula@linux.intel.com, jernej.skrabec@gmail.com, jonas@kwiboo.se, 
	kernel-list@raspberrypi.com, krzk@kernel.org, kyungmin.park@samsung.com, lgirdwood@gmail.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-sound@vger.kernel.org, 
	linux@armlinux.org.uk, maarten.lankhorst@linux.intel.com, matthias.bgg@gmail.com, 
	mcanal@igalia.com, mripard@kernel.org, neil.armstrong@linaro.org, 
	p.zabel@pengutronix.de, perex@perex.cz, ple@baylibre.com, rfoss@kernel.org, 
	rgallaispou@gmail.com, simona@ffwll.ch, sw0312.kim@samsung.com, tiwai@suse.com, 
	tzimmermann@suse.de
Subject: Re: [PATCH v10 03/10] drm/connector: implement generic HDMI audio
 helpers
Message-ID: <l3u3wtnxyhrwjynevkwfjwarisc4yt4xy2rbzf5kb7k5l5dw3n@lxqtimymyjg6>
References: <20241224-drm-bridge-hdmi-connector-v10-3-dc89577cd438@linaro.org>
 <20241231004311.2574720-1-martin.blumenstingl@googlemail.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241231004311.2574720-1-martin.blumenstingl@googlemail.com>

On Tue, Dec 31, 2024 at 01:43:11AM +0100, Martin Blumenstingl wrote:
> Hello Dmitry,
> 
> this is great work - thanks for your efforts!
> 
> To give some context:
> I am working on a HDMI controller driver for the Amlogic Meson8/8b/8m2
> SoCs. Unfortunately the driver is not mature enough for upstream
> submission (all I have is the vendor driver which serves as reference).
> That said, my goal is to upstream the driver at some point. I have
> already switched my driver to use hdmi_{clear,write}_infoframe. Now
> I'm trying this series to simplify my code even further - by using
> your audio helper work!
> 
> > --- /dev/null
> > +++ b/drivers/gpu/drm/display/drm_hdmi_audio_helper.c
> > @@ -0,0 +1,190 @@
> > [...]
> > +static const struct hdmi_codec_ops drm_connector_hdmi_audio_ops = {
> > +	.audio_startup = drm_connector_hdmi_audio_startup,
> > +	.prepare = drm_connector_hdmi_audio_prepare,
> > +	.audio_shutdown = drm_connector_hdmi_audio_shutdown,
> > +	.mute_stream = drm_connector_hdmi_audio_mute_stream,
> > +	.get_eld = drm_connector_hdmi_audio_get_eld,
> > +	.get_dai_id = drm_connector_hdmi_audio_get_dai_id,
> > +	.hook_plugged_cb = drm_connector_hdmi_audio_hook_plugged_cb,
> > +};
> On my platform drm_connector_hdmi_audio_prepare() is never called. As
> a result of that the audio infoframe is never written to my HDMI
> controller hardware (hdmi_write_infoframe() is never called with type
> HDMI_INFOFRAME_TYPE_AUDIO). My hack to make it work is to add the
> following line to drm_connector_hdmi_audio_ops:
>   .hw_params = drm_connector_hdmi_audio_prepare,
> 
> I checked all instances of struct hdmi_codec_ops in v6.13-rc3 and it
> seems that there is only a single driver which uses the .prepare
> callback (drivers/gpu/drm/vc4/vc4_hdmi.c). All other drivers seem to
> implement .hw_params instead.

Yes. However .hw_params don't have access to the infoframe contents, so
I had to settle on implementing .prepare.

> 
> The audio controller code for my platform is already upstream:
> - sound/soc/meson/aiu-codec-ctrl.c
> - sound/soc/meson/aiu-encoder-i2s.c
> - sound/soc/meson/aiu-fifo-i2s.c
> 
> My understanding is that you have a platform with a lontium-lt9611
> HDMI controller available for testing. Can you please help me
> investigate and find out which piece of code is calling
> hdmi_codec_prepare() and therefore lt9611_hdmi_audio_prepare() on
> your board?

Sure, this is the call trace on my platform (Qualcomm SDM845,
sdm845-db845c.dts):

lt9611_hdmi_audio_prepare+0x1c/0xc0 (P)
drm_bridge_connector_audio_prepare+0x2c/0x40 (L)
drm_bridge_connector_audio_prepare+0x2c/0x40
drm_connector_hdmi_audio_prepare+0x24/0x30
hdmi_codec_prepare+0xec/0x144
snd_soc_pcm_dai_prepare+0x78/0x10c
__soc_pcm_prepare+0x54/0x190
dpcm_be_dai_prepare+0x120/0x1d0
dpcm_fe_dai_prepare+0x9c/0x2a0
snd_pcm_do_prepare+0x30/0x50
snd_pcm_action_single+0x48/0xa4
snd_pcm_action_nonatomic+0xa0/0xa8
snd_pcm_prepare+0x90/0xec
snd_pcm_common_ioctl+0xd94/0x1a24
snd_pcm_ioctl+0x30/0x48
__arm64_sys_ioctl+0xb4/0xec
invoke_syscall+0x48/0x110
el0_svc_common.constprop.0+0x40/0xe0
do_el0_svc+0x1c/0x28
el0_svc+0x48/0x110
el0t_64_sync_handler+0x10c/0x138
el0t_64_sync+0x198/0x19c

Hope, this helps.

-- 
With best wishes
Dmitry

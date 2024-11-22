Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 038F11DE2C0
	for <linux-samsung-soc@vger.kernel.org>; Fri, 22 Nov 2024 11:35:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732275327; cv=none; b=aCkSX+dEQ2d+KeGtaIq+lyNYywP9fhgA9MrOnr1IJ0mV8Y8fUuxwiGbspiZRr/yFN86aLTVjA0gmVLd53HXluUOFN6CJy0k/VjuHLZhUhRtLx0HO7SdFNASFv030tsAKKGuf5ZfS+a4a22oVu7rj3Nt0vLE3CO1TweKRCtrAEjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732275327; c=relaxed/simple;
	bh=6Xd7rJOb08RMaqyYb/dd6a9HoYlps8DyV1OZBY6cLOU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G0TnJV/1eCgB0iupDwHldqTXfLy/A5z55tXJTV1uh+2LijMLobZDrqOFct+/vyLG9WKL4zhdr/vwlnQZ3z9l5+5iFl5riDGLehdbeZ2TV4u+h6UWDLMQnY16odicFPJ+e5uc9MiIahaJ6E8NWkc8J0rMAi59l2hgF+X1OqMbrNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rGooyY9r; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rGooyY9r"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-539fb49c64aso3405219e87.0
        for <linux-samsung-soc@vger.kernel.org>; Fri, 22 Nov 2024 03:35:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732275323; x=1732880123; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=krxMhaTOFP6KQfuRozKR1NNs6wdGoTjqof+u9BiFDsk=;
        b=rGooyY9rZyj2FYZ0mDfR0hvGn5g/BsiydIW6qk1ixiCTewn6or268/rpKR7n4XwRrr
         GUY7fVFUHcvJWyeJg7HJBeI0mKxx63yVSELWcWt09g23PHMS12qOIwm7bkkRGTBg3o68
         aBdxu0xsGW0NAo1mjcqtnPl/zGj12G06DQbEdXPMN2jYF+brA7krc9NE/VV7wosVstIz
         GF2hIIDV+jfJL1a9cQfK6pWxz5j3kKIMZ8ASHMDqOCBEM2504eXDjy2XwomWRZza8lrc
         jZalEHiPTEMP+CMf5kx4dnHCH5CHW/bfAMab4iJGdLmHcqcFAIs3f6wnP2Kdlyt0yK7F
         iFRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732275323; x=1732880123;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=krxMhaTOFP6KQfuRozKR1NNs6wdGoTjqof+u9BiFDsk=;
        b=AdXkKBuie5NYI5ZdveWT450JJ/Lcyjgntsc1YBrhO1a460yQmWR110BR7e1PFg8sr8
         F+8mwwTi8po1StNRyrjOVCXUR3DI3cMPGNKvjs0bx1ZO0oWs8CRcuuDHJVpVpJCT3TRf
         ZXysgADYw/0QTcFW8qwTEf7ogsf7sa9xOqEGHIjZYFYXkOMxDItrL/Z1u/rbOF4cbmyu
         rYu3qcdnYF2K9VSoxI74eOU8UVJPMVZ8Obk2B+dq0SOIVAMtlNjVIqjO38mAgbFG+3O9
         chsqlbO1krKqzt5iz4eslP+TIA3I6qUeds9iJcj8yvUGhjId5jRpSuHzPmGOPHS9Sd5o
         sHKA==
X-Forwarded-Encrypted: i=1; AJvYcCVc/gQSJdLJVVUC0hkk7wNDex9kXS8Uf1WeBq31/aY+FgO/qBKQYPa3vw+vj0VLIzsRRoena6JlVac0uhCnR+t4qQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwD+z+dSjDQsx0H9pHm9oQd8fVLCnRvHgHwE4pnK1/c7En0Q/u8
	IRGcprM8MCe+NAMrmvr77sdvoJOq8C5OvwR2jYxOYqFl9fFoWidKoCgyZaJFfjg=
X-Gm-Gg: ASbGncs0G5TRyL2FvqWYf28J65WmqSU7+8kYduF2XLg4tPhMtLEV1uz/35xiXoPXb0g
	fcnnGCuELPy1/8nhz8rAyr5ClSs5x1fYk85zHNxKZUEpOBu/eFd5UELpMD6hFAchtSBn+aRzyfB
	/nK/85tNVVzNLhCOlVwaeSSQg9KjLyQzyOfwc8J8pxkYDzJNOxFo1YVbw4oN8z5GajCagO9Gk6x
	SKrFPfe/EHE97e4Cd1SImGKtjQjNTNyXSOXeLPQ10yYvqrfcWdRULJTy2uil6TsWjXrNyNgqiN9
	mN2Kaim9vb2szRyRSx/K+X7U6fou+w==
X-Google-Smtp-Source: AGHT+IHcS5D0tQAmLEPHu7UajYtNpfZvhiuBwDM25QDIUqbvD9w+ge3SD7yoJlUUHrhodq7JCz8ehA==
X-Received: by 2002:ac2:5eda:0:b0:53d:d3ff:7874 with SMTP id 2adb3069b0e04-53dd3ff78e0mr1407682e87.29.1732275323001;
        Fri, 22 Nov 2024 03:35:23 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53dd3f12809sm270502e87.38.2024.11.22.03.35.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Nov 2024 03:35:21 -0800 (PST)
Date: Fri, 22 Nov 2024 13:35:19 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Phong LE <ple@baylibre.com>, 
	Inki Dae <inki.dae@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, 
	Kyungmin Park <kyungmin.park@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Russell King <linux@armlinux.org.uk>, 
	Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Sandy Huang <hjc@rock-chips.com>, 
	Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>, Andy Yan <andy.yan@rock-chips.com>, 
	Alain Volmat <alain.volmat@foss.st.com>, Raphael Gallais-Pou <rgallaispou@gmail.com>, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v4 3/7] drm/connector: implement generic HDMI codec
 helpers
Message-ID: <altuhp26ntnpltvfdmikggdmibyizdwnrmwshte7sa2btmbgvj@mbhlvwb4xrzj>
References: <20241122-drm-bridge-hdmi-connector-v4-0-b4d69d6e3bd9@linaro.org>
 <20241122-drm-bridge-hdmi-connector-v4-3-b4d69d6e3bd9@linaro.org>
 <87ed33zf5e.fsf@intel.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87ed33zf5e.fsf@intel.com>

On Fri, Nov 22, 2024 at 01:22:53PM +0200, Jani Nikula wrote:
> On Fri, 22 Nov 2024, Dmitry Baryshkov <dmitry.baryshkov@linaro.org> wrote:
> > diff --git a/drivers/gpu/drm/drm_internal.h b/drivers/gpu/drm/drm_internal.h
> > index b2b6a8e49dda46f1cb3b048ef7b28356dd3aaa4e..8ed58e482fac4662b659276e8bc17690e1fdb9b7 100644
> > --- a/drivers/gpu/drm/drm_internal.h
> > +++ b/drivers/gpu/drm/drm_internal.h
> > @@ -280,4 +280,9 @@ void drm_framebuffer_print_info(struct drm_printer *p, unsigned int indent,
> >  				const struct drm_framebuffer *fb);
> >  void drm_framebuffer_debugfs_init(struct drm_device *dev);
> >  
> > +/* drm_connector_hdmi_codec.c */
> > +
> > +int drm_connector_hdmi_codec_init(struct drm_connector *connector);
> > +void drm_connector_hdmi_codec_cleanup(struct drm_connector *connector);
> > +
> >  #endif /* __DRM_INTERNAL_H__ */
> 
> Better fit in drm_crtc_internal.h or drm_crtc_helper_internal.h?
> 
> Maybe we could use an internal header inside display/. Or just 1:1
> drm_foo_internal.h for every drm_foo.c to keep things simple and have
> fewer interdependencies.

Sounds like drm_connector_hdmi_codec_internal.h. Most likely we should
also split or rename drm_crtc_*_internal.h, but that's a separate topic.

-- 
With best wishes
Dmitry

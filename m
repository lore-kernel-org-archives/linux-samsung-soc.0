Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F6911632FE
	for <linux-samsung-soc@vger.kernel.org>; Wed,  4 Dec 2024 23:17:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733354267; cv=none; b=J5QdbRe0dXDmooZkVR+qyHczmnPu/aBp8feMVsKZZdYD2foHZG7I8A6ASSONez/DAm52uw1l32TQ2cglz3k6lPMwRL1YMqT1rs6ExIBGYsbA7JFqF1ARSf9lwF8wBLtzeBjpLUQerGMA9GYqHuzcH1RXycWA5kKv5QvnI8z7tHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733354267; c=relaxed/simple;
	bh=6gz/5JCvku0V5yr9ixVyR9+FNlFCkvwcxxf4D0X90ZQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L7vxSoN8JNz0d1nhcuJeaGbGFOREJyDY6OQAsp4/nsED/TwR34O3ZGFUsOl3jVZ+28zmXQzbJHD2bTQJ8Rpvuu3Nl7FeWXlBRkwHoq6QQjfrXB7Kyfv3Qh7Ny9F/Q2aaotdJub0DTTIb/qVLvihpZCPgFPHI9ryCNJOkbp+u8is=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FotN6tnC; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FotN6tnC"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-53dd59a2bc1so350364e87.2
        for <linux-samsung-soc@vger.kernel.org>; Wed, 04 Dec 2024 15:17:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733354264; x=1733959064; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=R+qyWMAaxSXjS/GuoQtdsJ9zo8e90abOj5J8SrRL65M=;
        b=FotN6tnCZCSpJq3dIQKpLY6hsyU/QkOWsmUZWT6AoSl4H7VVj83y4bykbZH+QYhZ/D
         CgngLSiN2uxozRcewUkdHitjzNLLcozG+AKLiN62HiJwNE829/Zv/LlIp27hHt+QGU/D
         oTJS5Ff2IdwgvZIAuj1t3XPPXmWizukxB57tFLqu0xp55cTJgJ4h0NljgXALyriNlU6X
         dq2LFmoNOG+jRo4J5KzDRbnn5RoM7SkY/WwbItpSxg/NSPleJMpXJ1phiqs7TjXQq+Uf
         ANIFAP/FnLt0HyMNQ4Pg14q/chrOSXdS9hi8vEjzK6fDWOcjKBoMnEev4EhydtpxGFK5
         HaYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733354264; x=1733959064;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R+qyWMAaxSXjS/GuoQtdsJ9zo8e90abOj5J8SrRL65M=;
        b=K6jiwXjIS899RTSI1Qgl/i6JXIw4MEce/6QwEaAjMXBFfnjslpHhdtWbmreOLOfZCt
         R4R3kDkvy8knJnhBDF7r4l8QGtQX8OhP947o1RUx8HEWVNw8E5AXzPr9N1fpqk5WNFWQ
         3RLpJW1aM1K/4g08f7cjNtt3kI1zofp72Ok4tO4iv9M1MNmaP4I0j8SMSYYtVusPxosk
         gvXMEIfp916mjm0v1ECccpGDF/jICOF7Ddo3FMJ0QUYFfDP9PG6d75K/a20pVricCmwy
         lm8H32ZGUR0eu0fSb0ilK1TpbCGHLR/lZ5rgkmPv4qCYtyV7oPPXvjN3cVpPxHj7+Y6z
         3dVw==
X-Forwarded-Encrypted: i=1; AJvYcCUNel+b4BfR4RYZ1+MbrZUBaP5K/cMj0ryZ6iFC2cTccs6nOzfj77UmtsAs+1SNCBw2uIeL4B8jijdoNTtnfDDtQw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwUw6eT8BN8X4qo+yPDHVAXvO7qwpsHDkQhABTup69HMveJN6tz
	syLMviH1RibJXnJYnNRV7vyPwJnXRdUTud7kjt6s9QNYjHSKZNil3vUYl4ge5DQ=
X-Gm-Gg: ASbGncuUg1bnNSF7XaLfHCGK7fFhG7Qu3lmdnTfI9I3JLcqciAkvbqwei6rnV9seVIr
	duA+8B/0E5wfQhBp8QGIVSLHntuEOtQETNwdu9456mgCNq3JuLBqBUbamziTXMcTRJnnw05rr9o
	HX+Yij9EuX2qZ/imD8vVk0Ge9DU4tjOt3VsTFsWLTTFGYXmewpeF4yGONM/S3L7QmVTtR2iWKSc
	bz9VIpPuIx2P0aLWBRUr/GMFRxptK8Q5i/Gs16DkDKz3U2HhGE6hu0mDXYbbAZpw9XOLAW7Zbud
	LYP9Xu5OK3geHIsKf5Lnqk0oURDXzw==
X-Google-Smtp-Source: AGHT+IG2aNoUrJvkerXSq3eWJ+qwjRlvZ17m+biwTB/m1eLy8NPmwfbxly/t8CsrnbMCJEk1wfQi/Q==
X-Received: by 2002:a05:6512:3f16:b0:53d:dd09:124a with SMTP id 2adb3069b0e04-53e129ed245mr3412222e87.8.1733354263629;
        Wed, 04 Dec 2024 15:17:43 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53e229ca4c2sm31823e87.269.2024.12.04.15.17.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Dec 2024 15:17:42 -0800 (PST)
Date: Thu, 5 Dec 2024 01:17:39 +0200
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
	Dave Stevenson <dave.stevenson@raspberrypi.com>, =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>, 
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v5 7/9] drm/bridge_connector: hook
 drm_atomic_helper_connector_hdmi_update_edid()
Message-ID: <3oz2k3ywwdkxhi4t4setfqjl54yzxg3nxe7upxwl4syyyygf42@3ynkabu2bmvs>
References: <20241201-drm-bridge-hdmi-connector-v5-0-b5316e82f61a@linaro.org>
 <20241201-drm-bridge-hdmi-connector-v5-7-b5316e82f61a@linaro.org>
 <87a5dc4zd5.fsf@intel.com>
 <txzri7x4pdeakx4juandk3hfhsbx3dhlulxfuehqlmrr7b3wpw@jaunqktsro6x>
 <87v7vz3ne4.fsf@intel.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87v7vz3ne4.fsf@intel.com>

On Wed, Dec 04, 2024 at 09:42:11AM +0200, Jani Nikula wrote:
> On Wed, 04 Dec 2024, Dmitry Baryshkov <dmitry.baryshkov@linaro.org> wrote:
> > On Tue, Dec 03, 2024 at 04:25:58PM +0200, Jani Nikula wrote:
> >> On Sun, 01 Dec 2024, Dmitry Baryshkov <dmitry.baryshkov@linaro.org> wrote:
> >> > +	drm_edid = drm_bridge_edid_read(bridge, connector);
> >> > +	if (!drm_edid_valid(drm_edid)) {
> >> 
> >> What's the case this check is for?
> >> 
> >> My preference would be that bridge->funcs->edid_read() uses
> >> drm_edid_read*() family of functions that do the checks and return the
> >> EDID.
> >> 
> >> There are some cases that just allocate a blob and return it. Would be
> >> nice if they could be converted, but in the mean time could use
> >> drm_edid_valid() right there. Additional validity checks are redundant.
> >
> > This was c&p from drm_bridge_connector_get_modes_edid(). If you think
> > that the check is redundant, could you please send a patch dropping the
> > check?
> 
> Mmmh. It's just scary to *remove* them, and that's the reason I didn't
> want you to add one in the first place! :)

Ack

-- 
With best wishes
Dmitry

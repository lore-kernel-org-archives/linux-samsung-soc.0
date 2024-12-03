Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 948F71E492D
	for <linux-samsung-soc@vger.kernel.org>; Tue,  3 Dec 2024 12:27:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733228871; cv=none; b=H+CXQDLUvelzQpEHdLu/6Kdi5jdiiiHUbd41R69zFixd+IDpC3L9XFqgLm/JsAk9RJHcm6bJpA850+JXY30z1sieQIjMR9aEmtLuqdT1HBg0zu2snDK+MrlSHd1xFBK3gwE2DwIMWBCvBLGw+bjHbMh+JQw92wzp0uKsPGSGGo8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733228871; c=relaxed/simple;
	bh=6RnywpFg91GD9e9AaGXdnmWR1etUR0dSB8zjuPzV61I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qBPkyFFfnISO7zblooCLnDQ5z5Q2lj/A+kxQsBWpe/XoBstuxG8Nc5ZDz6yWFvhhOZsDkcSVYhm3mmdTQvOgF2DpTKhHu7fDSgW/DhCrln9J4PEtvJcsN6J4d15SXSNAvuwSMsjDj7Kt4UN7wMqeAa4fU2uPgCH1It9hX6YGktc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=djY/WER5; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="djY/WER5"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-53de5ec22adso6877172e87.3
        for <linux-samsung-soc@vger.kernel.org>; Tue, 03 Dec 2024 04:27:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733228868; x=1733833668; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4tMW5BgK0yNLwCH6utYoQVhW0P2uh6V2gFL0Ya9nckg=;
        b=djY/WER5Rdu2jIlYxehbxDg/hlYaf361fF+3QnGzzUVRDumY5QD0FrO8+1CpEgWs+c
         f3dW2UiSQnk7eJu/RhipkmoPi7FQIPpXix8rGgack7fCJRvlGrCw1BGXSoDDRxTKicJQ
         IMUUuXlH2zOXbFm9GJLuykS1UsvBk5RSTaGyliJmG1x8cS6IZaEBgvcDhXH6yvafLQX3
         s49uIxIcXNLt+8salXrxOWUhLKvCDCAkhYbtQfRSE7AqBjxNgV6kyl4Br6igAGdMLREJ
         srgwR3oYPVVsvNJhOUdOwthKqw+HayL2AYYKPQAZBNE/3exPp1irghjYnI+ix380KhPm
         NO/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733228868; x=1733833668;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4tMW5BgK0yNLwCH6utYoQVhW0P2uh6V2gFL0Ya9nckg=;
        b=f+dyuYnjv41TmoNlMvfxEYlpf46j1qvlQqiIHK9ylUn5xbUwYDXveVMjJ27U9VAEOL
         eokn9/5SKkuYlIoEnF1z0AqXGXlTIq00+4oXb4tqzCAkU7Nn1bjpywFai04t1uw9+SVj
         o3LStapInfIhVN4otIGnwZqDqVtD2a0fFzjFR0RgRdw2lm1G1Z4ChWqowVTs3cIR1Dm/
         iDAU+595uahjLb0zodveNzfguDdVm/8x9rIjNWU+boUngQk9z/SpvVX/h6kxRddetHQT
         VCmcsqp9XsMpcZ7uQssVqLZAFfvszOOYLVgPw837TTBKRMyAAoOg2oE3Bf44qFDPG+9o
         V8+w==
X-Forwarded-Encrypted: i=1; AJvYcCWlykKwTRbmPtw9qSeI2s4ijp55BM7sJD+Wj2QT795ogAeWi60bjkPoZF7ipkFait0IVMeyn6jjMOTzZBLaWnQGtg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxV7OGuZYv9kDqTFaeIeIlAQNuc0Zw8UKy5P1jZL5CLNzrf2pbF
	vbsa+2J7P0cccN6fEinY2Rtpx4/0Yz35s+5ZXO+GzKLw/u3YOB+CIt/rc2JYNKo=
X-Gm-Gg: ASbGncvVF+zUEYpF9Ii3s7x55hxLqSroymsvxgfZ/47zIa9w3mi3WAzji/bH6wxsjrF
	p1nrJRusDjg4nbsbNy6srjHvWRqAfIQBWh9PTLz505lF+zYMzAEjP/mBaHUkMordKDR1+LyeHqU
	KSFCY71vfJ+X7udymxlNeUJBLgdrSdT2exsgM+ntrZu3cTFda/+ECPw1c9Mup8UtGg57mXGZeA4
	l4afT9za3miyIhNZkjhJ5T4IG3KbY8tMhU4k6ORapxHjSrxfGUQ/Y/jbr6oPbUwgsNwC6L1f+TV
	ceuFr781fxot9HpfHTzOoigHQAPQig==
X-Google-Smtp-Source: AGHT+IG0HmZ8YSlH3L/g4YitdlPm2st4Okvau8mZpJCNyynGj3Z9KtsKcqo/MMABonQgOnqb21PQhQ==
X-Received: by 2002:a05:6512:1089:b0:53d:d3ff:7309 with SMTP id 2adb3069b0e04-53e12a01ee6mr1387104e87.32.1733228867624;
        Tue, 03 Dec 2024 04:27:47 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53df649f6f2sm1810134e87.246.2024.12.03.04.27.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Dec 2024 04:27:46 -0800 (PST)
Date: Tue, 3 Dec 2024 14:27:44 +0200
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
Subject: Re: [PATCH v5 9/9] drm/vc4: hdmi: use
 drm_atomic_helper_connector_hdmi_update_edid()
Message-ID: <ae24x2bo736jpzi77l34hybejawwe4rp47v2idedga344ye6zr@bxsxz34dwrd2>
References: <20241201-drm-bridge-hdmi-connector-v5-0-b5316e82f61a@linaro.org>
 <20241201-drm-bridge-hdmi-connector-v5-9-b5316e82f61a@linaro.org>
 <20241202-married-bald-raven-7acd83@houat>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241202-married-bald-raven-7acd83@houat>

On Mon, Dec 02, 2024 at 02:27:49PM +0100, Maxime Ripard wrote:
> Hi,
> 
> On Sun, Dec 01, 2024 at 02:44:13AM +0200, Dmitry Baryshkov wrote:
> > Use the helper function to update the connector's information. This
> > makes sure that HDMI-related events are handled in a generic way.
> > Currently it is limited to the HDMI state reporting to the sound system.
> > 
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >  drivers/gpu/drm/vc4/vc4_hdmi.c | 9 +++++++--
> >  1 file changed, 7 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
> > index d0a9aff7ad43016647493263c00d593296a1e3ad..d83f587ab69f4b8f7d5c37a00777f11da8301bc1 100644
> > --- a/drivers/gpu/drm/vc4/vc4_hdmi.c
> > +++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
> > @@ -401,13 +401,16 @@ static void vc4_hdmi_handle_hotplug(struct vc4_hdmi *vc4_hdmi,
> >  	 */
> >  
> >  	if (status == connector_status_disconnected) {
> > +		drm_atomic_helper_connector_hdmi_update_edid(connector, NULL);
> >  		cec_phys_addr_invalidate(vc4_hdmi->cec_adap);
> >  		return;
> >  	}
> >  
> >  	drm_edid = drm_edid_read_ddc(connector, vc4_hdmi->ddc);
> >  
> > -	drm_edid_connector_update(connector, drm_edid);
> > +	// TODO: use drm_atomic_helper_connector_hdmi_update() once it gains
> > +	// CEC support
> > +	drm_atomic_helper_connector_hdmi_update_edid(connector, drm_edid);
> 
> So, it's not just about EDID, and I think we shouldn't really focus on
> that either.
> 
> As that patch points out, even if we only consider EDID's, we have
> different path depending on the connector status. It shouldn't be up to
> the drivers to get this right.
> 
> What I had in mind was something like a
> drm_atomic_helper_connector_hdmi_hotplug function that would obviously
> deal with EDID only here, but would expand to CEC, scrambling, etc.
> later on.

I thought about it, after our discussion, but in the end I had to
implement the EDID-specific function, using edid == NULL as
"disconnected" event. The issue is pretty simple: there is no standard
way to get EDID from the connector. The devices can call
drm_edid_read(), drm_edid_read_ddc(connector->ddc) or (especially
embedded bridges) use drm_edid_read_custom().

Of course we can go with the functional way and add the
.read_edid(drm_connector) callback to the HDMI funcs. Then the
drm_atomic_helper_connector_hdmi_hotplug() function can read EDID on its
own.

Also the function that you proposed perfectly fits the HPD notification
callbacks, but which function should be called from the .get_modes()?
The _hdmi_hotplug() doesn't fit there. Do we still end up with both
drm_atomic_helper_connector_hdmi_hotplug() and
drm_atomic_helper_connector_hdmi_update_edid()?

> 
> And would cover both the connected/disconnected cases.
> 
> Maxime



-- 
With best wishes
Dmitry

Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5C75206F06
	for <linux-samsung-soc@vger.kernel.org>; Mon, 16 Dec 2024 17:56:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734371767; cv=none; b=Ll0zXV9tbAddac3bDMAU0GQUdLNYCpD/t3TLHnD34CutA7q7oj0mcfGBg2gZarhs4Mw59vhdhEwGqwrJkNOxbG/fM+JH1CxdKMdkYlNFbihUrMxozxAiymI/+Iz4Qb8dgo4B+5LehM6VzemVpjYRY2jrDSr/h4jZmiQAzT4svcs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734371767; c=relaxed/simple;
	bh=jYOV+rLzJMIa5nPo8Ipdg7/NFKctvzV3MaiyusapoYI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A2Y+2B9zjsA3ZAffd/MBWiODerTLEof7OXPuJKwP+0tGDqMFV7Xx+2JvAe/HRyOcDYCkfepg0hZWpRSlTXem9LQAviUBLDHKuCXwdyATEn09GgRg1I8ZQZ08QqhZ/MmuyqHMwPMvIo1ebYYuN1SubBy05OFmt31vDMHuQJhGDKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lILPgTZ4; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lILPgTZ4"
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5401d3ea5a1so4910229e87.3
        for <linux-samsung-soc@vger.kernel.org>; Mon, 16 Dec 2024 09:56:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734371762; x=1734976562; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qwf0Q6wp6H/pRC8arADlqkyBJYwrH22sNYfvDfmEvNU=;
        b=lILPgTZ4QjwhSdPEN9jDjUg1AwH7SOG4daJE8WEv+WXtM8QgakqabZwD4ZQ1usObj/
         fzVH7IsQbOAtFjvDYMXwFB7dubC4R7TzrE6I80uZqn5vBCEQp+pYnWvRTaT9iWABVTZ2
         Dc0R/H9dXXFcaLsVOM2IW8DhVNN+YpMeVjJ4T8ipTY0zJAadCR5bCpytednqWPLM9n44
         3Oh8ufi7PSgHgzZ4kADQ621s5TgFAl6ReGRJilIq8H67BQfGVzY6yCDjqezyzu5UbRKZ
         o4Kv5zh0DEbmcO1wHbchho6oGMXxgstp1cz9mR7/rgbI31aPh7xUsiFit9+/2sBu4JHm
         bj8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734371762; x=1734976562;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qwf0Q6wp6H/pRC8arADlqkyBJYwrH22sNYfvDfmEvNU=;
        b=ZXVMgGacQCZUkZOQQAYDew+kYttgSnbfS6OziJ07DRSYv48pigl7lqN39MOYXINomD
         ZvvBQVZm5hNIFjRjgFi+eMZWO0qoYnQxDyVjSOwhB34IAsTQhoXmAtowOIU9Ek7Vt57I
         uzl2mvLtIUrueJ4jYn8b2KUJtDkFHZdHC1bl3uXSUcHoNv51Ewy9YRd37kBD9L+cOekq
         n4kY6USgCAmNHPIbM5iGI00DA+5wd+QY+tMJB2xs7Pgcazht8lctPM72SpkDVV4AnSbp
         pyV9arU9A6Wls+HEJzCGfbSiAxBzltRki3zJWie+XjNOVKZpACymc+ehIqVfA/EYHjO2
         5xiQ==
X-Forwarded-Encrypted: i=1; AJvYcCVflhomk3iSPXDFtQTihi/xFOvOx/94wJuRmh/7Egum8yC8YNyOUt8N9/hWGakojcNll7uAA2/bvjk+UQT+cbBZuw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyXpos4BQyGBWnJXwHV+Drh0yviSN0lZCPVgqM6PDHMwb9XzOGy
	+RCDf3jQ7eiOiLgFiGUf7hQhdZep8Xox9JbHkdnv98ebfZPE2wzI40q03kdIQeo=
X-Gm-Gg: ASbGnctm9IrOpDDJ3T9r65PPibQoIcot+ejjzZHGRsUafN4Jlm2l9y4D4lOczGf9IAs
	lwjj34aFGpG/mrB9CyNbrw4KCRCBE/fff5AfZSw0GfDEEGr2fQy20OICly70wrS7Shj8kNNmoHV
	lHXPsRNwuggIlLFbUgzTxtfgolJPtc4+MW/p8oLzp9i7Va3uKYzHrnL4Ul+JAwP68M3Wr0fxTpM
	E0pFVmrgpGcPX6F7+TMsBnscYW/+rqyx2jst/nnjwjmGD9VQOiHBExwjtBWff797LHMdINMhtOS
	iLeqEbwN/Ol/pyC6ptNEhYp0k0xuXPS/c8K1
X-Google-Smtp-Source: AGHT+IG29n5FlljcG2G5r78Pj66GgzI4srZEZjCTKnfT1NsJdZGIbQtNCeGwmhS44dO/GlUjtQdAug==
X-Received: by 2002:a05:6512:280a:b0:540:5b5c:c181 with SMTP id 2adb3069b0e04-5408b800764mr4435678e87.6.1734371761893;
        Mon, 16 Dec 2024 09:56:01 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54120b9f4b8sm949454e87.13.2024.12.16.09.55.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Dec 2024 09:56:00 -0800 (PST)
Date: Mon, 16 Dec 2024 19:55:57 +0200
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
Subject: Re: [PATCH v6 06/10] drm/display/hdmi: implement hotplug functions
Message-ID: <bapkgt2e33bhdmun4efcuaedshyyv7qvjgugu5y53ordw3gigl@n7zbfoga7qo7>
References: <20241206-drm-bridge-hdmi-connector-v6-0-50dc145a9c06@linaro.org>
 <20241206-drm-bridge-hdmi-connector-v6-6-50dc145a9c06@linaro.org>
 <20241216-courageous-mysterious-pelican-5a8d2e@houat>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241216-courageous-mysterious-pelican-5a8d2e@houat>

On Mon, Dec 16, 2024 at 06:20:04PM +0100, Maxime Ripard wrote:
> On Fri, Dec 06, 2024 at 12:16:00PM +0200, Dmitry Baryshkov wrote:
> > The HDMI Connectors need to perform a variety of tasks when the HDMI
> > connector state changes. Such tasks include setting or invalidating CEC
> > address, notifying HDMI codec driver, updating scrambler data, etc.
> > 
> > Implementing such tasks in a driver-specific callbacks is error prone.
> > Start implementing the generic helper function (currently handling only
> > the HDMI Codec framework) to be used by drivers utilizing HDMI Connector
> > framework.
> > 
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >  drivers/gpu/drm/display/drm_hdmi_state_helper.c | 61 +++++++++++++++++++++++++
> >  include/drm/display/drm_hdmi_state_helper.h     |  8 ++++
> >  2 files changed, 69 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/display/drm_hdmi_state_helper.c b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
> > index 80bf2829ba89b5f84fed4fa9eb1d6302e10a4f9e..4cdeb63688b9e48acd8e8ae87a45b6253f7dd12b 100644
> > --- a/drivers/gpu/drm/display/drm_hdmi_state_helper.c
> > +++ b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
> > @@ -769,3 +769,64 @@ drm_atomic_helper_connector_hdmi_clear_audio_infoframe(struct drm_connector *con
> >  	return ret;
> >  }
> >  EXPORT_SYMBOL(drm_atomic_helper_connector_hdmi_clear_audio_infoframe);
> > +
> > +/**
> > + * drm_atomic_helper_connector_hdmi_hotplug_edid - Handle the hotplug event for the HDMI connector passing custom EDID
> > + * @connector: A pointer to the HDMI connector
> > + * @status: Connection status
> > + * @drm_edid: EDID to process
> > + *
> > + * This function should be called as a part of the .detect() / .detect_ctx()
> > + * and .force() callbacks, updating the HDMI-specific connector's data. Most
> > + * drivers should be able to use @drm_atomic_helper_connector_hdmi_hotplug()
> > + * instead.
> > + *
> > + * Returns:
> > + * Zero on success, error code on failure.
> > + */
> > +int
> > +drm_atomic_helper_connector_hdmi_hotplug_edid(struct drm_connector *connector,
> > +					      enum drm_connector_status status,
> > +					      const struct drm_edid *drm_edid)
> > +{
> > +	if (status == connector_status_disconnected) {
> > +		// TODO: also handle CEC and scramber, HDMI sink disconnected.
> > +		drm_connector_hdmi_codec_plugged_notify(connector, false);
> > +	}
> > +
> > +	drm_edid_connector_update(connector, drm_edid);
> > +
> > +	if (status == connector_status_connected) {
> > +		// TODO: also handle CEC and scramber, HDMI sink is now connected.
> > +		drm_connector_hdmi_codec_plugged_notify(connector, true);
> > +	}
> > +
> > +	return 0;
> > +}
> > +EXPORT_SYMBOL(drm_atomic_helper_connector_hdmi_hotplug_edid);
> 
> I think we discussed it in a previous version's thread after you sent
> that one, but I'd rather have that helper call an edid retrieval
> function than passing it edids.

Ack, I forgot to add the hook. I'll do that for the next version. I'll
add the .read_edid callback to the HDMI functions.

> 
> Also, EDIDs are mandatory for HDMI, so I'd call the function
> drm_atomic_helper_connector_hdmi_hotplug.

See below.

> 
> > +/**
> > + * drm_atomic_helper_connector_hdmi_hotplug - Handle the hotplug event for the HDMI connector
> > + * @connector: A pointer to the HDMI connector
> > + * @status: Connection status
> > + *
> > + * This function should be called as a part of the .detect() / .detect_ctx()
> > + * and .force() callbacks, updating the HDMI-specific connector's data.
> > + *
> > + * Returns:
> > + * Zero on success, error code on failure.
> > + */
> > +int
> > +drm_atomic_helper_connector_hdmi_hotplug(struct drm_connector *connector,
> > +					 enum drm_connector_status status)
> > +{
> > +	const struct drm_edid *drm_edid;
> > +	int ret;
> > +
> > +	drm_edid = drm_edid_read(connector);
> > +	ret = drm_atomic_helper_connector_hdmi_hotplug_edid(connector, status, drm_edid);
> > +	drm_edid_free(drm_edid);
> 
> Oh. Why do we need the two variants? Or is it to deal with drivers that
> don't set connector->ddc?

Yes. There are enough HDMI bridge drivers that would provide the
callback instead of the DDC bus. Adding callback should solve that.

-- 
With best wishes
Dmitry

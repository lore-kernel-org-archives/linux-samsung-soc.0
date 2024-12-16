Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2486204563
	for <linux-samsung-soc@vger.kernel.org>; Mon, 16 Dec 2024 11:26:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734348396; cv=none; b=X9UM1+8DLHjjiaRe2HcQvf2JGd0hY6ML9KQjtTNJN8unz2b6d8DWHxmYk4U9+itX8Ruim6UIGPUEfKpbdoXsnV7YpwLmuwyRvcpCjJVvNmTVCPVB2qrF0WceAfzAWiLF08x8tHEHRgeLerceOdf9m/ypvhFF3r/+65P1FMiMwns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734348396; c=relaxed/simple;
	bh=FDCGvgz6+IaikCukN41+aa6UXILjPaDMYojr1vvsyiM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KK/SPMfg+O4ZYY8++5qPD1xpoSAKhEC/5wBbl2Joij8I/8snNaEToD7OqOpZAvro85c3JKW7FWc9t7TewhW3VUzVYJEiOP7gm2NKglZatnLCVVYsCwRj4dDZMPd/P4lHBFxWgqrjwFBwd/wUMpHgPkEomDhkWaam5K8faVgCqGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DanS6eae; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DanS6eae"
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-54026562221so4255474e87.1
        for <linux-samsung-soc@vger.kernel.org>; Mon, 16 Dec 2024 03:26:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734348393; x=1734953193; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YThwe23mDMw58S0YzeDlQzDzb/FEzhlX3ugmbXf8RUY=;
        b=DanS6eaeUoxDU183IknbsXbTPMjstOR9W4RmNQdRjNsN5GxY5VAMNOS9tyZU3jiDZp
         dqkPaBTXPeXzzxLKoFkwuwEr6SasDjQAixujuV22RMRXQfO+fb9SHGpwP9kocHLTsX6/
         OiprFvqiBCn+AH83GmCyB4f+pv/b1TbFUXjXaxpTTIyWCZ2Ne8CiLxLGTphYzS1UAccT
         XZSwh5xOrmd0T6021p+UgMfGrl2mf+y0c1iSVC1Fe751dQ/44JjLfhV/kyH0jW1gklRf
         UeMdEAlTMFF7LwUXNMhJVLV5xUcHpWzPasg5RHn9yK9TfGBNy/9JDCdn2yIjx3geYudh
         BzVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734348393; x=1734953193;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YThwe23mDMw58S0YzeDlQzDzb/FEzhlX3ugmbXf8RUY=;
        b=Z4yNYsq/ZLJ5D2Kyd4BJpBrJFUw4qv3JQOdmPvKrDNmLOpHhPDo9G8XKccZEvjHUjy
         FFDRCCASliWlNe1pfv7kaa/sDW5rTb7ioh/+8V+mO1QwTe3VfEhf5saZGMmLFLYywzpV
         Zm9N9D8TBaU6PrtWTohcbX8EA1fd1v+k27++p1LZpNlzvY92O0qv247ciW63p+C/NBx8
         PQtzp19xkc32XlDWIU6h/Uh7zMmR7YYjUGChdDa8lnGGLkZdwrlMTQ91CsigmLkSzFFU
         FaL1scdP8Yop14KzmgLk4iOf0G1xkUU426Y0y0VEREzLcu5119LEiiWApunBtYqhHmcc
         7zqA==
X-Forwarded-Encrypted: i=1; AJvYcCUIoCyefH1f9gRNwDacwBN9xPtK78L59P3lxZiY+vDM2WCIN2ayKWrmlam3gO9zyQrIA7VPE80sWubAFf3IzdczjA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzTbFVO/EBRRi9uVyNPZJaYAWBl6eA56MOpHC3al0l69hCoGMEM
	xn6Wn80viK8zCeNkKkaapqUgdYmmyeGBUqAyuJ4MSkctLaClDe5/2w6g+Ocx4YY=
X-Gm-Gg: ASbGnctZN+Ia6nxluMyRm02WFTGW7xfMvHLmZVDrUpAGWX9TiXDVfVeqevyTXKyRlHJ
	nIQOFirWZrPG4Oppn91+VONVmrudq+xK9A3suMuyvos6+X5XjdZvcvoj8iJzA8u4C4L+vYhx/pO
	/jHxdcs8bFT1Wm0yF4JqNAhUf2ZvtlKVPP3zH+uDxU765OGx+8XBBHaCjc7c/TR+JVqPyd84NDJ
	pXNbekqJS1S01iTXGclmp0e8kEt2JVspfx9OF3INCRhXA/MJvzL3aIHaxgCc5ZY9QkQmxmNhhpl
	MxqPg3ns/OvfRgbhMMb8Dxr+xF1QalFGk01z
X-Google-Smtp-Source: AGHT+IEC5KXhrrXGsT1eFAB/sps15bbUKYwoGeuTdcyybvAtpoczQRZn+Xw2w8c/HQ9Uc8g8NeiFrQ==
X-Received: by 2002:a05:6512:318b:b0:540:2a6e:3731 with SMTP id 2adb3069b0e04-5408b8f4a05mr4156948e87.5.1734348392766;
        Mon, 16 Dec 2024 03:26:32 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54120ba9e02sm811914e87.100.2024.12.16.03.26.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Dec 2024 03:26:32 -0800 (PST)
Date: Mon, 16 Dec 2024 13:26:29 +0200
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
Subject: Re: [PATCH v6 09/10] drm/vc4: hdmi: stop rereading EDID in
 get_modes()
Message-ID: <smaa7geowgyuvqvn6sph63ls5ublpt46zqdvt4yvqcg64scz3q@te52ty7x2soz>
References: <20241206-drm-bridge-hdmi-connector-v6-0-50dc145a9c06@linaro.org>
 <20241206-drm-bridge-hdmi-connector-v6-9-50dc145a9c06@linaro.org>
 <20241206-caped-proficient-rattlesnake-c882f3@houat>
 <73xdxb575n4ncmadffkwqzczoewbadq3forpvqt4vp7zfln2nq@o2wmbbbepwgg>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <73xdxb575n4ncmadffkwqzczoewbadq3forpvqt4vp7zfln2nq@o2wmbbbepwgg>

On Sun, Dec 08, 2024 at 01:06:46PM +0200, Dmitry Baryshkov wrote:
> On Fri, Dec 06, 2024 at 03:34:52PM +0100, Maxime Ripard wrote:
> > Hi,
> > 
> > On Fri, Dec 06, 2024 at 12:16:03PM +0200, Dmitry Baryshkov wrote:
> > > The vc4_hdmi_connector_detect_ctx() via vc4_hdmi_handle_hotplug()
> > > already reads EDID and propagates it to the drm_connector. Stop
> > > rereading EDID as a part of the .get_modes() callback and just update
> > > the list of modes. This matches the behaviour of the i915 driver.
> > > 
> > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > ---
> > >  drivers/gpu/drm/vc4/vc4_hdmi.c | 21 ---------------------
> > >  1 file changed, 21 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
> > > index e5ab42f72f618b90f956482db6c9c8074c1e3bf1..3364ef90968dad3074800f02926300ffceb75c69 100644
> > > --- a/drivers/gpu/drm/vc4/vc4_hdmi.c
> > > +++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
> > > @@ -470,31 +470,10 @@ static int vc4_hdmi_connector_detect_ctx(struct drm_connector *connector,
> > >  
> > >  static int vc4_hdmi_connector_get_modes(struct drm_connector *connector)
> > >  {
> > > -	struct vc4_hdmi *vc4_hdmi = connector_to_vc4_hdmi(connector);
> > >  	struct vc4_dev *vc4 = to_vc4_dev(connector->dev);
> > > -	const struct drm_edid *drm_edid;
> > >  	int ret = 0;
> > >  
> > > -	/*
> > > -	 * NOTE: This function should really take vc4_hdmi->mutex, but doing so
> > > -	 * results in reentrancy issues since cec_s_phys_addr() might call
> > > -	 * .adap_enable, which leads to that funtion being called with our mutex
> > > -	 * held.
> > > -	 *
> > > -	 * Concurrency isn't an issue at the moment since we don't share
> > > -	 * any state with any of the other frameworks so we can ignore
> > > -	 * the lock for now.
> > > -	 */
> > > -
> > > -	drm_edid = drm_edid_read_ddc(connector, vc4_hdmi->ddc);
> > > -	drm_edid_connector_update(connector, drm_edid);
> > > -	cec_s_phys_addr(vc4_hdmi->cec_adap,
> > > -			connector->display_info.source_physical_address, false);
> > > -	if (!drm_edid)
> > > -		return 0;
> > > -
> > >  	ret = drm_edid_connector_add_modes(connector);
> > > -	drm_edid_free(drm_edid);
> > 
> > I don't think that works though, for mostly two reasons:
> > 
> >  1) We're not sure we'll even have an hotplug interrupt if the system
> >     boots with the connector plugged in for example.
> > 
> >  2) afaik, the get_modes ioctl directly calls get_modes too.
> 
> I think both paths use .fill_modes, not get_modes. And fill_modes
> explicitly calls .detect / .detect_ctx. It would be nice if somebody can
> verify the change on the acual hw. But as I wrote, i915 driver does
> exactly the same: the EDID is read / updated in .detect_ctx(), while
> .get_modes() only performs drm_edid_connector_add_modes().
> Okay, there is one significant difference which we should probably patch
> out: the .force() is also implemented to update EDID in the forced case.
> I should probably do the same for the drivers being handled in this
> patchset.

Maxime, will .force() cover your concerns? I probably fail to see a path
when .get_mode() is called without calling .detect() / .force() first.

-- 
With best wishes
Dmitry

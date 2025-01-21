Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F25101F12EF
	for <linux-samsung-soc@vger.kernel.org>; Tue, 21 Jan 2025 11:21:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737458504; cv=none; b=oVflNm2ZP6sivnpuzf1TRY2KDJtcInDE3EK0ohSR/ihdiWHpXvLFAUh/31cK1AowCcpAf7AtGneT+7GNn25q0sSqr88KvQCceVLvXr6LgrPAWanyIujyDZqSu5g+NmmaRgjJAhcX1fKf4VtKgb3jVbGBPcMmnNY86hhHRTX2HAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737458504; c=relaxed/simple;
	bh=7rBsUDnZ310zkZmpLtMl2wqib1Sf/yRmyr8uhrOxaLM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WePuX3jbiuARiwvk62jmKXBnDzH1khVdSE0PcWLvHijCXmNqgOrCE+MfK39uhIZN7WQZJzWWyGBWn1gOAEu189hZHtqITAwuIQzs4whUBPHiiovpuBlq6AyNurH2kVxl18IqlUFL9ujbVebxyGKQ1ssMHXDJcFlfjFsF+ope1Gg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vxHQmcL7; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vxHQmcL7"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-53e3778bffdso5795751e87.0
        for <linux-samsung-soc@vger.kernel.org>; Tue, 21 Jan 2025 03:21:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737458500; x=1738063300; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Ccl7pK+fGoMwVya6mvoYHjlRDfdrE2si7QnLrLuVzrA=;
        b=vxHQmcL7k4+kcF9DcyGj1gyfA9r+sRZ8wnkg2RUG/jZoI4Ed22oqKXMB4wXYTTU2Jq
         rXWKsD5ey3ZxlThyzhUjMu0e9iWBQ6eipDc7hnaZPVv1awvvOmSzigjFONuqSLRE3jmG
         5+biLO86ga/gWj0lA2BrGgHt4I/QSog885uhFCi02u9YWzPkwPFshpdZvz4Cz5SF2yW5
         3cdX7Uc5jRxQyUZ/OdpS0FQ99MTHZvxZn+Yvh9+vUyCNU6Nkslsa0BsvetCyBiifuiaF
         ofpPIsCjf8RDcJnugQdsnMRpb699OA9J2IorskL7V4bo72fjLuOgBSbFaiudXLwYSXB+
         QC1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737458500; x=1738063300;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ccl7pK+fGoMwVya6mvoYHjlRDfdrE2si7QnLrLuVzrA=;
        b=wNTUZFpQBrcz7v9hWuvLiyACDTPI6OYtDHa6Pe5402eDrd/fE1NC9+2++ENWT82Yhp
         Qgd4XjDnOn+89kjD+6Ehk3TZsYnwCPGxXUaxv1BtBrdf47O7hh0+fqH/c2oIrsea1MpW
         HKYFcZIl6fnY9DRjA2J0jWFMCZLgFgGSw7gwTdJziWE/ezRWZpncyLJ5gj+vOIHHm5iW
         l8L9/lt6h9Aom2hkMPS9YSgLeyFjQFyU86KDbAz1hUMXKv+YO1c5wYGiNRLLYe3DB4cX
         bj3kTmxFVtswQiNMjVbu6ucW0wG64MM+FyR+fi8bii8oZeTdVqdAR9CKWf5Qn3GedWR9
         1ZjQ==
X-Forwarded-Encrypted: i=1; AJvYcCW0m7quf1tcooDw7rFBtNd7TLK2YZw8QAYbKYpWrvQyB88CO51fPb0c6rvRboget5qIp1FM7iSX7Xz6uYWVqZ1WAQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyVteCU+VQAtNVxREb6kihpVr62313vZwMzYk+ApOJhi+bHRFWN
	oKdJHRBWkpyMkRW3viPWTvHAu9g4eyvgZ5RMaPnqVZlUG0ZGqb6wvsV0jKYCDEM=
X-Gm-Gg: ASbGncuQ/RIVP58Uj53Idh1c8K22raG4Orl7DXLomrrgB38ApjfEf+fpwaota2zuTWF
	TkeKAwOimjfW5VfoVt3GoH52BsAsJkCttnNEfWzkKIf/N2+zu5LnKt13oE94y1VOF8SAYQWtqfW
	d0dJfMOV2SAdRgfMKuovdP0vXMBa01gw3qHIPzSsUwmJTfR9L7/CUzS3zi/xYiU7XzUSeFpB5/J
	clx+sLFAt4thXRZt64q2ryN/nhYDLRybH8c3TRGHUMNy3P63OLf8ExOHkuTchVE8WmuNvy9xric
	PSpV1JhF4K+wYWKgF9e+nLdSc+gsQwRQKrgpWVJYg5ppx+D1IA==
X-Google-Smtp-Source: AGHT+IFYzzED8Wa2HZSUyJkmbJmRc7n+A/fvnsoklQLIV99y/1uEpOedpIlkjVzotwOAh8lDtCA/PA==
X-Received: by 2002:a05:651c:b2a:b0:300:7f87:a65 with SMTP id 38308e7fff4ca-3072cb1f9b0mr65240811fa.35.1737458499868;
        Tue, 21 Jan 2025 03:21:39 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3072a51825fsm20633711fa.111.2025.01.21.03.21.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jan 2025 03:21:38 -0800 (PST)
Date: Tue, 21 Jan 2025 13:21:35 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Jani Nikula <jani.nikula@linux.intel.com>, 
	Rodrigo Vivi <rodrigo.vivi@intel.com>, Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
	Tvrtko Ursulin <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>, 
	Danilo Krummrich <dakr@redhat.com>, Harry Wentland <harry.wentland@amd.com>, 
	Leo Li <sunpeng.li@amd.com>, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, 
	Alex Deucher <alexander.deucher@amd.com>, Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>, 
	Xinhui Pan <Xinhui.Pan@amd.com>, Alain Volmat <alain.volmat@foss.st.com>, 
	Raphael Gallais-Pou <rgallaispou@gmail.com>, Liviu Dudau <liviu.dudau@arm.com>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Peter Senna Tschudin <peter.senna@gmail.com>, Ian Ray <ian.ray@ge.com>, 
	Martyn Welch <martyn.welch@collabora.co.uk>, Inki Dae <inki.dae@samsung.com>, 
	Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Stefan Agner <stefan@agner.ch>, Alison Wang <alison.wang@nxp.com>, 
	Patrik Jakobsson <patrik.r.jakobsson@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	Dave Airlie <airlied@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>, 
	Sandy Huang <hjc@rock-chips.com>, Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>, 
	Andy Yan <andy.yan@rock-chips.com>, Chen-Yu Tsai <wens@csie.org>, 
	Samuel Holland <samuel@sholland.org>, Thierry Reding <thierry.reding@gmail.com>, 
	Mikko Perttunen <mperttunen@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>, =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>, 
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, Gurchetan Singh <gurchetansingh@chromium.org>, 
	Chia-I Wu <olvaffe@gmail.com>, Zack Rusin <zack.rusin@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, nouveau@lists.freedesktop.org, 
	amd-gfx@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, imx@lists.linux.dev, linux-arm-msm@vger.kernel.org, 
	freedreno@lists.freedesktop.org, virtualization@lists.linux.dev, 
	spice-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-tegra@vger.kernel.org, Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
	Jani Nikula <jani.nikula@intel.com>, Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: [PATCH v2 0/5] drm/connector: make mode_valid() callback accept
 const mode pointer
Message-ID: <ak4cz6v6rjguh4jgacyu2mcfh5igtb7qwhvbvdcnfjc5hraloi@d7dwxc7v5gbo>
References: <20241214-drm-connector-mode-valid-const-v2-0-4f9498a4c822@linaro.org>
 <173624946815.1500596.321177900833598022.b4-ty@linaro.org>
 <CAMuHMdVwcaY2Fgpf7GYhBrE5B+AEg=v0BH4OjMXgnp=wqjxmKg@mail.gmail.com>
 <CAA8EJpos0HQpr9P4XRkto0Jy+Anf1xEH2xhEU8wtCyUQd+XwMg@mail.gmail.com>
 <CAMuHMdW-9F9aypY_XeU3y=dn3AAxjFrZO+H+=hbMF7nGrTLAQQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMuHMdW-9F9aypY_XeU3y=dn3AAxjFrZO+H+=hbMF7nGrTLAQQ@mail.gmail.com>

On Tue, Jan 21, 2025 at 12:10:25PM +0100, Geert Uytterhoeven wrote:
> Hi Dmitry,
> 
> CC sfr
> 
> On Tue, Jan 21, 2025 at 11:44 AM Dmitry Baryshkov
> <dmitry.baryshkov@linaro.org> wrote:
> > On Tue, 21 Jan 2025 at 11:13, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > > On Tue, Jan 7, 2025 at 12:31 PM Dmitry Baryshkov
> > > <dmitry.baryshkov@linaro.org> wrote:
> > > > On Sat, 14 Dec 2024 15:37:04 +0200, Dmitry Baryshkov wrote:
> > > > > While working on the generic mode_valid() implementation for the HDMI
> > > > > Connector framework I noticed that unlike other DRM objects
> > > > > drm_connector accepts non-const pointer to struct drm_display_mode,
> > > > > while obviously mode_valid() isn't expected to modify the argument.
> > > > >
> > > > > Mass-change the DRM framework code to pass const argument to that
> > > > > callback.
> > > > >
> > > > > [...]
> > > >
> > > > Applied to drm-misc-next, thanks!
> > > >
> > > > [1/5] drm/encoder_slave: make mode_valid accept const struct drm_display_mode
> > > >       commit: 7a5cd45fab0a2671aa4ea6d8fb80cea268387176
> > > > [2/5] drm/amdgpu: don't change mode in amdgpu_dm_connector_mode_valid()
> > > >       commit: b255ce4388e09f14311e7912d0ccd45a14a08d66
> > > > [3/5] drm/sti: hda: pass const struct drm_display_mode* to hda_get_mode_idx()
> > > >       commit: 5f011b442006ccb29044263df10843de80fc0b14
> > > > [4/5] drm/connector: make mode_valid_ctx take a const struct drm_display_mode
> > > >       commit: 66df9debcb29d14802912ed79a9cf9ba721b51a4
> > > > [5/5] drm/connector: make mode_valid take a const struct drm_display_mode
> > > >       commit: 26d6fd81916e62d2b0568d9756e5f9c33f0f9b7a
> > >
> > > I cannot find these in drm-misc or drm-next, but they are in drm-tip?
> >
> > These are in drm-misc/drm-misc-next, the commit IDs are a part of the
> > Git history.
> >
> > > The last one due to commit 2bdc721917cf141f ("Merge remote-tracking
> > > branch 'drm-misc/drm-misc-next' into drm-tip").
> > >
> > > What am I missing?
> > > Thanks!
> >
> > It might be some kind of misinteraction between drm-misc-next vs
> > drm-misc-next-fixes vs merge window. Let me recheck dim rebuild-tip.
> 
> I indeed see the commit in
> https://gitlab.freedesktop.org/drm/misc/kernel/-/blob/drm-misc-next/include/drm/drm_modeset_helper_vtables.h?ref_type=heads
> 
> [diving deeper]
> 
> So I missed the change from the for-linux-next to the drm-misc-next
> branch.  Hence I fetched only the former, and was using a stale
> version of the latter.
> 
> Apparently Stephen is also using the old branches for linux-next:
> 
>     drm-misc-fixes git
> https://gitlab.freedesktop.org/drm/misc/kernel.git#for-linux-next-fixes
>     drm-misc git
> https://gitlab.freedesktop.org/drm/misc/kernel.git#for-linux-next
> 
> I believe the latter should be drm-misc-next.
> Should the former be drm-misc-fixes or drm-misc-next-fixes? Or both?

No. Both branches are correct. This is how the drm-misc tree managed
development process: during the merge window (and several preceeding
weeks) the drm-misc-next branch is open for the commits. However those
commits are not targeted the forthcoming -rc1. Thus the for-linux-next
branch is diverted to point to drm-misc-next-fixes. This is all being by
the dim tool.

Respective mode_valid changes were applied too late in the cycle, so
they are not going to land into 6.14-rc1 (and are not a part of the
for-linux-next branch). Once 6.14-rc1 is released and we start working
towards 6.15, for-linux-next will again point to drm-misc-next.

-- 
With best wishes
Dmitry

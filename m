Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com [209.85.219.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30F261D88C3
	for <linux-samsung-soc@vger.kernel.org>; Mon,  6 Jan 2025 09:45:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736156740; cv=none; b=aJB2iLembpCCfQBivOplt00mT/BJgdxWi5jjGZtsdOJ0ZWz9bXkqvo83uQvV8HyQjMIwC/fjFSYHrcbS1eTP3EK8wkuNyc/sw15R9aos65+OK8g/wra1ZemU4u2ZYYcFvw5jUVcbYqvls7JPBchBB8uvuhEyj/54iL9d7W6lkr8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736156740; c=relaxed/simple;
	bh=IZYlUVs7+fKI40GFvfmgAb22nVpN8Q2at4NYNL8nKTk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OJuTmvGkyEuAhWCuYALj1sHFI5NC1+A4lhmmCxu1c4GwT48DFQuqOwB2Mku/TemdqDXCUmzEsSl8xKWCPA/mJ4l4u7lUdWovyh7bY/epLLLgWEQQZsBIsyLtME/fQrvsUQY/keoCjjz8cLY8kgyPYNteK5hrY6fJ4RDcuzYwLUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=srZmjNWl; arc=none smtp.client-ip=209.85.219.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="srZmjNWl"
Received: by mail-yb1-f181.google.com with SMTP id 3f1490d57ef6-e461015fbd4so13515445276.2
        for <linux-samsung-soc@vger.kernel.org>; Mon, 06 Jan 2025 01:45:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736156736; x=1736761536; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=DNzark5qtCDwQ7M0G9ZBrwk42sp8e6A1IdLf0YnVhag=;
        b=srZmjNWli06tECaJhyWDLqqd+z76dZgqOvksX6ohfjyhs1GnRGFuOWj9GHL72gAnxq
         tfxq5JDp1RiukFOcq6tNwk13d4n7mmi7a8WIOLx+fn31uYyZf1PThaWApSbYYxzouIId
         1IMYHSz5QSMCZJQ0tEWWYFV6oJp4bd3QRnt7Np9EhyIWICcSbMDu7z/eJXnAci0MOSy6
         jZenJXWtVIxfW2uymodU69lSVhYi/R4yYVioQaYp9WDMbfP+yt/OoPCOhaKrtmMgHs/m
         xXq/doIKM6Aq19ZQLRCyb9uJoAfy5kHQUzIcqPAYOssHWEOxuLCivSd68NJSFpgwRQ8E
         4Mzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736156736; x=1736761536;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DNzark5qtCDwQ7M0G9ZBrwk42sp8e6A1IdLf0YnVhag=;
        b=WpddYvHAn4V0OrS1cd3QcipYIfhHKt5gMZpzmzg5RFbsyq+OYi+UuDke/47qqT6UbK
         UCl9Aoypma7Y9HjQzZiRnviCBHxyzIvVqG2UUrRC1fyF4flc+ZPldzxSsJPo8NmxVsbJ
         BrV90+h9XlqAjMp4Uc3SRVR6XItyNRWsTEAOZX+sJPP/ouzlO9uvhJSdNGn+igfiI7P+
         YpVRCJXmYABH3XYB8yItBciENGt/kJVaoH6UpxZGit0YdHjr7MNucnUUSahrjLqp6iP0
         wISXb7yL5mjhmLbixl97htUSmxJFFMTIGHkFnnif+zQ4KJjYy1XLOAGnK+gjbFoSf8kc
         X7CA==
X-Forwarded-Encrypted: i=1; AJvYcCWjFE5hgH+d1Fs7TcMu3OI4XiB+tAH2SqlUGBlSwYhRLVqr/t/LO6aAbrY9COieazA23EAchyDmA+iRr5snR8J6iA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6j6SjnT/Z6Z+2nO9GnEaLuBeeAvGsUK4GXGaU/J4gX+zO7ld+
	JmCA5VZYmnoANzJZo6DSK+WxL7jf3AFyH3f66SrUpxkRq+xX+RSC1kl+/hpjyUZMzjF20wo9UUN
	RqlmwP6P3v7nJ2ebAlAnaGFlGewje4k9WaWoF4g==
X-Gm-Gg: ASbGnctK2acid5jo60WRc+HTs0T78l7/CDA5a/DzaX2AXMylP2DL8AfD38oWLedMYoh
	fsK2tH5cdw9v5BeKeF6mrb0TZdEMpY7mRF6sNGdybF6HhOeyVBoeQXVwaJSk2KDh/R7QsrQ==
X-Google-Smtp-Source: AGHT+IF4a956+UIVmRcZnhNjgi8nOMg6IoaI0eIk4X2K6tB7iwrgpwMF+LBupvdnoC+iyKAmLzs7x15lyjySzs2uP7E=
X-Received: by 2002:a05:690c:6d09:b0:6ef:a187:f377 with SMTP id
 00721157ae682-6f3f820e059mr436161257b3.34.1736156736064; Mon, 06 Jan 2025
 01:45:36 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241214-drm-connector-mode-valid-const-v2-0-4f9498a4c822@linaro.org>
 <76ho36jqcraehnsgpjralpye52w7ryshhgizekn4qqfsikiojd@3yyorbvjkc7b> <20250106-passionate-lorikeet-of-apotheosis-c62ff1@houat>
In-Reply-To: <20250106-passionate-lorikeet-of-apotheosis-c62ff1@houat>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 6 Jan 2025 11:45:26 +0200
Message-ID: <CAA8EJprwNFVV-1pr64_es6XbmOSYtTUYUUK3eOf7LFKBotbrQA@mail.gmail.com>
Subject: Re: [PATCH v2 0/5] drm/connector: make mode_valid() callback accept
 const mode pointer
To: Maxime Ripard <mripard@kernel.org>
Cc: Jani Nikula <jani.nikula@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, 
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>, 
	Danilo Krummrich <dakr@redhat.com>, Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>, 
	Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, Alex Deucher <alexander.deucher@amd.com>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
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
	Dave Airlie <airlied@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>, Sandy Huang <hjc@rock-chips.com>, 
	=?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
	Andy Yan <andy.yan@rock-chips.com>, Chen-Yu Tsai <wens@csie.org>, 
	Samuel Holland <samuel@sholland.org>, Thierry Reding <thierry.reding@gmail.com>, 
	Mikko Perttunen <mperttunen@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>, =?UTF-8?B?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>, 
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, Gurchetan Singh <gurchetansingh@chromium.org>, 
	Chia-I Wu <olvaffe@gmail.com>, Zack Rusin <zack.rusin@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, intel-gfx@lists.freedesktop.org, 
	intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, nouveau@lists.freedesktop.org, 
	amd-gfx@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, 
	virtualization@lists.linux.dev, spice-devel@lists.freedesktop.org, 
	linux-rockchip@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-tegra@vger.kernel.org, 
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
	Jani Nikula <jani.nikula@intel.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, 6 Jan 2025 at 10:55, Maxime Ripard <mripard@kernel.org> wrote:
>
> On Mon, Jan 06, 2025 at 12:47:07AM +0200, Dmitry Baryshkov wrote:
> > On Sat, Dec 14, 2024 at 03:37:04PM +0200, Dmitry Baryshkov wrote:
> > > While working on the generic mode_valid() implementation for the HDMI
> > > Connector framework I noticed that unlike other DRM objects
> > > drm_connector accepts non-const pointer to struct drm_display_mode,
> > > while obviously mode_valid() isn't expected to modify the argument.
> > >
> > > Mass-change the DRM framework code to pass const argument to that
> > > callback.
> > >
> > > The series has been compile-tested with defconfig for x86-64, arm and
> > > arm64.
> > >
> > > Note: yes, I understand that this change might be hard to review and
> > > merge. The only viable option that I foresee is to add new callback,
> > > having the const argument and migrate drivers into using it one by one.
> >
> > Colleagues, I'd like to graciously ping regarding this series. Should it
> > be merged as is (possibly requiring more R-B's)? Or should I rework it
> > adding something like .mode_valid_new() callback which takes const
> > argument?
>
> I think your patch is fine, and you can add my
>
> Reviewed-by: Maxime Ripard <mripard@kernel.org>
>
> We seem to lack an Acked-by for amdgpu though?

Yes. I think the AMD is the only one missing


-- 
With best wishes
Dmitry

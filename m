Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85E7013B2AF
	for <linux-samsung-soc@vger.kernel.org>; Mon, 16 Dec 2024 16:08:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734365330; cv=none; b=T21hdNVFR6sz6FCpJz50GDPk7rlYHxezMymhS7MT2OAlhNVRSealw/m/NNaiIFyFg8O1Ypp6kOw9chi/3wc3x0s9hfJBK3FP0V2KIeSJN0KRFYgzCXC3xmakT8PrBCb6+tZRgV0i41/La+0CrfugtKby40WMchrzYkfUA+o5jHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734365330; c=relaxed/simple;
	bh=s+2OGGOrTtT30i+ux35pZSdZiaLOWCeSP60gsYuHY1U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SoMMkepxJ/NXIUBgaeWWM1A6h9NG4GTvza9vuDmVffa5oRzhyG0lry+KCBT7XoMywaGGKqVbXUl8bf212Fdc6f2bhHzBBFy5DqsjjLu88aXXMCfrKXHivVvtV1tvoJmDb7FY26TS63jvOoa2cIYwC5x/egNXAa7sq4r+Vkv/HoA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UevO/zo0; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UevO/zo0"
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-300392cc4caso51088071fa.3
        for <linux-samsung-soc@vger.kernel.org>; Mon, 16 Dec 2024 08:08:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734365327; x=1734970127; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gimIjr0V+IvVPSAkV2M5qKEwFz/7JaI3Yve9R66BZE0=;
        b=UevO/zo0a9RXdWeSRieUVF25/c8zpy/ZATcYtVxQyd8Q2x+cLXOytmpTAEJM8l4B5A
         JFIy4ZAt7DqIL/jFc6g8d9HyznK3Sfc/eufZqu0P037W05jmBqn5BbMQ33NqgJoujYhQ
         1nHP+ZDUHznY9tr+rvmNWei3TeHAZYAS4BFH9DBJ9lnBxdIeFz/L6IdHgfhaaFhr6zZf
         aaw4IdHf35ykz6JkRLy4wewOP2ouhBJeQnOvD+2AK0FJVfPBqElmp0jFOucRgxEfiZp2
         CgUKtFAwa0WRqnOQV5HgLPc2iKVYWlJjrnQ+0kVQSRdwZJXsb8i2kuyxluQWgkMWyzma
         EnJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734365327; x=1734970127;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gimIjr0V+IvVPSAkV2M5qKEwFz/7JaI3Yve9R66BZE0=;
        b=j/+yItr1ekdzHBIsq41HY4OmKv7RSqjPSMnfUNfXjHnui/O4lWbzt6MkMyxMlm5fsg
         7LlOrMLJEnl/vtMMGKNcRbkdQ0YG+Ce+2weqjEoapz0vhulAH+O+59FfwOE5R1jy352E
         /6kQAgTJGicNPwnFVBBOnTWz9E+w+ALevMdol5smKKRN6/xyzkYf8tYKo/5OlQCoes76
         bCHPkKx3H83dai8tLeX1A6Yi/yIvDAqOXSSqLHu1DUdC+nk2YxUlgZFn/2pqKaqRHu7Y
         UTK2z98RojpKVdDeqFABEi0N+OjnNohTY2QjNFg0TZ14vFz2wQQxNO+eUHJMCQ+Al5EC
         2JmA==
X-Forwarded-Encrypted: i=1; AJvYcCUtl97FU6r9Gewne9ZTjFDrZjNwca1TMh+u7VyZU6yHO9vP9Y06ks/SKyvw6JTGlkaOz4+C8hYUPqQgwjZOlMONUw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz82GfMpzfkGrHNdyW1uYVGvjme4HSCRas3HW+q70rvsaPDrUmx
	i7PAYjlczPIAxl+bCeEd73mx6KfYP3tDD15sm34r2ixg/nGnZQ/Z9Oed9h07+Rk=
X-Gm-Gg: ASbGnctQCLXrQyY/8b+vUi7ttRW+/DaQSV5+wg8ZT8SH6AqJ7VK0NCqaAYZ5DC8kDxv
	mk008z+vmoUW0LKagwRl9eolWGR3qGZHPOcfiGQCcVR+HHxZNDwRDMKx/nepETFGAKMK8Xcp1VX
	GTUkvjcqG3Q8fVpm4rhC6rzA43QdR1zX0Nkcju5naWF85ddBDVQD7WWCD6udTLlu/qkXyVT+ZCQ
	eeO3DabGu/7DCkbJ7WQqDs49hzd/Z77L5jMg89jGUg5cZv363vMAbGEhCRVGXvmwFMWPr1A3b41
	pbzozhMlGJXpK1kq72RhjvAn
X-Google-Smtp-Source: AGHT+IEyHnHgkF8cGHfAxniJoLZXJ011DOlAgQIhnT5vzkhPcJthnAGY9LbeypdGeJjm5mrh2qegoQ==
X-Received: by 2002:a2e:a591:0:b0:302:17e7:e17e with SMTP id 38308e7fff4ca-302543460f4mr50630091fa.0.1734365326654;
        Mon, 16 Dec 2024 08:08:46 -0800 (PST)
Received: from eriador.lan (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30344175ad0sm9665241fa.84.2024.12.16.08.08.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Dec 2024 08:08:44 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Harry Wentland <harry.wentland@amd.com>,
	Leo Li <sunpeng.li@amd.com>,
	Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
	Alex Deucher <alexander.deucher@amd.com>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	Xinhui Pan <Xinhui.Pan@amd.com>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Phong LE <ple@baylibre.com>,
	Inki Dae <inki.dae@samsung.com>,
	Seung-Woo Kim <sw0312.kim@samsung.com>,
	Kyungmin Park <kyungmin.park@samsung.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Jani Nikula <jani.nikula@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
	Tvrtko Ursulin <tursulin@ursulin.net>,
	Rob Clark <robdclark@gmail.com>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	Alain Volmat <alain.volmat@foss.st.com>,
	Raphael Gallais-Pou <rgallaispou@gmail.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	=?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>,
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	amd-gfx@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org,
	linux-arm-msm@vger.kernel.org,
	freedreno@lists.freedesktop.org,
	Jani Nikula <jani.nikula@intel.com>
Subject: Re: [PATCH v2 00/10] drm/connector: add eld_mutex to protect connector->eld
Date: Mon, 16 Dec 2024 18:08:41 +0200
Message-ID: <173436531753.3257291.12458012077695445848.b4-ty@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241206-drm-connector-eld-mutex-v2-0-c9bce1ee8bea@linaro.org>
References: <20241206-drm-connector-eld-mutex-v2-0-c9bce1ee8bea@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Fri, 06 Dec 2024 11:43:03 +0200, Dmitry Baryshkov wrote:
> The connector->eld is accessed by the .get_eld() callback. This access
> can collide with the drm_edid_to_eld() updating the data at the same
> time. Add drm_connector.eld_mutex to protect the data from concurrenct
> access.
> 
> The individual drivers were just compile tested. I propose to merge the
> drm_connector and bridge drivers through drm-misc, allowing other
> maintainers either to ack merging through drm-misc or merging the
> drm-misc into their tree and then picking up correcponding patch.
> 
> [...]

Applied to drm-misc-next, thanks!

[01/10] drm/connector: add mutex to protect ELD from concurrent access
        commit: df7c8e3dde37a9d81c0613285b43600f3cc70f34
[02/10] drm/bridge: anx7625: use eld_mutex to protect access to connector->eld
        commit: e72bf423a60afd744d13e40ab2194044a3af5217
[03/10] drm/bridge: ite-it66121: use eld_mutex to protect access to connector->eld
        commit: 39ead6e02ea7d19b421e9d42299d4293fed3064e
[04/10] drm/amd/display: use eld_mutex to protect access to connector->eld
        commit: 819bee01eea06282d7bda17d46caf29cae4f6d84
[05/10] drm/exynos: hdmi: use eld_mutex to protect access to connector->eld
        commit: 5e8436d334ed7f6785416447c50b42077c6503e0
[06/10] drm/i915/audio: use eld_mutex to protect access to connector->eld
        commit: 5db44dd1528625c73a31542df2a68972327c9897
[07/10] drm/msm/dp: use eld_mutex to protect access to connector->eld
        commit: 9aad030dc64f6994dc5de7bb81ceca55dbc555c3
[08/10] drm/radeon: use eld_mutex to protect access to connector->eld
        commit: b54c14f82428c8a602392d4cae1958a71a578132
[09/10] drm/sti: hdmi: use eld_mutex to protect access to connector->eld
        commit: e99c0b517bcd53cf61f998a3c4291333401cb391
[10/10] drm/vc4: hdmi: use eld_mutex to protect access to connector->eld
        commit: 81a9a93b169a273ccc4a9a1ee56f17e9981d3f98

Best regards,
-- 
With best wishes
Dmitry


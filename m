Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0338D18A6DE;
	Fri, 22 Nov 2024 11:23:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732274595; cv=none; b=YYHzgFTSscK2V27f3vzcSwKE6rHdxbCA5+u3P+sMYgwX7nTUvyLAhwf1Sry1OLF27s1BOG9hZwWnsQH+9LXMWo7JIPnYsLZ+6B+Jsvq+qaJCvpbcl2FbHlj60xIZeFcChRlEk/u5n8NCOdBrErSbO8AJTzQYw3+hEq5pDt6FGIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732274595; c=relaxed/simple;
	bh=GJHZMDI2iJk8tkr/3YVQpA8tfSP7IWp9w/OqAk1Hxik=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=AkpgYisXOwJs9q3+gKWFcYzTtHs6h+j1dCIdKNzDQsce5PJpS9o+5+oklg9/AYtEXWnPX+xJNt0L2jkEH875zSZskV9QRrtpQVieWnmkyxlxe7aYUqPmqmmx7fPiwiOQj2EwlAqcuNvc8vdfVAKUv+cqGeprJXqiEgDpykh9jrU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JqMiHbYv; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JqMiHbYv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732274593; x=1763810593;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=GJHZMDI2iJk8tkr/3YVQpA8tfSP7IWp9w/OqAk1Hxik=;
  b=JqMiHbYv+OhdKmtoElOtvYiJ8wLweL/GzQ2Lq7jf+IUqRUOYOwvusek6
   UPz1AVSnygZa4gTIKsRwCOazVwskuVWhiOFKCW+7ytUrAprxPkfJKTExw
   FweRmZoL5tKnP9toxq/jr9xBlqDDox/h8dN0vSHv3QUfrnsBzv9gKXLxg
   RAYwzLf7N759TAJh+/CBcQHNiWcG3DzPUY8EngvJWezonE+A8JdsD3gVe
   aQHkvj41we4Y2UcVRCa0C+wYeYXu3L74mXSlBmBrDpnuex8egMj+z4ZRz
   U7CS44mwho6WTapzFcav96nZ42mKqZQFlOaNCuG2y6QfK01EV317v9R9b
   A==;
X-CSE-ConnectionGUID: 8pddK4YQQyOkO6Bdcl3W3w==
X-CSE-MsgGUID: TDOQ2RsURMSFFAM04OI3bA==
X-IronPort-AV: E=McAfee;i="6700,10204,11263"; a="43074369"
X-IronPort-AV: E=Sophos;i="6.12,175,1728975600"; 
   d="scan'208";a="43074369"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2024 03:23:12 -0800
X-CSE-ConnectionGUID: 6Krw7KkLR6GVn5UaKuPNZg==
X-CSE-MsgGUID: jti2QNpMQ/SNkFZUHXuDdg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,175,1728975600"; 
   d="scan'208";a="90532328"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO localhost) ([10.245.246.157])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2024 03:23:00 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Andrzej Hajda
 <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Laurent Pinchart
 <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Jaroslav Kysela <perex@perex.cz>, Takashi
 Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown
 <broonie@kernel.org>, Phong LE <ple@baylibre.com>, Inki Dae
 <inki.dae@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin
 Park <kyungmin.park@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>,
 Alim Akhtar <alim.akhtar@samsung.com>, Russell King
 <linux@armlinux.org.uk>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp
 Zabel <p.zabel@pengutronix.de>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Sandy Huang <hjc@rock-chips.com>, Heiko =?utf-8?Q?St=C3=BCbner?=
 <heiko@sntech.de>, Andy
 Yan <andy.yan@rock-chips.com>, Alain Volmat <alain.volmat@foss.st.com>,
 Raphael Gallais-Pou <rgallaispou@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v4 3/7] drm/connector: implement generic HDMI codec helpers
In-Reply-To: <20241122-drm-bridge-hdmi-connector-v4-3-b4d69d6e3bd9@linaro.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20241122-drm-bridge-hdmi-connector-v4-0-b4d69d6e3bd9@linaro.org>
 <20241122-drm-bridge-hdmi-connector-v4-3-b4d69d6e3bd9@linaro.org>
Date: Fri, 22 Nov 2024 13:22:53 +0200
Message-ID: <87ed33zf5e.fsf@intel.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Fri, 22 Nov 2024, Dmitry Baryshkov <dmitry.baryshkov@linaro.org> wrote:
> diff --git a/drivers/gpu/drm/drm_internal.h b/drivers/gpu/drm/drm_internal.h
> index b2b6a8e49dda46f1cb3b048ef7b28356dd3aaa4e..8ed58e482fac4662b659276e8bc17690e1fdb9b7 100644
> --- a/drivers/gpu/drm/drm_internal.h
> +++ b/drivers/gpu/drm/drm_internal.h
> @@ -280,4 +280,9 @@ void drm_framebuffer_print_info(struct drm_printer *p, unsigned int indent,
>  				const struct drm_framebuffer *fb);
>  void drm_framebuffer_debugfs_init(struct drm_device *dev);
>  
> +/* drm_connector_hdmi_codec.c */
> +
> +int drm_connector_hdmi_codec_init(struct drm_connector *connector);
> +void drm_connector_hdmi_codec_cleanup(struct drm_connector *connector);
> +
>  #endif /* __DRM_INTERNAL_H__ */

Better fit in drm_crtc_internal.h or drm_crtc_helper_internal.h?

Maybe we could use an internal header inside display/. Or just 1:1
drm_foo_internal.h for every drm_foo.c to keep things simple and have
fewer interdependencies.

BR,
Jani.

-- 
Jani Nikula, Intel

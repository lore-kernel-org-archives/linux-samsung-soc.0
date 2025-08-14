Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com [210.118.77.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E6AF1BE871
	for <linux-samsung-soc@vger.kernel.org>; Thu, 14 Aug 2025 14:33:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.118.77.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755182025; cv=none; b=mGEVOE1bPzPXdTabLaiIv98alcY8GvQlt0RGuNwkmO6pCH3XHAofV1aD3inMaBLlS4Q1H4wkgwWA2CpIRCI4mAsoJnyi92bg8hGSO8zs4hMIigSaMD7DT+xsW+Wr3pQ1XAB+lIEXQXgEamPYWx3P5hhP1MnjPt/uWtO2k+adIYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755182025; c=relaxed/simple;
	bh=3HRyi/pPqiXt+55im0ZeDQ/EKS5tO/F9qNKqrYGaFPw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:From:In-Reply-To:
	 Content-Type:References; b=QjKoxL5aS7ZUgtIBgUz9XrKT8hSO5H8c8IJKCz76t6E+eD0WL57ZtJkSFiLZLMqh6X5aG1C168GNJXNvW53KSKmgt9qXQp9qZ0dKt+bezuhRRdQWl+wwhyKS+ss00aUpwqjQ/WInzz8HYOUFB+h20pksFN9hwA7j4RAZnQ8jKQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=e7jfXMEt; arc=none smtp.client-ip=210.118.77.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="e7jfXMEt"
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20250814143341euoutp02ae86c6899ca0990ebd29d20e5eb72b63~bqL-N9WCI0705707057euoutp02J
	for <linux-samsung-soc@vger.kernel.org>; Thu, 14 Aug 2025 14:33:41 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20250814143341euoutp02ae86c6899ca0990ebd29d20e5eb72b63~bqL-N9WCI0705707057euoutp02J
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1755182021;
	bh=HYTbEJeXrofpbs+IrmDrCBkyO0qBISpuRD07yukoC3M=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=e7jfXMEtbajFgUjwRBhcTLRIVblrZOpnEbsCSf3WAKB1weUW7mUHDy9TxhLX2WjL+
	 kHFZv4Xci0Ot/45YURj7O/2bNOx4+5EINW25i7mU557c2szi1xkvgufLUGo2E3ntEz
	 34/Z2FghVovoMJr9w84HVH3KRqE89Cp0FhfBmgUc=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20250814143340eucas1p24ef13c4a8a272a5830bc0adbbc8206a2~bqL_iNFfu0056100561eucas1p2Y;
	Thu, 14 Aug 2025 14:33:40 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250814143338eusmtip29e7b2dc498b358fdadaba0c0c10331ce~bqL7__0l03070130701eusmtip20;
	Thu, 14 Aug 2025 14:33:37 +0000 (GMT)
Message-ID: <a3a2f8be-2c3c-49e7-b27a-72364ea48b06@samsung.com>
Date: Thu, 14 Aug 2025 16:33:36 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Subject: Re: [PATCH v4 00/13] Apply drm_bridge_connector and panel_bridge
 helper for the Analogix DP driver
To: Damon Ding <damon.ding@rock-chips.com>, andrzej.hajda@intel.com,
	neil.armstrong@linaro.org, rfoss@kernel.org
Cc: Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
	jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
	mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
	jingoohan1@gmail.com, inki.dae@samsung.com, sw0312.kim@samsung.com,
	kyungmin.park@samsung.com, krzk@kernel.org, alim.akhtar@samsung.com,
	hjc@rock-chips.com, heiko@sntech.de, andy.yan@rock-chips.com,
	dmitry.baryshkov@oss.qualcomm.com, l.stach@pengutronix.de,
	dianders@chromium.org, dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-rockchip@lists.infradead.org
Content-Language: en-US
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <20250814104753.195255-1-damon.ding@rock-chips.com>
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250814143340eucas1p24ef13c4a8a272a5830bc0adbbc8206a2
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20250814104818eucas1p2c5029f6d5997f4fafd6370f9e7fb2264
X-EPHeader: CA
X-CMS-RootMailID: 20250814104818eucas1p2c5029f6d5997f4fafd6370f9e7fb2264
References: <CGME20250814104818eucas1p2c5029f6d5997f4fafd6370f9e7fb2264@eucas1p2.samsung.com>
	<20250814104753.195255-1-damon.ding@rock-chips.com>

On 14.08.2025 12:47, Damon Ding wrote:
> PATCH 1 is a small format optimization for struct analogid_dp_device.
> PATCH 2 is to perform mode setting in &drm_bridge_funcs.atomic_enable.
> PATCH 3-6 are preparations for apply drm_bridge_connector helper.
> PATCH 7 is to apply the drm_bridge_connector helper.
> PATCH 8-10 are to move the panel/bridge parsing to the Analogix side.
> PATCH 11-12 are preparations for apply panel_bridge helper.
> PATCH 13 is to apply the panel_bridge helper.

This series lacks 'select DRM_BRIDGE_CONNECTOR' in ExynosDP's Kconfig, 
so it causes build break:

drivers/gpu/drm/exynos/exynos_dp.c:177: undefined reference to 
`drm_bridge_connector_init'
make[2]: *** [scripts/Makefile.vmlinux:91: vmlinux] Error 1

After adding this dependency, the Exynos DP driver stops working. On 
Samsung Snow Chromebook I observed following issue:

[    4.534220] exynos-dp 145b0000.dp-controller: failed to attach 
following panel or bridge (-16)
[    4.543428] exynos-drm exynos-drm: failed to bind 
145b0000.dp-controller (ops exynos_dp_ops): -16
[    4.551775] exynos-drm exynos-drm: adev bind failed: -16
[    4.556559] exynos-dp 145b0000.dp-controller: probe with driver 
exynos-dp failed with error -16

I will investigate details later in the evening.

> Damon Ding (13):
>    drm/bridge: analogix_dp: Formalize the struct analogix_dp_device
>    drm/bridge: analogix_dp: Move &drm_bridge_funcs.mode_set to
>      &drm_bridge_funcs.atomic_enable
>    drm/bridge: analogix_dp: Add &analogix_dp_plat_data.next_bridge
>    drm/exynos: exynos_dp: Remove &exynos_dp_device.ptn_bridge
>    drm/bridge: exynos_dp: Remove unused &exynos_dp_device.connector
>    drm/bridge: analogix_dp: Remove redundant
>      &analogix_dp_plat_data.skip_connector
>    drm/bridge: analogix_dp: Apply drm_bridge_connector helper
>    drm/bridge: analogix_dp: Add new API analogix_dp_finish_probe()
>    drm/rockchip: analogix_dp: Apply analogix_dp_finish_probe()
>    drm/exynos: exynos_dp: Apply analogix_dp_finish_probe()
>    drm/bridge: analogix_dp: Remove panel disabling and enabling in
>      analogix_dp_set_bridge()
>    drm/bridge: analogix_dp: Remove bridge disabing and panel unpreparing
>      in analogix_dp_unbind()
>    drm/bridge: analogix_dp: Apply panel_bridge helper
>
>   .../drm/bridge/analogix/analogix_dp_core.c    | 384 ++++++++++--------
>   .../drm/bridge/analogix/analogix_dp_core.h    |   5 +-
>   drivers/gpu/drm/exynos/exynos_dp.c            |  48 +--
>   .../gpu/drm/rockchip/analogix_dp-rockchip.c   |  49 +--
>   include/drm/bridge/analogix_dp.h              |   7 +-
>   5 files changed, 248 insertions(+), 245 deletions(-)
>
> ---
>
> Changes in v2:
> - Update Exynos DP driver synchronously.
> - Move the panel/bridge parsing to the Analogix side.
>
> Changes in v3:
> - Rebase for the existing devm_drm_bridge_alloc() applying commit.
> - Fix the typographical error of panel/bridge check in exynos_dp_bind().
> - Squash all commits related to skip_connector deletion in both Exynos and
>    Analogix code into one.
> - Apply panel_bridge helper to make the codes more concise.
> - Fix the handing of bridge in analogix_dp_bridge_get_modes().
> - Remove unnecessary parameter struct drm_connector* for callback
>    &analogix_dp_plat_data.attach().
> - In order to decouple the connector driver and the bridge driver, move
>    the bridge connector initilization to the Rockchip and Exynos sides.
>
> Changes in v4:
> - Rebase for the applied &drm_bridge_funcs.detect() modification commit.
> - Rename analogix_dp_find_panel_or_bridge() to analogix_dp_finish_probe().
> - Drop the drmm_encoder_init() modification commit.
> - Rename the &analogix_dp_plat_data.bridge to
>    &analogix_dp_plat_data.next_bridge.
>
Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland


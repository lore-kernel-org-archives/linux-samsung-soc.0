Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com [210.118.77.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A7248479
	for <linux-samsung-soc@vger.kernel.org>; Wed,  9 Jul 2025 07:22:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.118.77.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752045770; cv=none; b=PupsVxWrRNtOxOBXb2yPcP/GxHUdLD9Alesq9kCjxwLtHrb5p65Up31zaDjniCHNvKln2kFD1VAY54zLx6UcJ7ZZ47DRTWC29A23SF1N14lRHxo1HtW2BauxA8RCHPY7bkFu797tYPvGAcoJp3lZOxOm//feLS7M36goAl7jFTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752045770; c=relaxed/simple;
	bh=AJRk+myXB/Ct0dNapM9Txaj2/oHKv4lFWeN4J4Yd0o4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:From:In-Reply-To:
	 Content-Type:References; b=UKsCefsKAmNZTq2bS1/+PielwYY2pFp5nZY1+vwQNq0Up3nasjGJOd1UEkV2itHaK4Wy2hVk7mQr9VjIqqSIP45XkKEu8xfjoYmxkT5inPJ7LhXoiDhdHAt2LsrobiDRz/CAPuWsiNLKrgzHJ4QL8r2sjeukY99FMewBfdJP0zk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=u+O8eUBe; arc=none smtp.client-ip=210.118.77.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="u+O8eUBe"
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20250709072246euoutp0138f5f20819ee4235322e6d41d399a066~QhFeQBjf61075810758euoutp01X
	for <linux-samsung-soc@vger.kernel.org>; Wed,  9 Jul 2025 07:22:46 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20250709072246euoutp0138f5f20819ee4235322e6d41d399a066~QhFeQBjf61075810758euoutp01X
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1752045766;
	bh=qIHbeL0LG8G55ANYGcdpujwUfCstWXCxAhnRkcjxSxo=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=u+O8eUBejQ0U3lDJSuGDT7O5A/2mhQfjdEr38ZnnSm3Z8lCrRXk6b+nevytM15awo
	 25r7QXh3IEnRHwfD96bFEDkSZQ3ByBaTuHMeYQrrxorgL8Y3By2iGo6nYl2vAjLAM5
	 n0Mdgya150E1spOOOyzKUWIQ1LJBxrPnGh+Tabqg=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20250709072246eucas1p1d64e4c09a83c92497d76cb3efeaf6509~QhFdx5tSY0368803688eucas1p1I;
	Wed,  9 Jul 2025 07:22:46 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250709072243eusmtip29880f65c5964c8e0828e1df05a890579~QhFbeaA3i1291112911eusmtip2E;
	Wed,  9 Jul 2025 07:22:43 +0000 (GMT)
Message-ID: <4eb09ec9-bb7b-4266-8771-26b4819f47db@samsung.com>
Date: Wed, 9 Jul 2025 09:22:43 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 00/12] Apply drm_bridge_connector helper for the
 Analogix DP driver
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
In-Reply-To: <20250709070139.3130635-1-damon.ding@rock-chips.com>
Content-Transfer-Encoding: 7bit
X-CMS-MailID: 20250709072246eucas1p1d64e4c09a83c92497d76cb3efeaf6509
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20250709070241eucas1p1351e2b508cc648d1fafd93640b471e7b
X-EPHeader: CA
X-CMS-RootMailID: 20250709070241eucas1p1351e2b508cc648d1fafd93640b471e7b
References: <CGME20250709070241eucas1p1351e2b508cc648d1fafd93640b471e7b@eucas1p1.samsung.com>
	<20250709070139.3130635-1-damon.ding@rock-chips.com>

On 09.07.2025 09:01, Damon Ding wrote:
> PATCH 1 is a small format optimization for struct analogid_dp_device.
> PATCH 2 is to perform mode setting in &drm_bridge_funcs.atomic_enable.
> PATCH 3-8 are preparations for the movement of the panel/bridge parsing.
> PATCH 9 is to apply a better API for the encoder initialization.
> PATCH 10-11 are to apply the newly added API to find panel or bridge.
> PATCH 12 is to apply the drm_bridge_connector helper.

This patchset conflicts with my recent fix for Analogix DP driver 
applied to drm-misc-fixes:

https://lore.kernel.org/all/20250627165652.580798-1-m.szyprowski@samsung.com/


> Damon Ding (12):
>    drm/bridge: analogix_dp: Formalize the struct analogix_dp_device
>    drm/bridge: analogix_dp: Move &drm_bridge_funcs.mode_set to
>      &drm_bridge_funcs.atomic_enable
>    drm/bridge: analogix_dp: Add &analogix_dp_plat_data.bridge
>    drm/exynos: exynos_dp: Remove &exynos_dp_device.ptn_bridge
>    drm/exynos: exynos_dp: Remove redundant
>      &analogix_dp_plat_data.skip_connector
>    drm/bridge: analogix_dp: Remove redundant
>      &analogix_dp_plat_data.skip_connector
>    drm/bridge: analogix_dp: Add support to find panel or bridge
>    drm/rockchip: analogix_dp: Apply drmm_encoder_init() instead of
>      drm_simple_encoder_init()
>    drm/rockchip: analogix_dp: Apply analogix_dp_find_panel_or_bridge()
>    drm/exynos: exynos_dp: Apply analogix_dp_find_panel_or_bridge()
>    drm/bridge: analogix_dp: Remove unused APIs for AUX bus
>    drm/bridge: analogix_dp: Apply drm_bridge_connector helper
>
>   .../drm/bridge/analogix/analogix_dp_core.c    | 370 ++++++++++--------
>   .../drm/bridge/analogix/analogix_dp_core.h    |   8 +-
>   drivers/gpu/drm/exynos/exynos_dp.c            |  27 +-
>   .../gpu/drm/rockchip/analogix_dp-rockchip.c   |  42 +-
>   include/drm/bridge/analogix_dp.h              |   6 +-
>   5 files changed, 217 insertions(+), 236 deletions(-)
>
Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland


Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com [210.118.77.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF6C91369B4
	for <linux-samsung-soc@vger.kernel.org>; Thu, 14 Aug 2025 21:17:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.118.77.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755206228; cv=none; b=JyE8VARBoXISl1I2DhqfrQn0d8zOn3tfqknHp7z4eYvti2YZvsdFf9eZf1tCaMMzklNBrpbeB8gdWCjUj73WL4hUbT82Bb6rJhfIXZT8/MXK7eYVsz1ukyG6t9G1O2sv2i/fvAw/3FI7wPro1IXKB69oV/qLssjyWVUbDExPPyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755206228; c=relaxed/simple;
	bh=dJxpxpV0+M6urq4guoBXheuD1T5/7twwXGcKBFHyUSg=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:In-Reply-To:
	 Content-Type:References; b=tM6IkqqHhSEXMhBWlMJC24jQaeXTA6lDpJSHU1qAkbwzRt0LE7fgL3kyIMhCpzGsgbHTCrjWtwMIGQy0/mhsh0JFnQwyjkVT/3C6cxD3lrkX5mv0M+yHQzb804pRe3Q5CKmRlAA/Rpcyf4FDRLXCc4EgtDDa/we6eXdyOChqJqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=aif0DMJN; arc=none smtp.client-ip=210.118.77.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="aif0DMJN"
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20250814211704euoutp025ba546f55e48e7ec9569dee47a1e4c65~bvsMUnMbk2309123091euoutp02G
	for <linux-samsung-soc@vger.kernel.org>; Thu, 14 Aug 2025 21:17:04 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20250814211704euoutp025ba546f55e48e7ec9569dee47a1e4c65~bvsMUnMbk2309123091euoutp02G
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1755206224;
	bh=cSEixDLE7xsPsFz7NBwxP7uK65MZGZKF8ZUmhrV1huw=;
	h=Date:Subject:From:To:Cc:In-Reply-To:References:From;
	b=aif0DMJNDGGyAVppTHMk6Yf+pUZiOWU0ER6evHyGiNIC4x5MUx2Uk4BrgOCHG32br
	 v0vqia2Zf89eZKmw901sVlL+ul/Lzc6Y3ALfe83DhoHRPHhcp/U1Zx/XW7ya5K/4HA
	 EyAA1M0g09bPOExExj4/J1IFPfi27LIby9z7wyEY=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20250814211703eucas1p253cb95d05d46ff9f84c21d549f0f0098~bvsK_rr3M1788217882eucas1p2V;
	Thu, 14 Aug 2025 21:17:03 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
	eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20250814211700eusmtip10f43f1f50846dd52289fb97bdd649f18~bvsIPXpgd2313023130eusmtip1d;
	Thu, 14 Aug 2025 21:17:00 +0000 (GMT)
Message-ID: <7cb50c9c-ac41-43b6-8c69-5f184e7c94cf@samsung.com>
Date: Thu, 14 Aug 2025 23:16:59 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Subject: Re: [PATCH v4 00/13] Apply drm_bridge_connector and panel_bridge
 helper for the Analogix DP driver
From: Marek Szyprowski <m.szyprowski@samsung.com>
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
In-Reply-To: <a3a2f8be-2c3c-49e7-b27a-72364ea48b06@samsung.com>
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250814211703eucas1p253cb95d05d46ff9f84c21d549f0f0098
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20250814104818eucas1p2c5029f6d5997f4fafd6370f9e7fb2264
X-EPHeader: CA
X-CMS-RootMailID: 20250814104818eucas1p2c5029f6d5997f4fafd6370f9e7fb2264
References: <CGME20250814104818eucas1p2c5029f6d5997f4fafd6370f9e7fb2264@eucas1p2.samsung.com>
	<20250814104753.195255-1-damon.ding@rock-chips.com>
	<a3a2f8be-2c3c-49e7-b27a-72364ea48b06@samsung.com>


On 14.08.2025 16:33, Marek Szyprowski wrote:
> On 14.08.2025 12:47, Damon Ding wrote:
>> PATCH 1 is a small format optimization for struct analogid_dp_device.
>> PATCH 2 is to perform mode setting in &drm_bridge_funcs.atomic_enable.
>> PATCH 3-6 are preparations for apply drm_bridge_connector helper.
>> PATCH 7 is to apply the drm_bridge_connector helper.
>> PATCH 8-10 are to move the panel/bridge parsing to the Analogix side.
>> PATCH 11-12 are preparations for apply panel_bridge helper.
>> PATCH 13 is to apply the panel_bridge helper.
>
> This series lacks 'select DRM_BRIDGE_CONNECTOR' in ExynosDP's Kconfig, 
> so it causes build break:
>
> drivers/gpu/drm/exynos/exynos_dp.c:177: undefined reference to 
> `drm_bridge_connector_init'
> make[2]: *** [scripts/Makefile.vmlinux:91: vmlinux] Error 1
>
> After adding this dependency, the Exynos DP driver stops working. On 
> Samsung Snow Chromebook I observed following issue:
>
> [    4.534220] exynos-dp 145b0000.dp-controller: failed to attach 
> following panel or bridge (-16)
> [    4.543428] exynos-drm exynos-drm: failed to bind 
> 145b0000.dp-controller (ops exynos_dp_ops): -16
> [    4.551775] exynos-drm exynos-drm: adev bind failed: -16
> [    4.556559] exynos-dp 145b0000.dp-controller: probe with driver 
> exynos-dp failed with error -16
>
> I will investigate details later in the evening.

The failure is caused by trying to add plat_data->next_bridge twice 
(from exynos_dp's .attach callback, and from analogix' ->bind callback).


Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland


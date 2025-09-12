Received: from mail-m1973188.qiye.163.com (mail-m1973188.qiye.163.com [220.197.31.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3ED02472B5;
	Fri, 12 Sep 2025 10:37:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.88
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757673448; cv=none; b=FIqf2eNBmNrTtLo/2wr/SaWtTWvAJC64BJR59ik92UES+RYTzZuO4rPQ82AcWKNNrMcaxwNN45xcIwZOzr9zFPaw5f51cLYEemoalPgHqvWphiyOgEtrlXFWqMDCjRooSUiwlxW+k1E60XxOjm75rBIvsLyhh27I0sZ2sAZD/qs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757673448; c=relaxed/simple;
	bh=nAVD+ulFkoAPr0l7rUCeU6W/Wd0LbM07smm2NvrkvTc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gcC+JbMLiFuElusIoyEb50jc3hC2UlBGR9uFvRefOrXoBBzHPNM13cpJg0YG9nGgZw37SsY6XuNa/atyVXazrP/eEFFHg4BKj+K3Aj6abDIpWjH1Haqq6HhVIlcvoDLYawm5N09xwlEAk6NsBLaDBg+BlboYFDSR6Kxkh6LgGdE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com; spf=pass smtp.mailfrom=rock-chips.com; dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b=KRDGhJca; arc=none smtp.client-ip=220.197.31.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b="KRDGhJca"
Received: from [172.16.12.26] (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 229bf99e7;
	Fri, 12 Sep 2025 18:37:14 +0800 (GMT+08:00)
Message-ID: <1a870c14-e52f-4ab1-80d7-cea8a573592d@rock-chips.com>
Date: Fri, 12 Sep 2025 18:36:54 +0800
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 00/17] Apply drm_bridge_connector and panel_bridge
 helper for the Analogix DP driver
To: Marek Szyprowski <m.szyprowski@samsung.com>, andrzej.hajda@intel.com,
 neil.armstrong@linaro.org, rfoss@kernel.org
Cc: Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 jingoohan1@gmail.com, inki.dae@samsung.com, sw0312.kim@samsung.com,
 kyungmin.park@samsung.com, krzk@kernel.org, alim.akhtar@samsung.com,
 hjc@rock-chips.com, heiko@sntech.de, andy.yan@rock-chips.com,
 dmitry.baryshkov@oss.qualcomm.com, dianders@chromium.org,
 luca.ceresoli@bootlin.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-rockchip@lists.infradead.org
References: <CGME20250912085902eucas1p2b611b4afd6b453c161753f50386a6d01@eucas1p2.samsung.com>
 <20250912085846.7349-1-damon.ding@rock-chips.com>
 <0ff3ba73-18e8-4941-bac6-2efa790c36ab@samsung.com>
Content-Language: en-US
From: Damon Ding <damon.ding@rock-chips.com>
In-Reply-To: <0ff3ba73-18e8-4941-bac6-2efa790c36ab@samsung.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a993d802d4e03a3kunm5b46ebf0a6745e
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQk1JT1ZNGUtCHk9JT0NPSx5WFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSEpKQk
	1VSktLVUpCWQY+
DKIM-Signature: a=rsa-sha256;
	b=KRDGhJcaq71plC6cbAcR6tmLVvGmSaIF26xtcTKXFlsmcuxxuU6izGTDoAWyIeFGcjBJ/LcwfYGyEvFemtEnXGtOfgt7+PImPgG67nj30ykChwHgYr6Es7M2QZmtAcn9ghuAy9FhpB8jEhVeiffTgBCP8OQ7nyaxX7dncYTyn9Y=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=qQQg8rfKPXWWxQ+V8kjtdI95QaKuy+n6AtkZMoL0YJo=;
	h=date:mime-version:subject:message-id:from;

Hi Marek,

On 9/12/2025 5:56 PM, Marek Szyprowski wrote:
> On 12.09.2025 10:58, Damon Ding wrote:
>> PATCH 1 is a small format optimization for struct analogid_dp_device.
>> PATCH 2 is to perform mode setting in &drm_bridge_funcs.atomic_enable.
>> PATCH 3-9 are preparations for apply drm_bridge_connector helper.
>> PATCH 10 is to apply the drm_bridge_connector helper.
>> PATCH 11-14 are to move the panel/bridge parsing to the Analogix side.
>> PATCH 15-16 are preparations for apply panel_bridge helper.
>> PATCH 17 is to apply the panel_bridge helper.
>>
>> Damon Ding (17):
>>     drm/bridge: analogix_dp: Formalize the struct analogix_dp_device
>>     drm/bridge: analogix_dp: Move &drm_bridge_funcs.mode_set to
>>       &drm_bridge_funcs.atomic_enable
>>     drm/bridge: analogix_dp: Add &analogix_dp_plat_data.next_bridge
>>     drm/exynos: exynos_dp: Remove &exynos_dp_device.ptn_bridge
>>     drm/exynos: exynos_dp: Remove unused &exynos_dp_device.connector
>>     drm/bridge: analogix_dp: Remove redundant
>>       &analogix_dp_plat_data.skip_connector
>>     drm/exynos: exynos_dp: Add legacy bridge to parse the display-timings
>>       node
>>     drm/bridge: analogix_dp: Move the color format check to
>>       .atomic_check() for Rockchip platforms
>>     drm/bridge: analogix_dp: Remove unused
>>       &analogix_dp_plat_data.get_modes()
>>     drm/bridge: analogix_dp: Apply drm_bridge_connector helper
>>     drm/bridge: analogix_dp: Add new API analogix_dp_finish_probe()
>>     drm/rockchip: analogix_dp: Apply analogix_dp_finish_probe()
>>     drm/rockchip: analogix_dp: Apply &analogix_dp_plat_data.attach() to
>>       attach next bridge
>>     drm/exynos: exynos_dp: Apply analogix_dp_finish_probe()
>>     drm/bridge: analogix_dp: Remove panel disabling and enabling in
>>       analogix_dp_set_bridge()
>>     drm/bridge: analogix_dp: Remove bridge disabing and panel unpreparing
>>       in analogix_dp_unbind()
>>     drm/bridge: analogix_dp: Apply panel_bridge helper
>>
>>    drivers/gpu/drm/bridge/analogix/Kconfig       |   1 +
>>    .../drm/bridge/analogix/analogix_dp_core.c    | 394 ++++++++++--------
>>    .../drm/bridge/analogix/analogix_dp_core.h    |   5 +-
>>    drivers/gpu/drm/exynos/exynos_dp.c            | 168 ++++----
>>    drivers/gpu/drm/rockchip/Kconfig              |   1 -
>>    .../gpu/drm/rockchip/analogix_dp-rockchip.c   |  74 ++--
>>    include/drm/bridge/analogix_dp.h              |   9 +-
>>    7 files changed, 342 insertions(+), 310 deletions(-)
>>
>> ---
>>
>> Changes in v2:
>> - Update Exynos DP driver synchronously.
>> - Move the panel/bridge parsing to the Analogix side.
>>
>> Changes in v3:
>> - Rebase for the existing devm_drm_bridge_alloc() applying commit.
>> - Fix the typographical error of panel/bridge check in exynos_dp_bind().
>> - Squash all commits related to skip_connector deletion in both Exynos and
>>     Analogix code into one.
>> - Apply panel_bridge helper to make the codes more concise.
>> - Fix the handing of bridge in analogix_dp_bridge_get_modes().
>> - Remove unnecessary parameter struct drm_connector* for callback
>>     &analogix_dp_plat_data.attach().
>> - In order to decouple the connector driver and the bridge driver, move
>>     the bridge connector initilization to the Rockchip and Exynos sides.
>>
>> Changes in v4:
>> - Rebase for the applied &drm_bridge_funcs.detect() modification commit.
>> - Rename analogix_dp_find_panel_or_bridge() to analogix_dp_finish_probe().
>> - Drop the drmm_encoder_init() modification commit.
>> - Rename the &analogix_dp_plat_data.bridge to
>>     &analogix_dp_plat_data.next_bridge.
>>
>> Changes in v5:
>> - Add legacy bridge to parse the display-timings node under the dp node
>>     for Exynos side.
>> - Move color format check to &drm_connector_helper_funcs.atomic_check()
>>     in order to get rid of &analogix_dp_plat_data.get_modes().
>> - Remove unused callback &analogix_dp_plat_data.get_modes().
>> - Distinguish the &drm_bridge->ops of Analogix bridge based on whether
>>     the downstream device is a panel, a bridge or neither.
>> - Select DRM_DISPLAY_DP_AUX_BUS for DRM_ANALOGIX_DP, and remove it for
>>     ROCKCHIP_ANALOGIX_DP.
>> - Apply rockchip_dp_attach() to support the next bridge attachment for
>>     the Rockchip side.
>> - Move next_bridge attachment from Analogix side to Rockchip/Exynos sides.
> 
> Exynos part still lacks "select DRM_BRIDGE_CONNECTOR" in Kconfig,
> besides that it works fine on all my test boards. Fix this issue and
> feel free to add:
> 
> Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
> 

Thank you for the testing. I will add the DRM_BRIDGE_CONNECTOR selection 
for DRM_EXYNOS_DP in the next version, with the Tested-by tags.

Best regards,
Damon


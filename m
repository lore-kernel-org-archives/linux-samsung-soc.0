Received: from mail-m19731108.qiye.163.com (mail-m19731108.qiye.163.com [220.197.31.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 683F531326A;
	Tue, 17 Mar 2026 01:40:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773711651; cv=none; b=cRoKjcZI2fYfZEtqrtvaLEPNsazgzd2sGThaj/SYfG1zzp5MvcH9CYCeJUv3uZgdLF5KwCBcypnpQ+oD2FdDb/oQhx6/xiskjbI7HNNDdd+VJ8sLcVO8mKfE0W1NoEkFQcYXVYCiSFNQuoYboFxC4DeyFwJWDmP+xxVoD0pysHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773711651; c=relaxed/simple;
	bh=C6h59fY3avVLNkUbyFQr4bOS+03NrbYzU2jo7r2aFns=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MynwVmsGMGfSeHh+FCvuas9NVTJc1ZBgIy28ZDy4skM62zzqYHz2v/yVejNbREUiaE28375H1/Y1eh8Jee1ylhaD3GrxyPfZMUDx2oBUphimlNWINwV/z/7As7enc3WvW3NcPJmpOdpVjHiTQY4NtCvCX/lMdH9cGxt3s4SizWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com; spf=pass smtp.mailfrom=rock-chips.com; dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b=PMpp2P0X; arc=none smtp.client-ip=220.197.31.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b="PMpp2P0X"
Received: from [172.16.12.43] (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 372f4c86a;
	Tue, 17 Mar 2026 09:40:38 +0800 (GMT+08:00)
Message-ID: <62e28820-066c-42af-82a2-a9c95449b176@rock-chips.com>
Date: Tue, 17 Mar 2026 09:40:38 +0800
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 11/18] drm/bridge: analogix_dp: Apply
 drm_bridge_connector helper
To: Luca Ceresoli <luca.ceresoli@bootlin.com>, andrzej.hajda@intel.com,
 neil.armstrong@linaro.org, rfoss@kernel.org
Cc: Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, inki.dae@samsung.com, sw0312.kim@samsung.com,
 kyungmin.park@samsung.com, krzk@kernel.org, alim.akhtar@samsung.com,
 jingoohan1@gmail.com, p.zabel@pengutronix.de, hjc@rock-chips.com,
 heiko@sntech.de, andy.yan@rock-chips.com, dmitry.baryshkov@oss.qualcomm.com,
 dianders@chromium.org, m.szyprowski@samsung.com, jani.nikula@intel.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-rockchip@lists.infradead.org
References: <20260310012458.169272-1-damon.ding@rock-chips.com>
 <20260310012458.169272-12-damon.ding@rock-chips.com>
 <DH1TKWREZMFK.3BY4NY36BXLXG@bootlin.com>
 <bebadd3b-2fd1-404e-bc64-205c8b44880c@rock-chips.com>
 <DH46EQM1PED9.2BVW9DWVIMEJZ@bootlin.com>
Content-Language: en-US
From: Damon Ding <damon.ding@rock-chips.com>
In-Reply-To: <DH46EQM1PED9.2BVW9DWVIMEJZ@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9cf973bf6e03a3kunm936f13bf2236b8
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGkhNTVYYGkoYSE0YGENMSk5WFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSEpKQk
	1VSktLVUpCWQY+
DKIM-Signature: a=rsa-sha256;
	b=PMpp2P0XBVwcx8LLPcRmL5qfKUI3Ti5xc0q4KnELILlo+we4wYdKwzRCQV4/e6ecU4tOo4RgMj8xL8hBj7AHUupPd4ibMmmJjCC4E0LzUVuiABJjZeO01qG190Qa3VPM4Z6FubQyG6Chy5j61GUcGd9TEmvDbuOU41QtfUYXvCA=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=Z7g0mhmika0FKKGECUI1aZl6PGeXN4tAHtnClVoIoOM=;
	h=date:mime-version:subject:message-id:from;



On 3/16/2026 7:39 PM, Luca Ceresoli wrote:
> On Mon Mar 16, 2026 at 4:17 AM CET, Damon Ding wrote:
>> Hi Luca,
>>
>> On 3/14/2026 1:10 AM, Luca Ceresoli wrote:
>>> Hello Damon,
>>>
>>> On Tue Mar 10, 2026 at 2:24 AM CET, Damon Ding wrote:
>>>> Initialize bridge_connector for both Rockchip and Exynos encoder sides.
>>>> Then, make DRM_BRIDGE_ATTACH_NO_CONNECTOR mandatory for Analogix bridge
>>>> side, as the private &drm_connector is no longer created.
>>>>
>>>> The previous &drm_connector_funcs and &drm_connector_helper_funcs APIs
>>>> are replaced by the corresponding &drm_bridge_funcs APIs:
>>>>
>>>> analogix_dp_atomic_check() -> analogix_dp_bridge_atomic_check()
>>>> analogix_dp_detect()       -> analogix_dp_bridge_detect()
>>>> analogix_dp_get_modes()    -> analogix_dp_bridge_get_modes()
>>>>                                 analogix_dp_bridge_edid_read()
>>>>
>>>> Additionally, the compatibilities of Analogix DP bridge based on whether
>>>> the next bridge is a 'panel'. If it is, OP_MODES and OP_DETECT are
>>>> supported; If not (the next bridge is a 'monitor' or a bridge chip),
>>>> OP_EDID and OP_DETECT are supported.
>>>>
>>>> The devm_drm_bridge_add() is placed in analogix_dp_bind() instead of
>>>> analogix_dp_probe(), because the type of next bridge (the panel, monitor
>>>> or bridge chip) can only be determined after the probe process has fully
>>>> completed.
>>>>
>>>> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
>>>> Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
>>>> Tested-by: Heiko Stuebner <heiko@sntech.de> (on rk3588)
>>>
>>> ...
>>>
>>>> @@ -73,15 +72,12 @@ static int exynos_dp_bridge_attach(struct analogix_dp_plat_data *plat_data,
>>>>    				   struct drm_bridge *bridge)
>>>>    {
>>>>    	struct exynos_dp_device *dp = to_dp(plat_data);
>>>> -	enum drm_bridge_attach_flags flags = 0;
>>>>    	int ret;
>>>>
>>>>    	/* Pre-empt DP connector creation if there's a bridge */
>>>>    	if (plat_data->next_bridge) {
>>>> -		if (dp->has_of_bridge)
>>>> -			flags = DRM_BRIDGE_ATTACH_NO_CONNECTOR;
>>>> -
>>>> -		ret = drm_bridge_attach(&dp->encoder, plat_data->next_bridge, bridge, flags);
>>>> +		ret = drm_bridge_attach(&dp->encoder, plat_data->next_bridge, bridge,
>>>> +					DRM_BRIDGE_ATTACH_NO_CONNECTOR);
>>>
>>> Should this be 'flags | DRM_BRIDGE_ATTACH_NO_CONNECTOR' to be future-proof?
>>>
>>
>> Aha, the exynos_dp_bridge_attach() and even
>> &analogix_dp_plat_data.attach() have been removed in [PATCH v10 16/18]
>> for consistency and simplification. Since the only bridge flag supported
>> right now is DRM_BRIDGE_ATTACH_NO_CONNECTOR, let’s leave this as is for
>> now. ;-)
> 
> As you are going to send v11, I'd do that change. It is the right thing do
> to, it's cheap, and in case patches up to 11/18 but not (yet) up to 16/18
> we avoid ending up with unoptimal code until patch 16/18 is applied.
> 

Yes, I will fix this in v11.

Best regards,
Damon


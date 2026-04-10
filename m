Received: from mail-m49209.qiye.163.com (mail-m49209.qiye.163.com [45.254.49.209])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83EBB3ACA52;
	Fri, 10 Apr 2026 08:57:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.49.209
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775811462; cv=none; b=BOokutUHv1ACYXo71VMBX7SkrzTWiLG5nPuvFE+k+DUnRpMMfcEFxjMAJxLLaM4iqcdmGRrUFTj2A7o1E4Q+fPqmIORB8fXLnjWVUdtgzKbviTJerJycqoptSuitrpXj1O8XSA9sNZ6r3Xn7co7jsaYxBpmNTyWjaWCMP6n9+eY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775811462; c=relaxed/simple;
	bh=gZN3wtgx8RYWngf+HA0tzuEgZPV3k8EPEYG5n47mvfY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LfTKE9h1hD7x0awMZjvWF2xeuWYbbUaLr4EjjczIEjI7K85VS/HPWDl0xodz+Inw+diANNDGVnPRj+W9/rnEV+q+whWjlRWKRPiJIb2VexZMunT2ly4mjeshKUvSVZFLs+MXDQ83TqHU/bZ/sQXI/1ZzG1XO+/IEu4kmmThj9mw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com; spf=pass smtp.mailfrom=rock-chips.com; dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b=NJ6nulOP; arc=none smtp.client-ip=45.254.49.209
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b="NJ6nulOP"
Received: from [172.16.12.43] (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 3a3da4ce0;
	Fri, 10 Apr 2026 16:52:20 +0800 (GMT+08:00)
Message-ID: <39a86d7c-59fc-4849-aa60-d9bc62632143@rock-chips.com>
Date: Fri, 10 Apr 2026 16:52:18 +0800
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v13 11/17] drm/bridge: analogix_dp: Apply
 drm_bridge_connector helper
To: Luca Ceresoli <luca.ceresoli@bootlin.com>, andrzej.hajda@intel.com,
 neil.armstrong@linaro.org, rfoss@kernel.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, victor.liu@nxp.com, Frank.Li@nxp.com,
 shawnguo@kernel.org, s.hauer@pengutronix.de, inki.dae@samsung.com,
 sw0312.kim@samsung.com, kyungmin.park@samsung.com, krzk@kernel.org,
 jingoohan1@gmail.com, p.zabel@pengutronix.de, hjc@rock-chips.com,
 heiko@sntech.de, andy.yan@rock-chips.com
Cc: Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, kernel@pengutronix.de, festevam@gmail.com,
 alim.akhtar@samsung.com, dmitry.baryshkov@oss.qualcomm.com,
 nicolas.frattaroli@collabora.com, dianders@chromium.org,
 m.szyprowski@samsung.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-rockchip@lists.infradead.org
References: <20260409065301.446670-1-damon.ding@rock-chips.com>
 <20260409065301.446670-12-damon.ding@rock-chips.com>
 <DHPB0K9AHVR3.33XQ35I1GV96N@bootlin.com>
Content-Language: en-US
From: Damon Ding <damon.ding@rock-chips.com>
In-Reply-To: <DHPB0K9AHVR3.33XQ35I1GV96N@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-HM-Tid: 0a9d7697996f03a3kunm160a3efe4d69e3
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGhoZS1ZPThhOS0NCTBhKSRhWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSEpKQk
	1VSktLVUpCWQY+
DKIM-Signature: a=rsa-sha256;
	b=NJ6nulOPfjZxPerehJRi5Y1NtCkBNPQwbAOOZphJjJqnZQcUBEd6latzMr86rU+hU3micX3Am0ufud/JcsO2wZP15qN8f5tMbYTB87QgUiVssfv/m8UjSY7qseEQ8LpNcoVD048hBzWuFmWesLnasRDM/50ymJR67Px+yh4i2+0=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=FSaNZqWfDxbNZ57v4AyAy7Xb4S5mgUBeo3DUPCIrdgs=;
	h=date:mime-version:subject:message-id:from;

Hi Luca,

On 4/10/2026 3:41 PM, Luca Ceresoli wrote:
> Hello Damon,
> 
> On Thu Apr 9, 2026 at 8:52 AM CEST, Damon Ding wrote:
>> Initialize bridge_connector for both Rockchip and Exynos encoder sides.
>> Then, make DRM_BRIDGE_ATTACH_NO_CONNECTOR mandatory for Analogix bridge
>> side, as the private &drm_connector is no longer created.
>>
>> The previous &drm_connector_funcs and &drm_connector_helper_funcs APIs
>> are replaced by the corresponding &drm_bridge_funcs APIs:
>>
>> analogix_dp_atomic_check() -> analogix_dp_bridge_atomic_check()
>> analogix_dp_detect()       -> analogix_dp_bridge_detect()
>> analogix_dp_get_modes()    -> analogix_dp_bridge_get_modes()
>>                                analogix_dp_bridge_edid_read()
>>
>> Additionally, the compatibilities of Analogix DP bridge based on whether
>> the next bridge is a 'panel'. If it is, OP_MODES and OP_DETECT are
>> supported; If not (the next bridge is a 'monitor' or a bridge chip),
>> OP_EDID and OP_DETECT are supported.
>>
>> The devm_drm_bridge_add() is placed in analogix_dp_bind() instead of
>> analogix_dp_probe(), because the type of next bridge (the panel, monitor
>> or bridge chip) can only be determined after the probe process has fully
>> completed.
>>
>> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
>> Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
>> Tested-by: Heiko Stuebner <heiko@sntech.de> # rk3588
> 
> I noticed two issues, sorry I haven't catched them before...
> 
>> @@ -1580,7 +1533,8 @@ EXPORT_SYMBOL_GPL(analogix_dp_unbind);
>>
>>   int analogix_dp_start_crc(struct drm_connector *connector)
>>   {
>> -	struct analogix_dp_device *dp = to_dp(connector);
>> +	struct analogix_dp_device *dp;
>> +	struct drm_bridge *bridge;
>>
>>   	if (!connector->state->crtc) {
>>   		DRM_ERROR("Connector %s doesn't currently have a CRTC.\n",
>> @@ -1588,13 +1542,26 @@ int analogix_dp_start_crc(struct drm_connector *connector)
>>   		return -EINVAL;
>>   	}
>>
>> +	bridge = drm_bridge_chain_get_first_bridge(connector->encoder);
>> +	if (bridge->type != DRM_MODE_CONNECTOR_eDP)
>> +		return -EINVAL;
>> +
>> +	dp = to_dp(bridge);
>> +
>>   	return drm_dp_start_crc(&dp->aux, connector->state->crtc);
>>   }
> 
> drm_bridge_chain_get_first_bridge() takes a reference, you must call
> drm_bridge_put(bridge) before returning. Given there are two return paths I
> suggest:
> 
> -	struct drm_bridge *bridge;
> 
> -	bridge = drm_bridge_chain_get_first_bridge(connector->encoder);
> +	struct drm_bridge *bridge __free(drm_bridge_put) =
> +		drm_bridge_chain_get_first_bridge(connector->encoder);
> 
>>   EXPORT_SYMBOL_GPL(analogix_dp_start_crc);
>>
>>   int analogix_dp_stop_crc(struct drm_connector *connector)
>>   {
>> -	struct analogix_dp_device *dp = to_dp(connector);
>> +	struct analogix_dp_device *dp;
>> +	struct drm_bridge *bridge;
>> +
>> +	bridge = drm_bridge_chain_get_first_bridge(connector->encoder);
>> +	if (bridge->type != DRM_MODE_CONNECTOR_eDP)
>> +		return -EINVAL;
>> +
>> +	dp = to_dp(bridge);
>>
>>   	return drm_dp_stop_crc(&dp->aux);
>>   }
> 
> Same here:
> 
> -	struct drm_bridge *bridge;
> 
> -	bridge = drm_bridge_chain_get_first_bridge(connector->encoder);
> +	struct drm_bridge *bridge __free(drm-bridge_put) =
> +		drm_bridge_chain_get_first_bridge(connector->encoder);
> 
> With the above two changes you can add to v14:
> 
> +Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> 
> 

Ah, your previous commit added this nice reference handling. Thanks for 
the kind review.

I'll fix it in v14.

Best regards,
Damon


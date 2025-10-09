Received: from mail-m3298.qiye.163.com (mail-m3298.qiye.163.com [220.197.32.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E7E82DF71E;
	Thu,  9 Oct 2025 11:00:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760007622; cv=none; b=ZEpDznQIf3n0B4jc3LAA5/y2ISjmz1sBen/up9Sfq+IVbcextnl53TP2d7hYHa8SL3OrZSgJXOC7i83TYH7e5HnrzUa7u1PoBRYnm/sFn/u0XBenj1qJyVVAqX4G1x2rEfe6dUlBupBG4QwiJwqywCbMHafrZpW98wts0t5jvps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760007622; c=relaxed/simple;
	bh=y7OlmIAK8vLkfU3+JxQ1Pkm7zAIwUPOpZpXABe/3DLs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lGxWitYCG2vmLxOmhocm8Rir8+wUpAbhUcKPcODJsyl0cPkDYtVx9SyKaSYqSqoEZwoh+HG7kiDeXio1qQ1n+HBp19KRi36Q4aB9EdNt99vfNLjggtv5AaTGL+49J4DWXPYUm4nCrejlnsvMueCT9gslE4BIKzxdY22SFtNkIBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com; spf=pass smtp.mailfrom=rock-chips.com; dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b=CRpZqVpX; arc=none smtp.client-ip=220.197.32.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b="CRpZqVpX"
Received: from [172.16.12.26] (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 2543142d9;
	Thu, 9 Oct 2025 12:10:40 +0800 (GMT+08:00)
Message-ID: <a42ebdca-1cbc-498c-b859-336557823f26@rock-chips.com>
Date: Thu, 9 Oct 2025 12:10:42 +0800
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 11/18] drm/display: bridge_connector: Ensure last
 bridge determines EDID/modes detection capabilities
To: Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, inki.dae@samsung.com, sw0312.kim@samsung.com,
 kyungmin.park@samsung.com, krzk@kernel.org, alim.akhtar@samsung.com,
 jingoohan1@gmail.com, p.zabel@pengutronix.de, hjc@rock-chips.com,
 heiko@sntech.de, andy.yan@rock-chips.com, dianders@chromium.org,
 m.szyprowski@samsung.com, jani.nikula@intel.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-rockchip@lists.infradead.org
References: <20250930090920.131094-1-damon.ding@rock-chips.com>
 <20250930090920.131094-12-damon.ding@rock-chips.com>
 <20251001180922.6bbe42ac@booty>
Content-Language: en-US
From: Damon Ding <damon.ding@rock-chips.com>
In-Reply-To: <20251001180922.6bbe42ac@booty>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-HM-Tid: 0a99c729f83903a3kunm16370414a6fa98
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGRhISlZKSRgYQkhITx4fSEtWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSEpKQk
	1VSktLVUpCWQY+
DKIM-Signature: a=rsa-sha256;
	b=CRpZqVpXED0SBtQWsNn3unDFg6hHUsSbzj0hQuFlxkwW+RHOgdqWJ+gRlo060O6EvTD8QiK/bJkRJC7jl8p3TKWpa+RYxJFZxheUO49caZ0+LEO/SzLEqHTLZz4OpdNo5ABc75WLQf70YZcuBwLuXIDCpICPiK4KZ7G+gX4C7Gg=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=qQ2zeMeYDfoWTQYJ4xG+nhpK+0ZJUttKUUEWrzWjUSw=;
	h=date:mime-version:subject:message-id:from;

Hi Luca,

On 10/2/2025 12:09 AM, Luca Ceresoli wrote:
> Hello Damon,
> 
> On Tue, 30 Sep 2025 17:09:13 +0800
> Damon Ding <damon.ding@rock-chips.com> wrote:
> 
>> When multiple bridges are present, EDID detection capability
>> (DRM_BRIDGE_OP_EDID) takes precedence over modes detection
>> (DRM_BRIDGE_OP_MODES). To ensure the above two capabilities are
>> determined by the last bridge in the chain, we handle three cases:
>>
>> Case 1: The later bridge declares only DRM_BRIDGE_OP_MODES
>>   - If the previous bridge declares DRM_BRIDGE_OP_EDID, set
>>     &drm_bridge_connector.bridge_edid to NULL and set
>>     &drm_bridge_connector.bridge_modes to the later bridge.
>>   - Ensure modes detection capability of the later bridge will not
>>     be ignored.
>>
>> Case 2: The later bridge declares only DRM_BRIDGE_OP_EDID
>>   - If the previous bridge declares DRM_BRIDGE_OP_MODES, set
>>     &drm_bridge_connector.bridge_modes to NULL and set
>>     &drm_bridge_connector.bridge_edid to the later bridge.
>>   - Although EDID detection capability has higher priority, this
>>     operation is for balance and makes sense.
>>
>> Case 3: the later bridge declares both of them
>>   - Assign later bridge as &drm_bridge_connector.bridge_edid and
>>     and &drm_bridge_connector.bridge_modes to this bridge.
>>   - Just leave transfer of these two capabilities as before.
> 
> I think the whole explanation can be more concisely rewritten as:
> 
> If the later bridge declares OP_EDID, OP_MODES or both, then both
> .bridge_modes and .bridge_edid should be set to NULL (if any was set
> from a previous bridge), and then .bridge_modes and/or .bridge_edid be
> set to the later bridge as is done already.
> 
> Does this look correct (i.e. does it convey the same meaning)?
> 
>> --- a/drivers/gpu/drm/display/drm_bridge_connector.c
>> +++ b/drivers/gpu/drm/display/drm_bridge_connector.c
>> @@ -640,6 +640,7 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
>>   	struct drm_connector *connector;
>>   	struct i2c_adapter *ddc = NULL;
>>   	struct drm_bridge *bridge, *panel_bridge = NULL;
>> +	struct drm_bridge *pre_bridge_edid, *pre_bridge_modes;
>>   	unsigned int supported_formats = BIT(HDMI_COLORSPACE_RGB);
>>   	unsigned int max_bpc = 8;
>>   	bool support_hdcp = false;
>> @@ -668,6 +669,9 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
>>   	 */
>>   	connector_type = DRM_MODE_CONNECTOR_Unknown;
>>   	drm_for_each_bridge_in_chain(encoder, bridge) {
>> +		pre_bridge_edid = bridge_connector->bridge_edid;
>> +		pre_bridge_modes = bridge_connector->bridge_modes;
>> +
>>   		if (!bridge->interlace_allowed)
>>   			connector->interlace_allowed = false;
>>   		if (!bridge->ycbcr_420_allowed)
>> @@ -681,6 +685,44 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
>>   			bridge_connector->bridge_detect = bridge;
>>   		if (bridge->ops & DRM_BRIDGE_OP_MODES)
>>   			bridge_connector->bridge_modes = bridge;
>> +
>> +		/*
>> +		 * When multiple bridges are present, EDID detection capability
>> +		 * (DRM_BRIDGE_OP_EDID) takes precedence over modes detection
>> +		 * (DRM_BRIDGE_OP_MODES). To ensure the above two capabilities
>> +		 * are determined by the last bridge in the chain, we handle
>> +		 * three cases:
>> +		 *
>> +		 * Case 1: The later bridge declares only DRM_BRIDGE_OP_MODES
>> +		 *  - If the previous bridge declares DRM_BRIDGE_OP_EDID, set
>> +		 *    &drm_bridge_connector.bridge_edid to NULL and set
>> +		 *    &drm_bridge_connector.bridge_modes to the later bridge.
>> +		 *  - Ensure modes detection capability of the later bridge
>> +		 *    will not be ignored.
>> +		 *
>> +		 * Case 2: The later bridge declares only DRM_BRIDGE_OP_EDID
>> +		 *  - If the previous bridge declares DRM_BRIDGE_OP_MODES, set
>> +		 *    &drm_bridge_connector.bridge_modes to NULL and set
>> +		 *    &drm_bridge_connector.bridge_edid to the later bridge.
>> +		 *  - Although EDID detection capability has higher priority,
>> +		 *    this operation is for balance and makes sense.
>> +		 *
>> +		 * Case 3: the later bridge declares both of them
>> +		 *  - Assign later bridge as &drm_bridge_connector.bridge_edid
>> +		 *    and &drm_bridge_connector.bridge_modes to this bridge.
>> +		 *  - Just leave transfer of these two capabilities as before.
>> +		 */
>> +		if (bridge->ops & DRM_BRIDGE_OP_EDID &&
>> +		    !(bridge->ops & DRM_BRIDGE_OP_MODES)) {
>> +			if (pre_bridge_modes)
>> +				bridge_connector->bridge_modes = NULL;
>> +		}
>> +		if (bridge->ops & DRM_BRIDGE_OP_MODES &&
>> +		    !(bridge->ops & DRM_BRIDGE_OP_EDID)) {
>> +			if (pre_bridge_edid)
>> +				bridge_connector->bridge_edid = NULL;
>> +		}
>> +
> 
> If the above rewrite is correct, then I think this patch can be
> rewritten in a simple way (build tested only):
> 
> diff --git a/drivers/gpu/drm/display/drm_bridge_connector.c b/drivers/gpu/drm/display/drm_bridge_connector.c
> index a5bdd6c10643..bd5dbafe88bc 100644
> --- a/drivers/gpu/drm/display/drm_bridge_connector.c
> +++ b/drivers/gpu/drm/display/drm_bridge_connector.c
> @@ -672,14 +672,18 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
>                  if (!bridge->ycbcr_420_allowed)
>                          connector->ycbcr_420_allowed = false;
>   
> -               if (bridge->ops & DRM_BRIDGE_OP_EDID)
> -                       bridge_connector->bridge_edid = bridge;
> +               if (bridge->ops & DRM_BRIDGE_OP_EDID || bridge->ops & DRM_BRIDGE_OP_MODES) {
> +                       bridge_connector->bridge_edid = NULL;
> +                       bridge_connector->bridge_modes = NULL;
> +                       if (bridge->ops & DRM_BRIDGE_OP_EDID)
> +                               bridge_connector->bridge_edid = bridge;
> +                       if (bridge->ops & DRM_BRIDGE_OP_MODES)
> +                               bridge_connector->bridge_modes = bridge;
> +               }
>                  if (bridge->ops & DRM_BRIDGE_OP_HPD)
>                          bridge_connector->bridge_hpd = bridge;
>                  if (bridge->ops & DRM_BRIDGE_OP_DETECT)
>                          bridge_connector->bridge_detect = bridge;
> -               if (bridge->ops & DRM_BRIDGE_OP_MODES)
> -                       bridge_connector->bridge_modes = bridge;
>                  if (bridge->ops & DRM_BRIDGE_OP_HDMI) {
>                          if (bridge_connector->bridge_hdmi)
>                                  return ERR_PTR(-EBUSY);
> 

Yes, this is correct and maintains functional equivalence with the 
previous implementation.

I previously attempted to implement this feature by modifying the logic 
in this section. However, that approach would obscure the explicit 
propagation semantics of the bridge chain flags 
(OP_EDID/OP_HPD/OP_DETECT/OP_MODES). Therefore, I finally decided to 
implemented it as a specific check after this code block.

Dmitry, what's your take on this?

> Another thing to note is that this patch conflicts with [0], which I
> plan to apply in the next few days. The two patches are orthogonal but
> they insist on the same lines (those assigning
> bridge_connector->bridge_* = bridge). Not a big deal, whichever patch
> comes later will be easily adapted. Just wanted to ensure you are aware.
> 
> [0] https://lore.kernel.org/all/20250926-drm-bridge-alloc-getput-bridge-connector-v2-1-138b4bb70576@bootlin.com/
> 

This is indeed a clever approach to the managing bridge resource cleanup 
in drm_bridge_connector. Thanks a lot for the heads-up! I'll resolve 
this conflict and rebase the patch series.

Apologies for the delayed reply as I was on vacation. ;-)

Best regards,
Damon


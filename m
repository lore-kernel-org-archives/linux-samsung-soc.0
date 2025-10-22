Received: from mail-m3275.qiye.163.com (mail-m3275.qiye.163.com [220.197.32.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3D4613E02A;
	Wed, 22 Oct 2025 02:31:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.75
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761100302; cv=none; b=jkf3tfXCX4WLyiyAx0+OykSQSi4uHa5G7YrFaUgHC/qsM3ggeSUE9kk/yk5dU/53X4izrwqXoYy+u+qGtMZtXnDMuXtto7Q92aZ54Ocnmz0WCz7+ri9Az9Fe4cCAT4vTCoS6xZMMt4EpqM0jgJPaQe1IDPStNYpfBqQGySAkY5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761100302; c=relaxed/simple;
	bh=cBRz0RRJDinH4NIFc2MNyQ84IjGm7KmyCTz8GUuWGOk=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=h6BJcIrlZm8MHXXYk8Sn3aIXXN4j8A6Nxfg8fYh9zQZLaBCIup1XNoRoSYTBJgO1oSibUt2MjOkQsXX6Dcc6mUU6Kbw7Dd0tyZOG00lqw8vS/wpqNeK4XGMzvRLiOaQ0nnF+g4C3frwWfkZWqEF3Yz2iXJLtf231pRWNk0n16Aw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com; spf=pass smtp.mailfrom=rock-chips.com; dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b=G3IBa/UR; arc=none smtp.client-ip=220.197.32.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b="G3IBa/UR"
Received: from [172.16.12.26] (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 26b816b55;
	Wed, 22 Oct 2025 09:15:54 +0800 (GMT+08:00)
Message-ID: <ff65f453-68a9-41fc-b9e3-02733bba96e3@rock-chips.com>
Date: Wed, 22 Oct 2025 09:15:52 +0800
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Damon Ding <damon.ding@rock-chips.com>
Subject: Re: [PATCH v7 01/18] drm/display: bridge_connector: Ensure last
 bridge determines EDID/modes detection capabilities
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
References: <20251021023130.1523707-1-damon.ding@rock-chips.com>
 <20251021023130.1523707-2-damon.ding@rock-chips.com>
 <DDNXIYL494D2.2N8L1J7XTBT4S@bootlin.com>
Content-Language: en-US
In-Reply-To: <DDNXIYL494D2.2N8L1J7XTBT4S@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-HM-Tid: 0a9a097ca16b03a3kunm40777dd76b3afa
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGU5NTVZIGRkYGB1CSENNHk5WFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSEpKQk
	1VSktLVUpCWQY+
DKIM-Signature: a=rsa-sha256;
	b=G3IBa/UR/LuPN+iUHG5BfBsR0wakY08fMpbIcc22chg3Yl2mDJuP3hApodwjF7Dp3I5RcHlsanrTg0887GoJUZgyuAx5TMRcyEawoDSmH9l/4xI5P1euGxlyg400GezPKB85JhtiTT1ZShmJwtVe+NOdaGsfV+2hDV4p/3K+h9E=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=zauBUVRHLTtxfE8FEqH72ce8GCghwo6SRo4GbUPwtY0=;
	h=date:mime-version:subject:message-id:from;

Hi Luca,

On 10/21/2025 6:31 PM, Luca Ceresoli wrote:
> Hello Damon,
> 
> On Tue Oct 21, 2025 at 4:31 AM CEST, Damon Ding wrote:
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
>>
>> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
>> Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>> Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
>>
>> ---
>>
>> Changes in v7:
>> - As Luca suggested, simplify the code and related comment.
>> ---
>>   drivers/gpu/drm/display/drm_bridge_connector.c | 16 ++++++++++++----
>>   1 file changed, 12 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/display/drm_bridge_connector.c b/drivers/gpu/drm/display/drm_bridge_connector.c
>> index baacd21e7341..7c2936d59517 100644
>> --- a/drivers/gpu/drm/display/drm_bridge_connector.c
>> +++ b/drivers/gpu/drm/display/drm_bridge_connector.c
>> @@ -673,14 +673,22 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
>>   		if (!bridge->ycbcr_420_allowed)
>>   			connector->ycbcr_420_allowed = false;
>>
>> -		if (bridge->ops & DRM_BRIDGE_OP_EDID)
>> -			bridge_connector->bridge_edid = bridge;
>> +		/*
>> +		 * Ensure the last bridge declares OP_EDID or OP_MODES or both.
>> +		 */
>> +		if (bridge->ops & DRM_BRIDGE_OP_EDID || bridge->ops & DRM_BRIDGE_OP_MODES) {
>> +			bridge_connector->bridge_edid = NULL;
>> +			bridge_connector->bridge_modes = NULL;
>> +			if (bridge->ops & DRM_BRIDGE_OP_EDID)
>> +				bridge_connector->bridge_edid = bridge;
>> +			if (bridge->ops & DRM_BRIDGE_OP_MODES)
>> +				bridge_connector->bridge_modes = bridge;
>> +		}
>>   		if (bridge->ops & DRM_BRIDGE_OP_HPD)
>>   			bridge_connector->bridge_hpd = bridge;
>>   		if (bridge->ops & DRM_BRIDGE_OP_DETECT)
>>   			bridge_connector->bridge_detect = bridge;
>> -		if (bridge->ops & DRM_BRIDGE_OP_MODES)
>> -			bridge_connector->bridge_modes = bridge;
>> +
> 
> This does not apply on current drm-misc-next, due to the patch I mentioned
> in a previous iteration, now applied as commit 2be300f9a0b6 ("drm/display:
> bridge_connector: get/put the stored bridges").
> 
> However I'm sorry I have to mention that patch turned out being buggy, so
> I've sent a series to apply a corrected version [0]. I suggest watching the
> disucssion about the fix series, and if that gets approved rebase on top of
> that and adapt your changes.
> 
> Sorry about the mess. :(
> 
> [0] https://lore.kernel.org/r/20251017-drm-bridge-alloc-getput-bridge-connector-fix-hdmi_cec-v2-0-667abf6d47c0@bootlin.com
> 
> 

I saw your fix patches before sending this series. I think your patches 
will likely be merged relatively quickly, so I plan to wait until the 
other patches in my patch series are confirmed to be fine, then submit 
v8 version based on the latest bridge_connector driver. :-)

Best regards,
Damon


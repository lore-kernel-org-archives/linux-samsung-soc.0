Received: from mail-m19731102.qiye.163.com (mail-m19731102.qiye.163.com [220.197.31.102])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F73B39B4A1;
	Mon,  9 Mar 2026 11:51:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.102
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773057098; cv=none; b=JJMPxAEDSrIuItMskMBR4BRa7c5Zg4EkdiGiZU1fiS/2LykcKAL1AhCNuUEX6WP8aeqd27kOct48iAd/i+kYejtLr8WJep5PppBEtWbH2ptVib+UF+dCHT3KpG6w0/8WZ8YY3+cOCnw77rx+ydWXc+sl5qRQE33BueF/tqyQSmE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773057098; c=relaxed/simple;
	bh=DrtqFIO9YTumjBvEsVazx3/j4LOrIzkP53sXGMxlajM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ERI9jN2xPE7qX/cDLEAihCRb9NVHvuHm4gvjntEgoN9sBrtgAEM1d5dqNjmJwp1XvZzu69vxiakSl+yXlNE8aELD8+va75wKBO6p0dR2zWLzwBQ5tikL8UHEQ6rI7dp7XO1K/+pdZwUkEf8j+l/z4m+hgOBYKFpQw0YnJCwJnSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com; spf=pass smtp.mailfrom=rock-chips.com; dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b=C4os9YqN; arc=none smtp.client-ip=220.197.31.102
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b="C4os9YqN"
Received: from [172.16.12.43] (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 36434b970;
	Mon, 9 Mar 2026 19:51:23 +0800 (GMT+08:00)
Message-ID: <01983e92-dabb-47f7-ba01-988ea41641db@rock-chips.com>
Date: Mon, 9 Mar 2026 19:51:24 +0800
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 10/15] drm/bridge: analogix_dp: Add new API
 analogix_dp_finish_probe()
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
References: <20260210071225.2566099-1-damon.ding@rock-chips.com>
 <20260210071225.2566099-11-damon.ding@rock-chips.com>
 <DGT20ZJ3Q4WP.3OTQJYWGSYGUD@bootlin.com>
Content-Language: en-US
From: Damon Ding <damon.ding@rock-chips.com>
In-Reply-To: <DGT20ZJ3Q4WP.3OTQJYWGSYGUD@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-HM-Tid: 0a9cd270098c03a3kunm26e3dc7b2d81c9
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQ05OS1YeHkxLSkgYQkNDTE9WFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSEpKQk
	1VSktLVUpCWQY+
DKIM-Signature: a=rsa-sha256;
	b=C4os9YqNIUC3dEyjyzM/hCxvk1F4fWa1S7B31zMJjMRFJW7ZEsZL+m85ptIf9IWCeuLLhar9IN001x4s5PBLTMGuQlDb+GzAX3aXtbXJrDmPNAb2GPzyOvS/jIXmdi0MK0cJdB+IiAiLNeWa/7D2wdMUSjFWtZYZZb4qvAyF1AM=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=hduUfmGwgnKMskaDKeGcgwJWohiGVW+qVStYTESGB2U=;
	h=date:mime-version:subject:message-id:from;

Hi Luca,

On 3/3/2026 5:54 PM, Luca Ceresoli wrote:
> Hello Damon,
> 
> On Tue Feb 10, 2026 at 8:12 AM CET, Damon Ding wrote:
>> Since the panel/bridge should logically be positioned behind the
>> Analogix bridge in the display pipeline, it makes sense to handle
>> the panel/bridge parsing on the Analogix side. Therefore, we add
>> a new API analogix_dp_finish_probe(), which combines the panel/bridge
>> parsing with component addition, to do it.
>>
>> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>> Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
>> Tested-by: Heiko Stuebner <heiko@sntech.de> (on rk3588)
> 
> ...
> 
>> @@ -1581,6 +1583,52 @@ struct drm_dp_aux *analogix_dp_get_aux(struct analogix_dp_device *dp)
>>   }
>>   EXPORT_SYMBOL_GPL(analogix_dp_get_aux);
>>
>> +static int analogix_dp_aux_done_probing(struct drm_dp_aux *aux)
>> +{
>> +	struct analogix_dp_device *dp = to_dp(aux);
>> +	struct analogix_dp_plat_data *plat_data = dp->plat_data;
>> +	int port = plat_data->dev_type == EXYNOS_DP ? 0 : 1;
>> +	int ret;
>> +
>> +	/*
>> +	 * If drm_of_find_panel_or_bridge() returns -ENODEV, there may be no valid panel
>> +	 * or bridge nodes. The driver should go on for the driver-free bridge or the DP
>> +	 * mode applications.
>> +	 */
>> +	ret = drm_of_find_panel_or_bridge(dp->dev->of_node, port, 0,
>> +					  &plat_data->panel, &plat_data->next_bridge);
>> +	if (ret && ret != -ENODEV)
>> +		return ret;
>> +
>> +	return component_add(dp->dev, plat_data->ops);
>> +}
>> +
>> +int analogix_dp_finish_probe(struct analogix_dp_device *dp)
>> +{
>> +	int ret;
>> +
>> +	ret = devm_of_dp_aux_populate_bus(&dp->aux, analogix_dp_aux_done_probing);
>> +	if (ret) {
>> +		/*
>> +		 * If devm_of_dp_aux_populate_bus() returns -ENODEV, the done_probing() will
>> +		 * not be called because there are no EP devices. Then the callback function
>> +		 * analogix_dp_aux_done_probing() will be called directly in order to support
>> +		 * the other valid DT configurations.
>> +		 *
>> +		 * NOTE: The devm_of_dp_aux_populate_bus() is allowed to return -EPROBE_DEFER.
> 
> Uhm, if it is allowed to return -EPROBE_DEFER...
> 
>> +		 */
>> +		if (ret != -ENODEV) {
>> +			dev_err(dp->dev, "failed to populate aux bus\n");
>> +			return ret;
>> +		}
> 
> ...then you shouldn't dev_err() when -EPROBE_DEFER is returned.
> 
> Either use dev_err_probe() (which would also simplify your code) or check
> for if (ret != -ENODEV && ret != -EPROBE_DEFER).

Will fix in v10.

> 
>> +
>> +		return analogix_dp_aux_done_probing(&dp->aux);
>> +	}
>> +
>> +	return 0;
>> +}
>> +EXPORT_SYMBOL_GPL(analogix_dp_finish_probe);
>> +
>>   MODULE_AUTHOR("Jingoo Han <jg1.han@samsung.com>");
>>   MODULE_DESCRIPTION("Analogix DP Core Driver");
>>   MODULE_LICENSE("GPL v2");
>> diff --git a/include/drm/bridge/analogix_dp.h b/include/drm/bridge/analogix_dp.h
>> index 3428ffff24c5..bae969dec63a 100644
>> --- a/include/drm/bridge/analogix_dp.h
>> +++ b/include/drm/bridge/analogix_dp.h
>> @@ -30,6 +30,7 @@ struct analogix_dp_plat_data {
>>   	struct drm_bridge *next_bridge;
>>   	struct drm_encoder *encoder;
>>   	struct drm_connector *connector;
>> +	const struct component_ops *ops;
> 
> Is adding a new stored field a good idea? Can it be instead passed as an
> argument to analogix_dp_finish_probe()?
> 
> Note I don't have a strong opinion here, just the added struct field seems
> overkill for being used just once.
> 

I agree this is a better approach, since the &component_ops is only used 
during probing.

>> @@ -49,5 +50,6 @@ int analogix_dp_stop_crc(struct drm_connector *connector);
>>
>>   struct analogix_dp_plat_data *analogix_dp_aux_to_plat_data(struct drm_dp_aux *aux);
>>   struct drm_dp_aux *analogix_dp_get_aux(struct analogix_dp_device *dp);
>> +int analogix_dp_finish_probe(struct analogix_dp_device *dp);
>>
>>   #endif /* _ANALOGIX_DP_H_ */
> 

Best regards,
Damon


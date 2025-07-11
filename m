Received: from mail-m19731109.qiye.163.com (mail-m19731109.qiye.163.com [220.197.31.109])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 835201F4722;
	Fri, 11 Jul 2025 07:57:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.109
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752220625; cv=none; b=KDwKF0yycrdjpoDb3BUBsKByB9RMb2aotD8ShXhWJAuSS+grfY09rbHwRo72+GK1hfSqU3vwQOkOfEuVZnGQfpfO/QPgqApavuUNDrz8SxbxC6/vWQfcoFTAXuQF97d/Db5Qxk+lMJAjyfobFi6sBAtY44Nn9g15QjUILsNSUnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752220625; c=relaxed/simple;
	bh=MnkxfAEYEu/NGDI1digmussccdK/c+G8sqFOQG7VNEE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uH0q6XvKE/FD7P4TL6yZy/UCnGB6s3GRUe03xmSKIT3yaKeZeO4u053Q8HMlo0yr+eft85NGkK754oMh7nUDHPL9GTS5PGTJ1oWiuWCSFPDIlsepQC5yE93jMqw9cLI1VLQ/9FUVbUDkBIZhl/GAFMGQdH/yRJNRcYlVgkIn+lA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com; spf=pass smtp.mailfrom=rock-chips.com; dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b=I73tuKAN; arc=none smtp.client-ip=220.197.31.109
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b="I73tuKAN"
Received: from [172.16.12.26] (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 1baedbbda;
	Fri, 11 Jul 2025 15:41:38 +0800 (GMT+08:00)
Message-ID: <0a4d5e97-a143-4293-987c-5682be60023d@rock-chips.com>
Date: Fri, 11 Jul 2025 15:41:38 +0800
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 07/12] drm/bridge: analogix_dp: Add support to find
 panel or bridge
To: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
 andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org
Cc: Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 jingoohan1@gmail.com, inki.dae@samsung.com, sw0312.kim@samsung.com,
 kyungmin.park@samsung.com, krzk@kernel.org, alim.akhtar@samsung.com,
 hjc@rock-chips.com, andy.yan@rock-chips.com,
 dmitry.baryshkov@oss.qualcomm.com, l.stach@pengutronix.de,
 dianders@chromium.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-rockchip@lists.infradead.org
References: <20250709070139.3130635-1-damon.ding@rock-chips.com>
 <20250709070139.3130635-8-damon.ding@rock-chips.com>
 <4555084.IFkqi6BYcA@diego>
Content-Language: en-US
From: Damon Ding <damon.ding@rock-chips.com>
In-Reply-To: <4555084.IFkqi6BYcA@diego>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGRodHlZLSxkeSRgZSUNPT0JWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
	hVSktLVUpCS0tZBg++
X-HM-Tid: 0a97f86ec69303a3kunmd7d7e8ccf38b0e
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6PC46Ggw*IjExNx8rPyIUNjEJ
	PBhPCxhVSlVKTE5JSUpCTEtKSE1DVTMWGhIXVR8aFhQVVR8SFRw7CRQYEFYYExILCFUYFBZFWVdZ
	EgtZQVlOQ1VJSVVMVUpKT1lXWQgBWUFNSkJNNwY+
DKIM-Signature:a=rsa-sha256;
	b=I73tuKANV9uKyRok2N9ZcKiqfcsrTwuKJMN5/dQHhdFxk7pahy1W3RoQBYBD8Sl31ir9t+rz5HRKBQEDaOOODVrslC63ZYEKn1MQDTAU1e7vCJDMoixXOdF//+IEkg+8vA2U4Fvb1mOuGa65Y/9FpvLM36du1TAzXW2BrxD/QV8=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=vYnuM/WIrDM+HxkaZr79Qv/uzCSKH0uzs/xyR50RsYA=;
	h=date:mime-version:subject:message-id:from;

Hi Heiko,

On 2025/7/10 4:07, Heiko Stübner wrote:
> Hi Damon,
> 
> Am Mittwoch, 9. Juli 2025, 09:01:34 Mitteleuropäische Sommerzeit schrieb Damon Ding:
>> Since the panel/bridge should logically be positioned behind the
>> Analogix bridge in the display pipeline, it makes sense to handle
>> the panel/bridge parsing on the Analogix side.
>>
>> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
>> ---
>>   .../drm/bridge/analogix/analogix_dp_core.c    | 48 +++++++++++++++++++
>>   include/drm/bridge/analogix_dp.h              |  2 +
>>   2 files changed, 50 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
>> index 78d68310e4f6..660f95e90490 100644
>> --- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
>> +++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
>> @@ -19,12 +19,14 @@
>>   #include <linux/platform_device.h>
>>   
>>   #include <drm/bridge/analogix_dp.h>
>> +#include <drm/display/drm_dp_aux_bus.h>
>>   #include <drm/drm_atomic.h>
>>   #include <drm/drm_atomic_helper.h>
>>   #include <drm/drm_bridge.h>
>>   #include <drm/drm_crtc.h>
>>   #include <drm/drm_device.h>
>>   #include <drm/drm_edid.h>
>> +#include <drm/drm_of.h>
>>   #include <drm/drm_panel.h>
>>   #include <drm/drm_print.h>
>>   #include <drm/drm_probe_helper.h>
>> @@ -1707,6 +1709,52 @@ struct drm_dp_aux *analogix_dp_get_aux(struct analogix_dp_device *dp)
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
>> +					  &plat_data->panel, &plat_data->bridge);
> 
> Could you check if this can use a panel-bridge?
> See for example
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/gpu/drm/rockchip/rockchip_rgb.c#n138
> or a lot of other places for drm_panel_bridge_add()
> 
> So if drm_of_find_panel_or_bridge() finds a bridge, just use it; if it
> finds a panel, drm_panel_bridge_add() just wraps a bridge around it
> and all the code can just assume everything is bridge after that.
> 
> 

Yes, that is a good approach. Using the panel-bridge will make the 
related checks more concise.

> 
>> +	if (ret && ret != -ENODEV)
>> +		return ret;
>> +
>> +	return component_add(dp->dev, plat_data->ops);
>> +}
>> +
>> +int analogix_dp_find_panel_or_bridge(struct analogix_dp_device *dp)
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
>> +		 */
>> +		if (ret != -ENODEV) {
>> +			dev_err(dp->dev, "failed to populate aux bus\n");
>> +			return ret;
>> +		}
>> +
>> +		return analogix_dp_aux_done_probing(&dp->aux);
>> +	}
>> +
>> +	return 0;
>> +}
>> +EXPORT_SYMBOL_GPL(analogix_dp_find_panel_or_bridge);
>> +
>>   MODULE_AUTHOR("Jingoo Han <jg1.han@samsung.com>");
>>   MODULE_DESCRIPTION("Analogix DP Core Driver");
>>   MODULE_LICENSE("GPL v2");
>> diff --git a/include/drm/bridge/analogix_dp.h b/include/drm/bridge/analogix_dp.h
>> index 202e5eafb2cc..0b6d85f1924e 100644
>> --- a/include/drm/bridge/analogix_dp.h
>> +++ b/include/drm/bridge/analogix_dp.h
>> @@ -30,6 +30,7 @@ struct analogix_dp_plat_data {
>>   	struct drm_bridge *bridge;
>>   	struct drm_encoder *encoder;
>>   	struct drm_connector *connector;
>> +	const struct component_ops *ops;
>>   
>>   	int (*power_on)(struct analogix_dp_plat_data *);
>>   	int (*power_off)(struct analogix_dp_plat_data *);
>> @@ -52,5 +53,6 @@ int analogix_dp_stop_crc(struct drm_connector *connector);
>>   
>>   struct analogix_dp_plat_data *analogix_dp_aux_to_plat_data(struct drm_dp_aux *aux);
>>   struct drm_dp_aux *analogix_dp_get_aux(struct analogix_dp_device *dp);
>> +int analogix_dp_find_panel_or_bridge(struct analogix_dp_device *dp);
>>   
>>   #endif /* _ANALOGIX_DP_H_ */
>>
> 

Best regards,
Damon


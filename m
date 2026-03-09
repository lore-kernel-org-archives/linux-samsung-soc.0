Received: from mail-m19731100.qiye.163.com (mail-m19731100.qiye.163.com [220.197.31.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2669239A05F;
	Mon,  9 Mar 2026 11:25:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773055523; cv=none; b=QKKfsE4LSuQ8Yy41hzmeqHM6g2ck3Aroc5+q1Gm5ub88I0y0cu+hobTrabUnI1qPSNK0Q+ElmfZ3IsO9jgxGAf9dcT/xMq79C1ddjUdFBsVjlRpOJhJO0Pz9y7O43aT2kQd4crzuw1YWwHX74RJWDpV0siEjcVHTAzNxuByOIps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773055523; c=relaxed/simple;
	bh=Xpl/fpMpjUUVpfSnqfPkuT0H6Yqcz7PD/V6biWWfXc8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bYPBZH+3GDybSso6YczWK9d1msVbw3WdfID7TGA/C2N/4mF5EvnOvCSdONe/pP0vzJ/8KFh6rbYrs+Lx8ubm0911+vepQ0ys6ULHtpj2zoYl+UNnbAlGeaR8hfbOiYDMWhzqo4yXBmMX4E7SFKJDIycRBfpy6SjckKy1KftcDyY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com; spf=pass smtp.mailfrom=rock-chips.com; dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b=Qc0YmiyB; arc=none smtp.client-ip=220.197.31.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b="Qc0YmiyB"
Received: from [172.16.12.43] (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 3642c56b9;
	Mon, 9 Mar 2026 19:25:13 +0800 (GMT+08:00)
Message-ID: <b08028a2-a721-404f-aa37-2d5460b42f94@rock-chips.com>
Date: Mon, 9 Mar 2026 19:25:14 +0800
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 09/15] drm/bridge: analogix_dp: Apply
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
References: <20260210071225.2566099-1-damon.ding@rock-chips.com>
 <20260210071225.2566099-10-damon.ding@rock-chips.com>
 <DGT1S368J0BK.3UA75JNEA1AB8@bootlin.com>
Content-Language: en-US
From: Damon Ding <damon.ding@rock-chips.com>
In-Reply-To: <DGT1S368J0BK.3UA75JNEA1AB8@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-HM-Tid: 0a9cd25814c503a3kunmc0cb66ec2d5790
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQhpIHVZMShlCQxlDHx5JTx5WFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSEpKQk
	1VSktLVUpCWQY+
DKIM-Signature: a=rsa-sha256;
	b=Qc0YmiyBZee1Hk/fjhMP8HZRU/TFbXqGI15R8Nhb//1EjA0Vul81HEuf9DHIcX4+WMbFCJhaxhBQ0j4oiM5ISbiA7Za0bqazftO58tnWo3jv3QUmPQugIxhXN8V6z++BD9Sl0ShB06AP3Q4K/+O+oYpdJQ8n1KH9J/gJ61nTHAA=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=eKAr0WWTEFr13YAjpGH8NXZDOYNtjsEXrTQWXZpSIFg=;
	h=date:mime-version:subject:message-id:from;

Hi Luca,

On 3/3/2026 5:42 PM, Luca Ceresoli wrote:
> Hello Damon,
> 
> On Tue Feb 10, 2026 at 8:12 AM CET, Damon Ding wrote:
>> Apply drm_bridge_connector helper for Analogix DP driver.
>>
>> The following changes have been made:
>> - Apply drm_bridge_connector helper to get rid of &drm_connector_funcs
>>    and &drm_connector_helper_funcs.
>> - Remove unnecessary parameter struct drm_connector* for callback
>>    &analogix_dp_plat_data.attach.
>> - Remove &analogix_dp_device.connector.
>> - Convert analogix_dp_atomic_check()/analogix_dp_detect() to
>>    &drm_bridge_funcs.atomic_check()/&drm_bridge_funcs.detect().
>> - Split analogix_dp_get_modes() into &drm_bridge_funcs.get_modes() and
>>    &drm_bridge_funcs.edid_read().
>> - Set flag DRM_BRIDGE_ATTACH_NO_CONNECTOR for bridge attachment while
>>    binding. Meanwhile, make DRM_BRIDGE_ATTACH_NO_CONNECTOR unsuppported
>                               ^
> 
> Do you mean "!DRM_BRIDGE_ATTACH_NO_CONNECTOR" here (i.e. missing '!')?
> 
> Also, unsuppported -> unsupported (typo)
> 

Will fix in v10.

>>    in analogix_dp_bridge_attach().
>> - Set &drm_bridge.ops according to different cases.
>>
>> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
>> Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
>> Tested-by: Heiko Stuebner <heiko@sntech.de> (on rk3588)
> 
> I had a quick look, looks good overall, for the moment I have only a
> question, see below.
> 
> I aim at reviewing this patch in depth, but it's not an easy one to
> digest. Would it be feasible to split it in smaller logical steps? If it
> is, please do, it would be very helpful for reviewing.

Yes, this commit will be split into several smaller ones in v10.

> 
>> @@ -1532,6 +1481,7 @@ EXPORT_SYMBOL_GPL(analogix_dp_resume);
>>
>>   int analogix_dp_bind(struct analogix_dp_device *dp, struct drm_device *drm_dev)
>>   {
>> +	struct drm_bridge *bridge = &dp->bridge;
>>   	int ret;
>>
>>   	dp->drm_dev = drm_dev;
>> @@ -1545,7 +1495,18 @@ int analogix_dp_bind(struct analogix_dp_device *dp, struct drm_device *drm_dev)
>>   		return ret;
>>   	}
>>
>> -	ret = drm_bridge_attach(dp->encoder, &dp->bridge, NULL, 0);
>> +	if (dp->plat_data->panel)
>> +		bridge->ops = DRM_BRIDGE_OP_MODES | DRM_BRIDGE_OP_DETECT;
>> +	else
>> +		bridge->ops = DRM_BRIDGE_OP_EDID | DRM_BRIDGE_OP_DETECT;
>> +
>> +	bridge->of_node = dp->dev->of_node;
>> +	bridge->type = DRM_MODE_CONNECTOR_eDP;
>> +	ret = devm_drm_bridge_add(dp->dev, &dp->bridge);
> 
> Can devm_drm_bridge_add() be added to analogix_dp_probe() instead?

Will do in v10.

> 
>> +	if (ret)
>> +		goto err_unregister_aux;
>> +
>> +	ret = drm_bridge_attach(dp->encoder, bridge, NULL, DRM_BRIDGE_ATTACH_NO_CONNECTOR);
>>   	if (ret) {
>>   		DRM_ERROR("failed to create bridge (%d)\n", ret);
>>   		goto err_unregister_aux;

Best regards,
Damon


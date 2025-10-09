Received: from mail-m3290.qiye.163.com (mail-m3290.qiye.163.com [220.197.32.90])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 338A82D0C7A;
	Thu,  9 Oct 2025 07:44:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.90
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759995871; cv=none; b=R8eqP3jl5AyTlGdMLOxb5cIwKL4FamVWbUFYcP9obNnWKKPjttL6je0nNZ7ARbs0nejuUT0wLFHCFpQwDP2xtG4NxEQhJrlpH7bhaZY0jxwsEUhUw9p9iK0WL/HBq5Kg1VejCicRlOqFJ0Y5T5RJSoREh012mD+1j7QjZMLOKNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759995871; c=relaxed/simple;
	bh=A6klI/zLMxJ2hB4Xd5d1g4rb3kQELZncCrSJWRc97i8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AimM87RGF9WUg41YWxs6A2ga7v79+xHiwQSjrNaVbQnL9ll4jXVNOYTSN66bGauJmirIZHP48gAsiCoFEpBUnYCn+0oF8SbzBnI1XA9Up+4eyTEe5DjsNwiePtFM+nupuGoSFmL7zwoz4XI1xrmIfKXERKsgSf1s1CJNou5I+tQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com; spf=pass smtp.mailfrom=rock-chips.com; dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b=g5bSR7Jc; arc=none smtp.client-ip=220.197.32.90
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b="g5bSR7Jc"
Received: from [172.16.12.26] (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 253de3988;
	Thu, 9 Oct 2025 10:01:38 +0800 (GMT+08:00)
Message-ID: <d4353b1e-53e5-4a5f-8da0-df3493d95ec3@rock-chips.com>
Date: Thu, 9 Oct 2025 10:01:39 +0800
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 07/18] drm/exynos: exynos_dp: Apply legacy bridge to
 parse the display-timings node
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, inki.dae@samsung.com, sw0312.kim@samsung.com,
 kyungmin.park@samsung.com, krzk@kernel.org, alim.akhtar@samsung.com,
 jingoohan1@gmail.com, p.zabel@pengutronix.de, hjc@rock-chips.com,
 heiko@sntech.de, andy.yan@rock-chips.com, dianders@chromium.org,
 m.szyprowski@samsung.com, luca.ceresoli@bootlin.com, jani.nikula@intel.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-rockchip@lists.infradead.org
References: <20250930090920.131094-1-damon.ding@rock-chips.com>
 <20250930090920.131094-8-damon.ding@rock-chips.com>
 <73bpf77trhqdo5amfxbn4qhlwf4ta7hmouwfen7m3aslycd3bj@72artzwafbmq>
Content-Language: en-US
From: Damon Ding <damon.ding@rock-chips.com>
In-Reply-To: <73bpf77trhqdo5amfxbn4qhlwf4ta7hmouwfen7m3aslycd3bj@72artzwafbmq>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-HM-Tid: 0a99c6b3d38b03a3kunm9ba9a00aa3be80
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGRlLGFZPTh9CGUxIGUNMQklWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSEpKQk
	1VSktLVUpCWQY+
DKIM-Signature: a=rsa-sha256;
	b=g5bSR7JcicF4l8Xg5hsi1shmjZSmPq7LMdHC3p6KV19qTLOcogrtafU3cM+wvqokGzzEZTkyzGaDS7cVjiwUCI4qOWmqVd+YzemXrDWbkfLuzNP5flW+RxlNr/fEBr7DyIgul3sJ5uvZLX97Z1l67egKD79TmgMoVQjFgU3sJ50=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=hZLQq1cFpDnE3WeOTXxYAWB3fTkXBtyZpLnTjz0oWFs=;
	h=date:mime-version:subject:message-id:from;

Hi Dmitry,

On 10/1/2025 4:17 AM, Dmitry Baryshkov wrote:
> On Tue, Sep 30, 2025 at 05:09:09PM +0800, Damon Ding wrote:
>> If there is neither a panel nor a bridge, the display timing can be
>> parsed from the display-timings node under the dp node.
>>
>> In order to get rid of &analogix_dp_plat_data.get_modes() and make
>> the codes more consistent, apply DRM legacy bridge to parse display
>> timings.
>>
>> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
>>
>> ------
>>
>> Changes in v6:
>> - Apply DRM legacy bridge to parse display timings intead of
>>    implementing the same codes only for Exynos DP.
>> ---
>>   drivers/gpu/drm/exynos/Kconfig     |  1 +
>>   drivers/gpu/drm/exynos/exynos_dp.c | 71 +++++++++---------------------
>>   2 files changed, 22 insertions(+), 50 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/exynos/Kconfig b/drivers/gpu/drm/exynos/Kconfig
>> index 0d13828e7d9e..66665d317848 100644
>> --- a/drivers/gpu/drm/exynos/Kconfig
>> +++ b/drivers/gpu/drm/exynos/Kconfig
>> @@ -72,6 +72,7 @@ config DRM_EXYNOS_DP
>>   	select DRM_ANALOGIX_DP
>>   	select DRM_DISPLAY_DP_HELPER
>>   	default DRM_EXYNOS
>> +	select DRM_LEGACY_BRIDGE
>>   	select DRM_PANEL
>>   	help
>>   	  This enables support for DP device.
>> diff --git a/drivers/gpu/drm/exynos/exynos_dp.c b/drivers/gpu/drm/exynos/exynos_dp.c
>> index e20513164032..507d0a98fe5b 100644
>> --- a/drivers/gpu/drm/exynos/exynos_dp.c
>> +++ b/drivers/gpu/drm/exynos/exynos_dp.c
>> @@ -19,6 +19,7 @@
>>   #include <video/videomode.h>
>>   
>>   #include <drm/bridge/analogix_dp.h>
>> +#include <drm/bridge/legacy-bridge.h>
>>   #include <drm/drm_atomic_helper.h>
>>   #include <drm/drm_bridge.h>
>>   #include <drm/drm_crtc.h>
>> @@ -38,11 +39,23 @@ struct exynos_dp_device {
>>   	struct drm_device          *drm_dev;
>>   	struct device              *dev;
>>   
>> -	struct videomode           vm;
>>   	struct analogix_dp_device *adp;
>>   	struct analogix_dp_plat_data plat_data;
>>   };
>>   
>> +static int exynos_dp_legacy_bridge_init(struct exynos_dp_device *dp,
>> +					struct drm_bridge **bridge)
>> +{
>> +	if (!bridge)
>> +		return -EINVAL;
> 
> Well, this can't happen, can it?
> 
>> +
>> +	*bridge = devm_drm_legacy_bridge(dp->dev, dp->dev->of_node, DRM_MODE_CONNECTOR_eDP);
>> +	if (IS_ERR(*bridge))
>> +		return PTR_ERR(*bridge);
>> +
>> +	return 0;
>> +}
> 
> I'd suggest inlining the function. It doesn't make sense to have
> one-line wrapper.
> 

Will do in v7.

>> +
>>   static int exynos_dp_crtc_clock_enable(struct analogix_dp_plat_data *plat_data,
>>   				bool enable)
>>   {
> 
> [...]
> 
>>   static int exynos_dp_bridge_attach(struct analogix_dp_plat_data *plat_data,
>>   				   struct drm_bridge *bridge,
>>   				   struct drm_connector *connector)
>>   {
>>   	struct exynos_dp_device *dp = to_dp(plat_data);
>> +	enum drm_bridge_attach_flags flags = 0;
>>   	int ret;
>>   
>>   	/* Pre-empt DP connector creation if there's a bridge */
>>   	if (plat_data->next_bridge) {
>> -		ret = drm_bridge_attach(&dp->encoder, plat_data->next_bridge, bridge,
>> -					0);
>> +		if (drm_bridge_is_legacy(plat_data->next_bridge))
> 
> I see... You are going to kill this line in one of the next patches, but
> the API will stay. I suggest adding a flag to the exynos_dp_device and
> then removing the flag once you migrate to drm_bridge_connector.
> 

Yes, using a temporary flag is a better approach.

>> +			flags = DRM_BRIDGE_ATTACH_NO_CONNECTOR;
>> +
>> +		ret = drm_bridge_attach(&dp->encoder, plat_data->next_bridge, bridge, flags);
>>   		if (ret)
>>   			return ret;
>>   	}
> 

Best regards,
Damon


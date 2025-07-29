Received: from mail-m3285.qiye.163.com (mail-m3285.qiye.163.com [220.197.32.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C555026AAB7;
	Tue, 29 Jul 2025 08:36:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.85
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753778211; cv=none; b=t5NXoKxAnC7qwiZS0e4zxSdwEIr37Q2P9buCL6/662Zh17GZuRcsuyaj4xfiZj1Zi88Wis03D9v9nqQqAbfX+JwHEwMhbJGjqfLMSK9ISZSca2A8PG9vRHfdAjC7JGbgHN26R85nGkVkqg/cDu1xuzyZ9jVGxyQhV93zSFrCSUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753778211; c=relaxed/simple;
	bh=g206Alu73JgT5QWpvgVCLllZq5IsX/DhoDyib6ET+ug=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=eVpbBW8EEB/XmCvrHLp6OzTzWtHrZ1hztj/965cewrd/vYuAOZ7xGiKxzdk9Q9+muFBb7AiLO4HvcI2a/mV3siZUXkQdQ/OMBedQlFbG1p1D7xa41V0gV42ayOSiAe6LPjfo/Bhb75JwDUL8l//Fgi8eZwyJS/4W3o+nCb++J/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com; spf=pass smtp.mailfrom=rock-chips.com; dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b=Q80s3a/t; arc=none smtp.client-ip=220.197.32.85
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b="Q80s3a/t"
Received: from [172.16.12.26] (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 1d9827a9b;
	Tue, 29 Jul 2025 16:31:28 +0800 (GMT+08:00)
Message-ID: <7445b3d4-0e88-40e5-bcbd-8ea60c35d5bb@rock-chips.com>
Date: Tue, 29 Jul 2025 16:31:27 +0800
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Damon Ding <damon.ding@rock-chips.com>
Subject: Re: [PATCH v3 04/14] drm/bridge: analogix_dp: Add
 &analogix_dp_plat_data.bridge
To: Maxime Ripard <mripard@kernel.org>
Cc: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 jingoohan1@gmail.com, inki.dae@samsung.com, sw0312.kim@samsung.com,
 kyungmin.park@samsung.com, krzk@kernel.org, alim.akhtar@samsung.com,
 hjc@rock-chips.com, heiko@sntech.de, andy.yan@rock-chips.com,
 dmitry.baryshkov@oss.qualcomm.com, l.stach@pengutronix.de,
 dianders@chromium.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-rockchip@lists.infradead.org
References: <20250724080304.3572457-1-damon.ding@rock-chips.com>
 <20250724080304.3572457-5-damon.ding@rock-chips.com>
 <20250729-wooden-opalescent-baboon-f24fa2@houat>
Content-Language: en-US
In-Reply-To: <20250729-wooden-opalescent-baboon-f24fa2@houat>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-HM-Tid: 0a98554edd1703a3kunma08ba3a841d6e7
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQkNMGlYaGh1JSElDSR5MTBhWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
	hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=Q80s3a/tV4F2URBBklVXAzRfnVtfBo4yEdM/EZTEwDhDT0yBlKMCM/g4YkEMUHGcQZuzRB36AwgHJagRlvr2/emhFxN1gxf3dbNEzpE1/e+oHBfC3qFnlFMNZKoKPzivDTWL1SsMk8EJefvVkEZjqfv+ae5P4YR/7x2BVNQkl2g=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=hy5UWCAEJ8QpZLBQjuKhMArV1bapCPsMjvUUWG3LcSY=;
	h=date:mime-version:subject:message-id:from;

Hi Maxime,

On 2025/7/29 15:30, Maxime Ripard wrote:
> Hi,
> 
> On Thu, Jul 24, 2025 at 04:02:54PM +0800, Damon Ding wrote:
>> In order to move the parnel/bridge parsing and attachmenet to the
>> Analogix side, add component struct drm_bridge *bridge to platform
>> data struct analogix_dp_plat_data.
>>
>> The movemenet makes sense because the panel/bridge should logically
>> be positioned behind the Analogix bridge in the display pipeline.
>>
>> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
>> ---
>>   include/drm/bridge/analogix_dp.h | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/include/drm/bridge/analogix_dp.h b/include/drm/bridge/analogix_dp.h
>> index cf17646c1310..15cb6b706e9f 100644
>> --- a/include/drm/bridge/analogix_dp.h
>> +++ b/include/drm/bridge/analogix_dp.h
>> @@ -27,6 +27,7 @@ static inline bool is_rockchip(enum analogix_dp_devtype type)
>>   struct analogix_dp_plat_data {
>>   	enum analogix_dp_devtype dev_type;
>>   	struct drm_panel *panel;
>> +	struct drm_bridge *bridge;
>>   	struct drm_encoder *encoder;
>>   	struct drm_connector *connector;
>>   	bool skip_connector;
> 
> So it's not the analogix_dp bridge, but the bridge after that if any?
> 
> You should probably change it to next_bridge to avoid any confusion.
> 

Yes, &analogix_dp_plat_data.bridge is intended to be the next bridge 
after analogix_dp bridge.

I will rename it to &analogix_dp_plat_data.next_bridge as suggested and 
update it in the next version.

Best regards,
Damon


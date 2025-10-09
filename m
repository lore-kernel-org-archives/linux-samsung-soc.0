Received: from mail-m1973194.qiye.163.com (mail-m1973194.qiye.163.com [220.197.31.94])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A50222A7E0;
	Thu,  9 Oct 2025 03:15:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.94
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759979721; cv=none; b=CJwaIu7Frtzb8m2B5MHD/BqE4GW8L2nSo9zCqXJMgFJMstimkfF3ajNIZzD0Xuqa4i5pDxkl88/luR4Q3Xk7yJWRnQOfG5rzzOMDUvM3uCeh3d8wn2SmTzZVQAt2fAa/BjjvWV5bJXkCTshrkErvOfQU37XilgllmhCfghdOZno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759979721; c=relaxed/simple;
	bh=rd/lbmT2upkHWzOJOfdBnwlgLrDr7wZmyHVjlFZei44=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=V0ReknH0GxeZHBI48A3WRCxMuKlTKnR38FTTEYakhK16K6iy9VUbXXDnttSMharAxzqnDcqcWI1XuJn/Hoj0r/loivVimmX9gG45V0+o9tZtVxz8MevJu9fSoYsMI6nUSfuI08xkCzNVn5SI58n/BVMfjjiIDxlyQ8xnTpZR/a8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com; spf=pass smtp.mailfrom=rock-chips.com; dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b=iQs0T/oM; arc=none smtp.client-ip=220.197.31.94
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b="iQs0T/oM"
Received: from [172.16.12.26] (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 2540f1755;
	Thu, 9 Oct 2025 11:15:12 +0800 (GMT+08:00)
Message-ID: <600da5e2-da28-429b-ba7a-6ddabeeb044d@rock-chips.com>
Date: Thu, 9 Oct 2025 11:15:13 +0800
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 11/18] drm/display: bridge_connector: Ensure last
 bridge determines EDID/modes detection capabilities
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
 <20250930090920.131094-12-damon.ding@rock-chips.com>
 <4r25h5uaamfkprrmvrtdqfjlcgcnkfyca2o5q53hteta7rlrbq@xqlrjxhi7z2u>
Content-Language: en-US
From: Damon Ding <damon.ding@rock-chips.com>
In-Reply-To: <4r25h5uaamfkprrmvrtdqfjlcgcnkfyca2o5q53hteta7rlrbq@xqlrjxhi7z2u>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-HM-Tid: 0a99c6f72dc603a3kunmfe4252c4a5c7bd
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGhgfT1ZMGkxMTE1KSUtCTB5WFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSEpKQk
	1VSktLVUpCWQY+
DKIM-Signature: a=rsa-sha256;
	b=iQs0T/oMZ2uhdZcdybDbf32wCENpnpEDgP3/4nIpyZchoiqx101XIqUFLuYnQ8IcKx4Znl6ZyzkvOgsZ4UWhvqaSNB33nuRn9W/w1YboaMZpZdr5IObRzog7tr1A8nYt2b/3iKtdXeVXmfBjPuu7pX24s1jtIDZnRMVvEGAEOEc=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=iABHohkXXscty3ygSSBQiwpr5DtvMO/CY8j782HEq18=;
	h=date:mime-version:subject:message-id:from;

Hi Dmitry,

On 10/1/2025 4:21 AM, Dmitry Baryshkov wrote:
> On Tue, Sep 30, 2025 at 05:09:13PM +0800, Damon Ding wrote:
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
>> ---
>>   .../gpu/drm/display/drm_bridge_connector.c    | 42 +++++++++++++++++++
>>   1 file changed, 42 insertions(+)
>>
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> 
> But I'd suggest pulling this to a top of the series to let others also
> take a look at it.
> 

Will do in v7.

Best regards,
Damon


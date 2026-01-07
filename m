Received: from mail-m19731116.qiye.163.com (mail-m19731116.qiye.163.com [220.197.31.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91D0918A921;
	Wed,  7 Jan 2026 02:37:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767753433; cv=none; b=klWLnKWXVXKZAQxgxEcrOZmM01dppgHpAz3v187JYeIHjjEIUb/D5oVZ4RxYegQU3Sld/TjUWPiklI+FDW+Q8y+27NVFdQbWkZYsiBxspMn9NtfuoFR1G2qU5RTVWvlCr+8Ng0xhE4Qkx4WiZYwtbmkQPAQ1wkO+EAA7gkbmvow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767753433; c=relaxed/simple;
	bh=ICn4qhhsrF4pu4EGci52koh5C3HnFNE/YySH2HqVflY=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=pAY0iFKxWqMiFfHdaQqUXm1ixAciUI1UQcfue01K/cP7g3TQgwpDhdh2rp8usBIY4ixvh7oC5fCJDOOndH6R05LT4yBo4qtePgdxME0LCktnPvt/vef8KgvMQL4vzfAXTyA9Q4egIQ9QAZx3bJejoLmCzzQBhdFVErfHaVjBjnw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com; spf=pass smtp.mailfrom=rock-chips.com; dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b=XTc3ywoN; arc=none smtp.client-ip=220.197.31.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b="XTc3ywoN"
Received: from [172.16.12.43] (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 2fbef9ce3;
	Wed, 7 Jan 2026 10:36:57 +0800 (GMT+08:00)
Message-ID: <f644a5ab-5dd1-4f4e-b2e9-3585dec81a96@rock-chips.com>
Date: Wed, 7 Jan 2026 10:36:57 +0800
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Damon Ding <damon.ding@rock-chips.com>
Subject: Re: [PATCH v8 04/18] drm/bridge: analogix_dp: Add
 &analogix_dp_plat_data.next_bridge
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
References: <20251217093321.3108939-1-damon.ding@rock-chips.com>
 <20251217093321.3108939-5-damon.ding@rock-chips.com>
 <DFCCU8AN0GZQ.2CYTKKV40JYLI@bootlin.com>
 <187b2c32-5a10-4555-8d49-cf1ee86a8eaa@rock-chips.com>
Content-Language: en-US
In-Reply-To: <187b2c32-5a10-4555-8d49-cf1ee86a8eaa@rock-chips.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9b965081fc03a3kunme7026636f3fcd
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQx5DHlYdTEofSRpLSklPH0JWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSEpKQk
	1VSktLVUpCWQY+
DKIM-Signature: a=rsa-sha256;
	b=XTc3ywoNaUASUctvi7aqpNtFJToV3y76ir90mhINcT3SspMUdeAXdYHXWAhULkBokH/TOTyxAl1xgR5zUham/P2R2/bTWNZKibwHhve030/J2UcGgRkWDPAlabHxczeZ0+/YEt8YtK3jl3yaUXGchACliUpEFdyJR41n+ftMllA=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=XG1ve9KKgO4Stoa/EGMqCZSP6qpS5GUgHSKbTxkyq9Q=;
	h=date:mime-version:subject:message-id:from;

Hi Luca,

On 1/4/2026 10:51 AM, Damon Ding wrote:
> Hi Luca,
> 
> On 12/31/2025 7:11 PM, Luca Ceresoli wrote:
>> Hello Damon,
>>
>> On Wed Dec 17, 2025 at 10:33 AM CET, Damon Ding wrote:
>>> In order to move the panel/bridge parsing and attachmenet to the
>>> Analogix side, add component struct drm_bridge *next_bridge to
>>> platform data struct analogix_dp_plat_data.
>>>
>>> The movement makes sense because the panel/bridge should logically
>>> be positioned behind the Analogix bridge in the display pipeline.
>>>
>>> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
>>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>>> Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
>>>
>>> ---
>>>
>>> Changes in v4:
>>> - Rename the &analogix_dp_plat_data.bridge to
>>>    &analogix_dp_plat_data.next_bridge
>>> ---
>>>   include/drm/bridge/analogix_dp.h | 1 +
>>>   1 file changed, 1 insertion(+)
>>>
>>> diff --git a/include/drm/bridge/analogix_dp.h b/include/drm/bridge/ 
>>> analogix_dp.h
>>> index cf17646c1310..582357c20640 100644
>>> --- a/include/drm/bridge/analogix_dp.h
>>> +++ b/include/drm/bridge/analogix_dp.h
>>> @@ -27,6 +27,7 @@ static inline bool is_rockchip(enum 
>>> analogix_dp_devtype type)
>>>   struct analogix_dp_plat_data {
>>>       enum analogix_dp_devtype dev_type;
>>>       struct drm_panel *panel;
>>> +    struct drm_bridge *next_bridge;
>>>       struct drm_encoder *encoder;
>>>       struct drm_connector *connector;
>>>       bool skip_connector;
>>
>> It took a while to understand why you are adding the next_bridge 
>> pointer in
>> struct analogix_dp_plat_data instead of struct analogix_dp_device, 
>> where it
>> would be more natural. I found an answer in patch 16: with current 
>> code you
>> need to place next_bridge in struct analogix_dp_plat_data because it is
>> used by user drivers to attach, and those drivers have no access to 
>> struct
>> analogix_dp_device. However patch 16 (which looks a very good cleanup 
>> BTW)
>> next_bridge can be moved to struct analogix_dp_device.
>>
>> So I'd suggest to move patch 16 before this one if it easily doable, so
>> that you can introduce next_bridge in struct analogix_dp_device from the
>> beginning. Should that be impossible, you can send a separate patch to 
>> move
>> next_bridge, after patch 16.
>>
>>
> 
> Thanks for your nice suggestion! After patch 16, bridge attachment is 
> unified to the Analogix side, which acts as a common bridge driver for 
> both the Rockchip and Exynos sides, so moving next_bridge there makes 
> perfect sense. I will add a separate patch to move next_bridge in v9.
> 
> 

My apologies for reversing the plan to move next_bridge to the Analogix 
side in v9 -- I only considered the Rockchip side before.

When I tried modifying the code based on your suggestion, I found it 
better to keep &analogix_plat_data.next_bridge as is. This is because 
the Exynos side needs to maintain compatibility with the legacy method 
of parsing panels and bridges, so the next bridge isn't always parsed by 
the common Analogix side driver.

This patch series has been pending for ages, and I'm even a bit fuzzy on 
the details myself. ;-)

Best regards,
Damon


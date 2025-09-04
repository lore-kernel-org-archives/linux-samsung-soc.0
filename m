Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com [210.118.77.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8149E302CC4
	for <linux-samsung-soc@vger.kernel.org>; Thu,  4 Sep 2025 13:27:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.118.77.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756992452; cv=none; b=ewz43xryLbhGxJ/yHS+HN8JEmdcmS6rJAF4psLBnTlvWothoYfeqZpzfKPqY81ewe0/O8k4mpQk8cjL6x86eHXvsvnr8NbvAqCwJ55iBn1p+yYr3DvBlJ2WpvQ7bVpDl+xELDor416GQjrFikgEUf63aSOL3y2+5JnpyIweLS2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756992452; c=relaxed/simple;
	bh=4QCE683gFrC3oB20AMpMuljNRHfdz44NR0JejZ8MJcc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:From:In-Reply-To:
	 Content-Type:References; b=gncI0NZWYxsM7a8x9qwNHWf6EYWk7f993gcPvwDT/39Q9vO93Duoy7Thb4QNnfgkhJaYT6OeQWBWa1D5zf518bLrRHxPvbNy247OmdJE7pVwS0NwYYDvT0qXQjOQZ0vdwS0YvpqdCU9ljTY5SskI0AGLcJjD84lj0q1rOoraY10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=D+Of34zz; arc=none smtp.client-ip=210.118.77.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="D+Of34zz"
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20250904132728euoutp01768e7162a44c34f9133dfddc4e8419fa~iF1K5Xaf12954329543euoutp01b
	for <linux-samsung-soc@vger.kernel.org>; Thu,  4 Sep 2025 13:27:28 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20250904132728euoutp01768e7162a44c34f9133dfddc4e8419fa~iF1K5Xaf12954329543euoutp01b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1756992448;
	bh=OuqZMaZEY3Ro7lOt8/v6vij9JESnmu0skXkRr3yqkBo=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=D+Of34zz2dwO58oipgkskjDy0ppJoZmQXo63nqEJfv72IvnnIB8uWBGApOhhQvZdL
	 /9wTKwo+V35VsuIyoJE0tpEyKbCFcV5vWeI//gOnrow0l9jGlNCA1Lpj0D2QTZj7Ny
	 0cuZAif42CpQkC1UD2tHFGIwv7Ce89dQo4XEPPao=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20250904132728eucas1p110dd7341b827ecb00d326aaab1b6e052~iF1KTEFC-1354913549eucas1p1Y;
	Thu,  4 Sep 2025 13:27:28 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
	eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20250904132725eusmtip10df52413ab5451a89e7ae40f97632d99~iF1H12Bu90185801858eusmtip1I;
	Thu,  4 Sep 2025 13:27:25 +0000 (GMT)
Message-ID: <4939d55e-b560-4235-8295-adf8e48d9b74@samsung.com>
Date: Thu, 4 Sep 2025 15:27:24 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Subject: Re: [PATCH v4 00/13] Apply drm_bridge_connector and panel_bridge
 helper for the Analogix DP driver
To: Damon Ding <damon.ding@rock-chips.com>, andrzej.hajda@intel.com,
	neil.armstrong@linaro.org, rfoss@kernel.org
Cc: Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
	jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
	mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
	jingoohan1@gmail.com, inki.dae@samsung.com, sw0312.kim@samsung.com,
	kyungmin.park@samsung.com, krzk@kernel.org, alim.akhtar@samsung.com,
	hjc@rock-chips.com, heiko@sntech.de, andy.yan@rock-chips.com,
	dmitry.baryshkov@oss.qualcomm.com, l.stach@pengutronix.de,
	dianders@chromium.org, dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-rockchip@lists.infradead.org
Content-Language: en-US
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <825ff59f-0a97-49a1-a210-a7ee275364bc@rock-chips.com>
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250904132728eucas1p110dd7341b827ecb00d326aaab1b6e052
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20250814104818eucas1p2c5029f6d5997f4fafd6370f9e7fb2264
X-EPHeader: CA
X-CMS-RootMailID: 20250814104818eucas1p2c5029f6d5997f4fafd6370f9e7fb2264
References: <CGME20250814104818eucas1p2c5029f6d5997f4fafd6370f9e7fb2264@eucas1p2.samsung.com>
	<20250814104753.195255-1-damon.ding@rock-chips.com>
	<a3a2f8be-2c3c-49e7-b27a-72364ea48b06@samsung.com>
	<7cb50c9c-ac41-43b6-8c69-5f184e7c94cf@samsung.com>
	<1ccd3889-5f13-4609-9bd8-2c208e17fc96@rock-chips.com>
	<f2ebfff1-08ab-4f26-98f3-6d6415d58a5e@samsung.com>
	<a5e613ba-b404-40ae-b467-0f6f223f5d4c@rock-chips.com>
	<461daea4-5582-4aa2-bfea-130d2fb93717@samsung.com>
	<46f9137e-402d-4c0f-a224-10520f80c8b4@rock-chips.com>
	<ea57ca6e-4000-49f7-8e0b-899f34b7693a@samsung.com>
	<825ff59f-0a97-49a1-a210-a7ee275364bc@rock-chips.com>

On 04.09.2025 05:19, Damon Ding wrote:
> On 9/1/2025 6:25 PM, Marek Szyprowski wrote:
>> On 01.09.2025 05:41, Damon Ding wrote:
>>> On 8/29/2025 4:23 PM, Marek Szyprowski wrote:
>>>> On 29.08.2025 10:08, Damon Ding wrote:
>>>>> On 8/20/2025 5:20 AM, Marek Szyprowski wrote:
>>>>>> On 15.08.2025 04:59, Damon Ding wrote:
>>>>>>> On 2025/8/15 5:16, Marek Szyprowski wrote:
>>>>>>>> On 14.08.2025 16:33, Marek Szyprowski wrote:
>>>>>>>>> On 14.08.2025 12:47, Damon Ding wrote:
>>>>>>>>>> PATCH 1 is a small format optimization for struct
>>>>>>>>>> analogid_dp_device.
>>>>>>>>>> PATCH 2 is to perform mode setting in
>>>>>>>>>> &drm_bridge_funcs.atomic_enable.
>>>>>>>>>> PATCH 3-6 are preparations for apply drm_bridge_connector 
>>>>>>>>>> helper.
>>>>>>>>>> PATCH 7 is to apply the drm_bridge_connector helper.
>>>>>>>>>> PATCH 8-10 are to move the panel/bridge parsing to the Analogix
>>>>>>>>>> side.
>>>>>>>>>> PATCH 11-12 are preparations for apply panel_bridge helper.
>>>>>>>>>> PATCH 13 is to apply the panel_bridge helper.
>>>>>>>>> ...
>>>>>>
>>>>>
>>>>> Could you please provide the related DTS file for the test? I will
>>>>> also try to find out the reason for this unexpected issue. ;-)
>>>>
>>>> Unfortunately I didn't find enough time to debug this further. The 
>>>> above
>>>> log is from Samsung Snow Chromebook,
>>>> arch/arm/boot/dts/samsung/exynos5250-snow.dts
>>>>
>>>>
>>>
>>> I compare the differences in the following display path before and
>>> after this patch series:
>>>
>>> exynos_dp -> nxp-ptn3460 -> panel "auo,b116xw03"
>>>
>>> The issue is likely caused by the &drm_connector_funcs.detect()
>>> related logic. Before this patch series, the nxp-ptn3460 connector is
>>> always connector_status_connected because there is not available
>>> &drm_connector_funcs.detect(). After it, the DRM_BRIDGE_OP_DETECT flag
>>> make the connection status depend on analogix_dp_bridge_detect().
>>>
>>> Could you please add the following patches additionally and try again?
>>> (Not the final solution, just validation)
>>>
>>> diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
>>> b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
>>> index a93ff8f0a468..355911c47354 100644
>>> --- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
>>> +++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
>>> @@ -1491,9 +1491,11 @@ int analogix_dp_bind(struct analogix_dp_device
>>> *dp, struct drm_device *drm_dev)
>>>                  }
>>>          }
>>>
>>> -       bridge->ops = DRM_BRIDGE_OP_DETECT |
>>> -                     DRM_BRIDGE_OP_EDID |
>>> +       bridge->ops = DRM_BRIDGE_OP_EDID |
>>>                        DRM_BRIDGE_OP_MODES;
>>> +       if (drm_bridge_is_panel(dp->plat_data->next_bridge))
>>> +               bridge->ops |= DRM_BRIDGE_OP_DETECT;
>>> +
>>>          bridge->of_node = dp->dev->of_node;
>>>          bridge->type = DRM_MODE_CONNECTOR_eDP;
>>>          ret = devm_drm_bridge_add(dp->dev, &dp->bridge);
>>
>> It is better. Now the display panel is detected and reported to
>> userspace, but it looks that something is not properly initialized,
>> because there is garbage instead of the proper picture.
>>
>
> I simulated the display path mentioned above on my RK3588S EVB1 Board.
> To my slight surprise, it displayed normally with the reported 
> connector type DRM_MODE_CONNECTOR_LVDS. ;-)
>
> The modifications included:
> 1.Synchronized the Analogix DP ralated DT configurations with Samsung 
> Snow Chromebook.
> 2.Skipped the I2C transfers and GPIO operations in nxp-ptn3460 driver.
> 3.Set the EDID to that of eDP Panel LP079QX1-SP0V forcibly.
>
> Additionally, I added debug logs to verify whether the functions in 
> ptn3460_bridge_funcs were actually called.
>
> Did you encounter any unexpected logs during your investigation? I'd 
> like to perform additional tests on this issue. :-)


Okay, I've finally went to the office and tested manually all 3 
Chromebook boards witch use exynos-dp based display hardware. Previously 
I only did the remote tests and observed result on a webcam, which was 
not directed directly at the tested displays, so I only saw the glare 
from the display panel.

The results are as follows:

1. Snow (arch/arm/boot/dts/samsung/exynos5250-snow.dts) - exynos-dp -> 
nxp-ptn3460 1366x768 lvds panel - works fine with the above mentioned 
change.

2. Peach-Pit (arch/arm/boot/dts/samsung/exynos5420-peach-pit.dts) - 
exynos-dp -> parade,ps8625 -> auo,b116xw03 1366x768 lvds panel - 
displays garbage, this was the only board I previously was able to see 
partially on the webcam.

3. Peach-Pi (arch/arm/boot/dts/samsung/exynos5800-peach-pi.dts) - 
exynos-dp -> auo,b133htn01 1920x1080 edp panel - also displays garbage.

Then I found why both Peach boards displays garbage on boot - the 
framebuffer emulation is initialized for 1024x786 resolution, which is 
not handled by those panels. This is a bit strange, because the 
connector implemented by the panel reports proper native mode to drm and 
userspace. 'modetest -c' shows the right resolution. Also when I run 
'modetest -s' with the panel's native resolution then the test pattern 
is correctly displayed on all three boards.


Then I've played a bit with the analogix code and it looks that this 
1024x768 mode is some kind default mode which comes from 
analogix_dp_bridge_edid_read() function, which has been introduced by 
this patchset. When I removed DRM_BRIDGE_OP_EDID flag from bridge->ops, 
then I got it finally working again properly on all three boards. I hope 
this helps fixing this issue.



Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland


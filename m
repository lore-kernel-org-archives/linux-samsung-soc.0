Received: from mail-m3277.qiye.163.com (mail-m3277.qiye.163.com [220.197.32.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2598222B594;
	Tue,  3 Feb 2026 01:31:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770082277; cv=none; b=J/zBDo7RnKlsMf7bUFYBZHx5+DhSLyRvokq/VcH0pTrp9FGAjyHsHfkDopc45YRJxuNFCTrikRQt0M78FzWQryWRou5/58LLcEcrBfHgKGoASORO+bGhTqOYew+yGfljpRYLMG22MGNwvbrWLIb4bJ8tM9/b1SoRJjeIQV4bcAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770082277; c=relaxed/simple;
	bh=kKgVz+SvpsBDnJ6OuqexchxFrqTsqJTgg4pHTFqqgTg=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=Z2+EulqSlmtX9ItS78AGbcMjb/n+nIVaQtKkPLNY4A5DGGYUPO+IizBcXOvayKF5+p08sUBEq5TzAQVuWVqss1jncvvL8fnzRY/5oLi0w5uGTF2MkdhHKuUep6fhkTQDnYK4xxCAgIOCVdHtkInbN2R2wrQw06Wm8yqja9Img9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com; spf=pass smtp.mailfrom=rock-chips.com; dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b=PNeLKk6I; arc=none smtp.client-ip=220.197.32.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b="PNeLKk6I"
Received: from [172.16.12.43] (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 32e1603b0;
	Tue, 3 Feb 2026 09:31:06 +0800 (GMT+08:00)
Message-ID: <9e1da672-a52d-4ec3-a20a-fe6f8ca15496@rock-chips.com>
Date: Tue, 3 Feb 2026 09:31:05 +0800
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 05/18] drm/bridge: Move legacy bridge driver out of imx
 directory for multi-platform use
From: Damon Ding <damon.ding@rock-chips.com>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>, andrzej.hajda@intel.com,
 neil.armstrong@linaro.org, rfoss@kernel.org,
 dmitry.baryshkov@oss.qualcomm.com
Cc: Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
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
References: <20251217093321.3108939-1-damon.ding@rock-chips.com>
 <20251217093321.3108939-6-damon.ding@rock-chips.com>
 <DG2S064XPGXL.1MQDAKWZEK50K@bootlin.com>
 <7256ecf9-b10b-428c-a1a6-e35e80a686ed@rock-chips.com>
Content-Language: en-US
In-Reply-To: <7256ecf9-b10b-428c-a1a6-e35e80a686ed@rock-chips.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9c211febb503a3kunmdf9f046968496a
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQ0waTVYaHxlIHUhDGEJNGEJWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSEpKQk
	1VSktLVUpCWQY+
DKIM-Signature: a=rsa-sha256;
	b=PNeLKk6IXR55KNlke+4USCf5fom3f/N3+2kARL8pH0JwEPUlW60pXl+rtEoTZiX5O8yGuHc/m5vU/SaCJ1Gp07bJlpVKV7LVXgo8PO9QLI5HrJU160XWWzJRmQP51/j2tw/tfdjC+39EH3iKM0kT7IBxukZVeDjGby7EtvavdRI=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=80iknK13Kq+wx2P2fwBcvk34JAYKQJmD7fJDTp2xaOU=;
	h=date:mime-version:subject:message-id:from;

Hi,

On 2/2/2026 10:54 AM, Damon Ding wrote:
> Hi Luca,
> 
> On 1/31/2026 8:33 PM, Luca Ceresoli wrote:
>> Hello Damon, Dmitry,
>>
>> On Wed Dec 17, 2025 at 10:33 AM CET, Damon Ding wrote:
>>> As suggested by Dmitry, the DRM legacy bridge driver can be pulled
>>> out of imx/ subdir for multi-platform use. The driver is also renamed
>>> to make it more generic and suitable for platforms other than i.MX.
>>>
>>> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
>>> Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>>> Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
>>>
>>> ---
>>>
>>> Changes in v7:
>>> - Rename legacy-bridge to of-display-mode-bridge.
>>> - Remove unnecessary API drm_bridge_is_legacy().
>>
>> ...
>>
>>> --- a/drivers/gpu/drm/bridge/Kconfig
>>> +++ b/drivers/gpu/drm/bridge/Kconfig
>>> @@ -244,6 +244,16 @@ config DRM_NXP_PTN3460
>>>       help
>>>         NXP PTN3460 eDP-LVDS bridge chip driver.
>>>
>>> +config DRM_OF_DISPLAY_MODE_BRIDGE
>>> +    tristate
>>> +    depends on DRM_BRIDGE && OF
>>> +    help
>>> +      This is a DRM bridge implementation that uses 
>>> of_get_drm_display_mode
>>> +      to acquire display mode.
>>> +
>>> +      Newer designs should not use this bridge and should use proper 
>>> panel
>>> +      driver instead.
>>
>> "Newer designs should not use this bridge", but in patch 8 you are
>> introducing a new use ot devm_drm_of_display_mode_bridge(). Shouldn't you
>> instead "use proper panel driver instead" in patch 8?
>>
>> Can you point to the conversation where the converstaion where Dmitry
>> suggested this change? Maybe it already contains the answer to my
>> qustion. Also adding a link to that conversation in the commit message
>> woule be useful.
>>
> 
> First of all, thanks for your reviews on this patch series.
> 
> link: https://lore.kernel.org/all/ 
> xwenycscalzdlpuxytorbiyvej3k7pv3lhxwtadilxq65ipwsv@x5rxm53w5e22/
> 
> I think it may be a misleading issue caused by directly copying the 
> previous Kconfig description. Now that the new 
> devm_drm_of_display_mode_bridge() helper has been added, drivers using 
> the panel-bridge framework can rely on it to maintain compatibility with 
> legacy display mode parsing.
> 
> It would be better to update the comment as follows:
> 
> This is a DRM bridge implementation that uses of_get_drm_display_mode to 
> acquire display mode.
> 
> It exists for compatibility with legacy display mode parsing, in order 
> to conform to the panel-bridge framework.
> 

Dmitry, what's you take on this?

Best regards,
Damon


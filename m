Received: from mail-m1973199.qiye.163.com (mail-m1973199.qiye.163.com [220.197.31.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55D9118871F;
	Fri, 25 Jul 2025 02:33:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753410798; cv=none; b=CDY71sFiNjRXjrZsO5usktj8TO8xe1lAiSNPH+VfPJxGW4CEiRGo6Z+anQczS200A9SauVbyunBzbaypaMg/ibgSohqpJIbAm6T4/98t5nTaXD2q16V4RhInodndH5+5W5/9CjRFSWSLSYABOhv1b4fb6XEZuhsnv808BYHTjnU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753410798; c=relaxed/simple;
	bh=0Cic4vztw9qPR66sGPhF6vabvR8HYWnZINRF95RWc8c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZVfvS/m0jnOkuBh/VCF+5Zs3TvywAEqIwaqfuLTKgT/cLC/MzMD0Pk2I9yrdlSvjl20uZ1UFZfUnLmDN/0E7ETG9QrM6XkYVfBrLRZWMebVPFrVZXgDHCmtuAGl4EHnxooX0U664O9FswBHKGPX3LAu+RzJp6nLt+5rjyyrAHAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com; spf=pass smtp.mailfrom=rock-chips.com; dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b=PVnDJ7pq; arc=none smtp.client-ip=220.197.31.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b="PVnDJ7pq"
Received: from [172.16.12.26] (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 1d303d32a;
	Fri, 25 Jul 2025 09:57:42 +0800 (GMT+08:00)
Message-ID: <b0c9f1cb-1478-4afb-91dd-11c894adb957@rock-chips.com>
Date: Fri, 25 Jul 2025 09:57:41 +0800
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 14/14] drm/bridge: analogix_dp: Apply panel_bridge
 helper
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
References: <20250724080304.3572457-1-damon.ding@rock-chips.com>
 <20250724080304.3572457-15-damon.ding@rock-chips.com>
 <22774005.EfDdHjke4D@diego>
Content-Language: en-US
From: Damon Ding <damon.ding@rock-chips.com>
In-Reply-To: <22774005.EfDdHjke4D@diego>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a983f4ceb0203a3kunma3621b7ace742
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQkhOSVYeSkgYTEofS04eQk9WFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
	hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=PVnDJ7pq+2r+4DMA8NohRlIruBXZ6gKP5DOewVoBX5Ylhaokv+t1PQXA1wz9DlnXhKIviBOFuSFK2az7J1VBnBVWbBLOX/xNfakDiLvSGeqwh0cRkks8NRZt4SoD2Kc/oRP7u314F63JU7vY40c1/YwCIuUlJVv545mfkGqrsn4=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=WLNloxMnqHrVGlM+X06CnaTEpSjYhIn6LZ5vpWKDrB8=;
	h=date:mime-version:subject:message-id:from;
X-HMAIL-Slblob-Mailprops: v1_neYYFWAlZzU6u2dlJ0lhZ1RPldmXRgiXtrMOJbCgi9xoDoqIz0TbG+IlvGGPJxlJow0oASYOn1EFc/JVojI2GfsoRw92Y+x4Vmgmj6mV8DLNXZOCTB8Hl/KVW85JUPfkXjXp2v9kCkf8jpqX5oR82Qb6hCPTJAnzR6XvbDS52LHzEpX3dEELToO6saavbbDMu9ERgp63Bs5XJpGO2sT+uzbh94N2C6T8Xts1vvnfBssfybHoOVTUKBc3ioycoTXffhpP/Cy87zIslOJyFerlHg==

Hi Heiko,

On 2025/7/24 21:08, Heiko Stübner wrote:
> Hi Damon,
> 
> Am Donnerstag, 24. Juli 2025, 10:03:04 Mitteleuropäische Sommerzeit schrieb Damon Ding:
>> In order to unify the handling of the panel and bridge, apply
>> panel_bridge helpers for Analogix DP driver. With this patch, the
>> bridge support will also become available.
>>
>> The following changes have ben made:
>> - Apply plane_bridge helper to wrap the panel as the bridge.
>> - Remove the explicit panel APIs calls, which can be replaced with
>>    the automic bridge APIs calls wrapped by the panel.
>> - Unify the API of getting modes to drm_bridge_get_modes().
>>
>> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
> 
> To keep the code bisectable, I think patches 12+13+14 need to be one patch?
> Removing the panel-handling fefore this conversion to the panel-bridge
> would produce a gap, where previously hooked up panels would not work
> if a git bisect lands directly before this patch 14, I think
> 
> 
> Heiko
> 
> 

As expected, patch 12 and patch 13 should remain functionally 
independent. They should be logically self-contained even without patch 
14. Otherwise, patch 14 would need to incorporate those panel operations 
via panel_bridge as well.

Both patch 12 and patch 13 have been independently validated on the 
RK3588S EVB1.

Best regards,
Damon

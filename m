Received: from mail-m3274.qiye.163.com (mail-m3274.qiye.163.com [220.197.32.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B5FF27A47F;
	Wed,  4 Feb 2026 02:27:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770172075; cv=none; b=Lp8RQYQouffnwMCYaJBJAr7YvDzQd04BknynwkrvBA53wRj6HyNxKoM4CEUPjWEIHWeis2x2FQnAEFAt9lsuq/Vnk2uD+l899+vmnFHSYYPR2J7vFVv7miAU2yTRWq/WALVe3pbTTIx9zmZzxYaFxmn9n4PdO2Xx+kzF2dPZUj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770172075; c=relaxed/simple;
	bh=d97ZjiRn7WBC6MC2ERTatwpVYX2UWe4s594iBFUoe+s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uPBYd4tYmFgWfuQzTdXcs4zSSaPiSPi9qoIY8x2SICAHHLOdgM19/e0p66rt4ouabYrlp24MYET7l0wETOwKOXr5aG/cQLnZsV4El3Umglh9z3oqInuQFPKh0/zyjKslWK+ZeQn8l0mPHdmI8zy0PTRN/4dIJQH+Yatn28YOYKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com; spf=pass smtp.mailfrom=rock-chips.com; dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b=KgtiUAp3; arc=none smtp.client-ip=220.197.32.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b="KgtiUAp3"
Received: from [172.16.12.43] (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 330683486;
	Wed, 4 Feb 2026 09:52:14 +0800 (GMT+08:00)
Message-ID: <0b7e39bd-a403-45e4-93fd-701ab092525c@rock-chips.com>
Date: Wed, 4 Feb 2026 09:52:14 +0800
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 00/18] Apply drm_bridge_connector and panel_bridge
 helper for the Analogix DP driver
To: Luca Ceresoli <luca.ceresoli@bootlin.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?=
 <heiko@sntech.de>, andrzej.hajda@intel.com, neil.armstrong@linaro.org,
 rfoss@kernel.org
Cc: Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, inki.dae@samsung.com, sw0312.kim@samsung.com,
 kyungmin.park@samsung.com, krzk@kernel.org, alim.akhtar@samsung.com,
 jingoohan1@gmail.com, p.zabel@pengutronix.de, hjc@rock-chips.com,
 andy.yan@rock-chips.com, dmitry.baryshkov@oss.qualcomm.com,
 dianders@chromium.org, m.szyprowski@samsung.com, jani.nikula@intel.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-rockchip@lists.infradead.org
References: <20251217093321.3108939-1-damon.ding@rock-chips.com>
 <6571983.R56niFO833@diego> <DG5A5BNULPQX.HRWTJLN9UQ2W@bootlin.com>
Content-Language: en-US
From: Damon Ding <damon.ding@rock-chips.com>
In-Reply-To: <DG5A5BNULPQX.HRWTJLN9UQ2W@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9c2659a20003a3kunme960d4ef73ad41
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQkwZGVYaGR1NSE9NTE4ZTkhWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSEpKQk
	1VSktLVUpCWQY+
DKIM-Signature: a=rsa-sha256;
	b=KgtiUAp3ditdHJKw+YuPPmNedi6wR8b12xUSPp9hcUoCRAF7xNzEH3nZxGzbDeVSwJ93E6fDJ4Vl+9dnwKTJZG+vl+h1p5MWiMW8N/vLgv/Gn6vfD3J5HwbqagBHelnTeZk/XowaXaNkj1TqDjoeCz7JqI3qjrAMILEPUybjYuI=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=qDNxEGFKLTcQaAxSN3kPzeWr8ZRpCLzvyWFyoP3CJgQ=;
	h=date:mime-version:subject:message-id:from;

Hi Luca,

On 2/3/2026 7:11 PM, Luca Ceresoli wrote:
> Hello Heiko, Damon,
> 
> On Mon Jan 19, 2026 at 5:06 PM CET, Heiko Stübner wrote:
>> Hi Damon,
>>
>> Am Mittwoch, 17. Dezember 2025, 10:33:03 Mitteleuropäische Normalzeit schrieb Damon Ding:
>>> PATCH 1 is to ensure the last bridge declares OP_EDID or OP_MODES or both.
>>> PATCH 2 is a small format optimization for struct analogid_dp_device.
>>> PATCH 3 is to perform mode setting in &drm_bridge_funcs.atomic_enable.
>>> PATCH 4 is to add a new parameter to store the point of next bridge.
>>> PATCH 5 is to make legacy bridge driver more universal.
>>> PATCH 6-11 are preparations for apply drm_bridge_connector helper.
>>> PATCH 12 is to apply the drm_bridge_connector helper.
>>> PATCH 13-15 are to move the panel/bridge parsing to the Analogix side.
>>> PATCH 16 is to attach the next bridge on Analogix side uniformly.
>>> PATCH 17-18 are to apply the panel_bridge helper.
>>
>> On top of all the recent bridge-related commits, this series still works
>> on my rk3588-eDP board - when the display is plugged in on boot.
>>
>> As that is the current state we also had before, this series:
>> Tested-by: Heiko Stuebner <heiko@sntech.de> on rk3588
> 
> I'm appplying patches 1-3 and got a checkpatch warning for each patch:
> 
>    WARNING: Unexpected content after email: 'Heiko Stuebner <heiko@sntech.de> on rk3588', should be: 'Heiko Stuebner <heiko@sntech.de> (on rk3588)'
> 
> I'm fixing it while applying those 3 patches.
> 
> Damon, can you fix that for the remaining patches before sending a new
> iteration?
> 

Yes, will fix in v9.

Best regards,
Damon


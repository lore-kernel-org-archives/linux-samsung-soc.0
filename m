Received: from mail-m3296.qiye.163.com (mail-m3296.qiye.163.com [220.197.32.96])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 496BE350A2D;
	Mon,  2 Feb 2026 08:22:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.96
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770020582; cv=none; b=W8nIWz8wo/YRPqIH/+jYmspOxDVyozI9k7AonmLO+sKpjGY9uAACowfUPQI/FAJ8nrz4mPMCplvH7jYmgy+EIV0ibXSxgkosGvpU+kASCQFgYIAShDd8tmvOagucPU4+E8q3LnLtHhPzYrsb1UIVRNawh3klpS6md9NU0b2FyG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770020582; c=relaxed/simple;
	bh=zU1w86wjIDSbPbjL9XsqSjCXWt1aifcQlM6vWGeDy/0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DKG4hhxvwdDTaPRl/Y1GMLdghqWs+K3xnAmuqP91tEn1XaM9sGda/aeeZdNXQrFlWRwb8x60ikR6S67ObGK6jgIO8h2VYGJwoLBscKtVy+EixmmA6OxSs1Z4YNoIUxqXTYKY9Y3NngyL5NAFN17X7v4O8JsReHNE4gxxUO4TwbM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com; spf=pass smtp.mailfrom=rock-chips.com; dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b=KJRnNBIV; arc=none smtp.client-ip=220.197.32.96
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b="KJRnNBIV"
Received: from [172.16.12.43] (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 32baf1fcb;
	Mon, 2 Feb 2026 09:33:02 +0800 (GMT+08:00)
Message-ID: <c7d2c401-068c-456f-a641-71d9aec9a4cd@rock-chips.com>
Date: Mon, 2 Feb 2026 09:33:02 +0800
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 00/18] Apply drm_bridge_connector and panel_bridge
 helper for the Analogix DP driver
To: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
 andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org
Cc: Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, inki.dae@samsung.com, sw0312.kim@samsung.com,
 kyungmin.park@samsung.com, krzk@kernel.org, alim.akhtar@samsung.com,
 jingoohan1@gmail.com, p.zabel@pengutronix.de, hjc@rock-chips.com,
 andy.yan@rock-chips.com, dmitry.baryshkov@oss.qualcomm.com,
 dianders@chromium.org, m.szyprowski@samsung.com, luca.ceresoli@bootlin.com,
 jani.nikula@intel.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-rockchip@lists.infradead.org
References: <20251217093321.3108939-1-damon.ding@rock-chips.com>
 <6571983.R56niFO833@diego>
Content-Language: en-US
From: Damon Ding <damon.ding@rock-chips.com>
In-Reply-To: <6571983.R56niFO833@diego>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9c1bfb576803a3kunm5c7836bd5d1df6
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGhpLGFYaShpPGBpIGU1OT0tWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSEpKQk
	1VSktLVUpCWQY+
DKIM-Signature: a=rsa-sha256;
	b=KJRnNBIV/6A1cPIx6R+QeecYKPdcQaVXPI9zSXurB2PQuRHbCF1u3Yw+TzPWeVSFCkEdJGtjimeudD/Z6PL00I+5Z0uRt4EpwXdIHIewgGCVt7qgU/oUuAuQEp4smDrYdLlvtySYHY3PnK5GDx13Xcrtyi0y1KhKlDrw3nk26JE=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=3vJEwBZpP35hbXCKhhIcCEaHgMGxx7jXQ1r49X/tjUs=;
	h=date:mime-version:subject:message-id:from;

Hi Heiko,

On 1/20/2026 12:06 AM, Heiko Stübner wrote:
> Hi Damon,
> 
> Am Mittwoch, 17. Dezember 2025, 10:33:03 Mitteleuropäische Normalzeit schrieb Damon Ding:
>> PATCH 1 is to ensure the last bridge declares OP_EDID or OP_MODES or both.
>> PATCH 2 is a small format optimization for struct analogid_dp_device.
>> PATCH 3 is to perform mode setting in &drm_bridge_funcs.atomic_enable.
>> PATCH 4 is to add a new parameter to store the point of next bridge.
>> PATCH 5 is to make legacy bridge driver more universal.
>> PATCH 6-11 are preparations for apply drm_bridge_connector helper.
>> PATCH 12 is to apply the drm_bridge_connector helper.
>> PATCH 13-15 are to move the panel/bridge parsing to the Analogix side.
>> PATCH 16 is to attach the next bridge on Analogix side uniformly.
>> PATCH 17-18 are to apply the panel_bridge helper.
> 
> On top of all the recent bridge-related commits, this series still works
> on my rk3588-eDP board - when the display is plugged in on boot.
> 
> As that is the current state we also had before, this series:
> Tested-by: Heiko Stuebner <heiko@sntech.de> on rk3588
> 
> 
> ======
> !!! The following should not hold up this series though, because the
> analogix-dp not handling hotplug, is also the current state already!!!
> ======
> 
> However, actually hotplugging the device does not seem to work.
> 
> With the hpd-gpio inside a dp-connector node.
> 
> 
> (1) When booting connected and unplugging the display I get:
> 
> [   42.725888] rockchip-dp fdec0000.edp: Rx Max Link Rate is abnormal :0 !
> [   42.733325] rockchip-dp fdec0000.edp: Rx Max Lane count is abnormal :0 !
> [   42.764853] rockchip-dp fdec0000.edp: LT link start failed!
> [   42.771105] rockchip-dp fdec0000.edp: eDP link training failed (-110)
> [   42.778329] rockchip-dp fdec0000.edp: unable to do link train, ret=-110
> [   42.785747] [drm:analogix_dp_bridge_atomic_enable] *ERROR* dp commit error, ret = -110
> ( ... repeasts a bunch of times ... )
> [   43.284897] rockchip-dp fdec0000.edp: failed to set bridge, retry: 4
> [   43.292045] rockchip-dp fdec0000.edp: too many times retry set bridge, give it up
> 
> plugging the eDP back in reenables the display successfully though.
> 
> (2) Booting with the display unplugged
> 
> Same messages as above, but plugging the display in for the first time
> does not create an output.
> 
> I'll try to dig more, but if you have an idea, what I should look at, I'd,
> be really grateful.
> 

Sorry for the late reply. I've been heavily occupied with the downstream 
work recently.

I can reproduce the same issue on my RK3576 IOTEST board, which is 
equipped with a standard DP receptacle for eDP interface.

(BTW: The RK3576 Analogix DP functions properly with a set of targeted 
changes, and I plan to upstream these modifications later. :-))

Regarding the eDP HPD exception, several functional patches for HPD 
handling have not yet been synced to the upstream. I will verify these 
changes and submit them when time permits.

Best regards,
Damon


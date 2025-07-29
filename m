Received: from mail-m15599.qiye.163.com (mail-m15599.qiye.163.com [101.71.155.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BCAD21CA16;
	Tue, 29 Jul 2025 03:15:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=101.71.155.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753758910; cv=none; b=MkF04sUgAiO9OMjZHpFpIygNWGixGjCitJOWocTDm25h+r5T5sfPFGg+Ewh+0MvUM46AeEvR3l/rJxNHl1ciYLFl3MiDE2stCNyi72vQN82gXCKO8+vDd9OjFwvE54Wi0AMZHl+ptuK0230/rL/vVnBRtyEoaSbMEvAqJG+pRGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753758910; c=relaxed/simple;
	bh=LYhzwTIYOeQNR80Hz2FmJ6HcMYezrteLU3sB5z2U8XI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AkLQVyhe7+DmjF5Yfc8FzNY82VFcD1IOJ3H+DR63FhwmIdvM9jdajBwe94zbt00yIHvypII8Yh3qhUJNRnot83D6s9gRhs2eeVJX9/2NoZJBF+5deHHovWRvJVGHKgJxtq2/jJ2X2D08OjRrKgH9tsNF7PwzgjFLmxmsxJ2vpmM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com; spf=pass smtp.mailfrom=rock-chips.com; dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b=AP/adSjE; arc=none smtp.client-ip=101.71.155.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b="AP/adSjE"
Received: from [172.16.12.26] (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 1d8d749f6;
	Tue, 29 Jul 2025 11:09:47 +0800 (GMT+08:00)
Message-ID: <54ca1b36-fe13-4c2c-8e88-6e8e3c5d418f@rock-chips.com>
Date: Tue, 29 Jul 2025 11:09:46 +0800
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 09/14] drm/bridge: analogix_dp: Add support to find
 panel or bridge
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 jingoohan1@gmail.com, inki.dae@samsung.com, sw0312.kim@samsung.com,
 kyungmin.park@samsung.com, krzk@kernel.org, alim.akhtar@samsung.com,
 hjc@rock-chips.com, heiko@sntech.de, andy.yan@rock-chips.com,
 l.stach@pengutronix.de, dianders@chromium.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-rockchip@lists.infradead.org
References: <20250724080304.3572457-1-damon.ding@rock-chips.com>
 <20250724080304.3572457-10-damon.ding@rock-chips.com>
 <kulhumudepz3lqm6c36wbqtc4gv35pyqki7el63bovnvxcsjkk@nbxijrujm2vz>
Content-Language: en-US
From: Damon Ding <damon.ding@rock-chips.com>
In-Reply-To: <kulhumudepz3lqm6c36wbqtc4gv35pyqki7el63bovnvxcsjkk@nbxijrujm2vz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-HM-Tid: 0a98542859c103a3kunm87893e013b06b7
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGR9NTVZDQh4aTUwdTU9NTEtWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
	hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=AP/adSjE3FdRXEHhFfV/nKCal90lkpwjWfjHLGPfb4HSlsT7RWL53R0WCZtREraRkEqn6gfcUTrUm51n3M5e5MMoOWYJUUOAs6NGxMBIpzInGnbOZ4/XyxxOyPlF6netaBfMyjQw5ZBBydxKrervYTunuA0YKVAyinTn+SJDwPs=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=rUdqYX6T9QuWjeM9cJHzQiY8rQSOQ+4zW99e7T7EF00=;
	h=date:mime-version:subject:message-id:from;

Hi Dmitry,

On 2025/7/26 20:03, Dmitry Baryshkov wrote:
> On Thu, Jul 24, 2025 at 04:02:59PM +0800, Damon Ding wrote:
>> Since the panel/bridge should logically be positioned behind the
>> Analogix bridge in the display pipeline, it makes sense to handle
>> the panel/bridge parsing on the Analogix side.
>>
>> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
>> ---
>>   .../drm/bridge/analogix/analogix_dp_core.c    | 48 +++++++++++++++++++
>>   include/drm/bridge/analogix_dp.h              |  2 +
>>   2 files changed, 50 insertions(+)
>>
>> +int analogix_dp_find_panel_or_bridge(struct analogix_dp_device *dp)
> 
> Nit: the API does more than just finding the panel or bridge. Also the
> drivers use it in a more of 'analogix_dp_finish_probe()' manner.
> 
>>
> 

Yes, since the new API also includes component_add(), it would be better 
to rename it.

And the commit message will be expanded in the next version.

Best regards,
Damon


Received: from mail-m49196.qiye.163.com (mail-m49196.qiye.163.com [45.254.49.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD9ED2E3718;
	Fri, 25 Jul 2025 03:30:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.49.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753414249; cv=none; b=nUbQ0UISAeSMJ0vAJ/57IzOD1UgLYsLViiQRkeMnYPaaQnnilnrtgNQ9p+XRMVnTZNr1ttEoZ/5AMHovNC6kpaph4TH2v7ITHk+qimr1F5oCFfPcjCoMKfoGSpwLsn2t8qSjdJyfPvH1ipKkLpBS5ZT0Eo4lutkig8EQlQkmHDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753414249; c=relaxed/simple;
	bh=1i8wqCcc6DdQDxiSotNZ60Saa28LkA+xT4//JdnxnQI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lAGa+V5Jjy+J8PKKVXmtHOA1deYe8errQOXaQATvjXWWYEcugduAnTVyD/HIc54PMJG+jYP3z5YS9Mq4/GUcXM4z09PzIk0Bpvg2lBWadPIm4dxaNNxuI6VZt2zL9JSO2aGyQWgi5w2OSEaNlPYakzKtOpuASTJqTY2wh5QcJro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com; spf=pass smtp.mailfrom=rock-chips.com; dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b=KMKARJPJ; arc=none smtp.client-ip=45.254.49.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b="KMKARJPJ"
Received: from [172.16.12.26] (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 1d30daf98;
	Fri, 25 Jul 2025 10:15:07 +0800 (GMT+08:00)
Message-ID: <b0ce0d8d-4ceb-419e-a892-d39b8633aa13@rock-chips.com>
Date: Fri, 25 Jul 2025 10:15:06 +0800
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 00/14] Apply drm_bridge_connector and panel_bridge
 helper for the Analogix DP driver
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
 <3890785.kQq0lBPeGt@diego>
Content-Language: en-US
From: Damon Ding <damon.ding@rock-chips.com>
In-Reply-To: <3890785.kQq0lBPeGt@diego>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a983f5cdd0d03a3kunm18dd1a7ad70d9
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGk8YSlYYQxpJTUhCQk1PSBlWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
	hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=KMKARJPJW06jkInizHjvIBa2f9dBzLMKkAMK563pYRj3p2h0dxgKuirrWh301Xv0TuGwm0OOTALQT9/UErJ0HweSyG88BuTMnkDSZTAH9b5AoJC+/+Dzp6HROoAHvz1cWYDn25PVnk/mD/yU9OE2aag4cqZ10fbbzaXH1xMcwh4=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=DLYgWqNIFGd0r4HW5nV9IESqFa9QNfwIUAHcBOdrhMg=;
	h=date:mime-version:subject:message-id:from;
X-HMAIL-Slblob-Mailprops: v1_kTakW7JjryuX/AmUDtQemyRYMtpvvd2xMtRBJTar0scMRJw3TQIr0t+zgXFCA/SOKzzwgfPPYks57NEDXhu/kb17awRfAdz1QNfKnh2UGg+cU1SodnPkhIzOEdzCDcGnDQ6gGM/dwLNcHYHR4VHATdO6/TSZOl7ekoCxACb8ewcRfttJ8KzkS8zKeCoY/nfXlBfr4RbViTeAemyqw8LzM+nCjNqjeP/GUQu11zePTEVwlvYzJ8tyeo/LdCJvOIl6uU3HjxO5kDIaR4CGjzlbfQ==

Hi Heiko,

On 2025/7/24 21:10, Heiko Stübner wrote:
> Am Donnerstag, 24. Juli 2025, 10:02:50 Mitteleuropäische Sommerzeit schrieb Damon Ding:
>> PATCH 1 is a small format optimization for struct analogid_dp_device.
>> PATCH 2 is to perform mode setting in &drm_bridge_funcs.atomic_enable.
>> PATCH 3 is to apply a better API for the encoder initialization.
>> PATCH 4-7 are preparations for apply drm_bridge_connector helper.
>> PATCH 8 is to apply the drm_bridge_connector helper.
>> PATCH 9-11 are to move the panel/bridge parsing to the Analogix side.
>> PATCH 12-13 are preparations for apply panel_bridge helper.
>> PATCH 14 is to apply the panel_bridge helper.
> 
> for future revisions, please provide a changelog on what changed since
> the previous version, I guess ideally here in the cover-letter.
> 
> 
> On my rk3588-tiger-displayport-carrier this works like a charm
> Tested-by: Heiko Stuebner <heiko@sntech.de>
> 
> 
> 
> 

Glad to see your review and test. :-)

I will include the version-to-version changelogs (v2 -> v3 and v3 -> v4) 
in the next iteration.

Best regards,
Damon


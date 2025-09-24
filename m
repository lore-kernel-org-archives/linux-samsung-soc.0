Received: from mail-m3296.qiye.163.com (mail-m3296.qiye.163.com [220.197.32.96])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAE9B28153D;
	Wed, 24 Sep 2025 08:04:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.96
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758701057; cv=none; b=tMi5igydQhToqAZvQnF/YMfwQ1kDBm36cu5xiIQBZwG4/lbgCCkkSp+qgmtVwas/9ftO8OSSMUkDrCSYiNZZPvxjpslVCdgkA0uZBzTKJZ8qTUwan0gUUDQpMuaReLqypOZ3bnSGX65l1DQfryEr6DDqhJso+ow5qb2haNmLreg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758701057; c=relaxed/simple;
	bh=mJHIUXHCUGn9OJwRN/sEFIXyjwdJgOcK37I09oS2SDg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Dx0j6pVWaYzbTjU1Cf65QMbCKrAH29UsPmo2/Uq7e2OzBIMDK+iJHXeOjfRL86AForRLDNNC06cu1vkMPsAfxaYA6evalFKy55qCf6OwnoLGOWuUv6Ig8GQGVBGXmUsU0dfeBkyF2Dm18j3c81sNMCpyvWOZmHVDBXYPaMru+mA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com; spf=pass smtp.mailfrom=rock-chips.com; dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b=fPQCPCQ3; arc=none smtp.client-ip=220.197.32.96
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b="fPQCPCQ3"
Received: from [172.16.12.26] (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 23e428d4b;
	Wed, 24 Sep 2025 15:58:56 +0800 (GMT+08:00)
Message-ID: <8006587a-131a-4e2e-b32b-d7cdfe8716c8@rock-chips.com>
Date: Wed, 24 Sep 2025 15:58:55 +0800
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 07/17] drm/exynos: exynos_dp: Add legacy bridge to
 parse the display-timings node
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 jingoohan1@gmail.com, inki.dae@samsung.com, sw0312.kim@samsung.com,
 kyungmin.park@samsung.com, krzk@kernel.org, alim.akhtar@samsung.com,
 hjc@rock-chips.com, heiko@sntech.de, andy.yan@rock-chips.com,
 dianders@chromium.org, m.szyprowski@samsung.com, luca.ceresoli@bootlin.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-rockchip@lists.infradead.org
References: <20250912085846.7349-1-damon.ding@rock-chips.com>
 <20250912085846.7349-8-damon.ding@rock-chips.com>
 <xwenycscalzdlpuxytorbiyvej3k7pv3lhxwtadilxq65ipwsv@x5rxm53w5e22>
Content-Language: en-US
From: Damon Ding <damon.ding@rock-chips.com>
In-Reply-To: <xwenycscalzdlpuxytorbiyvej3k7pv3lhxwtadilxq65ipwsv@x5rxm53w5e22>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-HM-Tid: 0a997abb8e4e03a3kunmd0821eb84bbdd6
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGh1LSlZIQ0kfH0xNGE4dS0tWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
	hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=fPQCPCQ3uNzh5jXbF1GIeYUySqLOebeBw4w0FhfPw9EI4rdlhRwcE+q9UuYL9BHKzKH6+Ofs557sOKLYLFVqLFbb1+6k+Y5m6vozg6QzLae2vlKXPwIxLQavPC/kAZUbjj/2EbLGyn+8bCkebzPaoC95r0ZAHJUpYdh6ZTU4eFE=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=6dCejOxC2RXZr3efQHfWFC5w8CjvBk/FQ9sP2EuTN7w=;
	h=date:mime-version:subject:message-id:from;

Hi Dmitry,

On 9/12/2025 6:51 PM, Dmitry Baryshkov wrote:
> On Fri, Sep 12, 2025 at 04:58:36PM +0800, Damon Ding wrote:
>> If there is neither a panel nor a bridge, the display timing can be
>> parsed from the display-timings node under the dp node.
>>
>> Adding a legacy bridge to parse the display-timings node would get
>> rid of &analogix_dp_plat_data.get_modes() and make the codes more
>> consistent.
> 
> If it's the same as imx-legacy-bridge, it might make sense to pull it
> out of imx/ subdir and use it as is.
> 

Yeah, I will move it to the path drivers/gpu/drm/bridge/ and perform the 
necessary renaming.

>>
>> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
>> ---
>>   drivers/gpu/drm/exynos/exynos_dp.c | 132 ++++++++++++++++++-----------
>>   1 file changed, 82 insertions(+), 50 deletions(-)
>>
> 

Best regards,
Damon


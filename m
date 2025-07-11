Received: from mail-m19731117.qiye.163.com (mail-m19731117.qiye.163.com [220.197.31.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D64E01E5B73;
	Fri, 11 Jul 2025 07:25:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.117
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752218725; cv=none; b=tfDeoYpwjFxB0U4WQUDjwVdr8Kibj+5xNDnh0Ub65aHClMcyqBM2E6CBWsy5oyz4lUhD6oAeWqh5TWbY4+YDEQatwYGqrva/I3mxT1vwU5T5UWRDOwqJOxqr9k68nPg2SA0n1ArMs8FzA8tnr4T3bXRX7EmziA2v16y4VdCOQOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752218725; c=relaxed/simple;
	bh=EPbH64nRja7CPYX6FXOzsav2K14chsOTUkAA897dKuo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ol17qkxqFvwrjSAl/WFjPQ4+C4ds1fojxA11mnNYmYY7eIQgttqQB+vdFCqKxMZgR+rRlKi9tkhAVtUBvM0Kre483qskhKQ39Z/zg9jHATNZiSqMdbKdkd65EphKDEANZoYv3Oyp6fLcddvA/q7hB2CaWaDbueXW0/bRiW21bqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com; spf=pass smtp.mailfrom=rock-chips.com; dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b=Aa+3MMGC; arc=none smtp.client-ip=220.197.31.117
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b="Aa+3MMGC"
Received: from [172.16.12.26] (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 1badf1316;
	Fri, 11 Jul 2025 15:20:05 +0800 (GMT+08:00)
Message-ID: <600f723d-1ec7-4e67-b6f1-316ac8c09235@rock-chips.com>
Date: Fri, 11 Jul 2025 15:20:04 +0800
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 04/12] drm/exynos: exynos_dp: Remove
 &exynos_dp_device.ptn_bridge
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
References: <20250709070139.3130635-1-damon.ding@rock-chips.com>
 <20250709070139.3130635-5-damon.ding@rock-chips.com>
 <4596850.bcXerOTE6V@diego>
Content-Language: en-US
From: Damon Ding <damon.ding@rock-chips.com>
In-Reply-To: <4596850.bcXerOTE6V@diego>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQkxNSFYaH0NKSk8YGU9PHUJWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
	hVSktLVUpCS0tZBg++
X-HM-Tid: 0a97f85b090603a3kunm38f22b26f2f422
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6M0k6Ijo*FzE5HR8KEzA*Czwu
	HwowCQtVSlVKTE5JSUpDT0tMT0tCVTMWGhIXVR8aFhQVVR8SFRw7CRQYEFYYExILCFUYFBZFWVdZ
	EgtZQVlOQ1VJSVVMVUpKT1lXWQgBWUFJSUtPNwY+
DKIM-Signature:a=rsa-sha256;
	b=Aa+3MMGCvohGN1l0oGiN9mPE9+buYJEnl7ehbJtNvS297qP4+L7vINeEZPucXb9o8A4JzLAXyJsHSJEQslBF+pchRkHo/Eum2OyZKRYcPQ6U1nEYgyo+L5wX146JCFtmGeuaa1OuwRzenz3aIxjmbCmDgLQJwoJopLf5Na7YYzg=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=47mqYoiKeZ/zqm9N6N2f/Tu0kYWZlKHaQ/Ixw2H+aSk=;
	h=date:mime-version:subject:message-id:from;

Hi Heiko,

On 2025/7/10 3:55, Heiko Stübner wrote:
> Hi Damon,
> 
> Am Mittwoch, 9. Juli 2025, 09:01:31 Mitteleuropäische Sommerzeit schrieb Damon Ding:
>> Use &analogix_dp_plat_data.bridge instead of &exynos_dp_device.ptn_bridge
>> directly.
>>
>> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
> 
>> @@ -155,7 +154,7 @@ static int exynos_dp_bind(struct device *dev, struct device *master, void *data)
>>   
>>   	dp->drm_dev = drm_dev;
>>   
>> -	if (!dp->plat_data.panel && !dp->ptn_bridge) {
>> +	if (!dp->plat_data.panel && !dp->plat_data.panel) {
> 
> typo. The second test should be for dp->plat_data.bridge

That was so careless of me! I will fix it in the next version.

> 
> 
>>   		ret = exynos_dp_dt_parse_panel(dp);
>>   		if (ret)
>>   			return ret;
> 
> 
> 
> 
> 

Best regards,
Damon


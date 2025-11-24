Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63F532FDC28
	for <linux-samsung-soc@vger.kernel.org>; Mon, 24 Nov 2025 11:08:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763982517; cv=none; b=tHueZtc/uvqHVT4Wxjym9lYmktss7Ufx7rIup7zcHiGJeGWYFhdO7HMUDVUrQQkOgqLvW71DyVXy+3O14wGieV0fv3azZXihvnWpxmUgLSV0vWRAu2dfaHSDOcs8ipUuzJ9vu+XmjygYl+C/FZxurPWBSVLdKeKq7smD64OgSk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763982517; c=relaxed/simple;
	bh=pX8uLa24ufHlLnnLsdkJcwhfxVMAqlg8mivH7rZolUQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YJQwC9hU4KDgK7PeMZbtrtzdOYr6XJvWMLulD/+/z6ZYBjRor31Tb6LgO1WyhmCeCzS0tJWdWfeszPUqPdCr9inQYF50Y1RFHQOY9urRRU8ptyGoeH5CDfyVbsCaMV3d+Rv+UDI32EBSmouqeHAabHZy1kYYmi7L38oCmedWneg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ijgtDLJ6; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ijgtDLJ6"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-47790b080e4so21728935e9.3
        for <linux-samsung-soc@vger.kernel.org>; Mon, 24 Nov 2025 03:08:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763982514; x=1764587314; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6+5l3fHno/+RdcEbAfvBbgPLJtbuD4ohAwU1afUy64o=;
        b=ijgtDLJ6oHUA1HOO3yZn/MmCXSUYorO2nogBZvBDzkP/o11ZGYY2Sv1l/dYiwPJudc
         lPCXvHw/n4bho6mdlVfhA52Q2u5FMwN3Db2fIcR860IkEGvn16MUOwTeuVuvzmPWnQYH
         3gt4ilOS3ejCHGYkmQESxgLBB97wqtK/M15z83+ZWz14bL3y3C1NBYH+0sJx6QqjwWH0
         yTFr17xvak0uLhRDmZn/fvbhorQ54xYp2bCBuKEp6JAkJcT70hD0wsAZhofhtSnl8ZWm
         7KAZW1I0kGtjkjUpkgaSmVJSLRIrf+oxX3szz40CM546YsERIQV5EzTAX3Km2GaSkCcQ
         PBUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763982514; x=1764587314;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6+5l3fHno/+RdcEbAfvBbgPLJtbuD4ohAwU1afUy64o=;
        b=iY0jI3riffbMwR1g6cafr/g1i612DRbEcQ7BmuPcMhkDFdU0iLlRftjzrUEyu1ynLz
         HNYQxtDtLuZknuEB7fs+iBvrPDn0dWFwF1+TMvk0V74pdnPZjowmm9y5eJrBrFxtI96y
         Sd+kpSBGrDSRpxnrvmhVeTx8UIX3qwz/tDWw70909GJmnsMpzproSsyCWwF5IfaqLjgx
         MfSkrsrRYI3kRluh/VuK0BnBmRn8YUN95mTrZdyuk3dFDWt+nBCkVZ3p2dzFWtmJAR+k
         7dU4/+ulteER3CJtCgRj60mBkO+xFJiL70ZkpdycLnS3oZchKFPx8VD/J5KvBYukdTcz
         hXWQ==
X-Forwarded-Encrypted: i=1; AJvYcCXsZa//Rz/6c3m9G5k6BTacA47sCxoFTrCFR6IWz82WEO2vDZ7De5DUmI7Wy87bEduq7VHrVKh3F+n7C1OG01gYSQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3hk2ktFdjBlcDYC9jjF+joRvgLEY94nOJKQUmbKwUvGN/DeCC
	K536PIeB1y1nob8G0G820TIe5CSMR6C45rJwWTdYVU4eBvne015AfyW4jymg+vnopbI=
X-Gm-Gg: ASbGncvAYzfe6KdZLTgv98v5+IOJnkUaD7/a+209gIMUlGQdxYwKB4ewm32aFkn2C0c
	8GXeYRNmzGoj7gsvo+8qSuByiFob3mpYckxD12m0txht8inOIkRG01rEkdEH4RMXLP1GsRSqxU4
	fdyFvinxEJLuV4N6bzq3Z38iSz5VJJAffHn8UJE0bzEaO7mEXlowBa6rpVyLXqIgsHAyC2ExPYH
	43zZzQ0xT3Q467Ipll5VRWwMxTo79WAfYGHdk0VeNdfwgDZcVPxQBGsB9dpV+O4eMM7yRgyst07
	/SlFZGjS8ZQkLrZvYeGN4UITGI6ZfSCffXme7LPpinKOqO6HqfzPs1T9CP18XWWrlZUTMaUWnRA
	V6kEy4GP4Ep6wn8YHcq1Emy9EdEP0CnSfzh97FuPk0e0NVRUc0m9mKnyLZQ7ZQ4m/DnDE/7CsYV
	lbGMzDcu9NOTIcNOrcAKz3LTp7QAzgizPrnm0SOnl0eKp0bZM/PP4FHsVIg1jrypwTWQ==
X-Google-Smtp-Source: AGHT+IFTZFirZPCwnUDDiKfKr7H0K4OzotyW7bjOyOjeldVQNp8jBiM4RwHnhw/nv1j7ENdmzDjRpA==
X-Received: by 2002:a05:600c:1914:b0:471:114e:5894 with SMTP id 5b1f17b1804b1-477c112587fmr86546865e9.25.1763982513683;
        Mon, 24 Nov 2025 03:08:33 -0800 (PST)
Received: from ?IPV6:2a05:6e02:1041:c10:a756:bb6c:7b35:af9b? ([2a05:6e02:1041:c10:a756:bb6c:7b35:af9b])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-477bf3af0e1sm186819905e9.10.2025.11.24.03.08.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Nov 2025 03:08:33 -0800 (PST)
Message-ID: <2b63c064-ce62-421b-8469-e434bd0c9652@linaro.org>
Date: Mon, 24 Nov 2025 12:08:32 +0100
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 RESEND 2/3] thermal: exynos_tmu: Support new hardware
 and update TMU interface
To: =?UTF-8?B?7IaQ7Iug?= <shin.son@samsung.com>,
 'Bartlomiej Zolnierkiewicz' <bzolnier@gmail.com>,
 'Krzysztof Kozlowski' <krzk@kernel.org>,
 "'Rafael J . Wysocki'" <rafael@kernel.org>, 'Zhang Rui'
 <rui.zhang@intel.com>, 'Lukasz Luba' <lukasz.luba@arm.com>,
 'Rob Herring' <robh@kernel.org>, 'Conor Dooley' <conor+dt@kernel.org>,
 'Alim Akhtar' <alim.akhtar@samsung.com>
Cc: 'Henrik Grimler' <henrik@grimler.se>, linux-pm@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20251113064022.2701578-1-shin.son@samsung.com>
 <CGME20251113064044epcas2p1b87addb21473eca7cc52052e4e2e9237@epcas2p1.samsung.com>
 <20251113064022.2701578-3-shin.son@samsung.com>
 <2180a854-8ba6-4424-add2-eb34637530c1@linaro.org>
 <000001dc5d2a$0697bf10$13c73d30$@samsung.com>
 <ab35c20e-390c-4479-9bb1-9f5e49cba2a0@linaro.org>
 <000001dc5d32$2b4bfb20$81e3f160$@samsung.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <000001dc5d32$2b4bfb20$81e3f160$@samsung.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 11/24/25 12:04, 손신 wrote:
> Hello, Daniel Lezcano.
> 
>> On 11/24/25 11:06, 손신 wrote:
>> [ ... ]
>>
>>> However, since ExynosAutov920 diverges significantly from the existing
>>> driver, Would introducing a separate driver instead of unifying
>> everything be acceptable?
>>
>> So this driver is one controller for multiple sensors while the others
>> drivers are one controller for one sensor, right ?
>>
> 
> Yes. As far as I understand, the previous Exynos variants used one TMU controller per sensor,
> while on ExynosAutoV920 the hardware has multiple TMU instances and each instance contains multiple sensors.
> Therefore, this new automotive SoC requires supporting multiple sensors behind a single TMU controller.

Ok thanks. It makes sense to create a separate driver.


-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

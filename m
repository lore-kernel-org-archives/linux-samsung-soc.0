Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C151A1D61BC
	for <linux-samsung-soc@vger.kernel.org>; Wed, 19 Feb 2025 11:46:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739965564; cv=none; b=QK1nkuq88FnSHvRPxHQZaKJzUWn0fxNqQz9owHoGphxHSaXUPRGS92uT1OVNn71Eh6ovFzwiGsx2nxVDeEbb9mtARbAA/SFeShwdWlzJ6fdR5vpCabhMgM9dXoL5d+kr/T+nh5YBdMCS6pAVQHVJVcCSAnczJpjBiFFwzjeBldA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739965564; c=relaxed/simple;
	bh=iVVfLZ/Xexilj6DGdqpQ7mA+qvUkkMr2moH3ow9D3GE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TTHi7NeiiPw44lOMEXWEagkqToKMbxLhBYeAcaLfLpPKb7deF+zdugtEyAf5fY03qz9NBeczpJ6gNh+BxlWyNJCZp6BFgYGi5yp1BnDkywMmIqU6eNziKWpbt0ym3j9qvihQQIvSlh8xTqqmpuFxx5jbRDpr5PrweEgbwhLy2jA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YKkTuZqD; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YKkTuZqD"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4396a4d5e3bso49845895e9.3
        for <linux-samsung-soc@vger.kernel.org>; Wed, 19 Feb 2025 03:46:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739965561; x=1740570361; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=grVqY1qROVcqXbe9nYwk1uHL1rEHylCVGnje1QZKs3g=;
        b=YKkTuZqDO+eHlwH7hL+meqItmH/zuWnx/Wtl6j02Aq/s8b5chOnCJ1snpEo7kY4iKX
         2rzAw1SJc6IrBuFo4vQd+S37abp74kvo2ca/nKtXPEmKcnDBwcPUV8prvpy8SzaWXxmr
         a+6yvJqXK3n7PBxQSf8UVK9liFsrgyQxXYN6EgkFiXjxncUHxx+jkYeci/PDADTh259c
         wqieq4/9/o/T9NnGWyuW0CXfpYdjWsiFHQSeqGsUolYVEuKciPVApEbcKpEFR+9R/u1D
         c30vqNvnEWYNaZsbmevkk+woO9ltFWmrm71wSEHdG9KdXGOgu9QxaQwLjCj26z8dSRS3
         mObw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739965561; x=1740570361;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=grVqY1qROVcqXbe9nYwk1uHL1rEHylCVGnje1QZKs3g=;
        b=STFIbjVPvMy19RGqMlIT3dSHLm3Kat5kKHMP6G8nSKBQ5PSOE4zalGrHwk2h/YIAnJ
         6bvV27mToXY+npL9DV3/UGlRah6GFn9h6pKNdRDrpQSn8gG32kRfPYcmQa3kF5UdE3R1
         VYvru1VmTPetOXRnYCQrZh02XrEhaQKfeUMd/hKkYPnGhHcv6FI5ZFwr3MxZmxeRi5YL
         IIOPSRpSKPx+yqvIfuMUy0q3BeqSh0rLz2NYtVtvt4mf13+WOGTWZCMbMFVVd9pSMO/D
         GY5TUzKMyS+/7dVL9QLOifhy3L9Vfp6yaCVoUh227l+anX3FKPKB3zmziATgpu4A3V0+
         ZTMQ==
X-Forwarded-Encrypted: i=1; AJvYcCWWR8KsQfw95SpuYhxlaan0ab9+I5suRD5sgz8FCQsztY1BZvFw9QUiH1kZgsY7nF8ub0oRouuRpXF2bil5X99iLg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzwp/FYopHakqT77+DjW21Nhg6ucUHj2HAb9Wb/405wsMt5MiwZ
	NIt4KpZEC8mm441WPE279SEavS95qCgQyY2wTleohAuvuH0IgXS/NT+zoQaLoV0=
X-Gm-Gg: ASbGnctin1k575aFm1JP1GBduwtinBnY0QqbEVtckJnte1oYR4WNuVdaoWVX5x82bf3
	g1tFEwwalC0Pu5bqoBAfytE0utkVw2vHlRthwEs9cP46zjds1t6NFETWnAU5seQ+Xy30gEMBFL3
	2BD/5qG/W+6aL6Dhdy2jiDg36lFVInPJhsMnVTVr2VULzAiVnf5ULz/7QvRG3SKFtJCPK8Fnkvj
	Nxa6XVktVOJsU1Y7kkTJa+7kCLYPBpEFUuOy4fslo0Wmziv9hcae2aKdhYZLc8jIjciOkJWnHTO
	q6N149FfDeouGwCUPirb+NDos3uuRvxfxrEVT3Q9hyiishyJmFfUUGo=
X-Google-Smtp-Source: AGHT+IEPrAp7TfB1wuRgwHmXZYaORWGATsE4Btm3PHkL+64VjJn57We6CAzaMyjRJEOlvwankmW89w==
X-Received: by 2002:a05:600c:3110:b0:439:9985:6984 with SMTP id 5b1f17b1804b1-43999de0cc2mr33956895e9.30.1739965561108;
        Wed, 19 Feb 2025 03:46:01 -0800 (PST)
Received: from [192.168.10.46] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-43989087517sm77002015e9.8.2025.02.19.03.46.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Feb 2025 03:46:00 -0800 (PST)
Message-ID: <47c11da5-6235-4e13-ab91-580cfef508c2@linaro.org>
Date: Wed, 19 Feb 2025 12:46:00 +0100
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] dt-bindings: timer: exynos4210-mct: add
 samsung,exynos2200-mct-peris compatible
To: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250215123922.163630-1-ivo.ivanov.ivanov1@gmail.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <20250215123922.163630-1-ivo.ivanov.ivanov1@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 15/02/2025 13:39, Ivaylo Ivanov wrote:
> Whilst having a new multicore timer that differs from the old designs in
> functionality and registers (marked as MCTv2 in vendor kernels),
> Exynos2200 also keeps an additional multicore timer connected over PERIS
> that reuses the same design as older exynos socs.
> 
> Add a compatible for the legacy multicore timer of Exynos2200. Rather
> than differentiating it based on the block version, mark it as the
> one connected over PERIS.
> 
> Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
> ---

Applied, thanks


-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

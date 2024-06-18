Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DE4E157A48
	for <linux-samsung-soc@vger.kernel.org>; Tue, 18 Jun 2024 14:08:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718719690; cv=none; b=XgjacErr/OYeoPfmIkHGc8RYvsvU4EhEj1U/ZN6n3JWBUuVCMk9I30yI0Yufno9ZQaLQ4KMLmyYAqUXi/DMFClKF7jAhLGQv+wUlsoMgvRVm1G6ZZlvGxskXFDRcGJ6KKg4vBWWDdJLJkIRxtzAxuFmaRyYBi9OMnjYlMficN/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718719690; c=relaxed/simple;
	bh=n+QilORxP3RK1yVnaHzKUmNkVSKNJe6tBhnWisHRmlo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dSvwrTldaRcsbvHabG8dv9NVNk0fmNYiJoID84rl5D9twM9YwY5SCsjt4L/oyHmuAUQUIxEd1u7hvfFySknsUtOZqHEh/ytmrrRLXnbQ7IYaVZUgkNJtbtcbL9Fmt2rRc2Iaxkz33vXtIxnN5ej8B7xXBf2Jo5olId2C1yLWze8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MyGyVX0K; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MyGyVX0K"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-52cc1528c83so1220462e87.2
        for <linux-samsung-soc@vger.kernel.org>; Tue, 18 Jun 2024 07:08:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718719685; x=1719324485; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EPYowminOVvr+nmoaSaS+pLCI6yVw569Zh9cdjJsE7M=;
        b=MyGyVX0KL2B1uTed/G7P+E58qdzbpV+ZiM4cp2Fd/GzqbTTWJXIKfQBldd/YEmYOL2
         0UNBV3ZkNIAr/JRnUI27SPV/OQJo/Eq1QOFzY8ebgfxVn3cjoNBLebWtKuSCT+ogdfJn
         x+CZyxLTnF9tE3Tj7LYi+QlthpetvcVgtJX2fjjDyPiBMIbqGazw8T4OmY71mRHhz/1C
         Rc/nuJM0QHXgMgTR+m3v9rvYdY6gFlClpi8HKguMEBdMVrdISbXm3oOr2gF8zjQMMb5v
         2pnB8eH3uPq+XpeSz2M0W6IwQc3R/u/SqXwUUG0AJbyrgOzbSICdZJwzqfA6++RMfcuH
         6fAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718719685; x=1719324485;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EPYowminOVvr+nmoaSaS+pLCI6yVw569Zh9cdjJsE7M=;
        b=KOA72nuGQRll9+7iM1Z66+XWcj3DCtbvgTM+qMhV5dNJlGyiPiAF6NwKoe9dBZoEvc
         +Of/VlYTXsRt4+dHBLDDJYscyPBUrpywnX0IMxinteroDeEruEUGVNHduQJW5YZbCzuy
         4z48Sfh7cb0ttjotBeO5kK+Ji3T8Gtjdos7ciGZSV2YMBztjKlLmjUzsiwelZmpSro7j
         qlRvTClCfTVSK3n1/OOo3l6Grt6lzEheS2+LILFLpD0Tv8nql8jL3HvMUbGhQIto/04Z
         e4jSdk1TZuxpYlybvKosC759TOpvGw7Qmih4znTs33Y6vpJzFMQWBXJ1hKLYgkS5Sa98
         rtUQ==
X-Forwarded-Encrypted: i=1; AJvYcCULgsWZBnhmcad36ueTQ238iS9zQ7ckSuIIVDsEnYd3rTTWdLGF5jAN+XiYNkcQKo1aYcld/AkZz1WRcBehiCcUXlzuDiW2VhiekiBec/05kjo=
X-Gm-Message-State: AOJu0YxVJiBGqcOfqxF0ZGlqhuyuT1H8WRaXo22upVCC2206RBPuILpt
	/rTn805dXJhp8bKaYAKgw3bdcLhvqWFurcwDUcvZCWwvLRV+3Wc6aDvFRVHeGTg=
X-Google-Smtp-Source: AGHT+IFjNs+7IdOYMMPvNdFNexxA9RGwd73g79/svh7QWdlywyc8T5oNxWK+VByqXQUr181S1dbiZQ==
X-Received: by 2002:a19:8c5a:0:b0:52c:88d6:891d with SMTP id 2adb3069b0e04-52ca6e5637emr7805302e87.9.1718719685041;
        Tue, 18 Jun 2024 07:08:05 -0700 (PDT)
Received: from ?IPV6:2a00:f41:9028:9df3:4fb7:492b:2c94:7283? ([2a00:f41:9028:9df3:4fb7:492b:2c94:7283])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52ca282581csm1520479e87.37.2024.06.18.07.07.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Jun 2024 07:08:04 -0700 (PDT)
Message-ID: <e6a81932-0609-4476-82b6-43ee30b7de43@linaro.org>
Date: Tue, 18 Jun 2024 16:07:55 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 22/23] arm64: dts: qcom: starqltechn: fix usb regulator
 mistake
To: Dzmitry Sankouski <dsankouski@gmail.com>,
 Sebastian Reichel <sre@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Pavel Machek <pavel@ucw.cz>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, Chanwoo Choi <cw00.choi@samsung.com>,
 phone-devel@vger.kernel.org
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-input@vger.kernel.org, linux-leds@vger.kernel.org,
 linux-pwm@vger.kernel.org, linux-samsung-soc@vger.kernel.org
References: <20240618-starqltechn_integration_upstream-v3-0-e3f6662017ac@gmail.com>
 <20240618-starqltechn_integration_upstream-v3-22-e3f6662017ac@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20240618-starqltechn_integration_upstream-v3-22-e3f6662017ac@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 6/18/24 15:59, Dzmitry Sankouski wrote:
> Usb regulator was wrongly pointed to vreg_l1a_0p875.
> However, on starqltechn it's powered from vreg_l5a_0p8.
> 
> Fixes: d711b22eee55 ("arm64: dts: qcom: starqltechn: add initial device tree for starqltechn")
> 
> Signed-off-by: Dzmitry Sankouski <dsankouski@gmail.com>
> ---

How did you confirm that?

Konrad

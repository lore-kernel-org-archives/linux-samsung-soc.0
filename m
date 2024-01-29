Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B913156977
	for <linux-samsung-soc@vger.kernel.org>; Mon, 29 Jan 2024 16:39:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706546373; cv=none; b=rDqx/1RSUCz5W+Kh12173KE6M2RLWesCdVfS0IuDIQjlyvxbAT0w4P37BOr1eof2d6mBrH5jUMDkrLSfRc7JqH3Esp+KDgK62kLI7+Ogomq/9U0iu+f8n0SpD6NfMRKhPAO18Z0clMeWbR9QUO2fgTzPxTLPBy/jtAbrrnOxEks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706546373; c=relaxed/simple;
	bh=FHWcQrg6EPFEvmqH0eQBPKt2FvYxr1H8cD66r4DY7e8=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=jV28YcZLCrsYnb/MXjWT92buJP51t0p51JHwj482PFRm24h1jr7B83iv14ltyY+3ArSlfpU8QEBUVeS6p4MWQNn3RZ91SdoxZ2IZwueNqNEn01mwwYP6ItBy2sydBLA/hblTsNe93oXwSl1ZLBVfgXPogXdISWBCBkAYBxouhHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=F1K5H5Ua; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="F1K5H5Ua"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-55ee686b5d5so1940988a12.0
        for <linux-samsung-soc@vger.kernel.org>; Mon, 29 Jan 2024 08:39:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706546370; x=1707151170; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FHWcQrg6EPFEvmqH0eQBPKt2FvYxr1H8cD66r4DY7e8=;
        b=F1K5H5UapKoSNF5GUgOX+j38iOj2vhhZz10491sXdIKaKohFfnIM5rUDr1QH/XOX0p
         m+qF5X/ZuqAahZa+cvjnP7/twJVj4jirpv0iaspI8PFszai28fFR0Tek5d5x1mBYyhEq
         uZuff2MloW6GExb/MAaR+TQR0AZUYCAC0A5LEWPpkv9O2Q+vSFVkJ/XnnmvXywlBmQco
         o+J9e2Gi9mInp7Rb8ePqYvbvmIY3DoMJ0cBxBvFN+KkxvuvHfwYnkRhjsLX9MdsIfLJo
         vGhyYl+2OoPe1AeQoxmTTWd/2Zh1t+UfQT2RPWHcKipfwAa/A97nSSL4AOoKmnYcyr/m
         dOjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706546370; x=1707151170;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FHWcQrg6EPFEvmqH0eQBPKt2FvYxr1H8cD66r4DY7e8=;
        b=ObKYRMsKLMaQNBA4G8/Anwd43x4NKi9wUUfoG2Zi8jyub64zGVkPi2dX/EJ11PKXNw
         SxVl/56cCy1UG2l5tDoXcMrtKD5VsJCodIzCfFCn5z3byDFhNjT6ofIG9kReVz36THJs
         m7IxOV7VBdZsq8Y03QqUgH5QlSrhvlUt3zYu6+qd8kTPdE0viZ2ozEay1wj0DTX1CLVF
         RfbRy58NEfawxxOyWJeXBm+PyLoDniWn2GGH7+AfVyRiRgB6LnunHxwdJYTwkxR3fMoN
         DashNggEiqJgP4mX0zsryz6jzIAXQp+ghas8hKuDO66L5K7n4bq8WYTvymzRvVloGwMd
         7x6g==
X-Gm-Message-State: AOJu0YyZrtZpJcPThXLD/dYK7coxk/ds0V70AZW0byV9y8MB1PYtJS0S
	ZnSlYC3USmyWwfiqBc5L41X1nVr/79LPrx+kSXwU10KUdouv91jNPP2+I8V/AWE=
X-Google-Smtp-Source: AGHT+IHveaykAe2Gia9VkRGdUa1J0oM6GKhDfkmqjb4vj/R4B7VKKzRhqxrMC0YQ1JIZV/AEwS61uw==
X-Received: by 2002:aa7:c311:0:b0:55e:d846:ab4b with SMTP id l17-20020aa7c311000000b0055ed846ab4bmr2834528edq.20.1706546370544;
        Mon, 29 Jan 2024 08:39:30 -0800 (PST)
Received: from [192.168.2.107] ([79.115.63.202])
        by smtp.gmail.com with ESMTPSA id n17-20020aa7c791000000b0055f283314e1sm328438eds.43.2024.01.29.08.39.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jan 2024 08:39:29 -0800 (PST)
Message-ID: <0de3af8f-8f12-4246-81ea-3a3a2982983f@linaro.org>
Date: Mon, 29 Jan 2024 16:39:28 +0000
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] arm64: dts: exynos: gs101: use correct clocks for
 usi_uart
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 peter.griffin@linaro.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org
Cc: linux-kernel@vger.kernel.org, kernel-team@android.com,
 willmcvicker@google.com, semen.protsenko@linaro.org,
 alim.akhtar@samsung.com, s.nawrocki@samsung.com, tomasz.figa@gmail.com,
 cw00.choi@samsung.com, mturquette@baylibre.com, sboyd@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org
References: <20240127003607.501086-1-andre.draszik@linaro.org>
 <20240127003607.501086-5-andre.draszik@linaro.org>
 <6ccf359a-faeb-485b-8047-fa61bb1a3fc8@linaro.org>
In-Reply-To: <6ccf359a-faeb-485b-8047-fa61bb1a3fc8@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 1/27/24 04:03, Tudor Ambarus wrote:
> We'll
> come back on this matter on Monday.

I tested (correctly this time) and the patch is good:

Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>
Tested-by: Tudor Ambarus <tudor.ambarus@linaro.org>

Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D03818F6D
	for <linux-samsung-soc@vger.kernel.org>; Thu,  2 May 2024 06:50:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714632606; cv=none; b=GLhWRuwnpsd8gMjOtLAVvscYALqBmpsjy7rVMQDEj7dougP9N/HZkJOTM4QA3tg8sivSQvPfDm8jQTH0t5NqQvQthGMjENcHkWCv7pSGibOfUzJ/YMKunrzdeMuSim78QFdmF9lYTbt9wFBC9eQ8Yd7qEQDGxBQM279wtSdUbN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714632606; c=relaxed/simple;
	bh=gczMRuZ2fsGRpoCXUBhl7NeVLE82+ehtyW2OQrB7AVI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tMpSCyUpQ6KbZXgOfMrf76kk+yQsXy9NTrWmfyFg/wN0Rmz4zcO7aSaLdpKENua7/6/G404oJoWdsVv8fGBOX3lP+BU3fo7pDJWEfe6760Jjiv93L2COidwT4c3R8VSaFw5tSxdVNgfzc228EBDwQYFcSbFk8NhrXoejCrf60oA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=iAowNa07; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iAowNa07"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-a51a7d4466bso811412966b.2
        for <linux-samsung-soc@vger.kernel.org>; Wed, 01 May 2024 23:50:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714632603; x=1715237403; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gczMRuZ2fsGRpoCXUBhl7NeVLE82+ehtyW2OQrB7AVI=;
        b=iAowNa07+HpskSrVjTCyABhl1DXSvKvdwyPpjV8cpypXGoUmI5lR5Ymy4vEGWi65kw
         RNfq0SRGbVNJ/Da8rDbYf/OOLoQiPuUF1x6LW9Hi2isHw8bBj4FPz/dBeexPLk+cNjSt
         Z4bZRMIdjaOyRj9cxlqaz925i209Oi1ufRhYetxcX1xKMJN00rY4B/r4AGvnvSwe4TkQ
         AKIsMr4TeDLLfLbwX2rTIkSmxVjPlD5Uo8M5GQx7Ac9S62JCqg/lv9WoLGmvmq/JcfzX
         0oCKahJCegBTKCpBEcqZqvYxJ5lhtgKUMj26+vXiWWNEOUuzOLNr/9r4MkQAWpUoCYyP
         EWIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714632603; x=1715237403;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gczMRuZ2fsGRpoCXUBhl7NeVLE82+ehtyW2OQrB7AVI=;
        b=LZ7Gw1rM8A8jkbzX4a6ulHT7O5pwAeI8Ny+ToaJoQy+KXG2StP1K/cTcwovLTDp5P0
         ipeOz8MoHAQmPgPEYfT73dP4M3REgCBBb6/IaTYEJXljiUfCq1HIBxU3tU0Zk8UB9B0D
         JZk56LRbOb39SKJsEEs/At0RakeNzZrAd16V3BJmvf4XIrvWImrRHXEKFEBzqnefn09n
         r1+tyCyZP36LBuKDi1z9kFlLE19Z7S///cpEjFt7p/SFF5zkOtGiOGoLSdjUOsJoQSFj
         j+2KDzQb6evGpDpTpuZlBF/h0gw0pSgd0U6BAyQhw/OAE5qyCwl1UeFz2nIAH/REezef
         2duA==
X-Forwarded-Encrypted: i=1; AJvYcCXJufhOUf+CN/SZHI58c9IisL0RxG/HgKQwV1mRtPx7Z9QkAsX0XlNYfmuFVYXOoy0t4E1rSjxW3wBV2P0eaBbCYaRIq48n6Uv5W2isdAQjiXU=
X-Gm-Message-State: AOJu0YzU5Cp7qI6NYGh9lABM/rLcUwSMZ50ySTj9Ujj8DrxcofMKKnbe
	wnOP0kKHoCLRLhEsDR7gc18jR9hgmaXhuuKNOvNqLH4YyKchCwFlQmWaIF2bWCc=
X-Google-Smtp-Source: AGHT+IHPu2YWe3SsjrNJRVR4woDt4+tlOEKYS2Ep/eEIN0qqFEN0Dr1+URLpzG6JuPmVW/4sCrEdmg==
X-Received: by 2002:a17:906:381a:b0:a58:7aab:96bf with SMTP id v26-20020a170906381a00b00a587aab96bfmr3143994ejc.18.1714632603154;
        Wed, 01 May 2024 23:50:03 -0700 (PDT)
Received: from [172.20.10.10] ([213.233.85.172])
        by smtp.gmail.com with ESMTPSA id l12-20020a17090612cc00b00a5534758ef7sm184709ejb.148.2024.05.01.23.50.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 May 2024 23:50:02 -0700 (PDT)
Message-ID: <3327a63c-7b7c-4f44-ba48-89a833d211d4@linaro.org>
Date: Thu, 2 May 2024 07:49:59 +0100
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] arm64: dts: exynos: gs101: specify bus clock for
 pinctrl_peric[01]
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 Peter Griffin <peter.griffin@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: Will McVicker <willmcvicker@google.com>,
 Sam Protsenko <semen.protsenko@linaro.org>, kernel-team@android.com,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240430-samsung-pinctrl-busclock-dts-v2-0-14fc988139dd@linaro.org>
 <20240430-samsung-pinctrl-busclock-dts-v2-2-14fc988139dd@linaro.org>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20240430-samsung-pinctrl-busclock-dts-v2-2-14fc988139dd@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>

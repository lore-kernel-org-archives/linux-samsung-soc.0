Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A89721A440
	for <linux-samsung-soc@vger.kernel.org>; Thu,  7 Aug 2025 11:00:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754564452; cv=none; b=uESdlaqep3nWPx7UuenCf4LzrAksd7kbeGKTL+ZTMwiu+HmVN3igVV/dlqLki/0i4/cltl+Y1JVItGSw1Ree9sno7Ez3/fsLBJv8GLynz+gNk2ODgnDD5Fiw8Wno/yRTxdHYOk7sEqvtDDW3tfVax9JeXD7z0aeAFP1cn4WS6WE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754564452; c=relaxed/simple;
	bh=3PmQW8H0sTWjCukAvN8hvHBDjjRhejSIa84Yy9Pq27k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YOTSeZhP7/mClmWWK36vacW9mp7sO8s3TBgXfNLOHtUrFeHo3JnnADrLhjj3+ynL0qyldT4YBjRV9XGJYet2IkqNtoz70lWXopIGpj4HaBwrCO8dl/RzoOHvWDZh6tS7J9nW9lS2yNOYMgOpmlncXWSKdraFkcpUg18K5jWkynw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JeOf2zT1; arc=none smtp.client-ip=209.85.219.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JeOf2zT1"
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-7094f298e1bso1000146d6.1
        for <linux-samsung-soc@vger.kernel.org>; Thu, 07 Aug 2025 04:00:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1754564450; x=1755169250; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=bRcb27c8tScey9iDEsBA7ABHwMfEvu6ZRBi9F3TXtqk=;
        b=JeOf2zT17f6GPy1XpmKOeCh9j1+3J8VsX5nIkGwchEPd9MWc+1p3NNBbyEXRX0usbi
         9FA1kLLQbw/975yXR25c3F+T68nyhGsBVcRoT8rSZvk5IVRyTI4jiNqPupBspQrnWg58
         WNPuowsVBuzlk97VWIIVQaMLitV8sOFVSn5aSKt5hxXyd98dOibxhvJBd8x0wba68bel
         8VV3s8Mu8Mz/IKLlkF0hgw99nI+eF+niVHs4muqgHXYCeCFFfCG0AjyLz8Fg82OEF8cs
         cD0JHgNZtQm+K5W3F7ECtpUmIM2MnTkMp8jqQDOW5/M3HZVtbHcEV8scZB7g0JFESDz0
         5zVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754564450; x=1755169250;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bRcb27c8tScey9iDEsBA7ABHwMfEvu6ZRBi9F3TXtqk=;
        b=iTZnth5KaXTF6Lk3IaRm1HWWtVXLXCwivuwvGFuQjPRW4m/s2YTWA5l0kqZ8LMLRwU
         E1spBf0dXrt+SBKqRmcfboDsskRLLTu582N6B6bPrtSk9JNNldVO8WcPoj3t0eCLmsJT
         jU67prPEtEn8Bn9Wpur2Lgmakz9gWj0XIUvNKzKkMJbTX3/u1fHjuHDdvfbmnbUqDdTh
         OF1KCEhu5B49j3G2qh3kbktEdZGLNe6uYv/1wBNmjUAEyIWCx6VkvnMfGs4iw7hpXzmd
         z5yRfBNoQSpdwSjvnkdxMxaWWXb4QcwTSkQXMpckpVpOE3VCt8d1i8TnEisgWORbiFGO
         k/Yw==
X-Gm-Message-State: AOJu0YzNzddq5s9WF6Da75Av7jT8/7xrdVzwg5rKg9xlVxggkI/zcjsf
	q2nWN9xNcFgmbL4c7y4hAop5RITWVcoNGHgfavjRxuALMQ+PIADSZg5CIdhBFVEOQqY=
X-Gm-Gg: ASbGnctbBOtyxJ44hTmnxyb5ogPdrXIqOs22+JLKLklxhLM8A/XeQiPb4tpBa5tjqEu
	V5cW9oINhwhYZlUOSDXethCTPqW951yDqpaHZgdz6OGgxoBSnor/sYMk/4iHQ3sSjie3hb/YbbP
	mDlt2HEMHvK0z5oJZ22dlrMiGEJjRQRzun6eYmogfqZl7q1CsslihJImGoAvzdr8kGfJyrWullt
	jnCg1/X2d3ab8AQq5kP6oyWI2CfgqAbjyD//xQdedyVl82YO5mDsuUNhcmVU+WaONVY1cRYIuwl
	A3CUgfeptj3TNumqmHCzXAYYpThwSCIvJgAAESKE7/vwE32tn7ea6VPUJr1JoUAapqscUJ6fln3
	KszjVnG2TpK4eMfcSLo2t/Ng3NqtDVaqyH/XGc+kN7iUNxAqp4dAhNQ==
X-Google-Smtp-Source: AGHT+IFkQZucbySx973IMpGpQf31mwEpaX+tRF7OzK2L3zkcUFpWDVHU3/ckfQB6L7uNIc6/7qPHdA==
X-Received: by 2002:a05:620a:2945:b0:7e8:37f:f364 with SMTP id af79cd13be357-7e814d20c67mr444620685a.7.1754564449587;
        Thu, 07 Aug 2025 04:00:49 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.218.223])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7e67f72a47esm931765485a.61.2025.08.07.04.00.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Aug 2025 04:00:48 -0700 (PDT)
Message-ID: <fd2d1aab-a5e0-4822-89f9-eac45edd66c7@linaro.org>
Date: Thu, 7 Aug 2025 13:00:42 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/10] dt-bindings: media: s5p-mfc: Modify compatible
 string check for SoC-specific support
To: Aakarsh Jain <aakarsh.jain@samsung.com>,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, m.szyprowski@samsung.com,
 andrzej.hajda@intel.com, mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
 alim.akhtar@samsung.com, robh@kernel.org, conor+dt@kernel.org,
 devicetree@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org
Cc: linux-samsung-soc@vger.kernel.org, aswani.reddy@samsung.com,
 anindya.sg@samsung.com
References: <20250807032449.92770-1-aakarsh.jain@samsung.com>
 <CGME20250807032525epcas5p42f764c0b2af23d0e47e853fc5707cb46@epcas5p4.samsung.com>
 <20250807032449.92770-10-aakarsh.jain@samsung.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <20250807032449.92770-10-aakarsh.jain@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 07/08/2025 05:24, Aakarsh Jain wrote:
> Modify compatible strings in the s5p-mfc binding to reflect
> accurate SoC-specific naming across multiple Samsung platforms.
> 
> Signed-off-by: Aakarsh Jain <aakarsh.jain@samsung.com>
> ---
>  .../bindings/media/samsung,s5p-mfc.yaml          | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/media/samsung,s5p-mfc.yaml b/Documentation/devicetree/bindings/media/samsung,s5p-mfc.yaml
> index b46cc780703c..6a711c8103ac 100644
> --- a/Documentation/devicetree/bindings/media/samsung,s5p-mfc.yaml
> +++ b/Documentation/devicetree/bindings/media/samsung,s5p-mfc.yaml
> @@ -20,15 +20,15 @@ properties:
>        - enum:
>            - samsung,exynos5433-mfc        # Exynos5433
>            - samsung,mfc-v5                # Exynos4
> -          - samsung,mfc-v6                # Exynos5
> -          - samsung,mfc-v7                # Exynos5420
> -          - samsung,mfc-v8                # Exynos5800
> -          - samsung,mfc-v10               # Exynos7880
> +          - samsung,exynos5250-mfc        # Exynos5
> +          - samsung,exynos5420-mfc        # Exynos5420
> +          - samsung,exynos5800-mfc        # Exynos5800
> +          - samsung,exynos7880-mfc        # Exynos7880

NAK, ABI break without any valid reason or explanation why.

Best regards,
Krzysztof

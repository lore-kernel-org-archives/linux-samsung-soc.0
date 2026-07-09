Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41BD0238166
	for <linux-samsung-soc@vger.kernel.org>; Thu,  9 Jul 2026 13:10:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783602656; cv=pass; b=dykS/6y8wAJlzIxAV4YM4oJ4XkQpUfOTHzwzTiduaCgXFsN1qKge8rPgEoSC3kyma8ygJWlwNkyEA2aLCiTmwlC+1OIYdFgq4w7SNDFi+UlOi8vX6Nw0zPZPx13p/Ujy+HRAYX2WYu8WTMSQCsffdWwfl1Xq6B6Gy5j2HexBRfo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783602656; c=relaxed/simple;
	bh=jBgIT/3JkSEiSXb9BFVoD2KFzz1etXCmQZo4kJViH8o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ecXkfKzJpjW1Qrl7SQBc7Scyk6exO449t5D5e3r+WzJZjB6/ZvLsrjHjOxNPTsyOcBMi7wMV+/aGAr53JUhOMuVv36ivh7+zc+sH2ewPssyI3DfYnHoLy+GJXgll4lNH0iDo8M2orly+9ObhefQu22Qilw6I/lKLYlAchBOjiSY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rcReJAEL; arc=pass smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rcReJAEL"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6976b0c5adbso1582300a12.2
        for <linux-samsung-soc@vger.kernel.org>; Thu, 09 Jul 2026 06:10:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783602652; cv=none;
        d=google.com; s=arc-20260327;
        b=E4zv1+JMh7bVEVl4lMxaqB1fpkeatOpICW+yYJUK8e+HsKD3U6AFMAcB1D4o5a1LwF
         sYG3qrZfd1t5p0pnlMgVXYSRps3JqRIg6FMmpTh5YYqGZQIX8sQHa1JCUTjrMMN5Zyxy
         zai6MutKGH2uD4Eho3cXWDoHSuhn7GU1p3VYaqcvVZIXwh4x34KddQT2W+NXHevQ0PoN
         4dZR8EsmJb5L4nUMpyUxjxORZOs0Ck5zOLGLQJGtsIzuX2KSpNcwygz2oevCsbRsz+4m
         bSybCQij3nurTgWwsO+IZ7XJEdsKN0G9e2MzSvSR7CSqe3spz8vbgYac7d0am7urGrGC
         5Isg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=U7Kmv08cr/vXN/lQoowvHwCG19gM8kPqiBIx7P0p2BM=;
        fh=YQuFVGKlws5GyRlKfp+PmoU+74tiwuG3e1HoMHKxH/k=;
        b=MhbRGou05WGJVymHy3oBB5h+0nqvSEjeUfn4u7Tophj/TNkEK9UdTEKDSbMLG3jiqk
         K8iVOOcQULeGxyL72krn9uKxoeDljj75SPbh+BF41dpU7IyppbUhkPDTihRyaNjmgKoA
         iaP2jyyvC7ziJWqZjYsoLhAd2Ye9RnsB3TkNerf/2vraN8v994mFtqxNP48oipp12GCg
         bO7CJfxrEPdlODO6IUQabbdhUdwF3veQiRVE+k+JlnnKWNzynB5Lp+Z+fQ5jHrBwK/sq
         gSw3FQN59RdZMOhsQwJgOEGN0fhWau6B/5/Nz46aU734PQtuWA+zE9mBf5E9YMa141Mb
         rP0g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1783602652; x=1784207452; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=U7Kmv08cr/vXN/lQoowvHwCG19gM8kPqiBIx7P0p2BM=;
        b=rcReJAELE6y53oMZT1b1ksFweKPH+HU9mDua38ryoHZyJV7EsQ9wh3AcS/veuA6xLC
         l1VeAHLI5eiZj5mXg+o7/D8SvG1OVS7VSonT5RDtTDknNccs7tGhVRf4e6BYRSKVUQ6T
         nhGCSQpqYQaTiDA09sUEQPaFbJ3rv6tf90aCpaBXm1qtwbndkEUeYpmqSL9AkeboajDu
         RD7tj5bhMQQUHFcA2KYldn8hmDuHY2y/zzFBr8R1DjA1q9DX+EfMsX8a3m1wfbgi6PX1
         22Bt7omHmCnpYCnGZzkFL9cfViV8HM7csJ94OQzPVTKysA5HfmDsb3ayeZPPV6Lx/bkr
         Vtiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783602652; x=1784207452;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=U7Kmv08cr/vXN/lQoowvHwCG19gM8kPqiBIx7P0p2BM=;
        b=bj3L3UN2F+6pza4iQi6RvayP5PHWaIeZ5QzjtNoqUTcUIFuev9iMA4shs1sVjNBteN
         ljNBA8ZrK/K0XCJ7oW7zislzriZSQy7P8dJevlH4nddNin7g1HEfSmWq8EzEw5cPK3OL
         S/UUdcvQT66B0rAnyzHIHFOQMVIfH3XKp/RakBZxcoPKUaORgZYuVsVzQ/MOhMTRgvCA
         NgSpi2LCm3B1f5iFEukg/wOg7wjUMee1df1W7JMMBmIvoOkJC8vTROlTpFuXxnGoKxcp
         Lr3CiEg19/3LKlStF0TKcSdcR2X+H+eh6lOtN2Ud5kduoIRrMoaGOTt9PGlyBCE9RH0X
         PkvA==
X-Forwarded-Encrypted: i=1; AHgh+RrVfBCvPdXCIVnXglh0hfUUasgaqvvRh3No5k16uWaQE7yb0bPHQavdzo9/UWYnwZFO9V+JebZwr5AYbEJ3T4rMPw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1ZISR4dXn39JEG2bPwpOPO09sVokM6mrCxge8O0n5okHk/hZl
	a0CgI/gFpi/4LGZ5c/gq00Mx0XgouWPrN4xXQYacz0yKpn/j29r+fjVJgXXyW2r8LAS5cEOijLV
	kIRrY8VO4MR/unf5gRWxDGirXvbomFLzrMXD2CkNg/Q==
X-Gm-Gg: AfdE7ckXMBn32iYxmA3Y3ImtpkzHI9ygehK7F/wuvEqNMschlgrjDE5GLZFxzEzS+Ai
	wFfLdD1PZ4b5K7CoBrkYSCNgO7rsKM6o/Cjkfb07Y9Ggf2cKb+LvXa79m4iNX+rAYcw4f9guywe
	2TifG0PNfuAlhaxYx8KkL5OmvDAvoS9B8vfoomTSooOie/oGhheGgJrAa1H099BJ8jrgtlierfC
	eJKz0utGVzwgBZRmlP7M7gyHzUT1B5O1p7KDdICfLyRuDmIRpsIoAcwDqMTg8LmwDvht4kpUJgk
	WbNx2xNpoLB2jWg7d+tjntTLG2bRTjg=
X-Received: by 2002:a05:6402:3595:b0:69a:a9c1:c33b with SMTP id
 4fb4d7f45d1cf-69ab44aacddmr3005773a12.31.1783602651660; Thu, 09 Jul 2026
 06:10:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260701105731.196618-3-krzysztof.kozlowski@oss.qualcomm.com>
In-Reply-To: <20260701105731.196618-3-krzysztof.kozlowski@oss.qualcomm.com>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Thu, 9 Jul 2026 14:10:40 +0100
X-Gm-Features: AUfX_myQ0gFl-ytrmuBc8dxFLfDYOP7Y9AYpNDt10PW8eTtKc3T-jFh5D_m4h-M
Message-ID: <CADrjBPqGMUOWtm8nGHpkQTRkAHtxtpNi6SuTdE0x61zO0eG3Kg@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: samsung: exynos-pmu: Restrict children
 with unevaluatedProperties
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 1 Jul 2026 at 11:57, Krzysztof Kozlowski
<krzysztof.kozlowski@oss.qualcomm.com> wrote:
>
> Each schema for a child node should end with either additionalProperties
> or unevaluatedProperties, so add missing one making the schema tighter.
> Defining 'type: object' is on the other hand not necessary when other
> schema is referenced.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>

>  .../devicetree/bindings/soc/samsung/exynos-pmu.yaml         | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml b/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
> index 76ce7e98c10f..d124f3ae9fbd 100644
> --- a/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
> +++ b/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
> @@ -94,19 +94,19 @@ properties:
>
>    reboot-mode:
>      $ref: /schemas/power/reset/syscon-reboot-mode.yaml
> -    type: object
> +    unevaluatedProperties: false
>      description:
>        Reboot mode to alter bootloader behavior for the next boot
>
>    syscon-poweroff:
>      $ref: /schemas/power/reset/syscon-poweroff.yaml#
> -    type: object
> +    unevaluatedProperties: false
>      description:
>        Node for power off method
>
>    syscon-reboot:
>      $ref: /schemas/power/reset/syscon-reboot.yaml#
> -    type: object
> +    unevaluatedProperties: false
>      description:
>        Node for reboot method
>
> --
> 2.53.0
>

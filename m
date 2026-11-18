Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795013135;
	b=xAST+3m2HSA2ubhQ1p8W9XwhUa97RiKogxccfhWWNoDclk0NiwbqysCTkWfub4qB/kh3
	 fTaL7YnFSGxDfVGXlDCNgOspcPoNot02kJJMYDrMhar2m7QqpPHcfEC8Sv5bbACKWReQE
	 h+Sb1CJ3GErbHRhziG6VuOQPjg8x07EDuF0fraZ+5tcIAdUxwP/+fkHNAj9DZh9qg/f3d
	 HPRTyeVhRTfld7pHGLwoVeFxO3/HCP4lTlEcVcqgsTIvnVSIytQ/lo55/1fzu2PmCPMpq
	 1OTwO8NJmgRl5Gm+ObxqcpLxEC8V0SGfxTXpoRNNbBoS+HsDzcBAs9DsezCUnlnojOg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795013135;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=dW8jz8AGPYPy5zw3TfeSNEgxlfsTPgtxmP0tja/c/ok=;
	b=1XqoH/Gsuds9HES7vtyU7pB+9VibnkIatE8Al5F1T+IOP0L+yvsgShi6AFLnW6rxuzLa
	 kihxB0K8dRect+puYQztXGq9BwObgokG8CpFqh8lQEv8zLa+CyJhnBFR+acCPfz0hYKG5
	 nIjGxEYWcBx5faZ8R9FCIlcHDDODO6gSYqbAUa1yoSNas/u+VHRx9fUGGB+DIwVZXdSBf
	 //ejM9mpfdjG7wh3iJ/AcV8AnERSLsBZ9StSBucU12cWVn+H3YRvgvDZOdlkBiTJX8mca
	 6OBnrXrH6eIRLGVmK+6PyD3sAcS+yZS3vjtQwMQhDsSJC7TCSmLW+m0l5hq5YXpTXEA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=JLRcCDP5;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A590606A320
	for <linux-samsung-soc@vger.kernel.org>; Wed, 18 Nov 2026 14:45:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3A590606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=JLRcCDP5
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a207b02a2cso7549275e9.1
        for <linux-samsung-soc@vger.kernel.org>; Wed, 18 Nov 2026 06:45:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795013133; x=1795617933; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dW8jz8AGPYPy5zw3TfeSNEgxlfsTPgtxmP0tja/c/ok=;
        b=JLRcCDP5KP9Cz/mk2sL+Tmx3hGNnM5hWNFKWoZYjadAW4ctRCznrJYe6OmmNVyo7Bf
         l+o1RGlM4i+IrmfOeX2QmLT+wHx1/7ZzndxB6C2LLcRf3TKTyN23oX8oOsLote9uYypZ
         HjARGnm/tqHq8AuGMzkQSoFLsWiB9WJyWPWen41EoQKDOjghhPxGthrefowo8dL5ua8u
         jJbStuiRg42yPYPeC7UjdlboCDDkZoya6sU9P1hMFtJVmJFihsyaA6H4dGYAzAvHxtEr
         JXccfMZmbxBeJniCE8ryTBGz06eFclr+fhO38j+FGza9oOKOJPBmWum0jtXY9m2uzEIk
         ihdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795013133; x=1795617933;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dW8jz8AGPYPy5zw3TfeSNEgxlfsTPgtxmP0tja/c/ok=;
        b=TyDrlul61LiZC3F8pLSg9De1HRCgSkBs/HjOFVwvOTU7tr2Fedd8qG9643ydjACPf3
         aE0GKNMVJ/NJkm4P4g6rg+FNFBDmWEtCsj9XRrsrbRGloi4WrCAUgULFhO6d89EfJOgY
         MnXADBr+hNAidIO77Av9HQb67X53o3upwBRRdnOHCGhzKxgz32jko4Uo5ayJX4Vew2Ze
         3w6eE5YBlMsjVYoeO/jktXFQsBM/Gc8E78iMHyJh7FNsGH4sTTTC1kE4KTPERqGaBF+z
         3YPYdp3AOYp8ar+2rHHSzoUsINDRZFqvtYcoQw5JE+ImeYV38MN4CHP5u2E6dgP9uBQc
         qlvw==
X-Forwarded-Encrypted: i=1; AL+hErEqCwOolhWSmK0vmFaNHReqjANxr6onygFcT183so2A/DwOOPiBGs0rQWAZ5F2bJWll9zY7lMDvyK06HpAdE8D8OA==@vger.kernel.org
X-Gm-Message-State: APuU4Z+YweMqrP94sM5oioRc/3NZ3CKcPj4bzDPoj5R0pCxNJWb16uph
	PQj9o/yRg+oopsZUJQbrvwpLenHHPWKyv+DqwLrjH+Jegc0r+1D8PhSzoCYr8KPWnRE=
X-Gm-Gg: AYBFou2t4uRQXGqh9ivBPtFdTfF8mGR9jjLS+/6UtpCuq5ZDlQpsjRqwpZxsEGm30OY
	ECCPcDOwk61TQ7FOkBgMTCvhbNDttCQa1dYCk3ftoDeUiI0hHbGzKGmAyDNGljopmMxzinN1T1e
	H1SN7nBqc0Ui1PdPGjsJjOlNGoVlB5+Eg2hQDKbMVq4G15Drq+/zyA0ut8rWPfM00SYKABMCKHZ
	NWe7MsKZCamTxDk/IwQb9vmtDNv7ewH87ksdwA1mTgJ5zpuX0LCcVnRLeG5HYjnXkGOc5u02iz8
	gs/hzekDE+KSXYYcT3yVXD3goFeQiceIwgThjrYZueEi6StzdeDLJ7HK6KWlv4Dml7VHfyAibqR
	p4+BW3ziNVJPGNziwzdIP2+YPVLjtRRCFfdcHNpKyWvlfgAjqp1qn7mxXmbHtL2WAFcgl4TmAWG
	/lJE5DRq5NWIdvN1J2JeAYYODf5l3cSrb5IieV03tdjX6OJuw2VNEKdhZeS77F4Iw2MmjuAh+aX
	/Hi60XU0hH+szPa5MvZqOR0UMlJwPDO61X7VuoEro6/Ob5XMWDwLV/H0a/oqPPoCp0PaBT9SFAK
	8x2nX9APRauhNo+rORhYjt7HnZtC1ORuqHgW8kM=
X-Received: by 2002:a05:600c:8b51:b0:4a4:fc8c:cfd9 with SMTP id 5b1f17b1804b1-4bb7da3a65fmr52309385e9.25.1795013132472;
        Wed, 18 Nov 2026 06:45:32 -0800 (PST)
Received: from [192.168.0.252] ([82.76.204.26])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a6560962adsm5382230f8f.41.2026.11.18.06.45.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Nov 2026 06:45:32 -0800 (PST)
Message-ID: <ee73f5ce-906f-4411-9449-d17c3abfa11d@linaro.org>
Date: Wed, 18 Nov 2026 16:45:30 +0200
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Post: <mailto:linux-samsung-soc@vger.kernel.org>
List-Help: <mailto:linux-samsung-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-samsung-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] dt-bindings: thermal: gs101-tmu: add Exynos850
 compatible
To: Alexey Klimov <alexey.klimov@linaro.org>,
 Daniel Lezcano <daniel.lezcano@kernel.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 Lukasz Luba <lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Juan Yescas <jyescas@google.com>
Cc: Mateusz Majewski <m.majewski2@samsung.com>,
 Thomas Turner <tturner@lineageos.org>,
 Peter Griffin <peter.griffin@linaro.org>, linux-pm@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261118-acpm-tmu-e850-support-v2-0-19848c0d97e5@linaro.org>
 <20261118-acpm-tmu-e850-support-v2-1-19848c0d97e5@linaro.org>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20261118-acpm-tmu-e850-support-v2-1-19848c0d97e5@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 11/18/26 3:51 PM, Alexey Klimov wrote:
> Document the `samsung,exynos850-tmu-top` compatible string for the
> Exynos850 SoC.
> 
> Unlike the GS101, where the ACPM firmware handles most of the TMU
> initialization and threshold configuration, the Exynos850 firmware
> implements a significantly smaller subset of TMU IPC commands.
> Consequently, the Application Processor requires broader direct
> MMIO access to initialize the thermal unit, configure thresholds,
> clear interrupts and collect calibration data.
> 
> Acked-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>

Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>

> ---
>  .../bindings/thermal/google,gs101-tmu-top.yaml     | 26 +++++++++++++++-------
>  1 file changed, 18 insertions(+), 8 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/thermal/google,gs101-tmu-top.yaml b/Documentation/devicetree/bindings/thermal/google,gs101-tmu-top.yaml
> index 75560ebca48d..bea208cd4619 100644
> --- a/Documentation/devicetree/bindings/thermal/google,gs101-tmu-top.yaml
> +++ b/Documentation/devicetree/bindings/thermal/google,gs101-tmu-top.yaml
> @@ -15,17 +15,27 @@ description:
>    both direct register-level access and firmware-mediated management
>    via the ACPM (Alive Clock and Power Manager) firmware.
>  
> -  On these platforms, the hardware is managed in a hybrid fashion. The
> -  Application Processor (AP) maintains direct memory-mapped access
> -  exclusively to the interrupt pending registers to identify thermal
> -  events. All other functional aspects - including sensor
> -  initialization, threshold configuration, and temperature acquisition
> -  - are handled by the ACPM firmware. The AP coordinates these
> -  operations through the ACPM IPC protocol.
> +  On these platforms, the hardware is managed in a hybrid fashion, though
> +  the distribution of responsibilities between the Application Processor
> +  (AP) and the ACPM firmware varies by SoC.
> +
> +  On the GS101, the AP maintains direct memory-mapped access exclusively
> +  to the interrupt pending registers to identify thermal events. All other
> +  functional aspects - including sensor initialization, threshold
> +  configuration, and temperature acquisition - are handled by the ACPM
> +  firmware. The AP coordinates these operations through the ACPM IPC protocol.
> +
> +  On the Exynos850, the ACPM firmware implements a smaller subset of TMU IPC
> +  commands (mainly temperature querying, basic TMU initialization, and power
> +  state management). Consequently, the AP is responsible for register-level
> +  access to initialize the thermal unit, configure thresholds and handle
> +  interrupts via MMIO.
>  
>  properties:
>    compatible:
> -    const: google,gs101-tmu-top
> +    enum:
> +      - google,gs101-tmu-top
> +      - samsung,exynos850-tmu-top
>  
>    reg:
>      maxItems: 1
> 


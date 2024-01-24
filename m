Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 580BFF9C6
	for <linux-samsung-soc@vger.kernel.org>; Wed, 24 Jan 2024 06:32:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706077960; cv=none; b=CJ0rVopeUMhC3jjURxAnhAam0t4A7Wl5JpxL1i9CzkPDedYLlB2jUqC3E4TrdQnEMSbqdPZiBMM0Irn9PdsceLBnavBUh4vj7SQTMPGjHkvRk7FgU/ntffzt7Qk6iqFyNxEjmAtXDy1XgePDQN3lKrS/y8CIlpk2wnQjotbSWfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706077960; c=relaxed/simple;
	bh=W2A6Spf2jYLp0Om551ROYCkUMUGNSA0Xbwv1wks76g8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HiqRYG+JTYJkxgRbhur945AjG9xMmY8wt2gWMaOIkin4NaYvbTYyevC50FBO0ID86QaaNvPKPlblwkKtCWVfvMr8bjQAidn2air2dRBno1Bxpx5OkZPams2rV3cPy9KgdpAvVgTV16qV0fKIYpS5UpJI2gqIEb59fuDjK1VuAyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NCXhHkKE; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NCXhHkKE"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-40ebf373130so13611215e9.3
        for <linux-samsung-soc@vger.kernel.org>; Tue, 23 Jan 2024 22:32:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706077956; x=1706682756; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RbAT8z/Z9mzjHZAanqmmp59HdJKjGmfrVSvJnkugrds=;
        b=NCXhHkKEFGqPHJBlR6Cc0o46T3GSKaAGzg9T36Ckt5UZvf43aR8AY8X9cdMOxkuXRj
         miwSLRKmCrDkRi7O3WJ1q0Ot65PZcWKR+dMHENcFSHmSDgG0jyrRoav1kZGhNuLp5d2y
         X+JKZFqOhWQFKzYjRzAd4hqTK1iqPP3ra+rjjafGt0keyjcZ4hVGoMFnPriG3IyOEjpY
         Hrj8iA/r3wrPMmw3MuI7tBNQsi0g4mdVp40ZgU/F3woxQORO1qr5LWpyGMzDkEnstulb
         kN/Q8Ge1NN/1bcYiAUzSpHPuLk0F/6oZ08XUDECpIBZAm3fYPLZQot69UyVnensahqkj
         6cJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706077956; x=1706682756;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RbAT8z/Z9mzjHZAanqmmp59HdJKjGmfrVSvJnkugrds=;
        b=Aag8GvpKiue2m3/dkBo2FDqdWitONNEpo6JHZztmko6NwwJPikNVBMI/ziyaXVe5Dl
         3i3ORxfVs83BRGzvWSPXBnPjPCQyMii7z+9+BCYUxeir+1BbdqkWPaKLqfiOYfJImlWE
         pHF7CVXXjaSmAxP0q2ghJdXjpuuS0+u7wSmG8/oAhXc0t+hwBwaedDJiOFKnq4fXbgHs
         hauNP/yQj2m7Ed3beG6kcKonAtSfuy3upXK9fJljoxviNBGEZ+sGnaum5gkJ8JOLNXso
         SC+7Pfm2oOFPQvovgwPqtzGEt7MtgJ62rv/5mxYamTHXMaHicbCYt8Mn0q2W6ArJD+80
         7AwQ==
X-Gm-Message-State: AOJu0Ywb83Vg/jftwH8qQi5Mwnwwh0E12gkRavSBLAUfuq2I5/mAfKyA
	QLwQ/GupybJw+mDB9APk1hRmNFwUvFkL7Nl7fyn2sgN6QDdyURTqidgI1p/vp6E=
X-Google-Smtp-Source: AGHT+IF1pY971lIXL9bV04ZP9uV3BjbYP/RorxUyM06IpSBhjN85T7dfZN2WdsKvttVXPMoz0Ispiw==
X-Received: by 2002:a7b:cc93:0:b0:40e:51e:7295 with SMTP id p19-20020a7bcc93000000b0040e051e7295mr1062828wma.82.1706077956521;
        Tue, 23 Jan 2024 22:32:36 -0800 (PST)
Received: from [192.168.2.107] ([79.115.63.202])
        by smtp.gmail.com with ESMTPSA id hg14-20020a05600c538e00b0040e5cf9a6c7sm44673594wmb.13.2024.01.23.22.32.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Jan 2024 22:32:36 -0800 (PST)
Message-ID: <14ab8da0-5b3d-4878-84fd-ad7b7d150eb6@linaro.org>
Date: Wed, 24 Jan 2024 06:32:34 +0000
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/7] dt-bindings: spi: samsung: Add Exynos850 SPI
Content-Language: en-US
To: Sam Protsenko <semen.protsenko@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Andi Shyti <andi.shyti@kernel.org>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: Alim Akhtar <alim.akhtar@samsung.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Tomasz Figa <tomasz.figa@gmail.com>, Chanwoo Choi <cw00.choi@samsung.com>,
 linux-spi@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
References: <20240120012948.8836-1-semen.protsenko@linaro.org>
 <20240120012948.8836-3-semen.protsenko@linaro.org>
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20240120012948.8836-3-semen.protsenko@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 1/20/24 01:29, Sam Protsenko wrote:
> Document samsung,exynos850-spi compatible which will be used on
> Exynos850 SoC. Exynos850 doesn't have ioclk, so only two clocks are
> needed (bus clock and functional SPI clock).
> 
> Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>

Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>

As Krzysztof mentioned, I see lots of spi dt-bindings patches prefixed
with ``spi: dt-bindings:``, so probably it is better to follow that.

> ---
>  Documentation/devicetree/bindings/spi/samsung,spi.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/spi/samsung,spi.yaml b/Documentation/devicetree/bindings/spi/samsung,spi.yaml
> index 79da99ca0e53..f71099852653 100644
> --- a/Documentation/devicetree/bindings/spi/samsung,spi.yaml
> +++ b/Documentation/devicetree/bindings/spi/samsung,spi.yaml
> @@ -22,6 +22,7 @@ properties:
>            - samsung,s5pv210-spi # for S5PV210 and S5PC110
>            - samsung,exynos4210-spi
>            - samsung,exynos5433-spi
> +          - samsung,exynos850-spi
>            - samsung,exynosautov9-spi
>            - tesla,fsd-spi
>        - const: samsung,exynos7-spi

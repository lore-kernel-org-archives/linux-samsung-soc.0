Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792459506;
	b=nQHrPIhz2QD5u+qgomKJrMu/c3rgFAJ/WPYWwr5Tc3Puyg54hz2gkWo9at2Nhn5yG3Kk
	 8RsMgU0wRL7i3RfNwF7yiK0mD36z0s8QlcbxW0iaLVYCvTkB5p0jEChZznDUCZEq2ORqL
	 LAXn9xXOoJ1y0I5RNs0cTKLeDNEu3m5uq2rhBE/xer6ghifFSjwMVCKzezvdwWXdphXoP
	 SlzE6GXsNw08oELcmtXOjen0Gk8fBDjfRKPqbioGaA7gGvLVaQu4/1hoTlNIzIxrGfqQ4
	 78ocBCf4AOXZvhfNVtnCa9/WgM2YQx+XYRQJ7DcsztkW+9+gM+2J2v7EIPaH4gw0q7Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792459506;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Sender:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=G8hApdbjB2FWFRs0szr0ee40pXh05s3I5KLtI9DczSE=;
	b=fNkSKXBczCbwqALh7X4aPsBcxkhQ58ZolGByfZMTI/0JTIhN+vkPZbYd3z1lHlMX8Fnb
	 xaZ16Fd0bzKzXRrhvEp2IAG7D2ibryz4xdZESM4rEsbPGXMYzQlFqHPqHmPvFza7f85eQ
	 QKG6oKhzQa6I2E1s77aNmc3GOAiDDULrwOQBBOPt+eoyluhWkq9NicZdd2d/lVsUJxIb/
	 SMzRqB5K9gYvNi870MdYzgqJy6H1qQdbkPZV9ioPStfBpThv3DcTbkUrYTCOaZcAWHmCF
	 0hog0HVHW8P/ZPWEcGL9CILAdATA13MLAwjRvio9wLmhBH9yrIxqZVyC0Kr/L284YZw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=GkRT5n2e;
	arc=none smtp.remote-ip=209.85.214.178
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 739EE606A31B
	for <linux-samsung-soc@vger.kernel.org>; Tue, 20 Oct 2026 01:25:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 739EE606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=GkRT5n2e
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2e98798cbddso10589205ad.0
        for <linux-samsung-soc@vger.kernel.org>; Mon, 19 Oct 2026 18:25:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792459505; x=1793064305; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=G8hApdbjB2FWFRs0szr0ee40pXh05s3I5KLtI9DczSE=;
        b=GkRT5n2exhVq/bZWWaWrZfPBL5AwA74qNvh5AAr/Cgsx40W5miy0tb90dSrybPiAoA
         KYS5YrJMDwOJXQVm76DgepdKqhnCx6Iqsq4sLd3shwUGNj+OzN/wzokmuCk94+5xm1SN
         G2jJJDfuyh1SPZWyN+0RBm6NMNTfrQ12kcYn0FR2vl2C3JS3yLPcfijVc77wQLPIm6vq
         0pp+oKwJaT2ebEfzBfEgJGVN+hRbpSnPAW5glKNFeZaeYEtDVNk1g9RqbjKbqRNL7hXS
         Z5BfSnwFx/NFDkivzx6gPW43iJAAXPY0qzt+svke0gxc94DfosSykVf9sF432y8JhxHn
         aWHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792459505; x=1793064305;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=G8hApdbjB2FWFRs0szr0ee40pXh05s3I5KLtI9DczSE=;
        b=qqCcpb8/vXNIZK/HlljQ6BfL9TMEvRNztfHrK2OJoWPbsK/7dNxntUamG3ldVLQwg/
         RQKvFu5ggByP2S5Tq9Jj7WEqhriknOHp65k6P7Fnhd4hanAnrUKG7TOd4vi8Rsir+Nbr
         MBpvKn+eCpJOc1IP3W+QkkgF03zutkc8DMjZ26NAxSAb2e3tS8DH3KAqJdFRwNS0tT1P
         4TY6V2LOho19Mp2QqsGaRTKUU3YTG7hZqXmVWC8G0ctk8FXj70ZPl5mb1452zo7iGrJ/
         J/Xs1cYyCejVyn8V6CuTwfx33hNRDX9LXSbJXHXysMLwcAfBomv3D3kcWXzItkYdkOhl
         t88g==
X-Forwarded-Encrypted: i=1; AKwUvBwIQAUuDIHJ6t9wsTz/EKS5e2oS5QdE9b7mTviumZth82EomxIMwzKqmUr5J2zSkdsTf7hyv2GGBlse6kNiYy7M7g==@vger.kernel.org
X-Gm-Message-State: AFq9FYLB+d0Y9qFw8F3HG/MGu0xKcjzvXr6JznMEOD3LJkx8cyCUVe6i
	/R5FP1T9rC7JaDrgRbCgRVxMXHVPD0X/fS8XF2j8gau4weAFe3CQLXLq
X-Gm-Gg: AYBFou0cTFqB7kLniaZURizzT6EbNSLo6sNhe6c+R9tE+7dGfpd3RcBug3Qoq5A+HrB
	yqHClMjK6P7Y3q+tUxcnbYj/hxXQoHAAzdq4M4zczBY5tmcneVJPLDbSQzFwQV1NHrgGiCPyC8a
	j8hjPPHTRyhTXGz7y3IONvjDNTzzCTenReFDD5WgBh8KaNrpWrHtRRNQaqbwvzAedxzd5aD6ODC
	qQbnA14DRiu99H8nz6PjuqqjPy7I9WLvPPI+JzZBDvON737kMNYt+yWwsSXPyOpcmzy/wV9mtgR
	FUmX/EiXaW0xMvgunjaJBDUu8zug16qLZuZosVR5haUqBRU7pB3cj2mmmZZ6lxXG3wTkgd0J17t
	ze9kUxIvDCtLripYEtuhLJpYOc/MQYBfzlUw7UF1aex0n/TuxvMXGNKIG2MKQbSSraRhXHTP3Gi
	fQf9poYjPxu2Y7C6SRwmJWANi9TRhO/XfbAUI38zsgKjtWxLqyelLuPeTI5OaG4pAUF+VcJ6bMV
	us0xq7EpW1U
X-Received: by 2002:a17:902:f706:b0:2e8:2f95:764d with SMTP id d9443c01a7336-2e9a6f57a2emr77436145ad.59.1792459504698;
        Mon, 19 Oct 2026 18:25:04 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea14dec6f0sm6844815ad.30.2026.10.19.18.25.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 18:25:04 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 19 Oct 2026 18:25:03 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Alim Akhtar <alim.akhtar@samsung.com>
Cc: krzk@kernel.org, peter.griffin@linaro.org, robh@kernel.org,
	conor+dt@kernel.org, linusw@kernel.org,
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-watchdog@vger.kernel.org,
	hajun.sung@samsung.com, wim@linux-watchdog.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: watchdog: Add Exynos8855 watchdog
 compatible string
Message-ID: <63cac66c-98a7-4174-86c3-68c1e2f15805@roeck-us.net>
References: <CGME20261006160157epcas5p37b8a0053c489b051dfb415c9b72ba178@epcas5p3.samsung.com>
 <360067785.01791340382096.JavaMail.epsvc@epcpadp2new>
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Post: <mailto:linux-samsung-soc@vger.kernel.org>
List-Help: <mailto:linux-samsung-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-samsung-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <360067785.01791340382096.JavaMail.epsvc@epcpadp2new>

On Tue, Oct 06, 2026 at 09:50:03PM +0530, Alim Akhtar wrote:
> Add the 'samsung,exynos8855-wdt' compatible string to the Samsung
> watchdog device tree binding documentation. The Exynos8855 watchdog
> nodes use two clocks (bus clock and source clock), require
> samsung,cluster-index and samsung,syscon-phandle properties, similar
> to Exynos850 watchdog implementation.
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>

Applied.

This missed the start of the commit window, so queued for v7.5.
Sorry for the delay.

Guenter

> ---
> * Changes in V3:
>  - Removed comment "for exynos8855" as recommended by Krzysztof
>  - Added Reviewed-by tag
> 
> * Changes in V2:
>  - Fixed Sashiko review comment
> 	- [Low] dt-bindings: watchdog: missing comma in samsung,syscon-phandle description 
>  Documentation/devicetree/bindings/watchdog/samsung-wdt.yaml | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> 
> base-commit: bf1ee2bd5c2da8992f33c8950ef194aaff74ed6c
> 
> diff --git a/Documentation/devicetree/bindings/watchdog/samsung-wdt.yaml b/Documentation/devicetree/bindings/watchdog/samsung-wdt.yaml
> index a32c47831577..37d9fc9b68f4 100644
> --- a/Documentation/devicetree/bindings/watchdog/samsung-wdt.yaml
> +++ b/Documentation/devicetree/bindings/watchdog/samsung-wdt.yaml
> @@ -25,6 +25,7 @@ properties:
>            - samsung,exynos5515-wdt
>            - samsung,exynos7-wdt                   # for Exynos7
>            - samsung,exynos850-wdt                 # for Exynos850
> +          - samsung,exynos8855-wdt
>            - samsung,exynos990-wdt                 # for Exynos990
>            - samsung,exynosautov9-wdt              # for Exynosautov9
>            - samsung,exynosautov920-wdt            # for Exynosautov920
> @@ -52,13 +53,13 @@ properties:
>      enum: [0, 1, 2]
>      description:
>        Index of CPU cluster on which watchdog is running (in case of Exynos850,
> -      Exynos990 or Google gs101).
> +      Exynos8855, Exynos990 or Google gs101).
>  
>    samsung,syscon-phandle:
>      $ref: /schemas/types.yaml#/definitions/phandle
>      description:
>        Phandle to the PMU system controller node (in case of Exynos5250,
> -      Exynos5420, Exynos5515, Exynos7, Exynos850, Exynos990 and gs101).
> +      Exynos5420, Exynos5515, Exynos7, Exynos850, Exynos8855, Exynos990 and gs101).
>  
>  required:
>    - compatible
> @@ -76,6 +77,7 @@ allOf:
>              enum:
>                - google,gs101-wdt
>                - samsung,exynos850-wdt
> +              - samsung,exynos8855-wdt
>                - samsung,exynosautov9-wdt
>                - samsung,exynosautov920-wdt
>      then:

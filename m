Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com [209.85.222.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E68213AA2F;
	Fri, 27 Jun 2025 05:03:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751000596; cv=none; b=ApdMfYtWrg0uEhSY73lHFrxbbhjKa0LZ/cLFctDK61oOiIjvbNh4dTLM3ZAuBG8noFa7scVQp9aI/OB7zAvohp8Tt8dkQDFGZcKW5p08WguQuFtzfb0wJX11+IKS28Wy0GsklynpkJ0GFugbH4FXHA/stRV/wBgrfZWQuf8Pulo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751000596; c=relaxed/simple;
	bh=bCxLgBWa7qh7fI3aJyT2Vs16rxfLHHiT+sd7cIbc8xM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dFfq61ZjkdQZZGXhPenNAyKPZNQ+oLDWqWNpyMEviqVX/cexajfyhtOHIPT6FxynFXR9X3lFeDj1l4+dutWRtEdPxyE6xIxs2zE3z/L6nJ/YHBik7G1MSG5xvITKT+hoHMpkio/T4kAJCdvQ9R8SsnZk4dq5jzTQdbuZ8wsMD7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jE3vtlam; arc=none smtp.client-ip=209.85.222.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jE3vtlam"
Received: by mail-ua1-f47.google.com with SMTP id a1e0cc1a2514c-88150e9fba7so1048840241.1;
        Thu, 26 Jun 2025 22:03:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751000594; x=1751605394; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Sm4hHqZdHlJKjq+/RMjrxVZ+kQH4qjoP0GpZOg4z/2c=;
        b=jE3vtlamoDFV7/RkgghW2tuSjtPepjWeWJJd9OpGNG9vb6LrqX/ViQcNuxaEhudlgb
         tD9TIgQoSAwzr2m/a5zmnBkd0lZkqaC6plpK5z1vzzmWdXjWRRtCiG41WbQRbPmY3nTp
         N90XBMwsxJGNo3rkr0EmO06bFfuPZQaF7zNx1jeWeFWEavRDsi3+Z8gPrrFEIGRNjcJp
         os3aSghE5+QeP1SkaBL8igLWZBlVIgYRiu9rqV8uqDXRLj6b3/jx5DotMOj8JYqk60ME
         pNk6b7FbsHJ92fAV0NSRptYhwrJVVfMiPH5he+SMaif4WOS5wam9byzjOKD2kB3gcrWs
         Cz1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751000594; x=1751605394;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Sm4hHqZdHlJKjq+/RMjrxVZ+kQH4qjoP0GpZOg4z/2c=;
        b=ED58i52qfMiYSQtBkyBvrTzAfwgveGGODBaLu/OrEF7kDYmXwk+sLEKCQAF3Dm/965
         GzDHK6cwb95WVbF/V6SUUcNItEB+NKvN0HbEEYV/646pY6LotTqRnvDYXLDFMSAiU3sW
         h0IezKVa8CuLI4b/YZLMIyeMLAHeoB8N0nIzhPMm5yBd5arkPj/7cyKyZT6nbWwuCG9x
         5ZfkIuHIJ2FkeBR/qycw564xFNi6TsQfuBig++2BkZ4ofpbPtp3F9fpsDETNmcVUiITp
         s41ehWXiyfCssJRYIEPTlwWLcHECG6twoNr9udPOk619xDIWeooXxYZwvSC8C2xgJy3F
         7WAg==
X-Forwarded-Encrypted: i=1; AJvYcCU/Y0Jqu4x6uUPDidKpvr1InYHu1eAji/odweVNWpjlZt1nTvjNtxD/Af5IjI1uLch8NdwToqW1wi0BDHHE@vger.kernel.org, AJvYcCUZl0L2WPA4/mgMdW4ZIq+ideu9KD0iGuOy62zvZrm34qGMOonkKuB62j1H3ixDPrEOz+G+dgzZBgKhOmpw/5yrlvg=@vger.kernel.org, AJvYcCXJ/WUXMUTpWZd5V1Oh86RnFfDdKEJBUJJQbmJX4ibpTcgae+rXbEPauFAUcZQN2bdeRvtfPvNz6EYe@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7zXzaZ32ezsti6Y8lXfJiAuhqTPFDqsEleJYDtOVzOI+PYYoj
	wQSLOipS6TlzIsPYn39tZFAvJvqjf80/SIjM9myK9+/XzgtIRKsFO+YmILIPvK2DandgqQwVVLT
	tZqZpXWwOJiiHY83A+Ux0ov3AC/+A+bI=
X-Gm-Gg: ASbGncuNHv1osFn77NtPetZvvDQtyQ/Dw1v8O7P5+iIrzJcddIDsKqQskFvnydwh6ru
	VfXM5buai21WO9FJFmQKFxg8vwQn5WzLRvqVcKG+P9kXOFksT6PXSjx61fW3pJ2oK/oaGeLi9rJ
	6c976ubKQsBckjb30SpVXIzM4hVf8q+spyC4eIQdcZOtVIY0VCKSij
X-Google-Smtp-Source: AGHT+IF4cUJtxH83RDJft3O2FqQ5XUKOZe1zx/Bmli/7Ru2jER/I3z6z3oYtVafld19HMBo5LW8Ej/HPfe6pAovzDOo=
X-Received: by 2002:a05:6102:2ac3:b0:4ec:e1fa:ed7b with SMTP id
 ada2fe7eead31-4ee50a67c4bmr1229948137.9.1751000593950; Thu, 26 Jun 2025
 22:03:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250627-exynosdrm-decon-v3-0-5b456f88cfea@disroot.org> <20250627-exynosdrm-decon-v3-1-5b456f88cfea@disroot.org>
In-Reply-To: <20250627-exynosdrm-decon-v3-1-5b456f88cfea@disroot.org>
From: Inki Dae <daeinki@gmail.com>
Date: Fri, 27 Jun 2025 14:02:37 +0900
X-Gm-Features: Ac12FXz2dc5tsxsGmjdAH92okDL5yeiAijcWTCVAjDOYfNAbUY5poc38568eg-s
Message-ID: <CAAQKjZPAsE8LGE00fWE1aPj03b6tu1rk9ScTDSN+HeKzVXMZvw@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] dt-bindings: display: samsung,exynos7-decon: add
 properties for iommus and ports
To: Kaustabh Chakraborty <kauschluss@disroot.org>
Cc: Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, Conor Dooley <conor@kernel.org>, 
	Ajay Kumar <ajaykumar.rs@samsung.com>, Akshu Agrawal <akshua@gmail.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

2025=EB=85=84 6=EC=9B=94 27=EC=9D=BC (=EA=B8=88) =EC=98=A4=EC=A0=84 4:21, K=
austabh Chakraborty <kauschluss@disroot.org>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=
=84=B1:
>
> Similar to FIMD and Exynos5433's DECON, the Exynos7 DECON hardware:
> - May optionally require an IOMMU to initialize a display region.
> - May require a port connection to another block, say an MIC or a DSI
>   master.
>
> Document these bindings in the devicetree schema.

Applied.

Thanks,
Inki Dae

>
> Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
> ---
>  .../bindings/display/samsung/samsung,exynos7-decon.yaml           | 8 ++=
++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/display/samsung/samsung,ex=
ynos7-decon.yaml b/Documentation/devicetree/bindings/display/samsung/samsun=
g,exynos7-decon.yaml
> index 53916e4c95d8c0369138941a556c23f5d42fbd39..1e9500c86590d555cfa6f0479=
0e2b64da291b78b 100644
> --- a/Documentation/devicetree/bindings/display/samsung/samsung,exynos7-d=
econ.yaml
> +++ b/Documentation/devicetree/bindings/display/samsung/samsung,exynos7-d=
econ.yaml
> @@ -80,6 +80,14 @@ properties:
>        - const: vsync
>        - const: lcd_sys
>
> +  iommus:
> +    maxItems: 1
> +
> +  ports:
> +    $ref: /schemas/graph.yaml#/properties/ports
> +    description:
> +      Contains a port which is connected to mic or dsim node.
> +
>    power-domains:
>      maxItems: 1
>
>
> --
> 2.49.0
>
>

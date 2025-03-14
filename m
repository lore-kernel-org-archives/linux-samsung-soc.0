Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15C822040AE
	for <linux-samsung-soc@vger.kernel.org>; Fri, 14 Mar 2025 17:14:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741972460; cv=none; b=gYK9U7dzS4ZRhpTtf1tLwtiYRKn2Ln2FLvvcFuxAEfS7IPWM9R+xom5CavP0MlONEG/d2nmiqPEywiyWy4+HxCajKsKqZmaO7Ao/X1TfdsKadOQYK71PfAZfEoZKEvLyV93kVfQFs0/DcsLTLYEKRjycCjrClEvfOVl+dgGKMwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741972460; c=relaxed/simple;
	bh=5p0iC2SItNuF6AwjE1Hf3HgmLAJx6GZW09MUMx1WDn4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tYU8os3s6ibEezzrHH5iCtcuQxW7Z042N8emyRLsJBT2Bm2Eh+b6On7jN2AEBIejy9Z0wSNvOrs/3WomVpLzuE2ERh9FUQdvE7KMq96RixXUIElnDVJz7QkBME4FPIuO+mTZe3I8VC7rVmHxx7uHjgIjnL8iuz9aAuvfsSq2o8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=UOfIrw7o; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="UOfIrw7o"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-223f4c06e9fso43841545ad.1
        for <linux-samsung-soc@vger.kernel.org>; Fri, 14 Mar 2025 10:14:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1741972458; x=1742577258; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=yix95Y58aFVDLktEp8lmDmKYUrlcv0lyEDYQZgOfJW0=;
        b=UOfIrw7oT+4b8yEPf7Mh2zudvDHT7LjYjk4PRUR6nDtvJF0TAUvoBvgiK0Wtqpefy3
         K2DeSrNEw5yqYkY/8/Gskgg1juSt3h4RKFgqvxywGTIK3cXUCqeytxE2fwAEq0w+QQZ0
         K7UEssTLnlSZeVpuYoIhv/EJnJAs48MpjhUcwjDqxDj4f2uy2qYLPmGIrU3zYlyka04a
         sj3RPl9mZ5IDgN31WaOCkDmyFBk4mXyDwhyWV0SZyjOgl6k0mpDJ6nAKkVV7f3Zi+Yzh
         bydkQrtjV6L5+s6tfjUE8X3hr7Os0yPQ12lC9+adIWz1kIFTRqv32C7MPbkjpv+lR8P6
         /vNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741972458; x=1742577258;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yix95Y58aFVDLktEp8lmDmKYUrlcv0lyEDYQZgOfJW0=;
        b=PxsRyyUXKTW4D31YakV0+p6gETYqG+clFNrUOBCoWK5i6DPaJ5XQSA9FOrDPHWzxmV
         CeO0/kPfL7SFosYOfKNHYJoWi6GI08uqwJuV4ArOrylmRk5HmBXY5uytvpZDBdR/szdw
         14RKC9ew2QiYdkPRMM4pLOmk//BxOqQBQ8rHgzpp0FIa2R6Im2x8yaVu6uzEfwe94X/F
         dAdDzhE8gIoC/9aaWCiWJXL+C68poMuZ6yg1y3FJGK1S6pCHdvYsiiNyTi9r5oYTFxha
         lVls5TRHFlrV1pq3ChqBd/i6tjr3v3NMhhK0ChzfkiH7kc954Etl3w8Br/CDjcVaW0qp
         BC2w==
X-Forwarded-Encrypted: i=1; AJvYcCUtO5AY2F7UYMvgz/wkO6g3Ov1nAxMrgauBNjW9qdHqH6p/0KzjIRdq4sTbJyPKJWcWieocEKpqTL8eEkoIW3II2Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YzO1Yql3d/47mIS9Wcl9mGzGeVMZYQEiKAaXhuXcV3bDptLyK9g
	g1OXzMz6Bo68LmVO3SwLEynnEKccW4AeXlj3p/AFL/eqcXxbxYWXOWSX3Db+iw==
X-Gm-Gg: ASbGncsew0Ot9salz6SVJP4R0V6q4M+Ku5B7b1fCCGqs+MZraJ6sMuzUId5lJefW0yy
	NJy+LRAVLheEbF74OSyKBW9rQn2A4S3mmT/gpVo3I5CK8l9QjkwbbP/58TcyFoKMHZpOUli/7LL
	1rwt4nKtGcCREFkpucx3XhMdzMoAO+Q0qpN7QhlBdIGgxVp6V1mifWnfHHxlKfn3WO2wxd+D8aO
	JKl/bZDvlYXbUlOnhmLEsfhaZR/F8O2DHYRzIfJlwRKn0Z11swm7WKz0Z+Nw6Oc6vW/PFhzfYSW
	u21VJEU1qHXlvkoWZwSp9/qWlmL9UVdXacIqsASDhA4oGINqDysjTGSkk/ZY5oYXf6C6oNySk0Q
	7JStsuR2uWFcLQis=
X-Google-Smtp-Source: AGHT+IGy7HWrkPvjUpMMYhRQbw/am4ugxDMqJdGJdWH8dd6X/1N9h09zGNW9ExGPYF3hEaJz1QwaUQ==
X-Received: by 2002:a17:902:d4cd:b0:224:3994:8a8c with SMTP id d9443c01a7336-225c6613932mr89268175ad.8.1741972457947;
        Fri, 14 Mar 2025 10:14:17 -0700 (PDT)
Received: from google.com (198.103.247.35.bc.googleusercontent.com. [35.247.103.198])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-225c6bd4d61sm30841415ad.242.2025.03.14.10.14.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Mar 2025 10:14:17 -0700 (PDT)
Date: Fri, 14 Mar 2025 10:14:13 -0700
From: William McVicker <willmcvicker@google.com>
To: Peter Griffin <peter.griffin@linaro.org>
Cc: =?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Avri Altman <avri.altman@wdc.com>,
	Bart Van Assche <bvanassche@acm.org>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org,
	kernel-team@android.com, stable@vger.kernel.org
Subject: Re: [PATCH 1/2] arm64: dts: exynos: gs101: ufs: add dma-coherent
 property
Message-ID: <Z9Rj5T8il4rZAsoq@google.com>
References: <20250314-ufs-dma-coherent-v1-0-bdf9f9be2919@linaro.org>
 <20250314-ufs-dma-coherent-v1-1-bdf9f9be2919@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250314-ufs-dma-coherent-v1-1-bdf9f9be2919@linaro.org>

On 03/14/2025, Peter Griffin wrote:
> ufs-exynos driver configures the sysreg shareability as
> cacheable for gs101 so we need to set the dma-coherent
> property so the descriptors are also allocated cacheable.
> 
> This fixes the UFS stability issues we have seen with
> the upstream UFS driver on gs101.
> 
> Fixes: 4c65d7054b4c ("arm64: dts: exynos: gs101: Add ufs and ufs-phy dt nodes")
> Cc: stable@vger.kernel.org
> Suggested-by: Will McVicker <willmcvicker@google.com>
> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>

Tested-by: Will McVicker <willmcvicker@google.com>

Verified I can properly boot to Android recovery with UFS probing and mounting
the partitions in the fstab.

Can you send this to 6.12 stable as well since this is fixing booting issues
with Android?

Thanks,
Will

> ---
>  arch/arm64/boot/dts/exynos/google/gs101.dtsi | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/boot/dts/exynos/google/gs101.dtsi b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
> index c5335dd59dfe9fcf8c64d66a466799600f8447b0..cf30128ef004568f01b1c7150c5585ba267d64bc 100644
> --- a/arch/arm64/boot/dts/exynos/google/gs101.dtsi
> +++ b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
> @@ -1360,6 +1360,7 @@ ufs_0: ufs@14700000 {
>  				 <&cmu_hsi2 CLK_GOUT_HSI2_SYSREG_HSI2_PCLK>;
>  			clock-names = "core_clk", "sclk_unipro_main", "fmp",
>  				      "aclk", "pclk", "sysreg";
> +			dma-coherent;
>  			freq-table-hz = <0 0>, <0 0>, <0 0>, <0 0>, <0 0>, <0 0>;
>  			pinctrl-0 = <&ufs_rst_n &ufs_refclk_out>;
>  			pinctrl-names = "default";
> 
> -- 
> 2.49.0.rc1.451.g8f38331e32-goog
> 

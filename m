Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BCCA392838
	for <linux-samsung-soc@vger.kernel.org>; Wed, 10 Jun 2026 07:54:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781078041; cv=pass; b=l+Q+WSxih31KxtycGZJV0oBro1Kk0XDuY8/1wjUbVSLSzjG/+zID74DrYxk5UYJFdz98jChgmSXKj+Fz4+KxUmS8BeJ/RhZlnHNFTA1BYlkTvDFrTa3M1bMomrWIjTSqlvFBCkP52e3KMZA5pw7J+LVyqgEfY+mUr5cn3iGVM34=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781078041; c=relaxed/simple;
	bh=FirkQ9b3WjcBRyWWTk9l4j2fUhJzIUeGfuR4crWVpwU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ljk+DbmoKztAebnRpJajdkLXcZEYH3WTPe6ij/GyRd8TXjGWR2SeFlMxBGd6i+gZtZNt1R8n9zz0A9iN9UVYi1kxX7jW70TFTYWvRCVOpcs3e9ZApfOw8huvBYrxRd1VdHSlr1DspbkOytDmkuJUH8wzwRFzOaDnsDKoxtLCJdM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=V/wa91DK; arc=pass smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="V/wa91DK"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-bef47b1ac01so967421366b.2
        for <linux-samsung-soc@vger.kernel.org>; Wed, 10 Jun 2026 00:54:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781078039; cv=none;
        d=google.com; s=arc-20240605;
        b=ha6+v5xWgJfGwWfmya6iGMmn50SlXFdEPFDEX9xEadOIqadXf974jEB15/3d1nKIz7
         l6G+fzeL6idN0HnguPoFNebQCJyZuP930vkxcLJL5iOYYo7jvgNBS5S+JIcIrxQycfhi
         D5EyDvqXTL64tGQ/uJ58CbkqoKrHgj1JV5vzdcA29d2jppLTnJiDFblgpfmgRJpRAY6Q
         PSWG1aRFyylV4us1BylWKdiR+u+HMNGzy/M/ooxWcztmxtFQmawHvtPvqykqIAHCsKak
         RTe4ZeATyuRzOlig71txum5A76mbXLMly3n+QW9xocN3A7bqvGLw4fwsKlDTSZs/G9LI
         EDgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=kQVHlh3s1LVk2DUq8WGmvLFnNuxxdslZRijXwJj3LTA=;
        fh=ILCFtAS0WZ/mtjGogkEWegdZGci0v7UhgdZ90CzZlOM=;
        b=BI3S40lG3W+f09vJUS07Bg2ob8ocTV8RZgYfNxUG5w44fOSdqHToQSXzFfMBlWw0aH
         OgEQxTc9ZxSaQPsfsyMgODEejKzpMSAt7aCqlzWmdCUb193C62PRepVd8LeYqE3HhYHW
         awAyoGW3VCEyFCaiBjDzfbkRPF6sI4/1M8HVV44zPGawC6P53mQS6WHCvJUNpJMiUcaN
         qoZIAwOQPJWgny7uOvQ1ZlLOkcVGXS0frXNJ5jf/hmlfbwgDwmw04vro7mTQzVvH/HY7
         rPDGyRKzh6KV6KKukBe9PKcKYOKhuYysVmCpynIthLLyaZlAPwdy3ci3O/qQ1gspz+54
         4YGg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1781078039; x=1781682839; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=kQVHlh3s1LVk2DUq8WGmvLFnNuxxdslZRijXwJj3LTA=;
        b=V/wa91DKWIImVSxUTa6NO84KWNEvsYjd9eOi72KMswNDVQocj0Zo76yA+9VVru8iBG
         rTkPzY8Kyjzafq7AQSHKtjPZjEjX3rcaFuXDQqXm84K0d+NPJXKUA1yIlhijH4ONPurV
         GA1t4L8DI1S1IBtIFXqc1knUil6h2Ioh37FUkQyCc0VQsnw3RnT8am+MThZNglwTg4Qp
         GyhbGoQZmHLR1m5SR+nL4pZRwhELzuCVS+cokT9eH2UyhYcQu+4pTDBqZyfCcJauOaaz
         IJf1SB2oFStPuhS9hhrtjSRc5yV8S/EsaZXEnDd2UbUIBvqjz15zk8layGNMKop66DRm
         plGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781078039; x=1781682839;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kQVHlh3s1LVk2DUq8WGmvLFnNuxxdslZRijXwJj3LTA=;
        b=pzpMZhgEnDvcDG1btx6rTHqZF/qYCMCLJIJKUC/S8Ta7njRYvAes2LKIWwxr1FMSUJ
         Envof60eeD3yrxzrFaILCEH7AoRyJgQ8BYDtykfphVVYnLHLyD2ISF/jg+Vj47PnV8aS
         ZSEX2kqGFVf8vDyHToDyeFDAyKGHR1H4D13N8bl19ZKEj5GuloOtDBsfwkJM9iLDxzLp
         cV987tTXPq6MMBKLBZMOYsCMVOEcrcWuXGkzTsxpNJ67OpZ2KPeB/8DIfFmGbXXfROkB
         s1KkOLlTrzgiY0lezMOWUdf7b+Axuy2UE4i/1bQCMla2RgOh/Nq6yae7/LzBdg6V2Gp8
         zz5Q==
X-Forwarded-Encrypted: i=1; AFNElJ8y8cfiZyG7SS5hsxkLfkjEqwHomgisTFRQRR6ueRKGBmY4jSEaiR3pCoMAtYMiceBeOKy87k+W9tYm0JGwgTdieQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwX7d2I41oxfjHxIa7laUxVCYT6G9+lKsTkyBzYKl/jDKvooo9J
	7aYMOJhl92hRjsZN8yyqy9EihSNivJq1z1+NH4QPFBz/0Q1AuHlNkjms97OIHvuWjl8LYfwi4At
	lRoQbF277bQQneQG4h1h/B8nRgLpU6OI84Uh26C2oitaa233EYp+HI6k=
X-Gm-Gg: Acq92OF6/q3QKVeX/TmzrtSiPjrNoTKtPmS8o8MD9D9OiZe/ZUDXJKwUbxZGReL5j9U
	bB4dbyXgfEZYOmwDCidNsbupRRoBN8wq94wWiSExnHkN6kbwJqJm5yyQa+dYZry/zyXROzONGcZ
	SESZe4EvU/Ycm2GEupr/bZdT9OZYGI11h/4a1fAuAaz+C39ZpDB1jx3LJAyBG6wxVEqqTM4KjIv
	c37DR6ol5g6CF1gAPk3j4+eDNGCXxEyFVA58KMDlo87NyUuRjaZONecXqnW+QGvzFEPxvGnnTI2
	ZpzvlYN5gwIFG51kYpuiYjSmUcM1Q7hB2Jrd97P30AJWwGc/qAZU
X-Received: by 2002:a17:907:ca1:b0:bf4:6aca:6ff1 with SMTP id
 a640c23a62f3a-bf46aca72d8mr639120166b.49.1781078038780; Wed, 10 Jun 2026
 00:53:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CGME20260610050335epcas2p3ec1c019e86b75e9a4edd965a8b27ebd3@epcas2p3.samsung.com>
 <20260610050326.2903402-1-sh86.bae@samsung.com> <20260610050326.2903402-2-sh86.bae@samsung.com>
In-Reply-To: <20260610050326.2903402-2-sh86.bae@samsung.com>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Wed, 10 Jun 2026 08:53:47 +0100
X-Gm-Features: AVVi8CdBLIK1BYMIyty7W9TdEhhqe-w6-7EwqDM-mk3y9etMhibeEUIwfHY2zNo
Message-ID: <CADrjBPqhODqeV36+-758h_=34YrL=DYHJh5vCwB+Q+qeEkOHtQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: soc: samsung: exynos-sysreg: Add hsi0
 for ExynosAutov920
To: Sanghoon Bae <sh86.bae@samsung.com>
Cc: robh@kernel.org, krzk@kernel.org, conor+dt@kernel.org, vkoul@kernel.org, 
	alim.akhtar@samsung.com, kishon@kernel.org, krzk+dt@kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-samsung-soc@vger.kernel.org, sowon.na@samsung.com
Content-Type: text/plain; charset="UTF-8"

On Wed, 10 Jun 2026 at 06:03, Sanghoon Bae <sh86.bae@samsung.com> wrote:
>
> Add hsi0 compatible on samsung,exynos-sysreg
> To support ExynosAutov920 PCIe settings:
> - PCIe PHY power control
> - PLL settings for PCIe
> - PCIe device direction (RC/EP)
>
> Signed-off-by: Sanghoon Bae <sh86.bae@samsung.com>
> ---

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>

>  .../devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml   | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml b/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml
> index 9c63dbcd4d77..fcdb9ffd2644 100644
> --- a/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml
> +++ b/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml
> @@ -37,6 +37,7 @@ properties:
>                - samsung,exynos8895-peric1-sysreg
>                - samsung,exynos990-peric0-sysreg
>                - samsung,exynos990-peric1-sysreg
> +              - samsung,exynosautov920-hsi0-sysreg
>                - samsung,exynosautov920-hsi2-sysreg
>                - samsung,exynosautov920-peric0-sysreg
>                - samsung,exynosautov920-peric1-sysreg
> --
> 2.45.2
>
>

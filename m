Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9BAD17588
	for <linux-samsung-soc@vger.kernel.org>; Sun, 23 Feb 2025 23:43:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740354236; cv=none; b=JODFp8kiLgnn8FF2pxvYzOnNzo9pNKqnj+P03FcU/NS2rQr5Mh+SOQyCIs9hoLbsbRRmE9/vE9dKPGGByLeIyKHTMZS4b6LcXeh4sV9bpWObaJ1nInfH0XW32RBviXl/vO7lD6KoSl18N0PIvNLKeGlVWqQtpK2wwAQPzk4p79Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740354236; c=relaxed/simple;
	bh=deTx+omgnbLOs8r75CSTqyV8OyfmK0sMG1fGy+1WAXA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FpM+b24KeMn9YqHz7ywe/y24FC2Ugdn2DY7MnuWRX1TW8Fbwyzgu76Nf1vomMXe4U01lpkpUufn5XWwOc13JOjvB4bn/2aoy5HB1RkPaQfXVGDjqETfLLpMMk0pXAMBXfEToiudQPfgpgZMa0SNf9LhzQZkj+ia8vo6x/7lG3l4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=f7W5rXcZ; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="f7W5rXcZ"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5452c29bacfso4228862e87.3
        for <linux-samsung-soc@vger.kernel.org>; Sun, 23 Feb 2025 15:43:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740354233; x=1740959033; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=28j2oUhHrE0UtIm5Z7Iu9myzi6x7Y72gOBfh9gvCc7A=;
        b=f7W5rXcZfjbLnPu9d2Fjv268Mx56fiFxIf7KMch/7XYFz5jSR8G6VpdD5oxO6TSti9
         ZgLPrEdkKf/2JBZMhBv5BHOrjyvIJu/pNsEr+wS7t1ujiDfvJlNEaXJkNEhbTxX2AmvU
         rQhc657cnWk/CH4/Qie0Vk4zZFHb5F3QdHhX/nOpjlkVkstIRXLcPryCBD+ONifqrpN2
         YZH3dPrWnt4R/Z9SD4yh2wFoV+1vJRRw5mmBgP3kuw0Ej9Dp2AFyUJRpeitI1PCOYRac
         IHO31DPVQImRqq3/jEt8OkWGH3CdKhuMp4mnco9zXXwD75m4U1hu7NUon02d3SKAOcZJ
         5tWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740354233; x=1740959033;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=28j2oUhHrE0UtIm5Z7Iu9myzi6x7Y72gOBfh9gvCc7A=;
        b=oFVo9O53SoBXi8e8mSh69ZHAqzMdjEGDqMX7z6828XU69yT/eUbfNVQNfRN2Rj6LzY
         hePsK6fsLicDwJ1ZUgSS1lTMGcD2nPYVLO1y7+2wBsZq2RtS9/fYbuOs1u9Kdjin1zlR
         zNgIN2cw68//alTxwAwSjD7aXxYEL4SJsyOS5qPnwbKks6K7G9CVwwjHxzrXT35kQgN4
         8iluHEZhbr3VgMrCWGvy2fZ0uqvh506siVXOs/B9M8PTiP1YJ9BSC5j7yhdEUWFVw3Bo
         BRu482O/eELpreG2nCqWRuGDNUD/ymOg7xiUpTiW8wejrc1axzjbdaJP9/wAlbUgkmrX
         Kj2Q==
X-Forwarded-Encrypted: i=1; AJvYcCUIUl4wTxb0Iu69fF3N1MRJLd9RiPkA5cHXbZhmtxYUrnl9l+2HykacSWAT8ymT++wteZ0CgZefZqO7+uQVqBlDSg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxz1FKvA4nEUVdVoHSHkty+7pUm7o4NEnZrypBam7LyE7til+j4
	3TSPxran2HALyZHbeAFeRxD/Ct27ZqlpUvU60KFBNP9S0WoCImrA63norHPrcB4=
X-Gm-Gg: ASbGncsXlObS9LhtHi7SSv2iqL58iQeI6iKtgeHYZjpJh4nDrvkG/KJLMYs2OspJEsN
	m5Sqf9BdqH2nMbwM/9vCS2yZbA+1QAhqPyTT5nVfZmNvBbJ3vtcl8y8wiGoCqMngfkhtnH+0Wb3
	RwjOtJ9m8kMPqbnzhNGVc4WbAT4clciFeX0LoKIyDTJh8aHzhRpAWixtk9XQgccmKx35A9uQUAQ
	1p+tHKfY9FyERTcUUKQD+JyA5xh22KclcT86jd53liXEW2232UOmwmq4tDqGZ/+RxdG1jv08lw4
	Rmsx6LEHc0N+8KcYHvJN6OOJU+NaXZ6nZV/rujX11koTlxwsuDmfNceBxpyiqf7MDkZ44c1BL+E
	uu/NKTA==
X-Google-Smtp-Source: AGHT+IHqDyDmO/r2yjSG30eHo/aZTvnzBBS3IoH2SUfydcMTabalwcojF162vAWAlTXJ3voBa2nsQQ==
X-Received: by 2002:a05:6512:308a:b0:545:296e:ac28 with SMTP id 2adb3069b0e04-54839144ee2mr4857016e87.24.1740354232909;
        Sun, 23 Feb 2025 15:43:52 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54526741fe5sm3065509e87.90.2025.02.23.15.43.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Feb 2025 15:43:51 -0800 (PST)
Date: Mon, 24 Feb 2025 01:43:49 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Abel Vesa <abel.vesa@linaro.org>, linux-arm-msm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/8] dt-bindings: phy: snps-eusb2: add exynos2200
 support
Message-ID: <4tvpl3pujnuw2qjwu7f7ryrr5dndxow7srkkp2223wmexr23bi@7nmgrpq6znpg>
References: <20250223122227.725233-1-ivo.ivanov.ivanov1@gmail.com>
 <20250223122227.725233-3-ivo.ivanov.ivanov1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250223122227.725233-3-ivo.ivanov.ivanov1@gmail.com>

On Sun, Feb 23, 2025 at 02:22:21PM +0200, Ivaylo Ivanov wrote:
> Exynos 2200 makes use of the Synposys eUSB2 IP, so document it in the
> binding. Unlike the currently documented Qualcomm SoCs, it doesn't provide
> reset lines for reset control and uses more clocks.
> 
> Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov@gmail.com>
> ---
>  .../bindings/phy/snps,eusb2-phy.yaml          | 64 +++++++++++++++++--
>  1 file changed, 57 insertions(+), 7 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/phy/snps,eusb2-phy.yaml b/Documentation/devicetree/bindings/phy/snps,eusb2-phy.yaml
> index 22c77968f..f4164db71 100644
> --- a/Documentation/devicetree/bindings/phy/snps,eusb2-phy.yaml
> +++ b/Documentation/devicetree/bindings/phy/snps,eusb2-phy.yaml
> @@ -23,6 +23,7 @@ properties:
>                - qcom,x1e80100-snps-eusb2-phy
>            - const: qcom,sm8550-snps-eusb2-phy
>        - const: qcom,sm8550-snps-eusb2-phy
> +      - const: samsung,exynos2200-snps-eusb2-phy
>  
>    reg:
>      maxItems: 1
> @@ -31,12 +32,12 @@ properties:
>      const: 0
>  
>    clocks:
> -    items:
> -      - description: ref
> +    minItems: 1
> +    maxItems: 3
>  
>    clock-names:
> -    items:
> -      - const: ref
> +    minItems: 1
> +    maxItems: 3
>  
>    resets:
>      maxItems: 1
> @@ -58,11 +59,60 @@ required:
>    - compatible
>    - reg
>    - "#phy-cells"
> -  - clocks
> -  - clock-names

Why? Clocks are required in both if clauses.

>    - vdd-supply
>    - vdda12-supply
> -  - resets
> +
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - qcom,sm8550-snps-eusb2-phy
> +
> +    then:
> +      properties:
> +        reg:
> +          maxItems: 1
> +
> +        clocks:
> +          items:
> +            - description: ref
> +
> +        clock-names:
> +          items:
> +            - const: ref
> +
> +      required:
> +        - clocks
> +        - clock-names
> +        - resets
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - samsung,exynos2200-snps-eusb2-phy
> +
> +    then:
> +      properties:
> +
> +        clocks:
> +          items:
> +            - description: Reference clock
> +            - description: Bus (APB) clock
> +            - description: Control clock
> +
> +        clock-names:
> +          items:
> +            - const: ref
> +            - const: bus
> +            - const: ctrl
> +
> +      required:
> +        - clocks
> +        - clock-names
>  
>  additionalProperties: false
>  
> -- 
> 2.43.0
> 

-- 
With best wishes
Dmitry

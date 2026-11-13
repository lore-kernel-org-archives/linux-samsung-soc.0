Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794567828;
	b=RJAmjZQJNwq4VLiilyxd2iyZv7q09ik9sojof9lKZjBWVGsaccF1HY12mX5FvsQPghaG
	 mDfKbxX6KpntZherW6Xbm1f8ohjT4Qt0fUEWyquvkd92B6FFYu3PdQEQXz7tvVwEAlZfe
	 jAQDJvigM8ezTkQwZDOKI/5OEA/ZqkMfLWWS43566xFoiuf1+nnTrCjF/q6KDwuUrhsnp
	 ZrSbJafelbIJ8VOrJAmBFn3Tas39Iwwza1Al1iXs64UAh8UVCoed0Ar82GVVXzSyoZo1H
	 ULzyp9z61kUt34aoamtvBwh/Q87ZwSXSIFabxVTsmQIJsdL2dGd4Uyl2VXg3HPCyVVg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794567828;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=WrGUC4aP2CzOib9bfxPwXz4WnawgPNUWDRuOBMHlbso=;
	b=xynTkd9Z48R1g81LWxiQPldvFZvAWLSm8i+pdAZ9/bwBFkDgi7Lt/UGQYSRCMZq04AWQ
	 KOSE4Bg00cM5U360Lir3W/3V8WxADnhq3BgI0qtoI3vTfARmGaC5cn2zaRptuLsTnMJZB
	 wAXBVhFq9YpkqtW5z5nmtHS1e14/+/X/JqUud5IB2khiE3ejPDCDtZO9LZzZ6JapYGBxs
	 1fhpvZ8oVt/5rsRtz+ODc92TQkeoAhCLmhHzivArqoc7DINnOmDWhwECvRB+GpbQ3P/J7
	 a5gVXQrJi0cOMzdyR1zS6kcuXs8ue30ufp/peQ5WBXGvTgRpjH11udkc1vVzcLBhDpQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=uO1PZR9z;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.54
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F582606A332
	for <linux-samsung-soc@vger.kernel.org>; Fri, 13 Nov 2026 11:03:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2F582606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=uO1PZR9z
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-6b429f71dbeso1089551a12.1
        for <linux-samsung-soc@vger.kernel.org>; Fri, 13 Nov 2026 03:03:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794567825; cv=none;
        d=google.com; s=arc-20260327;
        b=qabA4Nc8AcbEZtRmSZGxw+reDlqUV01iAFnSE21OdEAa93qppq8P9tWooZgDYrtEly
         9LGL76i9HyHSejS+zUdHugNokpGgoewqOSmg0goBhp95zofQ/VBF+l3PPVWGB0lBCgwy
         nJc/TlX4RhJpm4gGDulR2Dip5CUvFxL7YW7+uFm7jjKov4ZuClTY/kE2BZZDRH9XmMRn
         H07AV2U7MUoVgQm+P6sDxI2IwxGDov6FAUu/ajsG/dMtpeDa2ESkMKzvgDoAyXNKBYVG
         6rchBLpMvy7zglosRjx1tCj2ANSGBTyZcVxoQ4QoeEJvA5u+ocXIO67+ggZ8ppdfYquU
         +OJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=WrGUC4aP2CzOib9bfxPwXz4WnawgPNUWDRuOBMHlbso=;
        fh=gXwVcGAbykOTHf73nHUNcYBeqyEm8LDh0u/VAChLKFo=;
        b=tDkrfGZCjDJ2MNYYKUQH6fEFhC2pSdiw5BrlfLcLS2iRVpHiwLNoWDKLZkBLhRXZLk
         1vGVOG7K73znc+fIAOlXsqSXC2NgoOQmSgEsF9RRb25ArNGA+qqBsh5gHJQUQtu6cWIN
         5fJafRVqh/ljawl8Pco+lbpPprsREPopAejVBhd88v7ZaPhh6x6Ek2wcPpm1DInSGfMk
         5Y+Lq8WJ93oy8jscQTt9aRY2mcRdrHlNJ48u27fQzuY/FoUeiicGTfsFx/q/0MRCXis1
         0leFwHt7JkVC3UsS0Utoq5MiuF7FL0H1agTKyXYk4KkSKm/hLbk8zk7rxt70aNyP5vKn
         f70g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794567825; x=1795172625; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WrGUC4aP2CzOib9bfxPwXz4WnawgPNUWDRuOBMHlbso=;
        b=uO1PZR9z6dSSdZdruiUCP+ylb+AYRNL3Bg9MtPyNPpe8quBN5+x0kSfhdc6XsXvP2l
         1EWqQ7J0agbDYHQH0axqwgMEmrDrhg1Oc3m0uRsq4mARWFpqfAlD8wPuiR+2zD/3uQAc
         qgBCiukndMVmJs/IVJpM4hd8qCyxWsLVVoqfyR4MHzajp1b/LSldKdhNuz5xTQf6BwtW
         G7ZtYItfHSpGNE6iBtAws9xro9RsQwnAsuAKn7ImZtuJ2ZhVdKtgkjXPgc1xO9XBrdh1
         DQ+AxJpHhiSmL+tPFg8JVylQURvnnB2fa73o0q3biC5HUIGOevOCFFQGY0cLG1WYTKPB
         RWcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794567825; x=1795172625;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=WrGUC4aP2CzOib9bfxPwXz4WnawgPNUWDRuOBMHlbso=;
        b=OQ2RnLnIlGv8aNQWICjjkZGC9BJN1r1rfEoKfJO34pRIQBoRbcl/1tlO+q68QCiBDY
         tJSG57yYCaokoVPBzrTQWAgIE98jGWmzIK48A3V/bs27SnpF/l34N0xy8i8wcNz1Yf+h
         FXib7TiT1up/+fLNr+K8BdVrmRTDMFIiLWIiBlYP31YC+bGwrNI718iCNVM44B/Y4tjM
         8OGrS5K6wRONN12IRHxhQNKtYCuY7OQrdW48C3pEuFvqNJXx+45Bemdh/iTSOdVC4QPE
         3fN2bAGgRRfCA1jsZRAtTSVhqcWRN/Zrr6DSyl8b5EX7x3vQrritNq+WKrwgZeM4EHuh
         mL8w==
X-Forwarded-Encrypted: i=1; AL+hErGu65u6vf0AXfi5/XFNWD+fqzLznlsoXaxKxCHzFkl2C7VGRfNtIZAqQp4MOoF2jWviVpEm9ZpurQkkB0NTk7I5zQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z899GiIE7RdLDHDv6MeW56BOg/A80d+nxSBvNqy4nUzNBVALWc6
	2FnW2SVRMpA7PB8YpsP+MoA+9s3Ukj7W+ua/OKGqOvYPJBsodNW4RSf5R6FX+hQMOPn5aVldjOk
	p219EMgnUxF2ScgFqQpUAgybR1he2fz4qZKw8Uoh51g==
X-Gm-Gg: AYBFou2bvp9lVB+bVVSGjEooG9F7EqcuKjQIbTEYj0Rel7tHfxKADWkS4aPXtyUqDUN
	FmF6jJ634Ygx2beMaU4MboiVa2+gm4PH01c3LujNn4vpmThaSrtLagdrPljfhkn7tby66wfAAdz
	Eu+CrExou8FG3tBvLMSgOSgNEU6s8PCoGOT1mB5jc5N2U0+PW2YilqRDYQPnsBc6Glt4fYy0Y2Y
	ju8+ghuVJVYjAaWq0YJeQ7M5ZhoWAXejZAaojA7UaFT7Wzywg7PNbYRLvvNWN4HC1v0bgnsfq2g
	Gdt21Ywy5DKpQAnDk6yGZKzqqRZgv6noWbkIuMMtFdiMNmLLmvhh3j8J7A2zo9M5odjirX+2QrH
	1y5TjYrYEeZPHYwlARj3JrSWEvUB+0xA1DZmp0uUnD4GCmsmH7tyFatrpiXiHf7ZAx/m7Nw==
X-Received: by 2002:a05:6402:42cb:b0:6b1:d439:5c5 with SMTP id
 4fb4d7f45d1cf-6b7c088fadfmr1814259a12.3.1794567825002; Fri, 13 Nov 2026
 03:03:45 -0800 (PST)
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Post: <mailto:linux-samsung-soc@vger.kernel.org>
List-Help: <mailto:linux-samsung-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-samsung-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <CGME20261113104844epcas5p4c1cb0c31de8b5b445f7f0060f81cf753@epcas5p4.samsung.com>
 <20261113110612.3265841-1-raghav.s@samsung.com> <927327686.61794567483016.JavaMail.epsvc@epcpadp2new>
In-Reply-To: <927327686.61794567483016.JavaMail.epsvc@epcpadp2new>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Fri, 13 Nov 2026 11:03:32 +0000
X-Gm-Features: AclHuK-nQAzdHNmzELAlgOYeQ9PIbGnRzQK2xJ_UxA7DGsqbyIcTqa_Es6uaAxk
Message-ID: <CADrjBPpUSot+jCUBKb4S4A8C5HazvqQbB-+wDvjJtjB5XGCytw@mail.gmail.com>
Subject: Re: [PATCH v3 05/14 RESEND] dt-bindings: clock: exynos8855: add usb
 clock definitions
To: Raghav Sharma <raghav.s@samsung.com>
Cc: krzk@kernel.org, s.nawrocki@samsung.com, cw00.choi@samsung.com, 
	alim.akhtar@samsung.com, sboyd@kernel.org, bmasney+clk@redhat.com, 
	jbrunet+clk@baylibre.com, robh@kernel.org, conor+dt@kernel.org, 
	linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, is.gandhi@samsung.com, ts.amit@samsung.com, 
	pokala.reddy@samsung.com, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"

On Fri, 13 Nov 2026 at 10:58, Raghav Sharma <raghav.s@samsung.com> wrote:
>
> Add device tree clock binding definitions for CMU_USB
>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Raghav Sharma <raghav.s@samsung.com>
> ---

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>

>  .../clock/samsung,exynos8855-clock.yaml       | 21 +++++++++++++++++++
>  .../dt-bindings/clock/samsung,exynos8855.h    |  8 +++++++
>  2 files changed, 29 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/clock/samsung,exynos8855-clock.yaml b/Documentation/devicetree/bindings/clock/samsung,exynos8855-clock.yaml
> index 21928235d131..c68a64eb35c5 100644
> --- a/Documentation/devicetree/bindings/clock/samsung,exynos8855-clock.yaml
> +++ b/Documentation/devicetree/bindings/clock/samsung,exynos8855-clock.yaml
> @@ -32,6 +32,7 @@ properties:
>        - samsung,exynos8855-cmu-peric
>        - samsung,exynos8855-cmu-peris
>        - samsung,exynos8855-cmu-top
> +      - samsung,exynos8855-cmu-usb
>
>    clocks:
>      minItems: 1
> @@ -143,6 +144,26 @@ allOf:
>        required:
>          - samsung,sysreg
>
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: samsung,exynos8855-cmu-usb
> +
> +    then:
> +      properties:
> +        clocks:
> +          items:
> +            - description: External reference clock (76.8 MHz)
> +            - description: CMU_USB NOC clock (from CMU_TOP)
> +            - description: CMU_USB USB20DRD clock (from CMU_TOP)
> +
> +        clock-names:
> +          items:
> +            - const: oscclk
> +            - const: bus
> +            - const: usb20drd
> +
>  required:
>    - compatible
>    - "#clock-cells"
> diff --git a/include/dt-bindings/clock/samsung,exynos8855.h b/include/dt-bindings/clock/samsung,exynos8855.h
> index 67cd97d8fab8..f4261956ab4a 100644
> --- a/include/dt-bindings/clock/samsung,exynos8855.h
> +++ b/include/dt-bindings/clock/samsung,exynos8855.h
> @@ -222,4 +222,12 @@
>  #define CLK_GOUT_UFS_EMBD_ACLK_HSI         5
>  #define CLK_GOUT_UFS_EMBD_UNIPRO_HSI       6
>
> +/* CMU_USB */
> +#define CLK_MOUT_USB_NOC_USER              1
> +#define CLK_MOUT_USB_USB20DRD              2
> +#define CLK_MOUT_USB_USB20DRD_USER         3
> +#define CLK_DOUT_USB_NOC_DIV3              4
> +#define CLK_GOUT_CMU_USB                   5
> +#define CLK_GOUT_SYSREG_USB                6
> +
>  #endif /* _DT_BINDINGS_CLOCK_EXYNOS8855_H */
> --
> 2.34.1
>
>

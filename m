Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.41
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794567776;
	b=OibCp7E1bIAPKAJCNEyXz0lwDfEwS0+tjdIkJNIx0y94MKo/71aPQuOcugfx1XAeoFK5
	 f4BCJsSDjQIf2sD1muiB+NkLyOrPwDEJm34jc0yEElrb8/jFzbHVDWe6xJQavUQlMYSkw
	 qxw27qXdvufNopdkQboHMAZ+D8CP+1qeQHD8B9jRlCIwzFU5MJJmSHykwHY2vZ+/HP/0P
	 BKd6WVcm+59T/HtDsy+Yd0b08gW9U3vGoo1kvXWZ+eVec1f7UTKuXmruCrjXfIWsIBpZz
	 KJiM/NHQdrXkZBolLFzQ+CTKdy/YCqIvC25d4nf6UDOIc4Fz8BQDXq5JmyxVUL6qnQA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794567776;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=cnBurJ7zmT1evvY005qDgFpHdZ3WLhIUwmhdRCCTod8=;
	b=vDbtQhnZAiYGfn0KbpGE2N8K0wYs9IdmmV7aTJV6piutVZB9MHr1mVIy8qr2F+xmqvDJ
	 1ORpmuSXCGFGI2CL1PuAtEg7oU0sHrnVxx40J4YwZbv0KwtM8cH/+85ITzDe+D2b8gyr+
	 MsEcNlm5TpuN0NK1QlXJTjZ0BMASPJcFtFdvpRqivmibJZ8fTVGRjv/vYu9qHns62+q84
	 JHS2NcLy+Kt7wyQPMtdmtU6XroenW8benuKgGplIH7rQrMXcDXqPi43PKsIkEwgBbJ249
	 P5EIZ30woZJCquF4u0YLAqXrJGd+QcLTpcj1JyizDaGC9XBtZnU6kWRsDOjEe5SYnMw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=JwUO2hvV;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.41
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 806EA606A8A5
	for <linux-samsung-soc@vger.kernel.org>; Fri, 13 Nov 2026 11:02:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 806EA606A8A5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=JwUO2hvV
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6b70880c0a4so1194684a12.2
        for <linux-samsung-soc@vger.kernel.org>; Fri, 13 Nov 2026 03:02:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794567775; cv=none;
        d=google.com; s=arc-20260327;
        b=jJugDFww/TKaiM70eSUOev4KrP+1d3q2vZZTXUx8eCgJwaOq8PcwSYAqRM5g6x2Tt2
         8mor8SK0XZ5aTFaUs9BDKJ+dYrtt7mekPuj97cNPwNNF+QDa/BrS2UpTx7NyKne2hCQ4
         IAeNEkNQP22ryowZGfHySuPXpJCYB2CRjVLC5jD5oFir+bNFoO8Ka1H2Z9qgKZ+yG0Sc
         Cltk5C2ScRB6j2pdcTDLEkshTKrGIloDQTtJryYk10EwNpvt+KMoUGoESpYODkXSOnxK
         9oAtFy8ktijVXH999AOSfdMCrctXVGz9KvfGSHExSphtwq+rQL7AbBNlw4BejIqqP9fE
         CyaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=cnBurJ7zmT1evvY005qDgFpHdZ3WLhIUwmhdRCCTod8=;
        fh=RCJqUBtTsKq3NCWXc0gJ/Bb7IrV5sZ1AfQJi31KMDyY=;
        b=fOpru3sxZteEi8bEYtLc/lOtBkQuRwzTwZ1JwRDncnxb0uDcn4ddCaT+6pmwrl20HE
         Jvfzku9f8rrcI3iVDwpcxzEzkZAROf5+V1EjPDLeIegPHcWPC3ccHb50kokQ1bj/1gA+
         FWCgQqjIQy/Tn4/cqLj9l4mxfT4NnwfGKxzWeM9U8K8Kj2q/vYrnqsUr2ysr1ZPRhHlK
         yuAw6QBpWG2OV+nG/lgklhviGe1B5Rv8aw+vVDAtTezo7TZB12SUtIJZ2IkNhwczZ9Rl
         vfqNkLMNoD0W652ILrAWgC2tUvHb5NwTRlkbNEVxu4XvJwVcvCzytL+SxY1MIKNyO2SU
         KOAw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794567775; x=1795172575; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cnBurJ7zmT1evvY005qDgFpHdZ3WLhIUwmhdRCCTod8=;
        b=JwUO2hvV/ppxAEDkH/xdfzNFsOCy2nUrg0ZFHAtKdpe5gps/G6RPPA9pKq4aXnNwly
         oZhmwpq0Z3TSi2r4/g1eyDRmUf3WQvjKa86mjB0TvIGOiRuPPhYk5/+RymLXdtEiTIS8
         JvVaSLafA6RqJmAQEKd0fDEeXldwwMvY1Em98dMSnjvSFnsUBfkDluLri3+1fuvzDjjL
         XW4z+VHppZGjccnha4auuROdpE2ZV91UQ64JVsjuUS1y4ELJ/ZKX5hkWFlllr0XG+/JY
         eEA1IcCu69ZJOzG7zBmGhpMqzl/UXCVWflfmtyvaRXbDhmk0hR2dQnoMjqg0uBKiJOV+
         SJIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794567775; x=1795172575;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=cnBurJ7zmT1evvY005qDgFpHdZ3WLhIUwmhdRCCTod8=;
        b=lvgggU+xlWT6Uck46fPG4I3r0nLMnZGsrtVpQkhBZq3Ft7id5NUHd1yhnFjPLHffoJ
         54WwAkLqGwwT/v9ebSC8+G3IQw21jShSj3kdbBEImFXVOlC/De3Go3cRRr2w8aBbaPyx
         BVMMxaRpX2wbr2l08lNdj2JMJpIK3iw2ecsGlDXojK9HflYSG969z40bPZ3MmWPqlFa8
         FWKdJSpuc/K4IV/gs5m3FTm6ajs9xQRmDBiemkEofcnTZKyGhHJgFJazUKA+Mt38HEFz
         WJdL/2Cp/SZeGAFuA+9tFfhwzEab+8e52cFolwYDlpVBZac4llC0c0/4iPZlFndQR6RJ
         SApg==
X-Forwarded-Encrypted: i=1; AL+hErE/bcsT5goIxUH/C1vZFUg+v4GydDo0ICF/R7KYCKflsmOvht+KgQdc0j8TCy66Qok8QLEvLbYdysKRaT1meoLF9A==@vger.kernel.org
X-Gm-Message-State: APuU4Z+FyMMbUxutgWRX3iG6obC3mrBjtvZ1qq6/zoQjwhFDyqf97Tp9
	us2huRCMLqYRHomPaJvR5yV2eKrMi5O4Cf+ZciYkHd8YrhLFkIVTcXP/e468jLiGbATSv02IXbR
	R83RtUzt3L+yLjSOV8CoJ5ovWP7Xp56Ulrj9LysNuyw==
X-Gm-Gg: AYBFou312iqKfjcyUjuQay5m/fxIiKsHx4dQ0JheHvFU/Q6q+U0G1an9sB/bRFAyC8Y
	3dgk+W9+t4NVAX7bR2HoduYnuoYIeY8zRaFzyr/VUwfXvIHeDA6KPvnz0hE8v36Z1W+tqWoAs2A
	j+5jz8FJ42HLuOSDD7S+u7siJGyZLwmgH1/fiwe7eOBYqWD4NXc8EJPUt+XiOdSMdbeXbyDdVR2
	NeEZHMOtbeSWWjKf68DN57zKL9azmNbJvgHkKU5rpRQ3Sgadu/N+GPZTxGitMDC4sDN2pU/ySFC
	WHhz+Fz+UV0S0pcsb1j9nuuFDOw8UbsDQo1x81NAKLEgU1HAdTr9BkqCvp+MAjSt3OYPP1WBNV/
	TbVl72Tm3BJH/zC4cBCnomhSrms1/zZMGH+UGcqoI2/IFwib3p6bNzLle0sTseiTwULp7dg==
X-Received: by 2002:a05:6402:13d1:b0:6b7:709f:85f with SMTP id
 4fb4d7f45d1cf-6b7c0c7fbb1mr1715682a12.36.1794567774860; Fri, 13 Nov 2026
 03:02:54 -0800 (PST)
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Post: <mailto:linux-samsung-soc@vger.kernel.org>
List-Help: <mailto:linux-samsung-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-samsung-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <CGME20261113104841epcas5p2823126ce22f44cc98fcbdf94403c32e3@epcas5p2.samsung.com>
 <20261113110612.3265841-1-raghav.s@samsung.com> <1771243284.81794567483188.JavaMail.epsvc@epcpadp2new>
In-Reply-To: <1771243284.81794567483188.JavaMail.epsvc@epcpadp2new>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Fri, 13 Nov 2026 11:02:43 +0000
X-Gm-Features: AclHuK-cUPGFMqYQ4aV0p1o7MZtl5WXavbyl1lomUd6smnM_F6LSvDHUWLAhm10
Message-ID: <CADrjBPq0nD1ENZySUVZvG8gWGpYrf1464MMau9VswjfosHU6Wg@mail.gmail.com>
Subject: Re: [PATCH v3 04/14 RESEND] dt-bindings: clock: exynos8855: add hsi
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
> Add device tree clock binding definitions for CMU_HSI
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
> index 53fc8040e173..21928235d131 100644
> --- a/Documentation/devicetree/bindings/clock/samsung,exynos8855-clock.yaml
> +++ b/Documentation/devicetree/bindings/clock/samsung,exynos8855-clock.yaml
> @@ -28,6 +28,7 @@ description: |
>  properties:
>    compatible:
>      enum:
> +      - samsung,exynos8855-cmu-hsi
>        - samsung,exynos8855-cmu-peric
>        - samsung,exynos8855-cmu-peris
>        - samsung,exynos8855-cmu-top
> @@ -52,6 +53,26 @@ properties:
>        Phandle to system registers interface.
>
>  allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: samsung,exynos8855-cmu-hsi
> +
> +    then:
> +      properties:
> +        clocks:
> +          items:
> +            - description: External reference clock (76.8 MHz)
> +            - description: CMU_HSI NOC clock (from CMU_TOP)
> +            - description: CMU_HSI UFS_EMBD clock (from CMU_TOP)
> +
> +        clock-names:
> +          items:
> +            - const: oscclk
> +            - const: bus
> +            - const: ufs_embd
> +
>    - if:
>        properties:
>          compatible:
> diff --git a/include/dt-bindings/clock/samsung,exynos8855.h b/include/dt-bindings/clock/samsung,exynos8855.h
> index 5d8b38a744b5..67cd97d8fab8 100644
> --- a/include/dt-bindings/clock/samsung,exynos8855.h
> +++ b/include/dt-bindings/clock/samsung,exynos8855.h
> @@ -214,4 +214,12 @@
>  #define CLK_GOUT_WDT0_PERIS                8
>  #define CLK_GOUT_WDT1_PERIS                9
>
> +/* CMU_HSI */
> +#define CLK_MOUT_HSI_NOC_USER              1
> +#define CLK_MOUT_HSI_UFS_EMBD_USER         2
> +#define CLK_GOUT_CMU_HSI                   3
> +#define CLK_GOUT_SYSREG_HSI                4
> +#define CLK_GOUT_UFS_EMBD_ACLK_HSI         5
> +#define CLK_GOUT_UFS_EMBD_UNIPRO_HSI       6
> +
>  #endif /* _DT_BINDINGS_CLOCK_EXYNOS8855_H */
> --
> 2.34.1
>
>

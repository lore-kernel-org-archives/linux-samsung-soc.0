Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794567685;
	b=wlr/LYY5TcPs5jF36FAqq2eknwKb8UKNc2D0/rBPGQu9Hu+cp2SingDzi8hT+QfPZT72
	 zo2a2aAYKfC/3N4XA1HuxNlrW8uX24C0om5BGUUYhI1ituzHwkP8OMO6xcXCeUDsEYOMK
	 4OBcIft2F5AVV6XbtklKLteOiv5jrJ8PoyWken5eDNIeJvBH2wN728DO4ujMyo8qfEsOa
	 iQTsMqY25thLjwGeOZvak61Q4Nmn6G1XiRtNunHpqZNdgMdlRBWJgBHoEYB4WBvkIHXVg
	 WTyM/7rh2HRdA1FgdFYstfb5xeVFP1WmSE8pMCnoRBeHeyJuANq0ozeca4CFeO5f58w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794567685;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=EhSLziMRwdiehgWLSf2hbf4dn4hmC+KU+DWMadGd+hk=;
	b=XdITs0SKlG00AGr4qy/JpPgOJ6asyeG8WGKPhb+V5WakkAKV92JrK1RL7WuXKF6IKeQv
	 gruU5gvxvYQCdbzqDrSP8LoIjzHm3lLQMHvIxchH/Ew4rh6w4ics25x8/1pW8LVOr9aDo
	 Clg6tZQVUuSlUNcWBMrmVYh2OfP8OSGJ43Dkxn4hbUlB/dvYfMpHHPGHS+7RMkhAjSIxE
	 fcQvvakkyamJzYZn7x3yRAu0Vo+NosWqrrZ4KX+qa/jKbsVCoLVqQQW1unjWUq283OgOT
	 N80+v5RRfCUVYqrkFcoBb3C/51jFynjiXdD3vte0q81e3fLGJ1NfBi9LJ4sP8tAq0Rg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=gM7anwqP;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.45
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27EB3606A323
	for <linux-samsung-soc@vger.kernel.org>; Fri, 13 Nov 2026 11:01:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 27EB3606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=gM7anwqP
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6b581b6b0e9so1169347a12.2
        for <linux-samsung-soc@vger.kernel.org>; Fri, 13 Nov 2026 03:01:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794567683; cv=none;
        d=google.com; s=arc-20260327;
        b=mCBhQsnOGk/gIgFCR89vhAIKSXNU8Su4onGPBlLki52RsVT8A/h6ZBZkGoj4IiDQPe
         DykRkiO59KNPTfx4AGQ38DMgpy3QJdfHa+w8XSONU41EVIA/MSaf7y/Q0kHaOjsecdqW
         99GhMgVt+J5o3925+N5GjB4KA9WInteijVeacRWdBsSykoH8PbjDvH+fChzg0106nyFm
         A8uTIuX8doEWmJ/dfpCZ89hQndhHV3IalL9BMZN5R33LuIb7NGaXr9gP9rKLnUMR4vYl
         fLpl8cZZ2RBKih3ryLAjKnWnpdLqoYmVOUUEfd0GOTspEe/FVE2aisd53dvGxwd4z9Pu
         2NoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=EhSLziMRwdiehgWLSf2hbf4dn4hmC+KU+DWMadGd+hk=;
        fh=a/QJ761T+0hg0EL3cbKC6nJFILHyoces4AWUck4pDns=;
        b=ito/VOQhdszqacZS386aTsfvH9+v7DbBFDar6qprfbPTol5j5QF9w6WynAo9rnVZ+K
         dMon5Znn3efaY31QnnkmkzqeACITZKqUZAHMbmobxCBZhB6fq7er3ej5RAV6/58ZHOHM
         xAVJKJTPhjvPFPMjy6QsKHiGgxiElxiD80j5v58K51ut3QLhQWn/iOsmX44K+Jvn9wwY
         6i79HGQvtWUV4pTRcGLZIQXiJplvyWjDOMZmnhrEY+L5/JldQK5A4kHh+0KmzQNoXCse
         3PIDdQP/lCywLyJWUQj7JCavoT/Go9+YFcHf0SADENUhVZPieKImUGaUM4+Pm7BRrPPL
         +dQg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794567683; x=1795172483; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EhSLziMRwdiehgWLSf2hbf4dn4hmC+KU+DWMadGd+hk=;
        b=gM7anwqPc6kf1KPuU0sHreJsXNGPWMw6uQsDOjTYUJ/sGIqVH7Q9/GUmBv1oV/sbv+
         bg2CTphEFLwiLGxYNT6nCTZ37BM/cg70n/mSunhzpQsBNLWUHrgND9OiU3Ib6KpbSvza
         i4lwEH8DreGew2XU6/qX2H9RfgB9UChtZoQNavK1lr7jON9PbqT/+PL8YRxGJjFq738s
         DG93cXHbiqQUUfyOTTPu+pOzoCOOILF37M6GoB1GLHrtsJEljQJRpqCsoViKeFqfrQK5
         I0FHY/y+ijCl52hijhZ9hbKa5+0bj5fKmVnkiuzrZCp8Ku5WIk5kQskS43H5O2pG7KU1
         JN0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794567683; x=1795172483;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=EhSLziMRwdiehgWLSf2hbf4dn4hmC+KU+DWMadGd+hk=;
        b=o56rmzjrfqm+4lonLlh7QbKhKEGjszXSOetYMiOXMgi4Gp+YLcxrdreef2uXdmwfgl
         a3YXebInqjvLCbh7I2ebPsVlQIJ8gETAlknhWO84e1vM+/fQ4/urJlOGmFiga4bFW9Ud
         ucoNvnhxNkUTKAli+d291zmQg6RTPTxpK78VmOZz/zJMqE/3unr98JjnT+/86l7bT1Bp
         PrKMmx46xVtZfP5bqXhfNxCFOEVDvP44pJw3ud0I1y1fEdRHbwjtoP12p/bT7xgohqqb
         6di/tZUa3pQ8cOqPT08Yt5he60OEAOXULGprq7LGIgrrWA9ckNuR1AzS8o7Yf0GzzpjT
         0zyg==
X-Forwarded-Encrypted: i=1; AL+hErGELukXEWM9j8eAttlCge/M638luCnxVKWaA8j7bnCKXJ1/CFnSvjEqaQk7tXatRJiHzFRyX/OKpC7y372dp2y1sA==@vger.kernel.org
X-Gm-Message-State: APuU4Z+RPCKSMx58PNosxqFTJANcouiTbh4Gzmx0aNEoMKXaQBvM1rWv
	F6Tn6I+XFIMBHZFCqoqP1i4zSyWGTqTOv2wjgMmjz5FMrcqYHTaMuuZD/ZeYLrvuyV7bqthLSD/
	gugkijpuymdUjbTvMmir5sAtI4hXue4nKj9rAxy3P5A==
X-Gm-Gg: AYBFou0k2hLI5Pqj4x5Gbkw3YzexSVTgxo5sqe3INVloMyfEL/z0WZfSOu5wNwB7WFp
	J467o7lCJZre58ouKKQOHfRzMLgNsXA5WxWMuD67owB13pq0cF7x88m3B07jku/A0nGc9IO4L7r
	F9coR4XKZ4PPu6APzhsOAXUQJjq5CwD/AcNggRPBtOXz1zCoHnlDp/WsSq31JNgeIoFH7ZrHpJ4
	0PPwS09Yy6QtarBGY82RAtxUgTtkmmE14o4Fjo5H29uslHL1+tMlqcm40/se95OkmC70F8aNzF3
	Wa+yMkm83MZpFKhaHBdzmPLTjrwzQFrHcGWGKDKzlzADus9+Y1+7L0Yv05+bBGhzmulCS5Ur9Hk
	XcDeXdPH3zo4HKFILCvipD50DHQfxTKZsdmwoLvtpbzobWH/E4gJkkA97zRyAf/hR7FrC5xjwNk
	niINAw0rc0+fq456E=
X-Received: by 2002:aa7:d1d0:0:b0:6b6:face:56ff with SMTP id
 4fb4d7f45d1cf-6b7c0c1cecdmr1517334a12.33.1794567683121; Fri, 13 Nov 2026
 03:01:23 -0800 (PST)
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Post: <mailto:linux-samsung-soc@vger.kernel.org>
List-Help: <mailto:linux-samsung-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-samsung-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <CGME20261113104835epcas5p4771d9933265138321769ebe010ee7334@epcas5p4.samsung.com>
 <20261113110612.3265841-1-raghav.s@samsung.com> <973576304.21794567482719.JavaMail.epsvc@epcpadp2new>
In-Reply-To: <973576304.21794567482719.JavaMail.epsvc@epcpadp2new>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Fri, 13 Nov 2026 11:01:11 +0000
X-Gm-Features: AclHuK_4eW2y5x1TJUXLIaUHvbg5Y5qQ1j28UjXn0i-1LLBtpN9OCJGbji06uaU
Message-ID: <CADrjBPpwrT=njcZZjprSt9UHdGTO6Zyf1Bg3j8PWW2uqcJXeYQ@mail.gmail.com>
Subject: Re: [PATCH v3 02/14 RESEND] dt-bindings: clock: exynos8855: add top &
 peric clock definitions
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
> Add device tree clock binding definitions for CMU_TOP & CMU_PERIC
>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Raghav Sharma <raghav.s@samsung.com>
> ---

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>

>  .../clock/samsung,exynos8855-clock.yaml       | 133 +++++++++++
>  .../dt-bindings/clock/samsung,exynos8855.h    | 206 ++++++++++++++++++
>  2 files changed, 339 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/samsung,exynos8855-clock.yaml
>  create mode 100644 include/dt-bindings/clock/samsung,exynos8855.h
>
> diff --git a/Documentation/devicetree/bindings/clock/samsung,exynos8855-clock.yaml b/Documentation/devicetree/bindings/clock/samsung,exynos8855-clock.yaml
> new file mode 100644
> index 000000000000..486b7347ad44
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/samsung,exynos8855-clock.yaml
> @@ -0,0 +1,133 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/samsung,exynos8855-clock.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Samsung Exynos 8855 SoC clock controller
> +
> +maintainers:
> +  - Raghav Sharma <raghav.s@samsung.com>
> +
> +description: |
> +  Exynos 8855 clock controller is comprised of several CMU units, generating
> +  clocks for different domains. Those CMU units are modeled as separate device
> +  tree nodes, and might depend on each other. Root clocks in that clock tree are
> +  two external clocks:: OSCCLK/XTCXO (76.8 MHz) and RTCCLK/XrtcXTI (32768 Hz).
> +  The external OSCCLK must be defined as fixed-rate clock in dts.
> +
> +  CMU_TOP is a top-level CMU, where all base clocks are prepared using PLLs and
> +  dividers; all other clocks of function blocks (other CMUs) are usually
> +  derived from CMU_TOP.
> +
> +  Each clock is assigned an identifier and client nodes can use this identifier
> +  to specify the clock which they consume. All clocks available for usage
> +  in clock consumer nodes are defined as preprocessor macros in
> +  'include/dt-bindings/clock/samsung,exynos8855.h' header.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - samsung,exynos8855-cmu-peric
> +      - samsung,exynos8855-cmu-top
> +
> +  clocks:
> +    minItems: 1
> +    maxItems: 4
> +
> +  clock-names:
> +    minItems: 1
> +    maxItems: 4
> +
> +  "#clock-cells":
> +    const: 1
> +
> +  reg:
> +    maxItems: 1
> +
> +  samsung,sysreg:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description:
> +      Phandle to system registers interface.
> +
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: samsung,exynos8855-cmu-peric
> +
> +    then:
> +      properties:
> +        clocks:
> +          items:
> +            - description: External reference clock (76.8 MHz)
> +            - description: CMU_PERIC NOC clock (from CMU_TOP)
> +            - description: CMU_PERIC MMC_CARD clock (from CMU_TOP)
> +            - description: CMU_PERIC IP clock (from CMU_TOP)
> +
> +        clock-names:
> +          items:
> +            - const: oscclk
> +            - const: bus
> +            - const: mmc_card
> +            - const: ip
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: samsung,exynos8855-cmu-top
> +
> +    then:
> +      properties:
> +        clocks:
> +          items:
> +            - description: External reference clock (76.8 MHz)
> +
> +        clock-names:
> +          items:
> +            - const: oscclk
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: samsung,exynos8855-cmu-top
> +    then:
> +      properties:
> +        samsung,sysreg: false
> +    else:
> +      required:
> +        - samsung,sysreg
> +
> +required:
> +  - compatible
> +  - "#clock-cells"
> +  - clocks
> +  - clock-names
> +  - reg
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/samsung,exynos8855.h>
> +
> +    cmu_peric0: clock-controller@15400000 {
> +        compatible = "samsung,exynos8855-cmu-peric";
> +        reg = <0x15400000 0x8000>;
> +        #clock-cells = <1>;
> +
> +        clocks = <&xtcxo>,
> +                 <&cmu_top CLKCMU_DOUT_PERIC_NOC>,
> +                 <&cmu_top CLKCMU_DOUT_PERIC_MMC_CARD>,
> +                 <&cmu_top CLKCMU_DOUT_PERIC_IP>;
> +        clock-names = "oscclk",
> +                      "bus",
> +                      "mmc_card",
> +                      "ip";
> +        samsung,sysreg = <&sysreg_peric>;
> +    };
> +
> +...
> diff --git a/include/dt-bindings/clock/samsung,exynos8855.h b/include/dt-bindings/clock/samsung,exynos8855.h
> new file mode 100644
> index 000000000000..cd445bb45070
> --- /dev/null
> +++ b/include/dt-bindings/clock/samsung,exynos8855.h
> @@ -0,0 +1,206 @@
> +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
> +/*
> + * Copyright (c) 2026 Samsung Electronics Co., Ltd.
> + * Author: Raghav Sharma <raghav.s@samsung.com>
> + *
> + * Device Tree binding constants for Exynos 8855 clock controller.
> + */
> +
> +#ifndef _DT_BINDINGS_CLOCK_EXYNOS8855_H
> +#define _DT_BINDINGS_CLOCK_EXYNOS8855_H
> +
> +/* CMU_TOP  */
> +#define FOUT_SHARED0_PLL                  1
> +#define FOUT_SHARED1_PLL                  2
> +#define FOUT_SHARED2_PLL                  3
> +#define FOUT_SHARED3_PLL                  4
> +#define FOUT_SHARED4_PLL                  5
> +#define FOUT_MMC_PLL                      6
> +#define MOUT_SHARED0_PLL                  7
> +#define MOUT_SHARED1_PLL                  8
> +#define MOUT_SHARED2_PLL                  9
> +#define MOUT_SHARED3_PLL                  10
> +#define MOUT_SHARED4_PLL                  11
> +#define MOUT_MMC_PLL                      12
> +#define CLKCMU_MOUT_PERIC_NOC              13
> +#define CLKCMU_MOUT_PERIC_MMC_CARD         14
> +#define CLKCMU_MOUT_PERIC_IP               15
> +#define CLKCMU_DOUT_PERIC_NOC              16
> +#define CLKCMU_DOUT_PERIC_MMC_CARD         17
> +#define CLKCMU_DOUT_PERIC_IP               18
> +#define DOUT_SHARED0_DIV1                 19
> +#define DOUT_SHARED0_DIV2                 20
> +#define DOUT_SHARED0_DIV3                 21
> +#define DOUT_SHARED0_DIV4                 22
> +#define DOUT_SHARED1_DIV1                 23
> +#define DOUT_SHARED1_DIV2                 24
> +#define DOUT_SHARED1_DIV3                 25
> +#define DOUT_SHARED1_DIV4                 26
> +#define DOUT_SHARED2_DIV1                 27
> +#define DOUT_SHARED2_DIV2                 28
> +#define DOUT_SHARED2_DIV3                 29
> +#define DOUT_SHARED2_DIV4                 30
> +#define DOUT_SHARED3_DIV1                 31
> +#define DOUT_SHARED3_DIV2                 32
> +#define DOUT_SHARED3_DIV3                 33
> +#define DOUT_SHARED3_DIV4                 34
> +#define DOUT_SHARED4_DIV1                 35
> +#define DOUT_SHARED4_DIV2                 36
> +#define DOUT_SHARED4_DIV3                 37
> +#define DOUT_SHARED4_DIV4                 38
> +#define FOUT_MMC_PLL_DIV1                  39
> +#define FOUT_MMC_PLL_DIV2                  40
> +#define CLKCMU_MOUT_PERIS_GIC              41
> +#define CLKCMU_MOUT_PERIS_NOC              42
> +#define CLKCMU_DOUT_PERIS_GIC              43
> +#define CLKCMU_DOUT_PERIS_NOC              44
> +#define FOUT_MMC_PLL_CLKOUT_DIV2           45
> +#define CLKCMU_MOUT_HSI_NOC                46
> +#define CLKCMU_MOUT_HSI_UFS_EMBD           47
> +#define CLKCMU_DOUT_HSI_NOC                48
> +#define CLKCMU_DOUT_HSI_UFS_EMBD           49
> +#define CLKCMU_MOUT_USB_NOC                50
> +#define CLKCMU_MOUT_USB_USB20DRD           51
> +#define CLKCMU_DOUT_USB_NOC                52
> +#define CLKCMU_DOUT_USB_USB20DRD           53
> +#define FOUT_MIF_SWITCH_PLL               54
> +#define MOUT_MIF_SWITCH_PLL               55
> +#define FOUT_MMC_PLL_DIV3                  56
> +#define FOUT_MMC_PLL_DIV4                  57
> +#define FOUT_MIF_SWITCH_PLL_DIV1           58
> +#define FOUT_MIF_SWITCH_PLL_DIV2           59
> +#define FOUT_MIF_SWITCH_PLL_DIV3           60
> +#define FOUT_MIF_SWITCH_PLL_DIV4           61
> +#define CLKCMU_MOUT_AUD_CPU                62
> +#define CLKCMU_MOUT_AUD_NOC                63
> +#define CLKCMU_MOUT_CPUCL0_SWITCH          64
> +#define CLKCMU_MOUT_CPUCL0_NOCP            65
> +#define CLKCMU_MOUT_DSU_SWITCH             66
> +#define CLKCMU_MOUT_CPUCL1_SWITCH          67
> +#define CLKCMU_MOUT_CIS_CLK0               68
> +#define CLKCMU_MOUT_CIS_CLK1               69
> +#define CLKCMU_MOUT_CIS_CLK2               70
> +#define CLKCMU_MOUT_CIS_CLK3               71
> +#define CLKCMU_MOUT_CIS_CLK4               72
> +#define CLKCMU_MOUT_CMU_BOOST_TOP          73
> +#define CLKCMU_MOUT_CMU_BOOST              74
> +#define CLKCMU_MOUT_CMU_BOOST_CPU          75
> +#define CLKCMU_MOUT_CMU_BOOST_MIF0         76
> +#define CLKCMU_MOUT_CSIS_NOC               77
> +#define CLKCMU_MOUT_CSTAT_NOC              78
> +#define CLKCMU_MOUT_CSTAT_BYRP             79
> +#define CLKCMU_MOUT_DPU_NOC                80
> +#define CLKCMU_MOUT_G3DCORE_SWITCH         81
> +#define CLKCMU_MOUT_M2M_NOC                82
> +#define CLKCMU_MOUT_M2M_JPEG               83
> +#define CLKCMU_MOUT_M2M_GDC                84
> +#define CLKCMU_MOUT_MIF1_NOCP              85
> +#define CLKCMU_MOUT_MFC_NOC                86
> +#define CLKCMU_MOUT_MIF0_NOCP              87
> +#define CLKCMU_MOUT_NOCL0_NOC              88
> +#define CLKCMU_MOUT_NOCL1A_NOC             89
> +#define CLKCMU_MOUT_RGBP_NOC               90
> +#define CLKCMU_MOUT_YUVP_NOC               91
> +#define CLKCMU_MOUT_ALIVE_NOC              92
> +#define CLKCMU_MOUT_CSIS_DCPHY             93
> +#define CLKCMU_MOUT_CSIS_OIS               94
> +#define CLKCMU_MOUT_ICPU_NOCD_0            95
> +#define CLKCMU_MOUT_ICPU_NOCD_1            96
> +#define CLKCMU_MOUT_GNPU0_NOC              97
> +#define CLKCMU_MOUT_GNPU0_XMAA             98
> +#define CLKCMU_MOUT_SDMA_NOC               99
> +#define CLKCMU_MOUT_DNC_HTU               100
> +#define CLKCMU_MOUT_DNC_NOC               101
> +#define CLKCMU_MOUT_PSP_NOC               102
> +#define CLKCMU_MOUT_G3D_NOCP              103
> +#define CLKCMU_MOUT_USI_NOC               104
> +#define CLKCMU_MOUT_USI_IP                105
> +#define CLKCMU_MOUT_CPUCL0_DBG_NOC        106
> +#define CLKCMU_MOUT_BOOST_RCO             107
> +#define CLKCMU_MOUT_MIF0_SWITCH           108
> +#define CLKCMU_MOUT_MIF1_SWITCH           109
> +#define CLKCMU_MOUT_NOCL1B_NOC            110
> +#define CLKCMU_MOUT_CPUCL2_SWITCH         111
> +#define CLKCMU_MOUT_CMU_BOOST_MIF1        112
> +#define CLKCMU_MOUT_CSTAT_MCSC            113
> +#define CLKCMU_MOUT_G3D_HTU               114
> +#define CLKCMU_DOUT_AUD_CPU               115
> +#define CLKCMU_DOUT_AUD_NOC               116
> +#define CLKCMU_DOUT_CPUCL0_SWITCH         117
> +#define CLKCMU_DOUT_CPUCL0_NOCP           118
> +#define CLKCMU_DOUT_DSU_SWITCH            119
> +#define CLKCMU_DOUT_CPUCL1_SWITCH         120
> +#define CLKCMU_DOUT_CIS_CLK0              121
> +#define CLKCMU_DOUT_CIS_CLK1              122
> +#define CLKCMU_DOUT_CIS_CLK2              123
> +#define CLKCMU_DOUT_CIS_CLK3              124
> +#define CLKCMU_DOUT_CIS_CLK4              125
> +#define CLKCMU_DOUT_CMU_BOOST_TOP         126
> +#define CLKCMU_DOUT_CMU_BOOST             127
> +#define CLKCMU_DOUT_CMU_BOOST_CPU         128
> +#define CLKCMU_DOUT_CMU_BOOST_MIF0        129
> +#define CLKCMU_DOUT_CSIS_NOC              130
> +#define CLKCMU_DOUT_CSTAT_NOC             131
> +#define CLKCMU_DOUT_CSTAT_BYRP            132
> +#define CLKCMU_DOUT_DPU_NOC               133
> +#define CLKCMU_DOUT_G3DCORE_SWITCH        134
> +#define CLKCMU_DOUT_M2M_NOC               135
> +#define CLKCMU_DOUT_M2M_JPEG              136
> +#define CLKCMU_DOUT_M2M_GDC               137
> +#define CLKCMU_DOUT_MIF1_NOCP             138
> +#define CLKCMU_DOUT_MFC_NOC               139
> +#define CLKCMU_DOUT_MIF0_NOCP             140
> +#define CLKCMU_DOUT_NOCL0_NOC             141
> +#define CLKCMU_DOUT_NOCL1A_NOC            142
> +#define CLKCMU_DOUT_RGBP_NOC              143
> +#define CLKCMU_DOUT_YUVP_NOC              144
> +#define CLKCMU_DOUT_ALIVE_NOC             145
> +#define CLKCMU_DOUT_CSIS_DCPHY            146
> +#define CLKCMU_DOUT_CSIS_OIS              147
> +#define CLKCMU_DOUT_ICPU_NOCD_0           148
> +#define CLKCMU_DOUT_ICPU_NOCD_1           149
> +#define CLKCMU_DOUT_GNPU0_NOC             150
> +#define CLKCMU_DOUT_GNPU0_XMAA            151
> +#define CLKCMU_DOUT_SDMA_NOC              152
> +#define CLKCMU_DOUT_DNC_HTU               153
> +#define CLKCMU_DOUT_DNC_NOC               154
> +#define CLKCMU_DOUT_PSP_NOC               155
> +#define CLKCMU_DOUT_G3D_NOCP              156
> +#define CLKCMU_DOUT_USI_NOC               157
> +#define CLKCMU_DOUT_USI_IP                158
> +#define CLKCMU_DOUT_CPUCL0_DBG_NOC        159
> +#define CLKCMU_DOUT_NOCL1B_NOC            160
> +#define CLKCMU_DOUT_CPUCL2_SWITCH         161
> +#define CLKCMU_DOUT_CMU_BOOST_MIF1        162
> +#define CLKCMU_DOUT_CSTAT_MCSC            163
> +#define CLKCMU_DOUT_G3D_HTU               164
> +
> +/* CMU_PERIC */
> +#define CLK_MOUT_PERIC_IP_USER             1
> +#define CLK_MOUT_PERIC_MMC_CARD_USER       2
> +#define CLK_MOUT_PERIC_NOC_USER            3
> +#define CLK_MOUT_PERIC_I2C                 4
> +#define CLK_MOUT_PERIC_UART_DBG            5
> +#define CLK_MOUT_PERIC_USI00               6
> +#define CLK_MOUT_PERIC_USI01               7
> +#define CLK_MOUT_PERIC_USI02               8
> +#define CLK_MOUT_PERIC_USI03               9
> +#define CLK_MOUT_PERIC_USI04               10
> +#define CLK_MOUT_PERIC_USI09_USI_OIS       11
> +#define CLK_MOUT_PERIC_USI10_USI_OIS       12
> +#define CLK_DOUT_PERIC_NOCP                13
> +#define CLK_DOUT_PERIC_UART_DBG            14
> +#define CLK_DOUT_PERIC_USI00_USI           15
> +#define CLK_DOUT_PERIC_USI01_USI           16
> +#define CLK_DOUT_PERIC_USI02_USI           17
> +#define CLK_DOUT_PERIC_USI03_USI           18
> +#define CLK_DOUT_PERIC_USI04_USI           19
> +#define CLK_DOUT_PERIC_USI09_USI_OIS       20
> +#define CLK_DOUT_PERIC_USI10_USI_OIS       21
> +#define CLK_DOUT_PERIC_USI_I2C             22
> +#define CLK_GOUT_CMU_PERIC                 23
> +#define CLK_GOUT_SYSREG_PERIC              24
> +#define CLK_GOUT_UART_DBG_PERIC            25
> +#define CLK_GOUT_USI_PERIC                 26
> +
> +#endif /* _DT_BINDINGS_CLOCK_EXYNOS8855_H */
> --
> 2.34.1
>
>

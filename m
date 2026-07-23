Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 706AB47CC6F
	for <linux-samsung-soc@vger.kernel.org>; Thu, 23 Jul 2026 12:14:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784808897; cv=pass; b=jW18/TakWE6V9qRanyTeNcRq4CaSlb+/yYMPT1tkYTcHpnXA5qnpVNToT59ORKqUu3rmqn02RvT2s5HgcGB5GvGeHOFGw/WRMEZsKRluJm21ZEDNKmJSZHEoAZnQY8Yb4lfKYvXsg87FuHVMFSKcMgYbar1xjVXVlR2u07lvDsA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784808897; c=relaxed/simple;
	bh=PNpa7UBnWJrPWSVe+I6P10UM5prlXE3CiMLCucrHEJw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KoInuYeYwCCexvR9SM5uv27IGM3noHL5TwB0EpjLTv1wyUCCWq35IWhs++5G12aQPcomTEfcg3yu3Qwob7cw4qP6n1Sf/LEEKIfMxOBFomz7LRL5WoPespmJYYhyHcVwVpyI1TRk+ke81UHAR2c38kivENC0ZCROSQrknYjEYjE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CHculerd; arc=pass smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CHculerd"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-698aa7ba3e6so946433a12.1
        for <linux-samsung-soc@vger.kernel.org>; Thu, 23 Jul 2026 05:14:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784808891; cv=none;
        d=google.com; s=arc-20260327;
        b=PZJISWlXNOaR2NDlJU338LxFr4iv5FE5xn+WbF63lpV0+Y78350WBMdwKu44aNmpwg
         t98W3H4rEuzvNlSehqx0xOJI7T/SXZwdi/kxlFUYZfznR5RPMRhjzl7Y4h+LPOpSXzff
         eWaUpBaRaMBoXfndrP006hOIfD0JAUWp9GqSsxKb9IhI8BYZW8e9f3XURxDpbgLtBq94
         5LLQsQ0lQL6FT1iEVxS1vsbNVZDV7jsY7RRzQ5qO5BO76JSmw6HfPI9vY2Khdsqwrz9F
         qNpyG0JjFNvs5tE+H2Vak+YuX2WOSHZHCZg3gbdswuCGE+zAOrEQCTyTp1KunOPOLBWg
         2Onw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=87JDpxU7wWz5t+Fbx4Cp5YJ1m59hVHmfKijZmjgZ1YY=;
        fh=RfpiQiZThlHANDGL1iixu8s8cxUt5aY97HBecXsuTHk=;
        b=JWrVrw2JQEilky28BRacrwE4aNcmKSlib39ioqLf+PaPRvLWt1iv8h+vaIn7j5Wztr
         UXKUTbCh1XXJMQmZT0+iO/OnK/sAcTy4f/n9eHCHaMe7cBIbSaXqlCAtAKg0PAsPFQiS
         RkrNfqM60W8cAre6iMhAYcVI+d5pqVea4VQkRo5+vG7JahrzAEBZ9vFR7iVroiQ1MmYr
         CFV0S+ylkrAcVqq8nUHodyiY8uahkZ7lvlE/7mmsBk+sCexaiITRyLB6MwKBwT0kqmf7
         qzZbia7fyrPrEmwFekr8ihKjB2CVC3G339gALIfXSTklFJRI5VESowtz92dC8n0Szz23
         LrcA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1784808891; x=1785413691; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=87JDpxU7wWz5t+Fbx4Cp5YJ1m59hVHmfKijZmjgZ1YY=;
        b=CHculerdhKIKyJmbgHKsEC8Vz8qu6uqlMnlwUNQnMVVeNg30/MQLxxplMt/tJT8UcL
         9a+5D07qX/2oeWDbDlPEX+GKYA8VhfiOvyx2etLj2FRIMIrbyP46X25EJRFjZdQ7aXMd
         0xQ0h8mURdX8bxbe+aOV4mx2avhqjPuigFB83Qn0DmhY7uACcl7MleKMFpkirQEp0saP
         BGmNAlUAWmT045FSqiNSL23/h3IHwUYdOI+eIiBL2ItoMi1v8abhAUR40bx8WuaZkHLZ
         DBi4j0lz6UI7W2eXFoqCCuQv6EWkkIXQcd5UDnxGcIzPyeWqsxlfA1zNssmFNimoj5M5
         OytQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784808891; x=1785413691;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=87JDpxU7wWz5t+Fbx4Cp5YJ1m59hVHmfKijZmjgZ1YY=;
        b=aLxQtte3k7oT7rbhTiP3zaOayHzlCObXZn5FezTTDV81x6w2gZV4tXaqvZr4tmWGzE
         +E7bF6VSmul0ubI0gSK6NR8n3A7haimX5f2jmTBEC0Q1/sHwhJ/32cL/1mZ67mGIT72b
         7OYU9O31etGna0Kmy3UJWJLKji2+4UjgGpHCW+cqzuLyt/igJTAUQHFbvEqGFXnmzgb4
         xJC034FZ2P81/lahCc4uI9LiKcNJmj4x6aOwSCysVcxr7B9IsRNJ1HThGjx5eEITG2so
         L0pfsgrM+9CWeQ0cNctmmXBcPt76dW2W7ezTbHfGJnU93EDWMv3TulQguqC+rO4MoAf7
         Jrhg==
X-Forwarded-Encrypted: i=1; AHgh+RrlbcFd8npjt3rg6TLyqfv+pg1Rck+HCAR8jptpR0eYUF5T5ua+I1PFHSRWnHoHAA14cgQkF4R8xsgndHa/H2jUcw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwnKII3LaeNVOwvzwJF+ZZPD523MZ33DK9sYVURJNNNoh0uDgGi
	FOFePskFTxbX7auWjtDrzvB+7kRWEiPc6jfNbCLDLK69eDaDFRKfI/Awzzv4jgWF8C1Io8+XZVi
	PPoWzzjUQH1OWw1Mgywe2xRzOR6+O/+btTIUS1IJzXA==
X-Gm-Gg: AR+sD13PQXfWNf/cAp263R/TC/lBdO2QixL7wc3hxVdLIavKxu0KzMTlunen799BfXq
	8SjqYMkcUDH9WLUpyjWmPKgqcqScwSdgPQImEXffp08fsCcI16m2/lBL8y5K98g+8nJIRxtS6CV
	WqoPi0EQ2omqkBaB3Vd4js6JsxT3IwrHlx1tOTb5/BQ9b+SCyt6RK3utmtxeZ70C7BOXzj28Hzd
	MdApluDDYkcpDvtwMqeXDqp2WexziAIWmCT/KON3P4HvvyxsLHUrKKAc6n84njRoJGcaqJJdrVc
	pSyCI4h0WwS0eCPJGtyp
X-Received: by 2002:a05:6402:528a:b0:698:76b8:e552 with SMTP id
 4fb4d7f45d1cf-69f6bc1a1eamr1066118a12.2.1784808891200; Thu, 23 Jul 2026
 05:14:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CGME20260627165422epcas5p4e4c6bce0e2daa6d08a9ec18afde9ce0e@epcas5p4.samsung.com>
 <20260627171228.2687857-1-alim.akhtar@samsung.com> <20260627171228.2687857-6-alim.akhtar@samsung.com>
In-Reply-To: <20260627171228.2687857-6-alim.akhtar@samsung.com>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Thu, 23 Jul 2026 13:14:39 +0100
X-Gm-Features: AUfX_mylIIp57pq2dVVawDA3TT7Con7Vrq-wOf02o52EvH981AjzpqF-98L5kFo
Message-ID: <CADrjBPrjM-eZC+GxQG68fVTQfOX_i+_EA41zBzGd8-_R1r9Erg@mail.gmail.com>
Subject: Re: [PATCH v3 5/6] arm64: dts: exynos: add initial support for
 Samsung Exynos8855 smdk
To: Alim Akhtar <alim.akhtar@samsung.com>
Cc: krzk@kernel.org, robh@kernel.org, conor+dt@kernel.org, linusw@kernel.org, 
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, 
	hajun.sung@samsung.com
Content-Type: text/plain; charset="UTF-8"

On Sat, 27 Jun 2026 at 17:54, Alim Akhtar <alim.akhtar@samsung.com> wrote:
>
> Add initial devicetree support for Samsung smdk board using
> Exynos8855 SoC.
> This SoC has Octa-core CPU with tri cluster architecture, a custom GPU
> and a NPU supporting up to 14.7 TOPS apart from other supporting peripheral
> and IPs.
>
> Commercially this SoC is also known as Exynos1580 [1]
>
> [1] https://semiconductor.samsung.com/processor/mobile-processor/exynos-1580/
>
> Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
> ---

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>

>  arch/arm64/boot/dts/exynos/Makefile           |   1 +
>  .../boot/dts/exynos/exynos8855-pinctrl.dtsi   | 574 ++++++++++++++++++
>  .../arm64/boot/dts/exynos/exynos8855-smdk.dts |  32 +
>  arch/arm64/boot/dts/exynos/exynos8855.dtsi    | 204 +++++++
>  4 files changed, 811 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/exynos/exynos8855-pinctrl.dtsi
>  create mode 100644 arch/arm64/boot/dts/exynos/exynos8855-smdk.dts
>  create mode 100644 arch/arm64/boot/dts/exynos/exynos8855.dtsi
>
> diff --git a/arch/arm64/boot/dts/exynos/Makefile b/arch/arm64/boot/dts/exynos/Makefile
> index 76cc23acb9b2..8c48ce2e02e5 100644
> --- a/arch/arm64/boot/dts/exynos/Makefile
> +++ b/arch/arm64/boot/dts/exynos/Makefile
> @@ -14,6 +14,7 @@ dtb-$(CONFIG_ARCH_EXYNOS) += \
>         exynos7870-on7xelte.dtb         \
>         exynos7885-jackpotlte.dtb       \
>         exynos850-e850-96.dtb           \
> +       exynos8855-smdk.dtb             \
>         exynos8895-dreamlte.dtb         \
>         exynos9810-starlte.dtb          \
>         exynos990-c1s.dtb               \
> diff --git a/arch/arm64/boot/dts/exynos/exynos8855-pinctrl.dtsi b/arch/arm64/boot/dts/exynos/exynos8855-pinctrl.dtsi
> new file mode 100644
> index 000000000000..b65f1698cd74
> --- /dev/null
> +++ b/arch/arm64/boot/dts/exynos/exynos8855-pinctrl.dtsi
> @@ -0,0 +1,574 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Samsung's S5E8855 SoC pin-mux and pin-config device tree source
> + *
> + * Copyright (c) 2023 Samsung Electronics Co., Ltd.
> + *             http://www.samsung.com
> + *
> + * Samsung's S5E8855 SoC pin-mux and pin-config options are listed as device
> + * tree nodes are listed in this file.
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> + */
> +
> +#include <dt-bindings/interrupt-controller/arm-gic.h>
> +#include "exynos-pinctrl.h"
> +
> +&pinctrl_alive {
> +       gpa0: gpa0-gpio-bank {
> +               gpio-controller;
> +               #gpio-cells = <2>;
> +
> +               interrupt-controller;
> +               #interrupt-cells = <2>;
> +               interrupt-parent = <&gic>;
> +               interrupts = <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH>,
> +                            <GIC_SPI 1 IRQ_TYPE_LEVEL_HIGH>,
> +                            <GIC_SPI 2 IRQ_TYPE_LEVEL_HIGH>,
> +                            <GIC_SPI 3 IRQ_TYPE_LEVEL_HIGH>,
> +                            <GIC_SPI 4 IRQ_TYPE_LEVEL_HIGH>,
> +                            <GIC_SPI 5 IRQ_TYPE_LEVEL_HIGH>,
> +                            <GIC_SPI 6 IRQ_TYPE_LEVEL_HIGH>,
> +                            <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>;
> +       };
> +
> +       gpa1: gpa1-gpio-bank {
> +               gpio-controller;
> +               #gpio-cells = <2>;
> +
> +               interrupt-controller;
> +               #interrupt-cells = <2>;
> +               interrupt-parent = <&gic>;
> +               interrupts = <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>,
> +                            <GIC_SPI 9 IRQ_TYPE_LEVEL_HIGH>,
> +                            <GIC_SPI 10 IRQ_TYPE_LEVEL_HIGH>,
> +                            <GIC_SPI 11 IRQ_TYPE_LEVEL_HIGH>,
> +                            <GIC_SPI 12 IRQ_TYPE_LEVEL_HIGH>;
> +       };
> +
> +       gpq0: gpq0-gpio-bank {
> +               gpio-controller;
> +               #gpio-cells = <2>;
> +       };
> +
> +       gpq1: gpq1-gpio-bank {
> +               gpio-controller;
> +               #gpio-cells = <2>;
> +       };
> +
> +       gpc0: gpc0-gpio-bank {
> +               gpio-controller;
> +               #gpio-cells = <2>;
> +
> +               interrupt-controller;
> +               #interrupt-cells = <2>;
> +               interrupt-parent = <&gic>;
> +               interrupts = <GIC_SPI 13 IRQ_TYPE_LEVEL_HIGH>;
> +       };
> +
> +       gpc1: gpc1-gpio-bank {
> +               gpio-controller;
> +               #gpio-cells = <2>;
> +
> +               interrupt-controller;
> +               #interrupt-cells = <2>;
> +               interrupt-parent = <&gic>;
> +               interrupts = <GIC_SPI 14 IRQ_TYPE_LEVEL_HIGH>;
> +       };
> +
> +       gpc2: gpc2-gpio-bank {
> +               gpio-controller;
> +               #gpio-cells = <2>;
> +
> +               interrupt-controller;
> +               #interrupt-cells = <2>;
> +               interrupt-parent = <&gic>;
> +               interrupts = <GIC_SPI 15 IRQ_TYPE_LEVEL_HIGH>;
> +       };
> +
> +       gpc3: gpc3-gpio-bank {
> +               gpio-controller;
> +               #gpio-cells = <2>;
> +
> +               interrupt-controller;
> +               #interrupt-cells = <2>;
> +               interrupt-parent = <&gic>;
> +               interrupts = <GIC_SPI 16 IRQ_TYPE_LEVEL_HIGH>;
> +       };
> +
> +       gpc4: gpc4-gpio-bank {
> +               gpio-controller;
> +               #gpio-cells = <2>;
> +
> +               interrupt-controller;
> +               #interrupt-cells = <2>;
> +               interrupt-parent = <&gic>;
> +               interrupts = <GIC_SPI 17 IRQ_TYPE_LEVEL_HIGH>;
> +       };
> +
> +       gpc5: gpc5-gpio-bank {
> +               gpio-controller;
> +               #gpio-cells = <2>;
> +
> +               interrupt-controller;
> +               #interrupt-cells = <2>;
> +               interrupt-parent = <&gic>;
> +               interrupts = <GIC_SPI 18 IRQ_TYPE_LEVEL_HIGH>;
> +       };
> +
> +       gpc6: gpc6-gpio-bank {
> +               gpio-controller;
> +               #gpio-cells = <2>;
> +
> +               interrupt-controller;
> +               #interrupt-cells = <2>;
> +               interrupt-parent = <&gic>;
> +               interrupts = <GIC_SPI 19 IRQ_TYPE_LEVEL_HIGH>;
> +       };
> +
> +       gpc7: gpc7-gpio-bank {
> +               gpio-controller;
> +               #gpio-cells = <2>;
> +
> +               interrupt-controller;
> +               #interrupt-cells = <2>;
> +               interrupt-parent = <&gic>;
> +               interrupts = <GIC_SPI 20 IRQ_TYPE_LEVEL_HIGH>;
> +       };
> +
> +       gpc8: gpc8-gpio-bank {
> +               gpio-controller;
> +               #gpio-cells = <2>;
> +
> +               interrupt-controller;
> +               #interrupt-cells = <2>;
> +               interrupt-parent = <&gic>;
> +               interrupts = <GIC_SPI 21 IRQ_TYPE_LEVEL_HIGH>;
> +       };
> +
> +       gpc9: gpc9-gpio-bank {
> +               gpio-controller;
> +               #gpio-cells = <2>;
> +
> +               interrupt-controller;
> +               #interrupt-cells = <2>;
> +               interrupt-parent = <&gic>;
> +               interrupts = <GIC_SPI 22 IRQ_TYPE_LEVEL_HIGH>;
> +       };
> +
> +       gpc10: gpc10-gpio-bank {
> +               gpio-controller;
> +               #gpio-cells = <2>;
> +
> +               interrupt-controller;
> +               #interrupt-cells = <2>;
> +               interrupt-parent = <&gic>;
> +               interrupts = <GIC_SPI 23 IRQ_TYPE_LEVEL_HIGH>;
> +       };
> +
> +       gpc11: gpc11-gpio-bank {
> +               gpio-controller;
> +               #gpio-cells = <2>;
> +
> +               interrupt-controller;
> +               #interrupt-cells = <2>;
> +               interrupt-parent = <&gic>;
> +               interrupts = <GIC_SPI 24 IRQ_TYPE_LEVEL_HIGH>;
> +       };
> +
> +       gpc12: gpc12-gpio-bank {
> +               gpio-controller;
> +               #gpio-cells = <2>;
> +
> +               interrupt-controller;
> +               #interrupt-cells = <2>;
> +               interrupt-parent = <&gic>;
> +               interrupts = <GIC_SPI 25 IRQ_TYPE_LEVEL_HIGH>;
> +       };
> +
> +       gpc13: gpc13-gpio-bank {
> +               gpio-controller;
> +               #gpio-cells = <2>;
> +
> +               interrupt-controller;
> +               #interrupt-cells = <2>;
> +               interrupt-parent = <&gic>;
> +               interrupts = <GIC_SPI 26 IRQ_TYPE_LEVEL_HIGH>;
> +       };
> +
> +       gpc14: gpc14-gpio-bank {
> +               gpio-controller;
> +               #gpio-cells = <2>;
> +
> +               interrupt-controller;
> +               #interrupt-cells = <2>;
> +               interrupt-parent = <&gic>;
> +               interrupts = <GIC_SPI 27 IRQ_TYPE_LEVEL_HIGH>;
> +       };
> +
> +       gpj0: gpj0-gpio-bank {
> +               gpio-controller;
> +               #gpio-cells = <2>;
> +
> +               interrupt-controller;
> +               #interrupt-cells = <2>;
> +               interrupt-parent = <&gic>;
> +               interrupts = <GIC_SPI 28 IRQ_TYPE_LEVEL_HIGH>;
> +       };
> +
> +       gpj1: gpj1-gpio-bank {
> +               gpio-controller;
> +               #gpio-cells = <2>;
> +
> +               interrupt-controller;
> +               #interrupt-cells = <2>;
> +               interrupt-parent = <&gic>;
> +               interrupts = <GIC_SPI 29 IRQ_TYPE_LEVEL_HIGH>;
> +       };
> +
> +       gpj2: gpj2-gpio-bank {
> +               gpio-controller;
> +               #gpio-cells = <2>;
> +
> +               interrupt-controller;
> +               #interrupt-cells = <2>;
> +               interrupt-parent = <&gic>;
> +               interrupts = <GIC_SPI 30 IRQ_TYPE_LEVEL_HIGH>;
> +       };
> +};
> +
> +&pinctrl_cmgp {
> +       gpm0: gpm0-gpio-bank {
> +               gpio-controller;
> +               #gpio-cells = <2>;
> +
> +               interrupt-controller;
> +               #interrupt-cells = <2>;
> +               interrupt-parent = <&gic>;
> +               interrupts = <GIC_SPI 114 IRQ_TYPE_LEVEL_HIGH>;
> +       };
> +
> +       gpm1: gpm1-gpio-bank {
> +               gpio-controller;
> +               #gpio-cells = <2>;
> +
> +               interrupt-controller;
> +               #interrupt-cells = <2>;
> +               interrupt-parent = <&gic>;
> +               interrupts = <GIC_SPI 115 IRQ_TYPE_LEVEL_HIGH>;
> +       };
> +
> +       gpm2: gpm2-gpio-bank {
> +               gpio-controller;
> +               #gpio-cells = <2>;
> +
> +               interrupt-controller;
> +               #interrupt-cells = <2>;
> +               interrupt-parent = <&gic>;
> +               interrupts = <GIC_SPI 116 IRQ_TYPE_LEVEL_HIGH>;
> +       };
> +
> +       gpm3: gpm3-gpio-bank {
> +               gpio-controller;
> +               #gpio-cells = <2>;
> +
> +               interrupt-controller;
> +               #interrupt-cells = <2>;
> +               interrupt-parent = <&gic>;
> +               interrupts = <GIC_SPI 117 IRQ_TYPE_LEVEL_HIGH>;
> +       };
> +
> +       gpm4: gpm4-gpio-bank {
> +               gpio-controller;
> +               #gpio-cells = <2>;
> +
> +               interrupt-controller;
> +               #interrupt-cells = <2>;
> +               interrupt-parent = <&gic>;
> +               interrupts = <GIC_SPI 118 IRQ_TYPE_LEVEL_HIGH>;
> +       };
> +
> +       gpm5: gpm5-gpio-bank {
> +               gpio-controller;
> +               #gpio-cells = <2>;
> +
> +               interrupt-controller;
> +               #interrupt-cells = <2>;
> +               interrupt-parent = <&gic>;
> +               interrupts = <GIC_SPI 119 IRQ_TYPE_LEVEL_HIGH>;
> +       };
> +
> +       gpm6: gpm6-gpio-bank {
> +               gpio-controller;
> +               #gpio-cells = <2>;
> +
> +               interrupt-controller;
> +               #interrupt-cells = <2>;
> +               interrupt-parent = <&gic>;
> +               interrupts = <GIC_SPI 120 IRQ_TYPE_LEVEL_HIGH>;
> +       };
> +
> +       gpm7: gpm7-gpio-bank {
> +               gpio-controller;
> +               #gpio-cells = <2>;
> +
> +               interrupt-controller;
> +               #interrupt-cells = <2>;
> +               interrupt-parent = <&gic>;
> +               interrupts = <GIC_SPI 121 IRQ_TYPE_LEVEL_HIGH>;
> +       };
> +
> +       gpm8: gpm8-gpio-bank {
> +               gpio-controller;
> +               #gpio-cells = <2>;
> +
> +               interrupt-controller;
> +               #interrupt-cells = <2>;
> +               interrupt-parent = <&gic>;
> +               interrupts = <GIC_SPI 122 IRQ_TYPE_LEVEL_HIGH>;
> +       };
> +
> +       gpm9: gpm9-gpio-bank {
> +               gpio-controller;
> +               #gpio-cells = <2>;
> +
> +               interrupt-controller;
> +               #interrupt-cells = <2>;
> +               interrupt-parent = <&gic>;
> +               interrupts = <GIC_SPI 123 IRQ_TYPE_LEVEL_HIGH>;
> +       };
> +
> +       gpm10: gpm10-gpio-bank {
> +               gpio-controller;
> +               #gpio-cells = <2>;
> +
> +               interrupt-controller;
> +               #interrupt-cells = <2>;
> +               interrupt-parent = <&gic>;
> +               interrupts = <GIC_SPI 124 IRQ_TYPE_LEVEL_HIGH>;
> +       };
> +
> +       gpm11: gpm11-gpio-bank {
> +               gpio-controller;
> +               #gpio-cells = <2>;
> +
> +               interrupt-controller;
> +               #interrupt-cells = <2>;
> +               interrupt-parent = <&gic>;
> +               interrupts = <GIC_SPI 125 IRQ_TYPE_LEVEL_HIGH>;
> +       };
> +
> +       gpm12: gpm12-gpio-bank {
> +               gpio-controller;
> +               #gpio-cells = <2>;
> +
> +               interrupt-controller;
> +               #interrupt-cells = <2>;
> +               interrupt-parent = <&gic>;
> +               interrupts = <GIC_SPI 126 IRQ_TYPE_LEVEL_HIGH>;
> +       };
> +
> +       gpm13: gpm13-gpio-bank {
> +               gpio-controller;
> +               #gpio-cells = <2>;
> +
> +               interrupt-controller;
> +               #interrupt-cells = <2>;
> +               interrupt-parent = <&gic>;
> +               interrupts = <GIC_SPI 127 IRQ_TYPE_LEVEL_HIGH>;
> +       };
> +
> +       gpm14: gpm14-gpio-bank {
> +               gpio-controller;
> +               #gpio-cells = <2>;
> +
> +               interrupt-controller;
> +               #interrupt-cells = <2>;
> +               interrupt-parent = <&gic>;
> +               interrupts = <GIC_SPI 128 IRQ_TYPE_LEVEL_HIGH>;
> +       };
> +
> +       gpm15: gpm15-gpio-bank {
> +               gpio-controller;
> +               #gpio-cells = <2>;
> +
> +               interrupt-controller;
> +               #interrupt-cells = <2>;
> +               interrupt-parent = <&gic>;
> +               interrupts = <GIC_SPI 129 IRQ_TYPE_LEVEL_HIGH>;
> +       };
> +
> +       gpm16: gpm16-gpio-bank {
> +               gpio-controller;
> +               #gpio-cells = <2>;
> +
> +               interrupt-controller;
> +               #interrupt-cells = <2>;
> +               interrupt-parent = <&gic>;
> +               interrupts = <GIC_SPI 130 IRQ_TYPE_LEVEL_HIGH>;
> +       };
> +
> +       gpm17: gpm17-gpio-bank {
> +               gpio-controller;
> +               #gpio-cells = <2>;
> +
> +               interrupt-controller;
> +               #interrupt-cells = <2>;
> +               interrupt-parent = <&gic>;
> +               interrupts = <GIC_SPI 131 IRQ_TYPE_LEVEL_HIGH>;
> +       };
> +
> +       gpm18: gpm18-gpio-bank {
> +               gpio-controller;
> +               #gpio-cells = <2>;
> +
> +               interrupt-controller;
> +               #interrupt-cells = <2>;
> +               interrupt-parent = <&gic>;
> +               interrupts = <GIC_SPI 132 IRQ_TYPE_LEVEL_HIGH>;
> +       };
> +
> +       gpm19: gpm19-gpio-bank {
> +               gpio-controller;
> +               #gpio-cells = <2>;
> +
> +               interrupt-controller;
> +               #interrupt-cells = <2>;
> +               interrupt-parent = <&gic>;
> +               interrupts = <GIC_SPI 133 IRQ_TYPE_LEVEL_HIGH>;
> +       };
> +
> +       gpm20: gpm20-gpio-bank {
> +               gpio-controller;
> +               #gpio-cells = <2>;
> +
> +               interrupt-controller;
> +               #interrupt-cells = <2>;
> +               interrupt-parent = <&gic>;
> +               interrupts = <GIC_SPI 134 IRQ_TYPE_LEVEL_HIGH>;
> +       };
> +
> +       gpm21: gpm21-gpio-bank {
> +               gpio-controller;
> +               #gpio-cells = <2>;
> +
> +               interrupt-controller;
> +               #interrupt-cells = <2>;
> +               interrupt-parent = <&gic>;
> +               interrupts = <GIC_SPI 135 IRQ_TYPE_LEVEL_HIGH>;
> +       };
> +};
> +
> +&pinctrl_hsi_ufs {
> +       gpf3: gpf3-gpio-bank{
> +               gpio-controller;
> +               #gpio-cells = <2>;
> +
> +               interrupt-controller;
> +               #interrupt-cells = <2>;
> +       };
> +};
> +
> +&pinctrl_peric {
> +       gpp0: gpp0-gpio-bank {
> +               gpio-controller;
> +               #gpio-cells = <2>;
> +
> +               interrupt-controller;
> +               #interrupt-cells = <2>;
> +       };
> +
> +       gpp1: gpp1-gpio-bank {
> +               gpio-controller;
> +               #gpio-cells = <2>;
> +
> +               interrupt-controller;
> +               #interrupt-cells = <2>;
> +       };
> +
> +       gpp2: gpp2-gpio-bank {
> +               gpio-controller;
> +               #gpio-cells = <2>;
> +
> +               interrupt-controller;
> +               #interrupt-cells = <2>;
> +       };
> +
> +       gpg0: gpg0-gpio-bank {
> +               gpio-controller;
> +               #gpio-cells = <2>;
> +
> +               interrupt-controller;
> +               #interrupt-cells = <2>;
> +       };
> +
> +       gpg1: gpg1-gpio-bank {
> +               gpio-controller;
> +               #gpio-cells = <2>;
> +
> +               interrupt-controller;
> +               #interrupt-cells = <2>;
> +       };
> +
> +       gpb0: gpb0-gpio-bank {
> +               gpio-controller;
> +               #gpio-cells = <2>;
> +
> +               interrupt-controller;
> +               #interrupt-cells = <2>;
> +       };
> +
> +       gpb1: gpb1-gpio-bank {
> +               gpio-controller;
> +               #gpio-cells = <2>;
> +
> +               interrupt-controller;
> +               #interrupt-cells = <2>;
> +       };
> +};
> +
> +&pinctrl_pericmmc {
> +       gpf2: gpf2-gpio-bank {
> +               gpio-controller;
> +               #gpio-cells = <2>;
> +
> +               interrupt-controller;
> +               #interrupt-cells = <2>;
> +       };
> +};
> +
> +&pinctrl_usi {
> +       gpp3: gpp3-gpio-bank {
> +               gpio-controller;
> +               #gpio-cells = <2>;
> +
> +               interrupt-controller;
> +               #interrupt-cells = <2>;
> +       };
> +
> +       gpp4: gpp4-gpio-bank {
> +               gpio-controller;
> +               #gpio-cells = <2>;
> +
> +               interrupt-controller;
> +               #interrupt-cells = <2>;
> +       };
> +
> +       gpg2: gpg2-gpio-bank {
> +               gpio-controller;
> +               #gpio-cells = <2>;
> +
> +               interrupt-controller;
> +               #interrupt-cells = <2>;
> +       };
> +
> +       gpg3: gpg3-gpio-bank {
> +               gpio-controller;
> +               #gpio-cells = <2>;
> +
> +               interrupt-controller;
> +               #interrupt-cells = <2>;
> +       };
> +};
> diff --git a/arch/arm64/boot/dts/exynos/exynos8855-smdk.dts b/arch/arm64/boot/dts/exynos/exynos8855-smdk.dts
> new file mode 100644
> index 000000000000..792d52affc61
> --- /dev/null
> +++ b/arch/arm64/boot/dts/exynos/exynos8855-smdk.dts
> @@ -0,0 +1,32 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Samsung Exynos8855 SMDK board device tree source
> + *
> + * Copyright (C) 2023 Samsung Electronics Co., Ltd.
> + *
> + * Device tree source file for Samsung SMDK board which is based on
> + * Exynos8855 SoC.
> + */
> +
> +/dts-v1/;
> +
> +#include "exynos8855.dtsi"
> +
> +/ {
> +       model = "Samsung Exynos8855 SMDK board";
> +       compatible = "samsung,exynos8855-smdk","samsung,exynos8855";
> +
> +       chosen {
> +       };
> +
> +       memory@80000000 {
> +               device_type = "memory";
> +               reg = <0x0 0x80000000 0x80000000>;
> +       };
> +
> +};
> +
> +&oscclk {
> +       clock-frequency = <76800000>;
> +};
> +
> diff --git a/arch/arm64/boot/dts/exynos/exynos8855.dtsi b/arch/arm64/boot/dts/exynos/exynos8855.dtsi
> new file mode 100644
> index 000000000000..9d82fceb5130
> --- /dev/null
> +++ b/arch/arm64/boot/dts/exynos/exynos8855.dtsi
> @@ -0,0 +1,204 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Samsung Exynos8855 SoC device tree source
> + *
> + * Copyright (C) 2023 Samsung Electronics Co., Ltd.
> + *
> + * Samsung Exynos8855 SoC device nodes are listed in this file.
> + * Exynos8855 based board files can include this file and provide
> + * values for board specific bindings.
> + */
> +
> +#include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +/ {
> +       compatible = "samsung,exynos8855";
> +       #address-cells = <2>;
> +       #size-cells = <1>;
> +
> +       interrupt-parent = <&gic>;
> +
> +       aliases {
> +               pinctrl0 = &pinctrl_alive;
> +               pinctrl1 = &pinctrl_cmgp;
> +               pinctrl2 = &pinctrl_hsi_ufs;
> +               pinctrl3 = &pinctrl_peric;
> +               pinctrl4 = &pinctrl_pericmmc;
> +               pinctrl5 = &pinctrl_usi;
> +       };
> +
> +       oscclk: clock-oscclk {
> +               compatible = "fixed-clock";
> +               clock-output-names = "oscclk";
> +               #clock-cells = <0>;
> +       };
> +
> +       cpus {
> +               #address-cells = <1>;
> +               #size-cells = <0>;
> +
> +               cpu-map {
> +                       cluster0 {
> +                               core0 {
> +                                       cpu = <&cpu0>;
> +                               };
> +                               core1 {
> +                                       cpu = <&cpu1>;
> +                               };
> +                               core2 {
> +                                       cpu = <&cpu2>;
> +                               };
> +                               core3 {
> +                                       cpu = <&cpu3>;
> +                               };
> +                       };
> +
> +                       cluster1 {
> +                               core0 {
> +                                       cpu = <&cpu4>;
> +                               };
> +                               core1 {
> +                                       cpu = <&cpu5>;
> +                               };
> +                               core2 {
> +                                       cpu = <&cpu6>;
> +                               };
> +                       };
> +
> +                       cluster2 {
> +                               core0 {
> +                                       cpu = <&cpu7>;
> +                               };
> +                       };
> +               };
> +
> +               cpu0: cpu@0 {
> +                       device_type = "cpu";
> +                       compatible = "arm,cortex-a520";
> +                       reg = <0x0>;
> +                       enable-method = "psci";
> +               };
> +
> +               cpu1: cpu@100 {
> +                       device_type = "cpu";
> +                       compatible = "arm,cortex-a520";
> +                       reg = <0x100>;
> +                       enable-method = "psci";
> +               };
> +
> +               cpu2: cpu@200 {
> +                       device_type = "cpu";
> +                       compatible = "arm,cortex-a520";
> +                       reg = <0x200>;
> +                       enable-method = "psci";
> +               };
> +
> +               cpu3: cpu@300 {
> +                       device_type = "cpu";
> +                       compatible = "arm,cortex-a520";
> +                       reg = <0x300>;
> +                       enable-method = "psci";
> +               };
> +
> +               cpu4: cpu@400 {
> +                       device_type = "cpu";
> +                       compatible = "arm,cortex-a720";
> +                       reg = <0x400>;
> +                       enable-method = "psci";
> +               };
> +
> +               cpu5: cpu@500 {
> +                       device_type = "cpu";
> +                       compatible = "arm,cortex-a720";
> +                       reg = <0x500>;
> +                       enable-method = "psci";
> +               };
> +
> +               cpu6: cpu@600 {
> +                       device_type = "cpu";
> +                       compatible = "arm,cortex-a720";
> +                       reg = <0x600>;
> +                       enable-method = "psci";
> +               };
> +
> +               cpu7: cpu@700 {
> +                       device_type = "cpu";
> +                       compatible = "arm,cortex-a720";
> +                       reg = <0x700>;
> +                       enable-method = "psci";
> +               };
> +       };
> +
> +       psci {
> +               compatible = "arm,psci-1.0";
> +               method = "smc";
> +       };
> +
> +       soc: soc@0 {
> +               compatible = "simple-bus";
> +               #address-cells = <1>;
> +               #size-cells = <1>;
> +               ranges = <0x0 0x0 0x0 0x20000000>;
> +
> +               gic: interrupt-controller@10200000 {
> +                       compatible = "arm,gic-v3";
> +                       #interrupt-cells = <3>;
> +                       interrupt-controller;
> +                       reg = <0x10200000 0x10000>,
> +                             <0x10240000 0x140000>;
> +                       interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH>;
> +               };
> +
> +               pinctrl_alive: pinctrl@11850000 {
> +                       compatible = "samsung,exynos8855-pinctrl";
> +                       reg = <0x11850000 0x1000>;
> +
> +                       wakeup-interrupt-controller {
> +                               compatible = "samsung,exynos8855-wakeup-eint",
> +                                            "samsung,exynos7-wakeup-eint";
> +                       };
> +               };
> +
> +               pinctrl_cmgp: pinctrl@12030000 {
> +                       compatible = "samsung,exynos8855-pinctrl";
> +                       reg = <0x12030000 0x1000>;
> +                       interrupts = <GIC_SPI 114 IRQ_TYPE_LEVEL_HIGH>;
> +               };
> +
> +               pinctrl_usi: pinctrl@15030000 {
> +                       compatible = "samsung,exynos8855-pinctrl";
> +                       reg = <0x15030000 0x1000>;
> +                       interrupts = <GIC_SPI 440 IRQ_TYPE_LEVEL_HIGH>;
> +               };
> +
> +               pinctrl_peric: pinctrl@15440000 {
> +                       compatible = "samsung,exynos8855-pinctrl";
> +                       reg = <0x15440000 0x1000>;
> +                       interrupts = <GIC_SPI 394 IRQ_TYPE_LEVEL_HIGH>;
> +               };
> +
> +               pinctrl_pericmmc: pinctrl@154f0000 {
> +                       compatible = "samsung,exynos8855-pinctrl";
> +                       reg = <0x154f0000 0x1000>;
> +                       interrupts = <GIC_SPI 395 IRQ_TYPE_LEVEL_HIGH>;
> +               };
> +
> +               pinctrl_hsi_ufs: pinctrl@17040000 {
> +                       compatible = "samsung,exynos8855-pinctrl";
> +                       reg = <0x17040000 0x1000>;
> +                       interrupts = <GIC_SPI 318 IRQ_TYPE_LEVEL_HIGH>;
> +               };
> +       };
> +
> +       timer {
> +               compatible = "arm,armv8-timer";
> +               /* Hypervisor Virtual Timer interrupt is not wired to GIC */
> +               interrupts =
> +                    <GIC_PPI 13 IRQ_TYPE_LEVEL_LOW>,
> +                    <GIC_PPI 14 IRQ_TYPE_LEVEL_LOW>,
> +                    <GIC_PPI 11 IRQ_TYPE_LEVEL_LOW>,
> +                    <GIC_PPI 10 IRQ_TYPE_LEVEL_LOW>;
> +       };
> +};
> +
> +#include "exynos8855-pinctrl.dtsi"
> --
> 2.34.1
>

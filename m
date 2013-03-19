From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: Re: [PATCH v8 4/4] ARM: dts: Add FIMD DT binding Documentation
Date: Tue, 19 Mar 2013 13:31:16 +0530
Message-ID: <CAK9yfHwzeMcHOTRWg_HF+aagPdqyeHADNPDJj4Dj0QnH8Fmjig@mail.gmail.com>
References: <1363676892-21296-1-git-send-email-vikas.sajjan@linaro.org>
	<1363676892-21296-5-git-send-email-vikas.sajjan@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ob0-f177.google.com ([209.85.214.177]:47415 "EHLO
	mail-ob0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933162Ab3CSIBR (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 19 Mar 2013 04:01:17 -0400
Received: by mail-ob0-f177.google.com with SMTP id eh20so151230obb.36
        for <linux-samsung-soc@vger.kernel.org>; Tue, 19 Mar 2013 01:01:17 -0700 (PDT)
In-Reply-To: <1363676892-21296-5-git-send-email-vikas.sajjan@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Vikas Sajjan <vikas.sajjan@linaro.org>
Cc: linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, sylvester.nawrocki@gmail.com, devicetree-discuss@lists.ozlabs.org, inki.dae@samsung.com, linaro-kernel@lists.linaro.org, joshi@samsung.com

Hi Vikas,

> +Example:
> +
> +SoC specific DT Entry:
> +
> +       fimd@11c00000 {
> +               compatible = "samsung,exynos4210-fimd";
> +               interrupt-parent = <&combiner>;
> +               reg = <0x11c00000 0x20000>;
> +               interrupt-names = "fifo", "vsync", "lcd_sys";
> +               interrupts = <11 0>, <11 1>, <11 2>;
> +               clocks = <&clock 140>, <&clock 283>;
> +               clock-names = "sclk_fimd", "fimd";

Now that you have added clock properties, you need to make a mention
about them too in the description above.

-- 
With warm regards,
Sachin

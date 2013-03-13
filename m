From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: Re: [PATCH v7 1/5] ARM: dts: Add FIMD node to exynos4
Date: Wed, 13 Mar 2013 16:02:05 +0530
Message-ID: <CAK9yfHzv-_9Xeg=WyYGwEkwRXAJvmyrowVBapXaMkj1=9YyAAw@mail.gmail.com>
References: <1363169371-310-1-git-send-email-vikas.sajjan@linaro.org>
	<1363169371-310-2-git-send-email-vikas.sajjan@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-oa0-f44.google.com ([209.85.219.44]:55970 "EHLO
	mail-oa0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932329Ab3CMKcG (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 13 Mar 2013 06:32:06 -0400
Received: by mail-oa0-f44.google.com with SMTP id h1so903918oag.3
        for <linux-samsung-soc@vger.kernel.org>; Wed, 13 Mar 2013 03:32:05 -0700 (PDT)
In-Reply-To: <1363169371-310-2-git-send-email-vikas.sajjan@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Vikas Sajjan <vikas.sajjan@linaro.org>
Cc: linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, sylvester.nawrocki@gmail.com, devicetree-discuss@lists.ozlabs.org, inki.dae@samsung.com, linaro-kernel@lists.linaro.org

> +
> +       fimd: fimd@11c00000 {
> +               compatible = "samsung,exynos4210-fimd";
> +               interrupt-parent = <&combiner>;
> +               reg = <0x11c00000 0x20000>;
> +               interrupt-names = "fifo", "vsync", "lcd_sys";
> +               interrupts = <11 0>, <11 1>, <11 2>;

How about adding status = "disabled"; above.
Sorry for not pointing it out earlier.

-- 
With warm regards,
Sachin

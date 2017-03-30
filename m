From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v9 12/12] ARM: EXYNOS: refactor of mach-exynos to use
 chipid information
Date: Thu, 30 Mar 2017 16:01:42 +0200
Message-ID: <CAK8P3a2oK1MvWe4B-4r2Rt7Q87juNJd3MsetN8-OeDYhBmKyUg@mail.gmail.com>
References: <CGME20170330131444epcas5p45051cf7e6ec7a993c2c9f84254b89a19@epcas5p4.samsung.com>
 <1490879826-16754-1-git-send-email-pankaj.dubey@samsung.com> <1490879826-16754-13-git-send-email-pankaj.dubey@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-oi0-f66.google.com ([209.85.218.66]:34178 "EHLO
        mail-oi0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754256AbdC3OBo (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 30 Mar 2017 10:01:44 -0400
Received: by mail-oi0-f66.google.com with SMTP id t11so4728372oib.1
        for <linux-samsung-soc@vger.kernel.org>; Thu, 30 Mar 2017 07:01:43 -0700 (PDT)
In-Reply-To: <1490879826-16754-13-git-send-email-pankaj.dubey@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Pankaj Dubey <pankaj.dubey@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, Linux ARM <linux-arm-kernel@lists.infradead.org>, Krzysztof Kozlowski <krzk@kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>, Kukjin Kim <kgene@kernel.org>, m.reichl@fivetechno.de, a.hajda@samsung.com, cwchoi00@gmail.com, Javier Martinez Canillas <javier@osg.samsung.com>

On Thu, Mar 30, 2017 at 3:17 PM, Pankaj Dubey <pankaj.dubey@samsung.com> wrote:

>   * register the standard cpu IO areas
>   */
> -static void __init exynos_map_io(void)
> +static int __init exynos_fdt_map_scu(unsigned long node, const char *uname,
> +               int depth, void *data)
>  {
> -       if (soc_is_exynos4())
> -               iotable_init(exynos4_iodesc, ARRAY_SIZE(exynos4_iodesc));
> +       if (!of_flat_dt_is_compatible(node, "samsung,exynos4210") &&
> +                       !of_flat_dt_is_compatible(node, "samsung,exynos4212") &&
> +                       !of_flat_dt_is_compatible(node, "samsung,exynos4412"))
> +               return 0;
> +
> +       iotable_init(exynos4_iodesc, ARRAY_SIZE(exynos4_iodesc));
> +       return 1;
>  }

This seems really overcomplicated. From what I can tell, this is only needed
to find the SCU address, but there are better ways to do that, either by
looking up the SCU in the DT at the time you actually need it,
or by calling scu_a9_get_base().

      Arnd

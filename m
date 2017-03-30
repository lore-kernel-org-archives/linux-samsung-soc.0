From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v9 04/12] soc: samsung: add exynos chipid driver support
Date: Thu, 30 Mar 2017 15:50:24 +0200
Message-ID: <CAK8P3a0dq-Ve2N3yFbpZ7LHzZJ=w6-pLRTSZJZ2=rnk2gWphJw@mail.gmail.com>
References: <CGME20170330131427epcas5p4c3d238022dc75694ad3baa8a1018ea04@epcas5p4.samsung.com>
 <1490879826-16754-1-git-send-email-pankaj.dubey@samsung.com> <1490879826-16754-5-git-send-email-pankaj.dubey@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-oi0-f65.google.com ([209.85.218.65]:33929 "EHLO
        mail-oi0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933934AbdC3NuZ (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 30 Mar 2017 09:50:25 -0400
Received: by mail-oi0-f65.google.com with SMTP id t11so4680432oib.1
        for <linux-samsung-soc@vger.kernel.org>; Thu, 30 Mar 2017 06:50:24 -0700 (PDT)
In-Reply-To: <1490879826-16754-5-git-send-email-pankaj.dubey@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Pankaj Dubey <pankaj.dubey@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, Linux ARM <linux-arm-kernel@lists.infradead.org>, Krzysztof Kozlowski <krzk@kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>, Kukjin Kim <kgene@kernel.org>, m.reichl@fivetechno.de, a.hajda@samsung.com, cwchoi00@gmail.com, Javier Martinez Canillas <javier@osg.samsung.com>, Grant Likely <grant.likely@linaro.org>, Rob Herring <robh+dt@kernel.org>, Linus Walleij <linus.walleij@linaro.org>

On Thu, Mar 30, 2017 at 3:16 PM, Pankaj Dubey <pankaj.dubey@samsung.com> wrote:
>
> +config EXYNOS_CHIPID
> +       bool "Exynos Chipid controller driver" if COMPILE_TEST
> +       depends on ARCH_EXYNOS || COMPILE_TEST
> +       select SOC_BUS

This lets you disable the driver when COMPILE_TEST is set on exynos,
which is probably not what you wanted.

I'd do

         bool "Exynos Chipid controller driver" if COMPILE_TEST && !ARCHEXYNOS
         default ARCH_EXYNOS

     Arnd

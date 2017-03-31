From: "pankaj.dubey" <pankaj.dubey@samsung.com>
Subject: Re: [PATCH v9 04/12] soc: samsung: add exynos chipid driver support
Date: Fri, 31 Mar 2017 11:06:14 +0530
Message-ID: <a1be4b9c-0f68-dbe3-7799-d5acf4ec31e0@samsung.com>
References: <CGME20170330131427epcas5p4c3d238022dc75694ad3baa8a1018ea04@epcas5p4.samsung.com>
        <1490879826-16754-1-git-send-email-pankaj.dubey@samsung.com>
        <1490879826-16754-5-git-send-email-pankaj.dubey@samsung.com>
        <CAK8P3a0dq-Ve2N3yFbpZ7LHzZJ=w6-pLRTSZJZ2=rnk2gWphJw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:19380 "EHLO
        epoutp01.samsung.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1751422AbdCaFdT (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 31 Mar 2017 01:33:19 -0400
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
        by epoutp01.samsung.com (KnoxPortal) with ESMTP id 20170331053316epoutp01c4ec6aae6a117e7ce3ea40ba25cb82d7~w4JKC5Fwb2128521285epoutp010
        for <linux-samsung-soc@vger.kernel.org>; Fri, 31 Mar 2017 05:33:16 +0000 (GMT)
In-Reply-To: <CAK8P3a0dq-Ve2N3yFbpZ7LHzZJ=w6-pLRTSZJZ2=rnk2gWphJw@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-samsung-soc@vger.kernel.org, Linux ARM <linux-arm-kernel@lists.infradead.org>, Krzysztof Kozlowski <krzk@kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>, Kukjin Kim <kgene@kernel.org>, m.reichl@fivetechno.de, a.hajda@samsung.com, cwchoi00@gmail.com, Javier Martinez Canillas <javier@osg.samsung.com>, Grant Likely <grant.likely@linaro.org>, Rob Herring <robh+dt@kernel.org>, Linus Walleij <linus.walleij@linaro.org>

Hi Arnd,

On Thursday 30 March 2017 07:20 PM, Arnd Bergmann wrote:
> On Thu, Mar 30, 2017 at 3:16 PM, Pankaj Dubey <pankaj.dubey@samsung.com> wrote:
>>
>> +config EXYNOS_CHIPID
>> +       bool "Exynos Chipid controller driver" if COMPILE_TEST
>> +       depends on ARCH_EXYNOS || COMPILE_TEST
>> +       select SOC_BUS
> 
> This lets you disable the driver when COMPILE_TEST is set on exynos,
> which is probably not what you wanted.
> 

Sorry I could not get this point. EXYNOS_CHIPID is invisible menu
option, when I enabled COMPILE_TEST, option is visible in make
menuconfig but it does not allow to disable this driver. I have adopted
this config same as EXYNOS_PMU in the same file.

> I'd do
> 
>          bool "Exynos Chipid controller driver" if COMPILE_TEST && !ARCHEXYNOS
>          default ARCH_EXYNOS

I can adopt, default ARCH_EXYNOS, which will allow me to drop patch 5/12
and 6/12.

Thanks for review.
Pankaj Dubey

> 
>      Arnd
> 
> 
> 

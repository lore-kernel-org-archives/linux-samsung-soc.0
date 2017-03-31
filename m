From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v9 04/12] soc: samsung: add exynos chipid driver support
Date: Fri, 31 Mar 2017 10:09:10 +0200
Message-ID: <CAK8P3a0orusAVqHSiBUmcmEUrc625H9MtxkXNwrWQOHgO=7v9Q@mail.gmail.com>
References: <CGME20170330131427epcas5p4c3d238022dc75694ad3baa8a1018ea04@epcas5p4.samsung.com>
 <1490879826-16754-1-git-send-email-pankaj.dubey@samsung.com>
 <1490879826-16754-5-git-send-email-pankaj.dubey@samsung.com>
 <CAK8P3a0dq-Ve2N3yFbpZ7LHzZJ=w6-pLRTSZJZ2=rnk2gWphJw@mail.gmail.com> <a1be4b9c-0f68-dbe3-7799-d5acf4ec31e0@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-oi0-f68.google.com ([209.85.218.68]:33582 "EHLO
        mail-oi0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932274AbdCaIJM (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 31 Mar 2017 04:09:12 -0400
Received: by mail-oi0-f68.google.com with SMTP id f193so8058056oib.0
        for <linux-samsung-soc@vger.kernel.org>; Fri, 31 Mar 2017 01:09:11 -0700 (PDT)
In-Reply-To: <a1be4b9c-0f68-dbe3-7799-d5acf4ec31e0@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: "pankaj.dubey" <pankaj.dubey@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, Linux ARM <linux-arm-kernel@lists.infradead.org>, Krzysztof Kozlowski <krzk@kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>, Kukjin Kim <kgene@kernel.org>, m.reichl@fivetechno.de, a.hajda@samsung.com, cwchoi00@gmail.com, Javier Martinez Canillas <javier@osg.samsung.com>, Grant Likely <grant.likely@linaro.org>, Rob Herring <robh+dt@kernel.org>, Linus Walleij <linus.walleij@linaro.org>

On Fri, Mar 31, 2017 at 7:36 AM, pankaj.dubey <pankaj.dubey@samsung.com> wrote:
> Hi Arnd,
>
> On Thursday 30 March 2017 07:20 PM, Arnd Bergmann wrote:
>> On Thu, Mar 30, 2017 at 3:16 PM, Pankaj Dubey <pankaj.dubey@samsung.com> wrote:
>>>
>>> +config EXYNOS_CHIPID
>>> +       bool "Exynos Chipid controller driver" if COMPILE_TEST
>>> +       depends on ARCH_EXYNOS || COMPILE_TEST
>>> +       select SOC_BUS
>>
>> This lets you disable the driver when COMPILE_TEST is set on exynos,
>> which is probably not what you wanted.
>>
>
> Sorry I could not get this point. EXYNOS_CHIPID is invisible menu
> option, when I enabled COMPILE_TEST, option is visible in make
> menuconfig but it does not allow to disable this driver. I have adopted
> this config same as EXYNOS_PMU in the same file.

I wrote my comment before I saw the 'select' statement in the later
patch. With that select, it is not a problem.

>>          bool "Exynos Chipid controller driver" if COMPILE_TEST && !ARCHEXYNOS
>>          default ARCH_EXYNOS
>
> I can adopt, default ARCH_EXYNOS, which will allow me to drop patch 5/12
> and 6/12.

Either way (select or default) is fine, just do the same thing for both chipid
and pmu. If you keep the 'select' and the 'if COMPILE_TEST', you can
drop the line 'depends on ARCH_EXYNOS || COMPILE_TEST'.

      Arnd

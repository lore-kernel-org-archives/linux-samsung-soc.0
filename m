From: "pankaj.dubey" <pankaj.dubey@samsung.com>
Subject: Re: [PATCH v9 04/12] soc: samsung: add exynos chipid driver support
Date: Mon, 3 Apr 2017 14:51:33 +0530
Message-ID: <c8322e0b-7ecd-f034-85bb-5c06062e3011@samsung.com>
References: <CGME20170330131427epcas5p4c3d238022dc75694ad3baa8a1018ea04@epcas5p4.samsung.com>
        <1490879826-16754-1-git-send-email-pankaj.dubey@samsung.com>
        <1490879826-16754-5-git-send-email-pankaj.dubey@samsung.com>
        <CAK8P3a0dq-Ve2N3yFbpZ7LHzZJ=w6-pLRTSZJZ2=rnk2gWphJw@mail.gmail.com>
        <a1be4b9c-0f68-dbe3-7799-d5acf4ec31e0@samsung.com>
        <CAK8P3a0orusAVqHSiBUmcmEUrc625H9MtxkXNwrWQOHgO=7v9Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:61023 "EHLO
        epoutp01.samsung.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1751952AbdDCJSV (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 3 Apr 2017 05:18:21 -0400
Received: from epcas5p3.samsung.com (unknown [182.195.41.41])
        by epoutp01.samsung.com (KnoxPortal) with ESMTP id 20170403091819epoutp011b59ba8eeb1951cecc91c5e5104b1252~x2JgUp-vr3046130461epoutp01X
        for <linux-samsung-soc@vger.kernel.org>; Mon,  3 Apr 2017 09:18:19 +0000 (GMT)
In-Reply-To: <CAK8P3a0orusAVqHSiBUmcmEUrc625H9MtxkXNwrWQOHgO=7v9Q@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-samsung-soc@vger.kernel.org, Linux ARM <linux-arm-kernel@lists.infradead.org>, Krzysztof Kozlowski <krzk@kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>, Kukjin Kim <kgene@kernel.org>, m.reichl@fivetechno.de, a.hajda@samsung.com, cwchoi00@gmail.com, Javier Martinez Canillas <javier@osg.samsung.com>, Grant Likely <grant.likely@linaro.org>, Rob Herring <robh+dt@kernel.org>, Linus Walleij <linus.walleij@linaro.org>



On Friday 31 March 2017 01:39 PM, Arnd Bergmann wrote:
> On Fri, Mar 31, 2017 at 7:36 AM, pankaj.dubey <pankaj.dubey@samsung.com> wrote:
>> Hi Arnd,
>>
>> On Thursday 30 March 2017 07:20 PM, Arnd Bergmann wrote:
>>> On Thu, Mar 30, 2017 at 3:16 PM, Pankaj Dubey <pankaj.dubey@samsung.com> wrote:
>>>>
>>>> +config EXYNOS_CHIPID
>>>> +       bool "Exynos Chipid controller driver" if COMPILE_TEST
>>>> +       depends on ARCH_EXYNOS || COMPILE_TEST
>>>> +       select SOC_BUS
>>>
>>> This lets you disable the driver when COMPILE_TEST is set on exynos,
>>> which is probably not what you wanted.
>>>
>>
>> Sorry I could not get this point. EXYNOS_CHIPID is invisible menu
>> option, when I enabled COMPILE_TEST, option is visible in make
>> menuconfig but it does not allow to disable this driver. I have adopted
>> this config same as EXYNOS_PMU in the same file.
> 
> I wrote my comment before I saw the 'select' statement in the later
> patch. With that select, it is not a problem.
> 
>>>          bool "Exynos Chipid controller driver" if COMPILE_TEST && !ARCHEXYNOS
>>>          default ARCH_EXYNOS
>>
>> I can adopt, default ARCH_EXYNOS, which will allow me to drop patch 5/12
>> and 6/12.
> 
> Either way (select or default) is fine, just do the same thing for both chipid
> and pmu. If you keep the 'select' and the 'if COMPILE_TEST', you can
> drop the line 'depends on ARCH_EXYNOS || COMPILE_TEST'.
> 

OK, I understood your point. Thanks.

Pankaj Dubey

>       Arnd
> 
> 
> 

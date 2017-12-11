From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Re: next/master boot: 270 boots: 35 failed, 213 passed with 20
 offline, 2 untried/unknown (next-20171207)
Date: Mon, 11 Dec 2017 10:28:54 +0100
Message-ID: <11a4d79d-73a5-5e98-c83f-f5e47bcfcdf2@samsung.com>
References: <5a29d4c7.4fabdf0a.716d7.8485@mx.google.com>
        <20171208122007.GB7606@sirena.org.uk> <20171208122703.GC7606@sirena.org.uk>
        <CGME20171208123350epcas3p2da09a6b41fb4ee626860fe5ac698e265@epcas3p2.samsung.com>
        <CAJKOXPcfgXTzacEYyPFV=UJYdKz9v86pEjbjaWJ_7BYhdNafqA@mail.gmail.com>
        <7ad6d330-d277-85ae-b891-cb76367461ce@samsung.com>
        <20171208165943.GC4283@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:33361 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752259AbdLKJ3A (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 11 Dec 2017 04:29:00 -0500
In-reply-to: <20171208165943.GC4283@codeaurora.org>
Content-language: en-US
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Mark Brown <broonie@kernel.org>, Kukjin Kim <kgene@kernel.org>, Guenter Roeck <groeck@google.com>, Ulf Hansson <ulf.hansson@linaro.org>, Michael Turquette <mturquette@baylibre.com>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, "kernelci.org bot" <bot@kernelci.org>, kernel-build-reports@lists.linaro.org

Hi Stephen,

On 2017-12-08 17:59, Stephen Boyd wrote:
> On 12/08, Marek Szyprowski wrote:
>> On 2017-12-08 13:33, Krzysztof Kozlowski wrote:
>>> On Fri, Dec 8, 2017 at 1:27 PM, Mark Brown <broonie@kernel.org> wrote:
>>>> On Fri, Dec 08, 2017 at 12:20:07PM +0000, Mark Brown wrote:
>>>>> On Thu, Dec 07, 2017 at 03:54:47PM -0800, kernelci.org bot wrote:
>>>>>
>>>>> Today's -next failed to boot on peach-pi:
>>>>>
>>>>>>      exynos_defconfig:
>>>>>>          exynos5800-peach-pi:
>>>>>>              lab-collabora: new failure (last pass: next-20171205)
>>>>> with details at https://kernelci.org/boot/id/5a2a2e7859b5141bc2afa17c/
>>>>> (including logs and comparisons with other boots, the last good boot was
>>>>> Wednesday).  It looks like it hangs somewhere late on in boot, the last
>>>>> output on the console is:
>>>>>
>>>>> [    4.827139] smsc95xx 3-1.1:1.0 eth0: register 'smsc95xx' at usb-xhci-hcd.3.auto-1.1, smsc95xx USB 2.0 Ethernet, 94:eb:2c:00:03:c0
>>>>> [    5.781037] dma-pl330 3880000.adma: Loaded driver for PL330 DMAC-241330
>>>>> [    5.786247] dma-pl330 3880000.adma:        DBUFF-4x8bytes Num_Chans-6 Num_Peri-16 Num_Events-6
>>>>> [    5.819200] dma-pl330 3880000.adma: PM domain MAU will not be powered off
>>>>> [   64.529228] random: crng init done
>>>>>
>>>>> and there's failures earlier to instantiate the display.
>>>> I just noticed that further up the log there's a lockdep splat with a
>>>> conflict between the genpd and clock API locking - an ABBA issue with
>>>> genpd->mlock and the clock API prepare_lock.
>>> +Cc Marek Szyprowski,
>>>
>>> The lockdep issue and display failures (including regulator warning)
>>> were present for some time. They also appear in boot log for
>>> next-20171206 (https://storage.kernelci.org/next/master/next-20171206/arm/exynos_defconfig/lab-collabora/boot-exynos5800-peach-pi.html).
>>> The difference is that 20171208 hangs on "random: crng init done"
>>> which did not appear before at all.
> I haven't looked at the lockdep splat yet, but is that happening
> because of runtime PM usage by the clk framework?

This is a false positive. The deplock doesn't distinguish each domain 
instance.
Only some instances of exynos power domains use clocks (as an old 
workaround of
the lack possibility to integrate proper clock rate/topology restoration 
after
power off/on cycle in the clock provider driver).

Those clock controllers, which implements runtime pm, are assigned to power
domain, which doesn't touch clocks at all.

I still have no idea how to fix the code to make deplock happy.

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

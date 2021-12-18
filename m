Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82B0CC433FE
	for <linux-samsung-soc@archiver.kernel.org>; Sat, 18 Dec 2021 10:37:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231625AbhLRKhv (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sat, 18 Dec 2021 05:37:51 -0500
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:56784
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230044AbhLRKhu (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sat, 18 Dec 2021 05:37:50 -0500
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com [209.85.167.72])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 037F33FFD3
        for <linux-samsung-soc@vger.kernel.org>; Sat, 18 Dec 2021 10:37:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1639823868;
        bh=LDSDrmQFQEPs0AYtnIdv1IgjreVq4x1VFmfenDdMBLE=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=IkAA1d1H5ke08ERa0RKwPDAUBIhwCP0swVSOeGeWBrBshVKgO+G06aawl3g3h9geG
         CJEBwn5eHceQSfLfhdbYhTd27hzYlbNNnCjaAlygU4n3TRRBKgo7YYRYElSwa9TlJm
         ezezcWv+4Ni/4dW0cAsRKqlup9AIiNfeEiTqt8rvbPGjK1Uqhid3tOeqCEgIKZQjeK
         vbkKvIQz1dhhQQvqk2IMyRXosuUKqPfas1DyO3Xs8yQt1k02ISDEfPzGEfQSk5vM93
         p7Gn/0MOs9loKV3P1j1gGJHJDD0EfQMd4eBMBUaA+x49hyzWSt7OCul4qsjyX5P3RW
         Z3jXolp0Q94Rw==
Received: by mail-lf1-f72.google.com with SMTP id k17-20020a05651239d100b0041c32e98751so2145305lfu.10
        for <linux-samsung-soc@vger.kernel.org>; Sat, 18 Dec 2021 02:37:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=LDSDrmQFQEPs0AYtnIdv1IgjreVq4x1VFmfenDdMBLE=;
        b=sUjpGlsodny5OqX+mPkfqBZc8wEJPnzCYdjrMANB4CU3GPaVhch647H9xeZNxB5h2R
         WOnw/5pi1Jfsu/pYZrxxdJgxtQZ1DCpq7vD3ntkFQpNRNNANLUF/F6UGbiZNAS32WoGG
         f2bjq0YMaiCAwln9w7LRmVa6nWR5ey/cUsXE+cwznB1qBYAdR8BvE3jDTVxuBRwVJ1Hv
         +sm25EM4KJVOOygqgb571hpCVAZJWDAxlnzeRReqleOcSucYpFtTNd0GAowkGHZq1Ofu
         No1oIT4UseSRsIdfde8gv+tjjy1UScW9C19U0CZeagU9Miy/3pxzj2WbLTM/K1Cai6ZL
         5KLA==
X-Gm-Message-State: AOAM532yNPd1POqzVjoVuGN+GrO3aBX7wZ9uVh5gkQ1rfCYWPdZwJMfv
        jjig58ZCmFQ/KyioE7rzUIWEAafDwl60gGJyvC5WRJwDlgbQFCkuW7CIVxgEvKdNkckk6mY5MFq
        6VBPsK8++8+gLZ8UYg6Q0XSZBopulYogiKJjeWxiBmXx4wwek
X-Received: by 2002:ac2:57db:: with SMTP id k27mr6746125lfo.652.1639823867318;
        Sat, 18 Dec 2021 02:37:47 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxFPjW4FhzC6siK+EU1JldkI45ctb06HwBavX8cSF/Dm+d0Cp+CPDqvzJoTiq7Mk6+JWyBNUA==
X-Received: by 2002:ac2:57db:: with SMTP id k27mr6746110lfo.652.1639823867154;
        Sat, 18 Dec 2021 02:37:47 -0800 (PST)
Received: from [192.168.3.67] (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
        by smtp.gmail.com with ESMTPSA id b17sm1054lfq.238.2021.12.18.02.37.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 18 Dec 2021 02:37:46 -0800 (PST)
Message-ID: <cd97d5f8-42ff-98a4-2dfe-7d8076cf5e53@canonical.com>
Date:   Sat, 18 Dec 2021 11:37:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [PATCH 6/7] arm64: dts: exynos: Add initial Exynos850 SoC support
Content-Language: en-US
To:     Alim Akhtar <alim.akhtar@gmail.com>,
        Sam Protsenko <semen.protsenko@linaro.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Jaewon Kim <jaewon02.kim@samsung.com>,
        Chanho Park <chanho61.park@samsung.com>,
        David Virag <virag.david003@gmail.com>,
        Youngmin Nam <youngmin.nam@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Daniel Palmer <daniel@0x0f.com>,
        Hao Fang <fanghao11@huawei.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
        open list <linux-kernel@vger.kernel.org>,
        linux-clk@vger.kernel.org
References: <20211215160906.17451-1-semen.protsenko@linaro.org>
 <20211215160906.17451-7-semen.protsenko@linaro.org>
 <CAGOxZ52h-PL7ii-qDVy0tn51gmvgU3uhZC6NYH3hgxWiHrRJEA@mail.gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <CAGOxZ52h-PL7ii-qDVy0tn51gmvgU3uhZC6NYH3hgxWiHrRJEA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 17/12/2021 17:46, Alim Akhtar wrote:
> Hi Sam,
> 
> On Thu, Dec 16, 2021 at 1:36 AM Sam Protsenko
> <semen.protsenko@linaro.org> wrote:
>>
>> Samsung Exynos850 is ARMv8-based mobile-oriented SoC. This patch adds
>> initial SoC support. It's not comprehensive yet, some more devices will
>> be added later. Right now only crucial system components and most needed
>> platform devices are defined.
>>
>> Crucial features (needed to boot Linux up to shell with serial console):
>>
>>   * Octa cores (Cortex-A55), supporting PSCI v1.0
>>   * ARM architected timer (armv8-timer)
>>   * Interrupt controller (GIC-400)
>>   * Pinctrl nodes for GPIO
>>   * Serial node
>>
>> Basic platform features:
>>
>>   * Clock controller CMUs
>>   * OSCCLK clock
>>   * RTC clock
>>   * MCT timer
>>   * ARM PMU (Performance Monitor Unit)
>>   * Chip-id
>>   * RTC
>>   * Reset
>>   * Watchdog timers
>>   * eMMC
>>   * I2C
>>   * HSI2C
>>   * USI
>>
>> All those features were already enabled and tested on E850-96 board with
>> minimal BusyBox rootfs.
>>
>> Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
>> ---
>>  .../boot/dts/exynos/exynos850-pinctrl.dtsi    | 755 ++++++++++++++++++
>>  arch/arm64/boot/dts/exynos/exynos850.dtsi     | 755 ++++++++++++++++++
> Instead of such a large patch, it is good to logically divide the
> patches as per IP for easy of review
> e.g.
> Put everything in one patch which is good enough to get you a Linux
> prompt, followed
> by one or a couple of IPs dtsi, dts entries.

The patch is not that big and splitting it into several addons does not
bring benefits. You still add new DTSI - either in one or two patches,
there is going to be the same amount of code to review. One still has to
review everything.

It would be different if DTSI was already applied - then incremental
updates make sense. Another reason for splitting is for different
topics, when doing multiple separate actions, like fix + add, change + add.


Best regards,
Krzysztof

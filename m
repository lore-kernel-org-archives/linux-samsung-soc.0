Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 300AEC433EF
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 27 Oct 2021 06:39:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id F3ECF60E78
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 27 Oct 2021 06:39:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235983AbhJ0GmQ (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 27 Oct 2021 02:42:16 -0400
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:49528
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S236683AbhJ0GmP (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 27 Oct 2021 02:42:15 -0400
Received: from mail-lj1-f199.google.com (mail-lj1-f199.google.com [209.85.208.199])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 8C6C03F175
        for <linux-samsung-soc@vger.kernel.org>; Wed, 27 Oct 2021 06:39:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1635316789;
        bh=TJFG/vvNaCf13HIPnLu6h3d4TGYuU2bYLg5tA/AzYYE=;
        h=To:Cc:References:From:Subject:Message-ID:Date:MIME-Version:
         In-Reply-To:Content-Type;
        b=Ly7AFYu5xOLinWDlGM41iBbo1lYOifD2mRL8+ZzYBqdmt8Y1Jwfb1XsXVDlYTnb1x
         0PBlAEglZ+8quZOk2mrHQoARjn9Civpjsfr76v+IedeCmOVcgEdb/gqRew0Ce2Cee8
         TiCJ5Pkq+6mGsnq5+NtQIVrw27lwTQQrHefeIukBRvM0ZVs1Z7UkBfNgMGZely1Mxr
         6UouG4xleKbh0tVzBNiQeZEA9iRNkQFtmt9EXNxGEtDTP/yu7KTEwnyYb04YJEuUs1
         olgjJeSbBsbYz0Oq5rzTwAn2d+4+LhSvwDtu/WVl3urVNfdD2+ABFgqqMe2AHd5sC3
         0ES0q4ICSgogA==
Received: by mail-lj1-f199.google.com with SMTP id f6-20020a2e9e86000000b00211349f9ce3so277810ljk.3
        for <linux-samsung-soc@vger.kernel.org>; Tue, 26 Oct 2021 23:39:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:to:cc:references:from:subject:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=TJFG/vvNaCf13HIPnLu6h3d4TGYuU2bYLg5tA/AzYYE=;
        b=JC3i+sAbqb/ZI4eCQfxJ9s9l2VTtU44DfIPr2LBS9URZ+4kwE7Z2eJpK32J2RMhmid
         +k65h3CjI1xIORrKMjZEv81r0HFW6ltI9gk35K6h9XzzX6i2i1XPXxB1MVSC/0ozCI8T
         ACuaml7FmucVTsG7zBnNmLiCsl84naIyLS/z37BEHls6hkEUeMfUVg7LVScTRTL09WPW
         EVsw03LpjDyZnRyqthWovMT3o6qrmcE9YJDNen+r1Vv+KxR8AGfyMmjdila3qhy1rG0T
         Dvzwp+FqBR4m1dBgbfL2CeFAPBPBuGCe7XgShnxsM/JaNeuNViAekKuxrkmJvBM0aZ74
         yKNw==
X-Gm-Message-State: AOAM531g5xHco9L5FAE6l2Sy9Z0mn3hMYb7+EbRo7q6NcjelTrWTQat1
        Aj2ni337rBomGf0e9Ghg1+giOrhM/y4ccgmClTp1s7mjW1W2yim6RjCXjSOQUqCAzRWfTudOd2U
        A9MVNw3ROFqYLPX9lztYiqY2sS7OIXMRTJuCpzV16YwrERULs
X-Received: by 2002:a05:6512:220d:: with SMTP id h13mr27001357lfu.623.1635316788852;
        Tue, 26 Oct 2021 23:39:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzgGc5YUxt9r1hmLSARb+KaEihH3zKqTxL/LSbVv3ad6jszmxotM+Garn3vkCUOj2nZmB8PFQ==
X-Received: by 2002:a05:6512:220d:: with SMTP id h13mr27001338lfu.623.1635316788528;
        Tue, 26 Oct 2021 23:39:48 -0700 (PDT)
Received: from [192.168.3.161] (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
        by smtp.gmail.com with ESMTPSA id o22sm2480929lfr.250.2021.10.26.23.39.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 Oct 2021 23:39:48 -0700 (PDT)
To:     Youngmin Nam <youngmin.nam@samsung.com>, will@kernel.org,
        mark.rutland@arm.com, daniel.lezcano@linaro.org
Cc:     tglx@linutronix.de, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, pullip.cho@samsung.com,
        hoony.yu@samsung.com, hajun.sung@samsung.com,
        myung-su.cha@samsung.com, kgene@kernel.org
References: <20211021061804.39118-2-youngmin.nam@samsung.com>
 <0c5dcdab-7aa3-a98f-e615-acbe98489935@canonical.com>
 <20211021082650.GA30741@perf>
 <1b93aaf3-ed64-b105-dec4-07b6f27b385b@canonical.com>
 <20211022042116.GA30645@perf>
 <da83de3a-e7a2-f9b2-80f2-25c39717c3e4@canonical.com>
 <20211026014732.GA45525@perf>
 <91e926c4-9a3a-196d-1451-d3e7d38fc132@canonical.com>
 <20211026104518.GA40630@perf>
 <cb5bd5a3-1c23-0dc5-9f77-112befd7269c@canonical.com>
 <CGME20211027011125epcas2p2916524051416ede854b750c91a19073b@epcas2p2.samsung.com>
 <20211027013709.GA17353@perf>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Subject: Re: [PATCH v1 1/2] clocksource/drivers/exynos_mct_v2: introduce
 Exynos MCT version 2 driver for next Exynos SoC
Message-ID: <bde68e45-bc8f-8013-9097-e68d123c9019@canonical.com>
Date:   Wed, 27 Oct 2021 08:39:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211027013709.GA17353@perf>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 27/10/2021 03:38, Youngmin Nam wrote:
> On Tue, Oct 26, 2021 at 01:00:51PM +0200, Krzysztof Kozlowski wrote:
>> On 26/10/2021 12:45, Youngmin Nam wrote:
>>> On Tue, Oct 26, 2021 at 09:10:28AM +0200, Krzysztof Kozlowski wrote:
>>>> On 26/10/2021 03:47, Youngmin Nam wrote:
>>>>>> If everyone added a new driver to avoid integrating with existing code,
>>>>>> we would have huge kernel with thousands of duplicated solutions. The
>>>>>> kernel also would be unmaintained.
>>>>>>
>>>>>> Such arguments were brought before several times - "I don't want to
>>>>>> integrating with existing code", "My use case is different", "I would
>>>>>> need to test the other cases", "It's complicated for me".
>>>>>>
>>>>>> Instead of pushing a new vendor driver you should integrate it with
>>>>>> existing code.
>>>>>>
>>>>> Let me ask you one question.
>>>>> If we maintain as one driver, how can people who don't have the new MCT test the new driver?
>>>>
>>>> I assume you talk about a case when someone else later changes something
>>>> in the driver. Such person doesn't necessarily have to test it. The same
>>>> as in all other cases (Exynos MCT is not special here): just ask for
>>>> testing on platform one doesn't have.
>>>>
>>>> Even if you submit this as separate driver, there is the exact same
>>>> problem. People will change the MCTv2 driver without access to hardware.
>>>>
>>> Yes, I can test the new MCT driver if someone ask for testing after modifying the new driver.
>>> But in this case, we don't need to test the previous MCT driver. We have only to test the new MCT driver.
>>
>> Like with everything in Linux kernel. We merge instead of duplicate.
>> It's not an argument.
>>
>>>> None of these differ for Exynos MCT from other drivers, e.g. mentioned
>>>> Samsung PMIC drivers, recently modified (by Will and Sam) the SoC clock
>>>> drivers or the ChipID drivers (changed by Chanho).
>>> From HW point of view, the previous MCT is almost 10-year-old IP without any major change and
>>> it will not be used on next new Exynos SoC.
>>> MCTv2 is the totally newly designed IP and it will replace the Exynos system timer.
>>> Device driver would be dependent with H/W. We are going to apply a lot of changes for this new MCT.
>>> For maintenance, I think we should separate the new MCT driver for maintenance.
>>>
>>
>> There are several similarities which actually suggest that you
>> exaggerate the differences.
>>
>> The number of interrupts is the same (4+8 in older one, 12 in new one...).
> 
> I didn't "exaggerate" at all.
> The numer of interrups is the same. But their usage is completely different.
> The type of each timer is different.
> And previous MCT can only support upto 8 cores.
> 
> * MCTv1 (Let me call previous MCT as MCTv1)
>  - 4 global timer + 8 local timer
>  - Global timer and local timer are totally different.
>  - 4 global timer have only one 64bit FRC that serves as the "up-counter" with 4 "comparators"
>  - 8 local timer have 8 of 32bit FRC that serves as the "down-counter" without any "comparators".(just expire timer)
>  - local timer can be used as per-cpu event timer, so it can only support upto 8 cores.
> 
> * MCTv2
>  - There are no global timer and local timer anymore.
>  - 1 of 64bit FRC that serves as "up-counter" (just counter without "comparators")
>  - 12 comaprators (These are not "counter") can be used as per-cpu event timer so that it can support upto 12 cores.
>  - RTC source can be used as backup source.
> 
>> You assign the MCT priority also as higher than Architected Timer
>> (+Cc Will and Mark - is it ok for you?)
>>     evt->rating = 500;      /* use value higher than ARM arch timer *
>>
> Yes, this is absolutely correct on event timer.
> We cannot use arm arch timer which is operating based on PPI as per-cpu event timer because of poewr mode.
> We have to use SPI for per-cpu timer interrupt. (This is the same in all Exynos platform)

No, this is not correct, was explained several times and it is one of
the reasons why I am holding back to reuse of existing driver. You
copied few 32-bit ARM (ARMv7) solutions from old MCT driver into a new
one which is only 64-bit. These 32-bit solutions are some optimizations
or hacks matching 32-bit ARM Exynos processors. If you copy them to
entirely new driver for entirely different IP block, it means this is
not entirely different IP block.

Therefore I see a point now in having a Exynos MCTv2 driver for new IP
blocks after removing all that legacy 32-bit ARM stuff.

Therefore:
> evt->rating = 350;
Not 500. Use the same value as old timer driver for ARMv8. See previous
discussions and commits from Marek and Will.

Other:
> static u32 exynos_read_count_32(void)

This is u64, not u32. Get rid of 32-bit optimization/hack or explain it
similarly as Doug did (40 lines of reasoning).

>  .mask           = CLOCKSOURCE_MASK(32),

Mask is 64.

These are the 32-bit legacies I found now (maybe there are more...).
Don't copy them if this is a new driver getting rid of legacy.

> 
>> All these point that block is not different. Again, let me repeat, we
>> support old Samsung PMICs with new Samsung PMICs in one driver. Even
>> though the "old one" won't be changed, as you mentioned here. The same
>> Samsung SoC clock drivers are used for old Exynos and for new ones...
>> Similarly to pinctrl drivers. The same ChipId.
>>
>> Everywhere we follow the same concept of unification instead of
>> duplication. Maybe Exynos MCT timer is an exception but you did not
>> provide any arguments supporting this. Why Exynos MCTv2 should be
>> treated differently than Exynos850 clocks, chipid, pinctrl and other blocks?
>>
> 
> If MCTv2 has only changes in register layout, I can consider merging work.
> But this is not that case.
> 
> You gave a example with PMIC, SoC clock, Pinctrl, ChipId.
> These H/W IP have only changes in register layout which came from difference of each SoC.
> 
> Were these H/W IP version changed?
> Were these H/W IP control method changed ?
> No. It only has minor chagnes not major changes.
> 
> * PMIC - controls the PMIC reigster with I2C interface regarding their SoC usecase.
>        - there is no changes on H/W control method itself.
> 
> * SoC Clock - changes only in register layout regarding SoC
>             - Clock control method still the same.
> 
> * Pinctrl - changes only in gpio pin register layout (pin number, pin type, pin map..) regarding SoC.
> 	  - Is there any changes on control method ?
> 
> * Chipid - This is very simple H/W IP. It only supports unique chip id value with read-only register.
>          - It really only have changes in register layout.
> 
> MCTv2 is different.
> Not only register layout but also it's control method has to be changed regarding H/W difference.

Yes, I see some differences in HW control which we also solve in several
other cases through structure ops. Indeed here it looks like the number
of differences in control is bigger than in other cases.

If Daniel is okay in having two drivers and you get rid of all 32-bit
legacy (including ordering against architected timers), I am fine with it.

>> Daniel,
>> Any preferences from you? Integrating MCT into existing driver (thus
>> growing it) or having a new one?



Best regards,
Krzysztof

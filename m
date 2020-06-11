Return-Path: <SRS0=3c0k=7Y=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3550CC433DF
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 11 Jun 2020 10:59:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 125392063A
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 11 Jun 2020 10:59:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726995AbgFKK7u (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 11 Jun 2020 06:59:50 -0400
Received: from foss.arm.com ([217.140.110.172]:50470 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726407AbgFKK7u (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 11 Jun 2020 06:59:50 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B5F2E31B;
        Thu, 11 Jun 2020 03:59:49 -0700 (PDT)
Received: from [10.57.9.128] (unknown [10.57.9.128])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 67B753F66F;
        Thu, 11 Jun 2020 03:59:48 -0700 (PDT)
Subject: Re: ARM: warning: relocation out of range on Exynos XU4 and U3+
To:     Anand Moon <linux.amoon@gmail.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
Cc:     Chanwoo Choi <cw00.choi@samsung.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        linux-samsung-soc@vger.kernel.org,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>
References: <CANAwSgQv9BKV4QfZAgSfFQvO7ftcFyCGXEo+g4pgQA4mgK52iQ@mail.gmail.com>
 <20200611064556.GA5056@kozik-lap>
 <CANAwSgQqW6+W2=QcrAx8DsafK_0eMtQthQWcZWy9NDWxN3WkbQ@mail.gmail.com>
From:   Robin Murphy <robin.murphy@arm.com>
Message-ID: <19d94eb3-d08c-e436-ccc0-cca56291eed2@arm.com>
Date:   Thu, 11 Jun 2020 11:59:46 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:68.0) Gecko/20100101
 Thunderbird/68.8.1
MIME-Version: 1.0
In-Reply-To: <CANAwSgQqW6+W2=QcrAx8DsafK_0eMtQthQWcZWy9NDWxN3WkbQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 2020-06-11 08:51, Anand Moon wrote:
> Hi Krzysztof,
> 
> On Thu, 11 Jun 2020 at 12:15, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>>
>> On Thu, Jun 11, 2020 at 11:13:57AM +0530, Anand Moon wrote:
>>> Hi All,
>>>
>>> I would like to report some warnings I observed on pre-compiled kernel
>>> image (5.7.1-1-ARCH) from Archlinux.
>>> Sometimes ethernet would not come up and get connected, so in order to
>>> investigate.
>>> I found below warnings, So I am sharing the logs at my end.
>>>
>>> Are these warnings related to in-consistency in locking, How can we
>>> Investigate more to fix this issue.
>>
>> These rather look like some address space randomization or some compiler
>> (LLVM?) feature. Not Exynos-specific anyway.
>>
>> You should report it to Arch folks because they know how they compiled
>> the kernel and what config they used (althogh config you can find in
>> /proc/config.gz).
> 
> Thanks for your inputs.
> Ok I will do more checks at my end, before reporting further to Archlinux.

Looks like the relocations fail when loading modules, and PLTs are not 
enbabled[1], so chances are the kernel image has simply grown too big to 
keep everything within direct branch range of everything else.

Robin.

[1] 
https://github.com/archlinuxarm/PKGBUILDs/blob/master/core/linux-odroid-xu3/config#L619

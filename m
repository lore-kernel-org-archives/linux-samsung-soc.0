Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A270CC433FE
	for <linux-samsung-soc@archiver.kernel.org>; Sat, 20 Nov 2021 17:38:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237684AbhKTRlW (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sat, 20 Nov 2021 12:41:22 -0500
Received: from mail.kernel.org ([198.145.29.99]:48354 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230190AbhKTRlW (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sat, 20 Nov 2021 12:41:22 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id E54AF60E9C;
        Sat, 20 Nov 2021 17:38:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1637429898;
        bh=DJSZbPQnZbwd2WMtdienM58036xGViO7g+aTcGftKeI=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=ij/1yDQcdlKUSKM1H8ayOJ/NvPGBUdIxKJeNyVarsxGdAYhx+3v76Px/H1/3g/EEW
         4mXlQ6AvqfrehgbZJKRAZVC1nYdC360Od70A0ZLoLdKxarrT4gIqxc8k1D/jszy+oc
         ZEsZweJ5FO37763k8ef+KNiNPf2TfcpCliBve4nQQD9r3AVzOfyuLHgw8U/Kin5bkp
         7cHNRsr3JkStorMI9pMKMI2p3KRbUM6m5rHcQ9su9ac7XqjJ358BiWW02CRGzeZFDo
         0MxhKxxdu6LetUNVFLNg64Ewgigi3Lh77Co/Kwq2JamPvNHu/tjZ5VR1d3OTmBI9ST
         F0R+Fl3Pzb/Sg==
Subject: Re: [PATCH v2 1/1] clk: samsung: exynos850: Register clocks early
To:     Sam Protsenko <semen.protsenko@linaro.org>
Cc:     Sumit Semwal <sumit.semwal@linaro.org>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        =?UTF-8?Q?Pawe=c5=82_Chmiel?= <pawel.mikolaj.chmiel@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>
References: <CGME20211025161302eucas1p2f50ef29a0bba69c13deaf1ad31a8439c@eucas1p2.samsung.com>
 <20211025161254.5575-1-semen.protsenko@linaro.org>
 <fcc939e6-50b4-1847-c738-db940d0c5bd4@samsung.com>
 <CAPLW+4nnyPAMRcAzDjJ-uygm8bjncNp_rTLKdY5cywcpf5vg=w@mail.gmail.com>
From:   Sylwester Nawrocki <snawrocki@kernel.org>
Message-ID: <b5ac9e36-235c-906c-9f95-80dabd971be5@kernel.org>
Date:   Sat, 20 Nov 2021 18:38:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <CAPLW+4nnyPAMRcAzDjJ-uygm8bjncNp_rTLKdY5cywcpf5vg=w@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 20.11.2021 17:47, Sam Protsenko wrote:
>>> @@ -920,8 +929,12 @@ static int __init exynos850_cmu_probe(struct platform_device *pdev)
>>>        struct device_node *np = dev->of_node;
>>>
>>>        info = of_device_get_match_data(dev);
>>> -     exynos850_init_clocks(np, info->clk_regs, info->nr_clk_regs);
>>> -     samsung_cmu_register_one(np, info);
>>> +
>>> +     /* Early clocks are already registered using CLK_OF_DECLARE_DRIVER() */
>>> +     if (info != &peri_cmu_info) {
>>> +             exynos850_init_clocks(np, info->clk_regs, info->nr_clk_regs);
>>> +             samsung_cmu_register_one(np, info);
>>> +     }
>> Don't you also need to register early CMU_TOP, which provides clocks
>> for CMU_PERI? I'm afraid it might not work properly when you register
>> CMU_PERI clocks early and only later in probe() you enable parent clock
>> required for the already registered clocks to be usable.

> Good point, I'll do that in v2. Not sure how I missed that dependency
> point, but thank you for noticing that. Guess it only works for me
> because clocks are already enabled in bootloader, and I'm using
> "clk_ignore_unused" param for now.
> 
>> How about registering also CMU_TOP early and enabling parent clock
>> also in OF_CLK_DECLARE init callback, i.e. using either OF_CLK_DECLARE
>> or platform driver for a CMU?
>>
> If you mean doing clk_prepare_enable() for "dout_peri_bus" clock in
> exynos850_cmu_peri_init(), I don't think it's possible. clk_get()
> needs "struct device *dev", and we only have that in platform driver
> probe. Trying to pass dev=NULL won't work, so that's why I'm enabling
> parent clocks in platform driver probe.

Sorry, I didn't notice it earlier, actually CMU_TOP is already being
initialized with OF_CLK_DECLARE.

You could use of_clk_get() to get the clock, the consumer clock indexes
are fixed and defined in the DT binding. There is also
of_clk_get_by_name() which works similarly to clk_get().



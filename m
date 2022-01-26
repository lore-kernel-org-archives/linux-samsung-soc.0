Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2874C63684
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 26 Jan 2022 09:19:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230127AbiAZJTm (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 26 Jan 2022 04:19:42 -0500
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:47798
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S238977AbiAZJTk (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 26 Jan 2022 04:19:40 -0500
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com [209.85.221.69])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 53F333FFFD
        for <linux-samsung-soc@vger.kernel.org>; Wed, 26 Jan 2022 09:19:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1643188779;
        bh=pBqXXr3PeJ7ykOBVowRPGxEs/0VxNU9EERyHzmf0x6M=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=iNqWtQm3lLA8yk1z2SWWMaeQXgd8k2V1cE0sL87ksuidOQKIwAu76/c5h2gTx3jUO
         mbstyX/+O355Zf13yo87zGC7vlNbFWbyeR6RVAIjdwigysu/EtAf/Ez6RY06cKFq3o
         6cb4TH1rhPFVNadqopdOkDY2Y5TxUsbQTK0BixVTqnxQTD7lO6pgf35isKVl6cX8wR
         G7iEbGJFk3x3nvXH4Wg0d0NpwqkUj7jef/ZuVG26gY01jYOW+QJa2cu1Ow4okMksWD
         RPKnzwaSS7j+SPtGpLCVceY6ic/fKjuoljsBocRAL3/nhfzT2MnbwJzhtocLojvvLO
         htqsT1J7fp2ww==
Received: by mail-wr1-f69.google.com with SMTP id g6-20020adfbc86000000b001a2d62be244so4015467wrh.23
        for <linux-samsung-soc@vger.kernel.org>; Wed, 26 Jan 2022 01:19:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=pBqXXr3PeJ7ykOBVowRPGxEs/0VxNU9EERyHzmf0x6M=;
        b=t+0u2gkdCAVT8Hn1ZGivPZErN+ZWEBDlUkVx9HLT2iFT8RgGtHYbp611O/mYec/Tcr
         LBAdW/GQUuAICdL6bBfzZp12dZT0Pl2eBGixVIcSl5qENp599y2Q8rGGK6hA1gpupt+o
         gnoc73uAOwiFFfJe4SG9ub8noo+koL42iUStpeuva05hY9r6dvYvl1EWB3Shr2SgCM8L
         Y19svh8uOd6DM/3I8BcZITJPnf0Qb0RVw0/A12XQioQWNXI4sMzdOUH5vCl5j/QY28Zi
         Yqj/pnjWgSrFjdxmhXYZgjH4Pn7Tq/v+EEYEionzZB4QC9t4tzFZOrKYQL4L2VHBFr7r
         D30w==
X-Gm-Message-State: AOAM533m4qOAkslg/7wYahgA+VHWUOhMzv7ok0rtYc6YPct8iW2JTlMA
        F0RggurumyGxhF3hUxySf6bJuD/1t7W9Mb9Ua9dQAfN8nEDIt/ZpnH50n9odU+wYYcHebnQqzPM
        JQGkUp2ZtzN4f5CaTD6cF6iSF3kSii/wWEE6OLPuwmiJhXzZq
X-Received: by 2002:adf:eb87:: with SMTP id t7mr21742783wrn.147.1643188778818;
        Wed, 26 Jan 2022 01:19:38 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwEP5/lu7fbvZTNXya5lAtVgrXBoVxZH1tRfgYLoGaoAPtg9tM6DO08WcYy4M6fXSv2af6NTA==
X-Received: by 2002:adf:eb87:: with SMTP id t7mr21742754wrn.147.1643188778608;
        Wed, 26 Jan 2022 01:19:38 -0800 (PST)
Received: from [192.168.0.60] (xdsl-188-155-168-84.adslplus.ch. [188.155.168.84])
        by smtp.gmail.com with ESMTPSA id j2sm3230420wms.2.2022.01.26.01.19.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Jan 2022 01:19:38 -0800 (PST)
Message-ID: <4c029f92-ece7-78c1-e64b-cbe438b45a5f@canonical.com>
Date:   Wed, 26 Jan 2022 10:19:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v5 00/16] Add support for Tesla Full Self-Driving (FSD)
 SoC
Content-Language: en-US
To:     Alim Akhtar <alim.akhtar@samsung.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc:     soc@kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, olof@lixom.net, arnd@arndb.de,
        linus.walleij@linaro.org, catalin.marinas@arm.com,
        robh+dt@kernel.org, s.nawrocki@samsung.com,
        linux-samsung-soc@vger.kernel.org, pankaj.dubey@samsung.com,
        sboyd@kernel.org
References: <CGME20220124142850epcas5p2f82243b87386b3d49a9302c87e015d6b@epcas5p2.samsung.com>
 <20220124141644.71052-1-alim.akhtar@samsung.com>
 <d9682f16-13b7-b6dc-5afd-b2d319143de5@canonical.com>
 <4cfcde38-50cb-646a-0d17-c2cb2977a2e4@canonical.com>
 <063501d81281$10e5b3c0$32b11b40$@samsung.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <063501d81281$10e5b3c0$32b11b40$@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 26/01/2022 07:50, Alim Akhtar wrote:
> Hi Krzysztof
> 
>> -----Original Message-----
>> From: Krzysztof Kozlowski [mailto:krzysztof.kozlowski@canonical.com]
>> Sent: Tuesday, January 25, 2022 10:56 PM
>> To: Alim Akhtar <alim.akhtar@samsung.com>; linux-arm-
>> kernel@lists.infradead.org; linux-kernel@vger.kernel.org
>> Cc: soc@kernel.org; linux-clk@vger.kernel.org; devicetree@vger.kernel.org;
>> olof@lixom.net; arnd@arndb.de; linus.walleij@linaro.org;
>> catalin.marinas@arm.com; robh+dt@kernel.org; s.nawrocki@samsung.com;
>> linux-samsung-soc@vger.kernel.org; pankaj.dubey@samsung.com;
>> sboyd@kernel.org
>> Subject: Re: [PATCH v5 00/16] Add support for Tesla Full Self-Driving (FSD) SoC
>>
>> On 25/01/2022 18:12, Krzysztof Kozlowski wrote:
>>> On 24/01/2022 15:16, Alim Akhtar wrote:
>>>> Adds basic support for the Tesla Full Self-Driving (FSD) SoC. This
>>>> SoC contains three clusters of four Cortex-A72 CPUs, as well as
>>>> several IPs.
>>>>
>>>> Patches 1 to 9 provide support for the clock controller (which is
>>>> designed similarly to Exynos SoCs).
>>>>
>>>> The remaining changes provide pinmux support, initial device tree support.
>>>>
>>>> - Changes since v4
>>>> * fixed 'make dtbs_check' warnings on patch 14/16
>>>>
>>>> - Changes since v3
>>>> * Addressed Stefen's review comments on patch 14/16
>>>> * Fixed kernel test robot warning on patch 04/16
>>>> * rebsaed this series on Krzysztof's pinmux new binding schema work
>>>> [1]
>>>>
>>>> - Changes since v2
>>>> * Addressed Krzysztof's and Stephen's review comments
>>>> * Added Reviewed-by and Acked-by tags
>>>> * Rebased on next-20220120
>>>>
>>>> - Changes since v1
>>>> * fixed make dt_binding_check error as pointed by Rob
>>>> * Addressed Krzysztof's and Rob's review comments
>>>> * Added Reviewed-by and Acked-by tags
>>>> * Dropped SPI, MCT and ADC from this series (to be posted in small
>>>> sets)
>>>>
>>>> NOTE: These patches are based on Krzysztof's pinmux for-next branch
>>>> commit 832ae134ccc1 ("pinctrl: samsung: add support for Exynos850 and
>>>> ExynosAutov9 wake-ups") [1]
>>>> https://git.kernel.org/pub/scm/linux/kernel/git/pinctrl/samsung.git/l
>>>> og/?h=for-next
>>>>
>>>>
>>>
>>> Thanks, applied DTS/soc and pinctrl patches.
>>>
>>> I expect Sylwester will pick up the clock ones. Otherwise please let
>>> me know to pick it up as well.
>>
>> I forgot that clock macros are used in DTS. This does not compile and I cannot
>> take drivers into DTS branch.
>>
>> Alim,
>> DTS changes dropped. Please resend with the same trick we did for
>> Exynos850 board - hard-coded clock IDs as defines. See:
>>
>> https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git/diff/arch/arm6
>> 4/boot/dts/exynos/exynos850.dtsi?h=samsung-dt64-5.17-
>> 2&id=e3493220fd3e474abcdcefbe14fb60485097ce06
>>
> Ok, I will resend patch 14 and 15 (DTS changes) only as suggested above.

I see Sylwester acked clock patches, so I will take them. No need to
resend, I'll organize the patches so they will compile.


Best regards,
Krzysztof

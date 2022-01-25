Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0781C433EF
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 25 Jan 2022 17:29:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349121AbiAYR25 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 25 Jan 2022 12:28:57 -0500
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:55646
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1380325AbiAYR0S (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 25 Jan 2022 12:26:18 -0500
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com [209.85.128.71])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 740803F1C2
        for <linux-samsung-soc@vger.kernel.org>; Tue, 25 Jan 2022 17:26:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1643131575;
        bh=tBPSBXWD6lNXgd+PIKKZrS4JET2MiEwqJjtzX3WR0BA=;
        h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
         In-Reply-To:Content-Type;
        b=G8c3ia/BSN1RU+ikJX2kFULNHiO0oSsqqcVWbtbLsADS9XUUB/gMGGqpiuSWi7Jwg
         Ul0H8jlvR/54pvZPfptZhz5hPC7Rcv71zxl51MdXZkp7qct6cLVfR0mR+4mYMetxcN
         cOQndFKvtGmAgoHqLjH9V4qb3ym/BHYLLkNDmiiu/gGzI0TIQ0087qLrvlO7KFzfFy
         Z2eU6jy6Q7TsQ3KQVjKB/Tr5/zAq+S/4khimYn7QJUeTIQERk8O/bdWc0I2mohNG80
         zI6CoAHx4nPQcnIgntniDoDiDzK22wLrDHQGIU+SoaHBuvvKGB9IbrhfwCXK/4apVp
         qdzjW066/6Wqg==
Received: by mail-wm1-f71.google.com with SMTP id w5-20020a1cf605000000b0034b8cb1f55eso1474799wmc.0
        for <linux-samsung-soc@vger.kernel.org>; Tue, 25 Jan 2022 09:26:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:from:to:cc:references:in-reply-to
         :content-transfer-encoding;
        bh=tBPSBXWD6lNXgd+PIKKZrS4JET2MiEwqJjtzX3WR0BA=;
        b=uubFXEDeVSRklaiRc1367XYLeFZhEptyegp73HkyGtnJSHrlgIb+hK0wtyVR7DNkVY
         y+6Yj4f4g2w0opsM2t6azU41X5zsUOuB3QnzfvG+zQOTJ9v/iwOWrkBJ3w/iWaKfl1uN
         4Y7U6IC8iGnkGGPqRBN6egPJslOF0nFfCwi/ps1YtO2PZI6dr7JdZ19MPj9v6baeBSdH
         RUOIqW1yq6T8bxx+m7NXin0Ov3LyqVRqB88PLUAgFyl7lgdBQMPPKKz2LhVHU0tYCKGl
         phKKjl/UPyoHTQW1XNcCu9fgJfDmrXuKFJ0JHET3GMqmrwE2UXdzv4jiPcI7iulZJn/G
         ZqGQ==
X-Gm-Message-State: AOAM530Q8amYK40q66KerqTkuyf3mMn+DnDE/Pd7fvJLFsaMU04hdeCW
        xMprxKv4ZaqXqrjhGPvev8NmI01ggqkTIuUlW5w1JOpJUdNn7MHqWD/SUHytcVOgWS/0TLEOciu
        4b+qsvR79oIdcXDvfmohtpsUW7XQyMERMwliWIMUz1OluLRxa
X-Received: by 2002:a5d:47ad:: with SMTP id 13mr19223371wrb.268.1643131575155;
        Tue, 25 Jan 2022 09:26:15 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxYI/XrOuQ3vsEuxgAlunH/u1OuAuphMer+VPxKWkoU6kMBjIKLaf4SHUyoWcg3qCZ2MyGAZg==
X-Received: by 2002:a5d:47ad:: with SMTP id 13mr19223349wrb.268.1643131574970;
        Tue, 25 Jan 2022 09:26:14 -0800 (PST)
Received: from [192.168.0.59] (xdsl-188-155-168-84.adslplus.ch. [188.155.168.84])
        by smtp.gmail.com with ESMTPSA id k12sm11197616wrd.110.2022.01.25.09.26.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Jan 2022 09:26:14 -0800 (PST)
Message-ID: <4cfcde38-50cb-646a-0d17-c2cb2977a2e4@canonical.com>
Date:   Tue, 25 Jan 2022 18:26:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v5 00/16] Add support for Tesla Full Self-Driving (FSD)
 SoC
Content-Language: en-US
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
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
In-Reply-To: <d9682f16-13b7-b6dc-5afd-b2d319143de5@canonical.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 25/01/2022 18:12, Krzysztof Kozlowski wrote:
> On 24/01/2022 15:16, Alim Akhtar wrote:
>> Adds basic support for the Tesla Full Self-Driving (FSD)
>> SoC. This SoC contains three clusters of four Cortex-A72 CPUs,
>> as well as several IPs.
>>
>> Patches 1 to 9 provide support for the clock controller
>> (which is designed similarly to Exynos SoCs).
>>
>> The remaining changes provide pinmux support, initial device tree support.
>>
>> - Changes since v4
>> * fixed 'make dtbs_check' warnings on patch 14/16
>>
>> - Changes since v3
>> * Addressed Stefen's review comments on patch 14/16
>> * Fixed kernel test robot warning on patch 04/16
>> * rebsaed this series on Krzysztof's pinmux new binding schema work [1]
>>
>> - Changes since v2
>> * Addressed Krzysztof's and Stephen's review comments
>> * Added Reviewed-by and Acked-by tags
>> * Rebased on next-20220120
>>
>> - Changes since v1
>> * fixed make dt_binding_check error as pointed by Rob
>> * Addressed Krzysztof's and Rob's review comments
>> * Added Reviewed-by and Acked-by tags
>> * Dropped SPI, MCT and ADC from this series (to be posted in small sets)
>>
>> NOTE: These patches are based on Krzysztof's pinmux for-next branch
>> commit 832ae134ccc1 ("pinctrl: samsung: add support for Exynos850 and ExynosAutov9 wake-ups") 
>> [1] https://git.kernel.org/pub/scm/linux/kernel/git/pinctrl/samsung.git/log/?h=for-next
>>
>>
> 
> Thanks, applied DTS/soc and pinctrl patches.
> 
> I expect Sylwester will pick up the clock ones. Otherwise please let me
> know to pick it up as well.

I forgot that clock macros are used in DTS. This does not compile and I
cannot take drivers into DTS branch.

Alim,
DTS changes dropped. Please resend with the same trick we did for
Exynos850 board - hard-coded clock IDs as defines. See:

https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git/diff/arch/arm64/boot/dts/exynos/exynos850.dtsi?h=samsung-dt64-5.17-2&id=e3493220fd3e474abcdcefbe14fb60485097ce06


Best regards,
Krzysztof

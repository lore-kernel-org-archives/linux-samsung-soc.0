Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2AC58C433EF
	for <linux-samsung-soc@archiver.kernel.org>; Sat, 18 Dec 2021 10:50:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231761AbhLRKuy (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sat, 18 Dec 2021 05:50:54 -0500
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:56912
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229480AbhLRKuy (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sat, 18 Dec 2021 05:50:54 -0500
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com [209.85.167.72])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 5641E3FFDB
        for <linux-samsung-soc@vger.kernel.org>; Sat, 18 Dec 2021 10:50:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1639824653;
        bh=Wa9ILGMaRHRGBy0aLVrTaW+lHyiaTJlPeVGkAqUVXAA=;
        h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
         In-Reply-To:Content-Type;
        b=eyaMlDydNFdKarqgfHMjOPQAyYlqUCOSzWfK816ES8G/0agnxMyZWUTfBPQIQEUDu
         GCOYGaYpuQOFUVryDoKLU0PHwANrzqkSy2TR13Wfpx0Vcd6undnwTVE1c+UsHXcZqh
         i9ZYvSPJy4CP3qFGfj1/Knd32PLRwPQWxPCQlozW8Ow/gy1+mi+IEGxcbuRvB+TYyp
         JjJUKgEhiAysiytfyQ6u/48Ug1xjzkwa37TBis/0kGYiB2CqEMi8XCnxPgDrXgqDxu
         8MtuN/0j6hf43NyF6Yz7II+aAZQbp4lsq0vZnKz8gVXi8JkGK2o5IPeOcd8Siu5qZS
         IkBuRQDUEKiow==
Received: by mail-lf1-f72.google.com with SMTP id n18-20020a0565120ad200b004036c43a0ddso2158252lfu.2
        for <linux-samsung-soc@vger.kernel.org>; Sat, 18 Dec 2021 02:50:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:from:to:cc:references:in-reply-to
         :content-transfer-encoding;
        bh=Wa9ILGMaRHRGBy0aLVrTaW+lHyiaTJlPeVGkAqUVXAA=;
        b=lL87W9XfXD1awrEEVt25QN+Jb3THGLqVw3eEc64vBHvfyS6rVMjeOuYtp8aymcF4ZU
         QPCfW14vKeBatHBN7W6wU8StCpcTca5JoYCV4GZduqE1MRbhZDCtXdxPOyUBe24XobQ+
         rTwGUizhukStaEqIaiLJLckkBfb8H/qiNWmF2iCH4p4ziA/RQYEIU0sUcotm6HfSxHq9
         mV3d10XWYxH7ABy8w1EhVMDAaoMs3QvfFRnkl5JId8VYrWmgDwSZXvqEFUQz5LOQxcti
         HsspEXDnbIu96u1kR3B0/dSLkBLk5z4qwuo8Xqr/JXbDrS22GignbGKuYNLhCw3reEVu
         FpdA==
X-Gm-Message-State: AOAM530w19XfBMhNxP84CFqruNJjea4D3fIM3z7ktIupi361HYVSQm+X
        12bncKkxpPOafuaiGH+N+ohYaVE96wjyFV9HthoAYUS1+/XjQr4slFnybF/tCLKONzVcSTql9SC
        RGlL1YWL/Kf3sa15w0lWvY0c7yds+WZV9FIpve6PXYQ4HNvAE
X-Received: by 2002:a05:6512:33a6:: with SMTP id i6mr5149398lfg.663.1639824652343;
        Sat, 18 Dec 2021 02:50:52 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzI58O3aQ14JoDf1qzpEQ5Fr4XSXIQcCangkv6BKEfjOW3enxwPtjDy0n9OK2tsKPthEVp8EA==
X-Received: by 2002:a05:6512:33a6:: with SMTP id i6mr5149381lfg.663.1639824652175;
        Sat, 18 Dec 2021 02:50:52 -0800 (PST)
Received: from [192.168.3.67] (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
        by smtp.gmail.com with ESMTPSA id s4sm1676721lfp.198.2021.12.18.02.50.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 18 Dec 2021 02:50:51 -0800 (PST)
Message-ID: <5ad0b0e7-1c09-b7eb-87a3-e62e9e3d12af@canonical.com>
Date:   Sat, 18 Dec 2021 11:50:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [PATCH 1/2] dt-bindings: clock: exynos850: Add bindings for
 Exynos850 sysreg clocks
Content-Language: en-US
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc:     linux-samsung-soc@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
        David Virag <virag.david003@gmail.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        =?UTF-8?Q?Pawe=c5=82_Chmiel?= <pawel.mikolaj.chmiel@gmail.com>,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Sam Protsenko <semen.protsenko@linaro.org>,
        Rob Herring <robh@kernel.org>
References: <20211126203641.24005-1-semen.protsenko@linaro.org>
 <YagPWOj0CLxE/+ER@robh.at.kernel.org>
 <CAPLW+4=LTd8i2Tqr7Wa0NDRTJ5mRJXP=EvRCx84WxnwCDQ1eVg@mail.gmail.com>
 <CAPLW+4nk7Y8Psg9ZVacvzJeAV3VAGWfi+9hTPWgTeAWqh67AKQ@mail.gmail.com>
 <146b173e-f445-bebc-d44c-afd41123eb80@canonical.com>
In-Reply-To: <146b173e-f445-bebc-d44c-afd41123eb80@canonical.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 14/12/2021 17:20, Krzysztof Kozlowski wrote:
> On 14/12/2021 17:15, Sam Protsenko wrote:
>> On Tue, 7 Dec 2021 at 22:54, Sam Protsenko <semen.protsenko@linaro.org> wrote:
>>>
>>> On Thu, 2 Dec 2021 at 02:12, Rob Herring <robh@kernel.org> wrote:
>>>>
>>>> On Fri, 26 Nov 2021 22:36:40 +0200, Sam Protsenko wrote:
>>>>> System Register is used to configure system behavior, like USI protocol,
>>>>> etc. SYSREG clocks should be provided to corresponding syscon nodes, to
>>>>> make it possible to modify SYSREG registers.
>>>>>
>>>>> While at it, add also missing PMU and GPIO clocks, which looks necessary
>>>>> and might be needed for corresponding Exynos850 features soon.
>>>>>
>>>>> Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
>>>>> ---
>>>>>  include/dt-bindings/clock/exynos850.h | 12 +++++++++---
>>>>>  1 file changed, 9 insertions(+), 3 deletions(-)
>>>>>
>>>>
>>>> Acked-by: Rob Herring <robh@kernel.org>
>>>
>>> Hi Sylwester,
>>>
>>> Can you please review and apply this series, if it's ok?
>>>
>>
>> Hi Krzysztof,
>>
>> Do you think it's possible to take this series in your tree? Once it's
>> applied, I can send the board support (dts) series -- this is the only
>> remaining blocker for that right now.
> 
> I would need an Ack from Sylwester anyway. If you have dependencies (the
> DTS), you should send them together with it. Once Sylwester applies this
> patch, the DTS either waits till next release or it has to be modified
> to not depend on this patch.

Sylwester,

We need decision from your side. The apply-window is slowly closing, so
at least take it so DTSI will be free to go next cycle.

Best regards,
Krzysztof

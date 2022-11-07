Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE024C433FE
	for <linux-samsung-soc@archiver.kernel.org>; Mon,  7 Nov 2022 09:12:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231585AbiKGJMT (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 7 Nov 2022 04:12:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39526 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231783AbiKGJMI (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 7 Nov 2022 04:12:08 -0500
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4469863EF
        for <linux-samsung-soc@vger.kernel.org>; Mon,  7 Nov 2022 01:12:07 -0800 (PST)
Received: by mail-lf1-x130.google.com with SMTP id f37so15850595lfv.8
        for <linux-samsung-soc@vger.kernel.org>; Mon, 07 Nov 2022 01:12:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lnsPOK5motup9T8XBniEK+peF/D2fTuyq/bCy58k14U=;
        b=bvOlLbXhahamOjqO+zkLPF8mhi4RlovgUaredeyun24ljOLREs9ppJVlJDipQmET9F
         10KOQMwRSPJjZGOSvfSm+AQ5/8x2yTkCwd56WPI0oFTGR/YDdJj1OHtJldSWYo5mnP6R
         TtjJxmftemResRP6WaV+b/pga2IveLsputjMd78VuHC/RFKQv9EW+LSntd246g2gMK/h
         WTzSLL4hmksJhkznSmwYLEeEObYEShDfxLRvKoWZ2JHFY5bxV7oNR4oYjAEhJrKlCMqG
         GNqY42NPIBSaMgccF3sYiF7GTRMlidv+/1s2KiuFGPoDatfTKdFYB7jng7EtmADN4Tqo
         ivHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lnsPOK5motup9T8XBniEK+peF/D2fTuyq/bCy58k14U=;
        b=tkWvkefurohd2KHsV9pHh+V6WGkRSGjIJ6oA62SNXNOkWG+FaRhlzO8pISLr7tuLnp
         U1j5xnUqfi71MgMW9N7arh3wfn26yoYUbQ1D9wu2LfK6wqnHhC7cNbmjemdITH0wM51H
         cozcUlAEIfD5RPh86KN2cMrOy0UhtAqHJV72Z1xQrcTI5n3uddlY7i4U9mRpm8WQsqL9
         acOPnfa/sJntwk6Hk0OtLZJxVY5HkMiT7Pm0bDyrADBtVxmQjyjSNhWUbAzad/Wll1hh
         4vXgzxpmuAqmcEA8wOs9FQ5zXRqUg6e5jG3H1YVvvoBOF9vH+28EYHKLoIwPsZE4rf0e
         ZXnQ==
X-Gm-Message-State: ACrzQf3MHMkZARefZRNXPUrjF0DSgB00QKilKWwEWEUz6U//vU7kUpwx
        LuQ4n36AuOcIbLcgGMkhelstMg==
X-Google-Smtp-Source: AMsMyM7bXG55cIesK9wxtNvqOTQV+Xf1GiFjjQy9uqOkUa9uGlR/Zjx94GQGqhw1F7vSxJkhQLmuQA==
X-Received: by 2002:a19:654a:0:b0:4b0:831b:ef35 with SMTP id c10-20020a19654a000000b004b0831bef35mr15143654lfj.206.1667812325644;
        Mon, 07 Nov 2022 01:12:05 -0800 (PST)
Received: from [192.168.0.20] (088156142199.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.199])
        by smtp.gmail.com with ESMTPSA id r17-20020a194411000000b0048a9e899693sm1146236lfa.16.2022.11.07.01.12.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Nov 2022 01:12:05 -0800 (PST)
Message-ID: <0e929d35-2a90-94fb-49d6-7f6a0f0a3ed0@linaro.org>
Date:   Mon, 7 Nov 2022 10:12:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH] dt-bindings: clock: exynosautov9: fix reference to
 CMU_FSYS1 mmc card clock
Content-Language: en-US
To:     chanho61.park@samsung.com, Inbaraj E <inbaraj.e@samsung.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        "tomasz.figa@gmail.com" <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        ALIM AKHTAR <alim.akhtar@samsung.com>,
        "mturquette@baylibre.com" <mturquette@baylibre.com>,
        "sboyd@kernel.org" <sboyd@kernel.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>
Cc:     "linux-samsung-soc@vger.kernel.org" 
        <linux-samsung-soc@vger.kernel.org>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        PANKAJ KUMAR DUBEY <pankaj.dubey@samsung.com>
References: <8f026f38-ef09-788e-7bd8-45683b074075@linaro.org>
 <20221104090019.88387-1-inbaraj.e@samsung.com>
 <CGME20221104085410epcas5p24d88f59001b739075e9e190e2c47841e@epcms2p3>
 <20221107000401epcms2p3eeeecbfb2b1cdfb30dcee99bbb48780c@epcms2p3>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221107000401epcms2p3eeeecbfb2b1cdfb30dcee99bbb48780c@epcms2p3>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 07/11/2022 01:04, CHANHO PARK wrote:
>>> Fix reference to CMU_FSYS1 mmc card clock to gout clock instead of dout.
>>>
>>> This fixes make dtbs_check warning as shown below:
>>>
>>> arch/arm64/boot/dts/exynos/exynosautov9-sadk.dtb: clock-
>> controller@17040000:
>>> clock-names:2: 'dout_clkcmu_fsys1_mmc_card' was expected From schema:
>>> /home/inbaraj/mainline/linux/Documentation/devicetree/
>>> bindings/clock/samsung,exynosautov9-clock.yaml
>>
>> I don't understand:
>> 1. Why bindings are wrong not DTSI?
>> 2. What is "gout"? "dout" had a meaning as clock divider output.
> 
> "gout" is output of a gate clock, AFAIK.
> Unlike any other clocks, the fsys1 mmc top clock does not have a divider. So, it should be "mout -> gout" instead of "mout -> gout -> dout".

OK, then this should be in commit msg.

My question about full legal name remains, as here in replies I see
"Inbaraj E".

Best regards,
Krzysztof


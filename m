Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 408F1C4332F
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 15 Nov 2022 09:38:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232405AbiKOJiT (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 15 Nov 2022 04:38:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60776 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232197AbiKOJiS (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 15 Nov 2022 04:38:18 -0500
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E714C1A065
        for <linux-samsung-soc@vger.kernel.org>; Tue, 15 Nov 2022 01:38:16 -0800 (PST)
Received: by mail-lf1-x133.google.com with SMTP id c1so23539098lfi.7
        for <linux-samsung-soc@vger.kernel.org>; Tue, 15 Nov 2022 01:38:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ADm39rqyfjpSRfhU67zfC4NHD+8x5Nv/QWMyB5+FVho=;
        b=kcuus02aGgmW9RkzhYkKs7RMlJRHKg8VOHIQIatQ1i8EC/xuDAJbqm45ZyPbIhC9Ap
         npuhQU5jYW+JYFLsCPpKEoXkCoIRsWKg7vKqp8iIDcJWmrx3w2Q4qqtJ4yyjnAZuRFOY
         2pIM0lLYTGb02zTnW9gSxEwhB/npVdozq4gMnVW5c7MHcFB+3+YKY4QH6S+L9VA/i0Ht
         XOH9SpcjDs8Er1RNjWNpR3J3H1MyRSEuyuqFoJm8Jmo4mCMxcHnlltu5/MFFagzqMBrn
         puQvAq4hXSKMZlClKPR7sRsKkyQYKGcrPydvZFUDdooeQT32MbozBfX6q+GRDdvN0ll2
         IeDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ADm39rqyfjpSRfhU67zfC4NHD+8x5Nv/QWMyB5+FVho=;
        b=pXO/QNiRVHYkomiAoYV4f0YcJJv8UBXJLOgWHFA/+C+AwZJKU3E1Seba5ehBQdyScj
         ywzrr63MnPqRUOI1QvtXQ7S6TWfNHmu749gyIcS0kiwxHLSz1UpPpembMFDhqESd6H8y
         VhI/zbLPbgvLzowJR8JuBb6ypqQvTKDZE8Vw/za+jpj3l+KAwt9aSUk88T+9itsT5xf6
         sy6xdXOE5OgPFoUvV9vyXE3n6a/m04uFsVuTpjoBlrczZhQ0SFy/YAC1C6BPBqqkS/MI
         B0xEIizcBHgFg092S+rN7iUREExnxVdEU/b6rs9RhNfPpEJKRRX+iWSuhfxZTOfNhvdA
         rzrA==
X-Gm-Message-State: ANoB5pnmedQzk9nlvuK7l+PKU77rRYvNyxD5iGpWmi1kEbTy25qHO9gT
        PihSbp77i/sluKx/Gsj6VzraRw==
X-Google-Smtp-Source: AA0mqf7Nyn0t/l3gblajEa+AIkxJIRCjo0o6dQgQ3O9rpdPVmbthJxcjTjLs7LvfD6PkT2jTJuYOOg==
X-Received: by 2002:ac2:4a8e:0:b0:4b3:b6db:8ca7 with SMTP id l14-20020ac24a8e000000b004b3b6db8ca7mr5333118lfp.590.1668505095302;
        Tue, 15 Nov 2022 01:38:15 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id t14-20020a2e8e6e000000b0026bf0d71b1esm2415560ljk.93.2022.11.15.01.38.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Nov 2022 01:38:14 -0800 (PST)
Message-ID: <6976d129-a274-f3a7-52fe-b26275a900cd@linaro.org>
Date:   Tue, 15 Nov 2022 10:38:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH] clk: samsung: Revert "clk: samsung: exynos-clkout: Use
 of_device_get_match_data()"
Content-Language: en-US
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Marek Szyprowski <m.szyprowski@samsung.com>,
        linux-clk@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc:     Stephen Boyd <sboyd@kernel.org>,
        "Minghao Chi (CGEL ZTE)" <chi.minghao@zte.com.cn>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Vinod Koul <vkoul@kernel.org>, Nishanth Menon <nm@ti.com>,
        Mark Brown <broonie@kernel.org>
References: <CGME20221108213728eucas1p2aa97d7925e280b7347bb9e76d3c9a177@eucas1p2.samsung.com>
 <20221108213718.32076-1-m.szyprowski@samsung.com>
 <0da15378-ca0d-4f26-c21c-184de2a89350@linaro.org>
 <d4b49cb6-f7c1-e859-98a8-e78a132b421b@samsung.com>
 <e6cf63f1-ec5f-e600-570d-70e933740f4b@linaro.org>
In-Reply-To: <e6cf63f1-ec5f-e600-570d-70e933740f4b@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 09/11/2022 10:14, Krzysztof Kozlowski wrote:
> On 08/11/2022 23:53, Marek Szyprowski wrote:
>> On 08.11.2022 22:44, Krzysztof Kozlowski wrote:
>>> On 08/11/2022 22:37, Marek Szyprowski wrote:
>>>> of_device_get_match_data() function should not be used on the device
>>>> other than the one matched to the given driver, because it always returns
>>>> the match_data of the matched driver. In case of exynos-clkout driver,
>>>> the code matched the OF IDs on the PARENT device, so replacing it with
>>>> of_device_get_match_data() broke the driver.
>>>>
>>>> This reverts commit 777aaf3d1daf793461269b49c063aca1cee06a44.
>>> This was untested, automated commit and there were several other like
>>> that from Minghao. Other driver owners should check if they have the
>>> same issue. I made a quick look and seems fine, but it all depends what
>>> was the of_device_get_match_data() argument.
>>>
>>>> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
>>> Please add Cc-stable tag. Do reverts need a Fixes tag? I guess as well...
>>
>> Do we really need a CC-stable tag? v6.1-rc1 is the first release that 
>> contains that bug, so this revert imho should be simply applied as a fix 
>> for v6.1-rcX cycle.
> 
> No, then it's fine.
> 

I applied it.

Best regards,
Krzysztof


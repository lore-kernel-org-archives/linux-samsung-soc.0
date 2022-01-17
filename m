Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11A8FC433FE
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 17 Jan 2022 13:50:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234656AbiAQNuc (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 17 Jan 2022 08:50:32 -0500
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:44236
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234554AbiAQNuZ (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 17 Jan 2022 08:50:25 -0500
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com [209.85.208.70])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 23D23402A8
        for <linux-samsung-soc@vger.kernel.org>; Mon, 17 Jan 2022 13:50:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1642427421;
        bh=ePAMBME9OoqmLqu9TGmOOJDOdAhBTNGeiMQzo5Zcwk8=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=QoDQy62cmF6E2Oah0ZZmMj/aIp68t5DyoQ9uJZruVQhFHWsirQmXoUbpWGBOMhQ09
         06XWrzovc4ZVqBNVCTfFtL3AhBdxZZJayqSWBC81JJGcaRjLVRR/uneZzS9zSdGvP1
         eY5e99vN/sG3b4iIgRkotCWFPK7nY1JcITcopOXnOehsvuO2kvoUhp/UdvtEfjkfjS
         GbPuhw2dgtwum9xk5KF0fyt2+INpl4YRZcmKS6V20GUQFCthyjRte+sjY9atIKHgHm
         1qJYYDS6Am+tgMb+KBkGynW7cyyE+YdBD2zbtm1Z0J81B5ZIjHn1Ar1uglOhIY9F3h
         llpmiNoI9z8ew==
Received: by mail-ed1-f70.google.com with SMTP id bs4-20020a056402304400b004032af6b7ebso974886edb.16
        for <linux-samsung-soc@vger.kernel.org>; Mon, 17 Jan 2022 05:50:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=ePAMBME9OoqmLqu9TGmOOJDOdAhBTNGeiMQzo5Zcwk8=;
        b=FFeDaJiSmBgcUwbT6JyuM5GNfizigpVagVzwH5vXLjS0lUBsSBdX/C/S/v3roHB77I
         gly1bPlYSH6YcI5o6QHTFDRcE4Auz9cyK7Zs4OBj1CZmvLkrxK6Y6tgPwnYhBt7mzKCo
         Q0qf0vPrwu+lG9H5t0rGf5K7yzARQLxaSZZTEPVGrXXRnHFtkKJo9zYZzmMARjsbzij5
         qfByts+Vbz87FteuozwmgK6xzgKUlX5kmlmMqqS0wOxDKD/WsVIgbis/1yroMPXhMO26
         +N6YotxNVAAbYHi7FbT5janFwK3N7VuV1FtxjrBnXbElWoJZLL+ls0eBAVB9Sx+s4j/C
         yicg==
X-Gm-Message-State: AOAM533ZLfZ5GTWwVB8CjrlzksIx7LJ8b3/IfAHr6uAYVw/uNikGDGQB
        p0yiNPpAvPmuJFa4zXeNxfPUJziDJz88RTgvWV1kypnylBIbfLs5TgWQopeAJNEJOu0Cdai2Qo7
        RlT1LvLkjSYiqRqHmG8q7ze0ldxHDpHFz1zef04G/xAKXEAes
X-Received: by 2002:a17:906:5d16:: with SMTP id g22mr5071274ejt.295.1642427419816;
        Mon, 17 Jan 2022 05:50:19 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxq9DzOXYxEW3Jq0YclwQkYlU99PzXh2g5H9926DHwMIx90PvG8ZqFXXD4IU5OjfMoVVLw8EQ==
X-Received: by 2002:a17:906:5d16:: with SMTP id g22mr5071248ejt.295.1642427419602;
        Mon, 17 Jan 2022 05:50:19 -0800 (PST)
Received: from [192.168.0.38] (xdsl-188-155-168-84.adslplus.ch. [188.155.168.84])
        by smtp.gmail.com with ESMTPSA id p10sm4535501ejo.14.2022.01.17.05.50.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Jan 2022 05:50:19 -0800 (PST)
Message-ID: <b8040d39-cd4d-e5b0-8aec-f03c5257d63e@canonical.com>
Date:   Mon, 17 Jan 2022 14:50:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [PATCH 15/23] arm64: dts: fsd: Add initial pinctrl support
Content-Language: en-US
To:     Alim Akhtar <alim.akhtar@samsung.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc:     soc@kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, olof@lixom.net,
        linus.walleij@linaro.org, catalin.marinas@arm.com,
        robh+dt@kernel.org, s.nawrocki@samsung.com,
        linux-samsung-soc@vger.kernel.org, pankaj.dubey@samsung.com,
        linux-fsd@tesla.com, 'Shashank Prashar' <s.prashar@samsung.com>,
        'Aswani Reddy' <aswani.reddy@samsung.com>
References: <20220113121143.22280-1-alim.akhtar@samsung.com>
 <CGME20220113122417epcas5p47398a5190cdf4c574c6f1762918b549f@epcas5p4.samsung.com>
 <20220113121143.22280-16-alim.akhtar@samsung.com>
 <2927c34e-3259-4e9a-a657-aeeebf9089d2@canonical.com>
 <00ca01d80ba8$6b9b9800$42d2c800$@samsung.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <00ca01d80ba8$6b9b9800$42d2c800$@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 17/01/2022 14:44, Alim Akhtar wrote:
> Hi Krzysztof
> 
>> -----Original Message-----
>> From: Krzysztof Kozlowski [mailto:krzysztof.kozlowski@canonical.com]
>> Sent: Thursday, January 13, 2022 6:50 PM
>> To: Alim Akhtar <alim.akhtar@samsung.com>; linux-arm-
>> kernel@lists.infradead.org; linux-kernel@vger.kernel.org
>> Cc: soc@kernel.org; linux-clk@vger.kernel.org; devicetree@vger.kernel.org;
>> olof@lixom.net; linus.walleij@linaro.org; catalin.marinas@arm.com;
>> robh+dt@kernel.org; s.nawrocki@samsung.com; linux-samsung-
>> soc@vger.kernel.org; pankaj.dubey@samsung.com; linux-fsd@tesla.com;
>> Shashank Prashar <s.prashar@samsung.com>; Aswani Reddy
>> <aswani.reddy@samsung.com>
>> Subject: Re: [PATCH 15/23] arm64: dts: fsd: Add initial pinctrl support
>>
>> On 13/01/2022 13:11, Alim Akhtar wrote:
>>> Add initial pin configuration nodes for FSD SoC.
>>>
>>> Cc: linux-fsd@tesla.com
>>> Signed-off-by: Shashank Prashar <s.prashar@samsung.com>
>>> Signed-off-by: Aswani Reddy <aswani.reddy@samsung.com>
>>> Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
>>> ---
>>>  arch/arm64/boot/dts/tesla/fsd-pinctrl.dtsi | 338
>> +++++++++++++++++++++
>>>  arch/arm64/boot/dts/tesla/fsd.dtsi         |  22 ++
>>>  2 files changed, 360 insertions(+)
>>>  create mode 100644 arch/arm64/boot/dts/tesla/fsd-pinctrl.dtsi
>>>
>>> diff --git a/arch/arm64/boot/dts/tesla/fsd-pinctrl.dtsi
>>> b/arch/arm64/boot/dts/tesla/fsd-pinctrl.dtsi
>>> new file mode 100644
>>> index 000000000000..ec8d944af636
>>> --- /dev/null
>>> +++ b/arch/arm64/boot/dts/tesla/fsd-pinctrl.dtsi
>>> @@ -0,0 +1,338 @@
>>> +// SPDX-License-Identifier: GPL-2.0
>>> +/*
>>> + * Tesla Full Self-Driving SoC device tree source
>>> + *
>>> + * Copyright (c) 2017-2021 Samsung Electronics Co., Ltd.
>>> + *		https://www.samsung.com
>>> + * Copyright (c) 2017-2021 Tesla, Inc.
>>> + *		https://www.tesla.com
>>> + */
>>> +
>>> +#include <dt-bindings/pinctrl/samsung.h>
>>> +
>>> +&pinctrl_fsys0 {
>>> +
>>
>> No need for empty line.
>>
> Noted
> 
>>> +	gpf0: gpf0 {
>>
>> FYI:
>> It's ok now, but the nodes will have to be renamed to "xxx-gpio-bank" later.
>>
> Have rebased my v2 on your pinmux schema update, so these and below comments are addressed.
> Thanks
> 

OK, but have in mind that -gpio-bank suffix is not needed now. This
depends on support in the pinctrl driver, which will be applied after
the merge window to different tree or branches than DTS is going to.
Therefore if I apply your DTS with "-gpio-bank" to my next/dt64, the
kernel won't find GPIo banks and won't properly boot. The linux-next
will be fine, just my next/dt64 won't be.

If you're fine with it - use "-gpio-bank" suffix. If you prefer my
next/dt64 to have a fully working Tesla SoC DTS, then stick to old node
naming and let's replace it later.

Best regards,
Krzysztof

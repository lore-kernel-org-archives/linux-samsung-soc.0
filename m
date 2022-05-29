Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4FBDC433FE
	for <linux-samsung-soc@archiver.kernel.org>; Sun, 29 May 2022 08:08:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229707AbiE2IIB (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sun, 29 May 2022 04:08:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51596 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229686AbiE2IIA (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sun, 29 May 2022 04:08:00 -0400
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1DB6059942
        for <linux-samsung-soc@vger.kernel.org>; Sun, 29 May 2022 01:07:59 -0700 (PDT)
Received: by mail-ej1-x631.google.com with SMTP id y13so15746390eje.2
        for <linux-samsung-soc@vger.kernel.org>; Sun, 29 May 2022 01:07:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:in-reply-to:content-transfer-encoding;
        bh=/9oKQoiIHCtLJ1GiPNcOALfaJrc/XLY9k2oODVX8Eww=;
        b=pv4gsODv8js7J2ZgEckaxk4Syo6mbxwoGURgIzB+/fBFy+2coOTX+1ZawHUZbKHqWF
         jYr4bXyX9PE1K0ObIz2S4tMh3pBNME174vnZcut/24uDizDJsbkQaraekMapUH3iVT5i
         M6CVhqeAkNr7lakjLEy1+VZjClM7ZqfeMNb8VcqMcKoKUmDfWYf9UW1+78E8kxDCIO75
         4hNhp0J8epVs2xbnPm4SK4J49MUskVtz8qJY7USgjszj2kdrT7Cb5VMSZ7r8JsbsU/zp
         VSzjOY6zCUlZgDWJYbu2/Poe5ohrBPNSiVtymmmOwdQcZ+yIYGHx6En9A4wVEeLj5Sji
         YFrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=/9oKQoiIHCtLJ1GiPNcOALfaJrc/XLY9k2oODVX8Eww=;
        b=XkveI5mBIRUWIO7gvr38YrlDLIH1iIHJrKsfa6B4XdcAE5TkveV5VytgkPFWpsh/eP
         siqSc/Ah+GoNHJhs1FNDMdCdBwnl6l8bsxYqcMtryQLPyXRPks9ZQuuoShoRN9pIhCAG
         TNT0NOKLu3/m5lf8fHXYzX+sv55dBMvq+yxM4y62QtsN3FK/IcY9GUo7hqhKi5kydADA
         5RuOYW7bjzDvtSm7BhArUibA4cGtzAGGINa78s8bqDgMar23h9Vj8Z8dq1Jb0YxEqHzG
         kms/N7tXan8yz4V8vV5MhcrnLNl3GVaczTNs43My7HXgTSWyO3UtFaCIuoIqyYuTgv7B
         Bvng==
X-Gm-Message-State: AOAM532Roxxney8wlYZcpwju6n0rirMRZieWWWWuMB38x+pUgosA4buf
        BxYMYttSFgu9b2uA7GmOoSX4BQ==
X-Google-Smtp-Source: ABdhPJy2rTrwJjkzwEbnjBlix/SQVyAjaLRROArqJUFGXbwwsBqpTnCdUXq1Bry4EYrEXx/2LauiKA==
X-Received: by 2002:a17:906:3958:b0:6fe:90ef:c4b with SMTP id g24-20020a170906395800b006fe90ef0c4bmr44916053eje.36.1653811677641;
        Sun, 29 May 2022 01:07:57 -0700 (PDT)
Received: from [192.168.0.177] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id v2-20020a509542000000b0042dcd6f9994sm595545eda.9.2022.05.29.01.07.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 29 May 2022 01:07:57 -0700 (PDT)
Message-ID: <89cc9ef4-7a6c-4dd0-3aac-8ad22d8ada2e@linaro.org>
Date:   Sun, 29 May 2022 10:07:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 1/7] ARM: dts: s3c2410: use local header for pinctrl
 register values
Content-Language: en-US
To:     Chanho Park <chanho61.park@samsung.com>,
        'Rob Herring' <robh+dt@kernel.org>,
        'Krzysztof Kozlowski' <krzysztof.kozlowski+dt@linaro.org>,
        'Alim Akhtar' <alim.akhtar@samsung.com>,
        'Tomasz Figa' <tomasz.figa@gmail.com>,
        'Sylwester Nawrocki' <s.nawrocki@samsung.com>,
        'Linus Walleij' <linus.walleij@linaro.org>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org
References: <20220526143707.767490-1-krzysztof.kozlowski@linaro.org>
 <CGME20220526143736epcas2p27f8a54ddcb91aa4a66adc287af0491c3@epcas2p2.samsung.com>
 <20220526143707.767490-2-krzysztof.kozlowski@linaro.org>
 <012d01d87181$5b9e23c0$12da6b40$@samsung.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <012d01d87181$5b9e23c0$12da6b40$@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 27/05/2022 06:22, Chanho Park wrote:
>> Subject: [PATCH 1/7] ARM: dts: s3c2410: use local header for pinctrl
>> register values
>>
>> The DTS uses hardware register values directly in pin controller pin
>> configuration.  These are not some IDs or other abstraction layer but raw
>> numbers used in the registers.
>>
>> These numbers were previously put in the bindings header to avoid code
>> duplication and to provide some context meaning (name), but they do not
>> fit the purpose of bindings.  It is also quite confusing to use constants
>> prefixed with Exynos for other SoC, because there is actually nothing here
>> in common, except the actual value.
>>
>> Store the constants in a header next to DTS and use them instead of
>> bindings.
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> ---
>>  arch/arm/boot/dts/s3c2410-pinctrl.h    | 19 +++++++++++++
>>  arch/arm/boot/dts/s3c2416-pinctrl.dtsi | 38 +++++++++++++-------------
>>  2 files changed, 38 insertions(+), 19 deletions(-)  create mode 100644
>> arch/arm/boot/dts/s3c2410-pinctrl.h
>>
>> diff --git a/arch/arm/boot/dts/s3c2410-pinctrl.h
>> b/arch/arm/boot/dts/s3c2410-pinctrl.h
>> new file mode 100644
>> index 000000000000..71cb0ac815b3
>> --- /dev/null
>> +++ b/arch/arm/boot/dts/s3c2410-pinctrl.h
>> @@ -0,0 +1,19 @@
>> +/* SPDX-License-Identifier: GPL-2.0 */
>> +/*
>> + * Samsung's Exynos pinctrl bindings
> 
> "Exynos" -> "s3c2410"
> 

Thanks, I need to fix it also in other files.

Best regards,
Krzysztof

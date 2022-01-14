Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0179C4332F
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 14 Jan 2022 07:49:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233886AbiANHtn (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 14 Jan 2022 02:49:43 -0500
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:60756
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233763AbiANHtk (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 14 Jan 2022 02:49:40 -0500
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com [209.85.208.70])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 49E0C3F1EC
        for <linux-samsung-soc@vger.kernel.org>; Fri, 14 Jan 2022 07:49:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1642146578;
        bh=OfGvrCtC8xlimA6cEB+wdrguTqUYJCj+ZRy5BPwVdRo=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=L/EgHIHbJdR8oHWtWf3LqUEgvfA86riHomk6b0iBFStDGkxfG35H4H8dfnBR6Pq1u
         INQ6IFWKTdyK5FMN+okz3qQBFsUaSeHBHMpoMqKzoli09WvF9UkQumFydLHHF6Od4k
         pF98S5YJNr247xBtWqrvVJqrb6ZTVb5GBdixRTxk5+b8bTx8gvFKq94FQmxpLm80zi
         jerHUaDo4MSiiKPlecMiFK+w+Q/wYbZtKT3B9NUGhomgiNyUotRLWEg8FRhP2Zw4dE
         p7ZDEaBsfWnezruJmFKcnuBn0c45mHEVIZTqBIP32XVUCC7+tVxiXfYGFaHOEb73vC
         XpEFBO1mNuFqQ==
Received: by mail-ed1-f70.google.com with SMTP id y18-20020a056402271200b003fa16a5debcso7624577edd.14
        for <linux-samsung-soc@vger.kernel.org>; Thu, 13 Jan 2022 23:49:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=OfGvrCtC8xlimA6cEB+wdrguTqUYJCj+ZRy5BPwVdRo=;
        b=ORKhzjTqa3AgiXcDFq4O+FJPPUnJG5khbi7sIqiFvMP9qDsgvowVYUR2MTbVNVFNEs
         64RqsGZEwonLfgpvvPqu8XzAVSWI2YSqooXzmcG5eVi3ZXIAjdzmUEVOjuyK3T5sCP2R
         bCHO+6VADalflb/VUt6ExT/7xDYtm0u3glBnqgKJb3Wil9c6FiwWheEt1lpl8jpTukVV
         htFNl7ZXo/2mYmM+XbJUozyjlqIibADvr3Tl4F18r9mrAI/Uz+0n3YH0OJbWTrz/40nV
         vphZ7By26zYpkuW3J/suwsd6yZc0HRKhm5+FmD8aL8Pgc3+TA+KU7bfxE75KG9ThGXsu
         dvsA==
X-Gm-Message-State: AOAM532nnIHmSntaPgeeyF9IhGZmo2lXjehJufg8tOhTaXCw5aCsKpSU
        A5YiFB+4f6Tb+xC7+9bnNt9tBg3zFjJGIfgUh/qDEb7mKBa03Lnugt7OF64L8EBZiCTnAj4Xvso
        HhvEUJj/ySze7l9HfK5rcdPwMY4sB8tBgaC6lshVLGfQOWmLz
X-Received: by 2002:a05:6402:2685:: with SMTP id w5mr7710422edd.151.1642146578013;
        Thu, 13 Jan 2022 23:49:38 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx28rjBXLGcKe6hIBmUk/lmPK/ygVLWajiItPMzl6kJqav/dcWM9ZuCOshtlFa/+UuDpfMTkw==
X-Received: by 2002:a05:6402:2685:: with SMTP id w5mr7710414edd.151.1642146577885;
        Thu, 13 Jan 2022 23:49:37 -0800 (PST)
Received: from [192.168.0.30] (xdsl-188-155-168-84.adslplus.ch. [188.155.168.84])
        by smtp.gmail.com with ESMTPSA id jg41sm1602954ejc.101.2022.01.13.23.49.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Jan 2022 23:49:37 -0800 (PST)
Message-ID: <65e6f034-278a-81fa-844d-10a1865a25a4@canonical.com>
Date:   Fri, 14 Jan 2022 08:49:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [PATCH 10/23] dt-bindings: pinctrl: samsung: Add compatible for
 Tesla FSD SoC
Content-Language: en-US
To:     Alim Akhtar <alim.akhtar@samsung.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc:     soc@kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, olof@lixom.net,
        linus.walleij@linaro.org, catalin.marinas@arm.com,
        robh+dt@kernel.org, s.nawrocki@samsung.com,
        linux-samsung-soc@vger.kernel.org, pankaj.dubey@samsung.com,
        linux-fsd@tesla.com
References: <20220113121143.22280-1-alim.akhtar@samsung.com>
 <CGME20220113122354epcas5p19e5cebe9e85e9ba1758fa0b9d7d1ef75@epcas5p1.samsung.com>
 <20220113121143.22280-11-alim.akhtar@samsung.com>
 <849c7772-0f7e-32ff-6ea6-c46aa6837bb4@canonical.com>
 <076101d80909$d5849060$808db120$@samsung.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <076101d80909$d5849060$808db120$@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 14/01/2022 06:44, Alim Akhtar wrote:
> 
> 
>> -----Original Message-----
>> From: Krzysztof Kozlowski [mailto:krzysztof.kozlowski@canonical.com]
>> Sent: Thursday, January 13, 2022 5:57 PM
>> To: Alim Akhtar <alim.akhtar@samsung.com>; linux-arm-
>> kernel@lists.infradead.org; linux-kernel@vger.kernel.org
>> Cc: soc@kernel.org; linux-clk@vger.kernel.org; devicetree@vger.kernel.org;
>> olof@lixom.net; linus.walleij@linaro.org; catalin.marinas@arm.com;
>> robh+dt@kernel.org; s.nawrocki@samsung.com; linux-samsung-
>> soc@vger.kernel.org; pankaj.dubey@samsung.com; linux-fsd@tesla.com
>> Subject: Re: [PATCH 10/23] dt-bindings: pinctrl: samsung: Add compatible for
>> Tesla FSD SoC
>>
>> On 13/01/2022 13:11, Alim Akhtar wrote:
>>> Add compatible for Tesla Full Self-Driving SoC. The pinctrl hardware
>>> IP is similar to what found on most of the exynos series of SoC, so
>>> this new compatible is added in samsung pinctrl binding.
>>>
>>> Cc: linux-fsd@tesla.com
>>> Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
>>> ---
>>>  Documentation/devicetree/bindings/pinctrl/samsung-pinctrl.txt | 1 +
>>>  1 file changed, 1 insertion(+)
>>>
>>> diff --git
>>> a/Documentation/devicetree/bindings/pinctrl/samsung-pinctrl.txt
>>> b/Documentation/devicetree/bindings/pinctrl/samsung-pinctrl.txt
>>> index b8b475967ff9..ba972998a0e4 100644
>>> --- a/Documentation/devicetree/bindings/pinctrl/samsung-pinctrl.txt
>>> +++ b/Documentation/devicetree/bindings/pinctrl/samsung-pinctrl.txt
>>> @@ -24,6 +24,7 @@ Required Properties:
>>>    - "samsung,exynos7-pinctrl": for Exynos7 compatible pin-controller.
>>>    - "samsung,exynos850-pinctrl": for Exynos850 compatible pin-controller.
>>>    - "samsung,exynosautov9-pinctrl": for ExynosAutov9 compatible pin-
>> controller.
>>> +  - "tesla,fsd-pinctrl": for Tesla FSD SoC compatible pin-controller.
>>>
>>
>> Please rebase this on my latest Samsung pinctrl dtschema patches. You also
>> need a tesla vendor prefix patch (separate).
>>
> Sure will rebase when sending v2, your latest patches are in Linux-next or still in your tree?

The SPI (v3) and pinctrl (v2) dtschema patches are on mailing lists.
They seem to be done, so after merge window they will make to
linux-next. If you want earlier, grab them from mailing list or from
branches:
https://github.com/krzk/linux/tree/n/dt-bindings-samsung-spi-schema-v3
https://github.com/krzk/linux/tree/n/dt-bindings-samsung-pinctrl-schema-v2


Best regards,
Krzysztof

Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 516FFC61D97
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 26 Jan 2023 13:55:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231578AbjAZNz3 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 26 Jan 2023 08:55:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47076 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231614AbjAZNzT (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 26 Jan 2023 08:55:19 -0500
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A7C202704
        for <linux-samsung-soc@vger.kernel.org>; Thu, 26 Jan 2023 05:54:49 -0800 (PST)
Received: by mail-wm1-x329.google.com with SMTP id f12-20020a7bc8cc000000b003daf6b2f9b9so3276499wml.3
        for <linux-samsung-soc@vger.kernel.org>; Thu, 26 Jan 2023 05:54:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VOWkcYiJEYSOZi2GcxiIbR4PFJ+2cQXy9po2yEM4hSM=;
        b=v+tL5e3nxmEUzfro8VIEgJVROZBG/otDR6RgziVLGb1KhQvonKbWDXNabkBdEg+1j+
         V7HhfOUmaH0V+x3uEOh2veT8ApPyz3pb36i/Odqc/4A/9qL7mLG6Ojgi8q0fuSB9LyE1
         vQajVyyKyQhiNkPmdWA9O10seinP48xPKvVNSe6abihWUJ9dEY/lWBE6Jyyea2E6m8I1
         GAUgnXQ+Hcwi8jN97KXk2ct8IYHo6exAgXyP9YQrRhqiy5zbRKXQhOwLwPnCDOD835ar
         iLJeuWT9s7g/T0PaAtNUHYV11R2AN7bIT994oWYyQGHqBEL/7cWJiY3iwez7C5b3LG7i
         RVkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VOWkcYiJEYSOZi2GcxiIbR4PFJ+2cQXy9po2yEM4hSM=;
        b=M0jbsbz3fSKBh06QYKfIq+POc4jbgxqad0Y+AfNTgZaFd4k7RVeVT5icuapZkq/5tl
         oC5XTeBVCrrqsthUo7Qo3Zu8haFmA9UzRDirR3DDfvWQRme7vyhdQafkzQVYzqW0X+IS
         9XVhtpLicLLX+ka8CcFyTgCEYCDw9KkWXeK+pTKtkcUyYIXkLwIQWZrEpJOmEtoK9qFq
         K39AyM18Gz/JBf7dgwpcfYQSkGvJPM73SAfQSmqmma20nT+R+M5SS83y3GKWu+aE3FvL
         PWmu50mVbeXt0s2D5aKc9QT8WlC01P7wTfjzdh8kzkZYufCfZKM6PM1fAtrkgzNLwV3x
         nMXg==
X-Gm-Message-State: AFqh2krMOTSItL3oJjY5SRSBphO9L4aG5lVu62EOYlRsPDGMNc32nlal
        GKtGYu06JkTsS9wg3oM+72s5OA==
X-Google-Smtp-Source: AMrXdXteF0iTaHq1hlDgy7GniH4hSyHqI8kOZKBVywiptyRXydiRVvCim8tyKFLJ6pKOUYCzJZ9mhw==
X-Received: by 2002:a05:600c:6011:b0:3cf:85f7:bbc4 with SMTP id az17-20020a05600c601100b003cf85f7bbc4mr35059143wmb.2.1674741287361;
        Thu, 26 Jan 2023 05:54:47 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id b32-20020a05600c4aa000b003db0cab0844sm1426678wmp.40.2023.01.26.05.54.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Jan 2023 05:54:46 -0800 (PST)
Message-ID: <29f1ddef-6165-951c-946c-661adf620442@linaro.org>
Date:   Thu, 26 Jan 2023 14:54:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [PATCH] dt-bindings: usb: samsung,exynos-dwc3: allow unit address
 in DTS
Content-Language: en-US
To:     Rob Herring <robh@kernel.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230125175943.675823-1-krzysztof.kozlowski@linaro.org>
 <20230125211329.GA2899932-robh@kernel.org>
 <afce38b0-be90-a3b5-f181-a88ad3025bd9@linaro.org>
 <CAL_JsqKpibaWgWXwhNFQ4U_tT0cdvUMO4attSsYqoSFmbq4RZQ@mail.gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CAL_JsqKpibaWgWXwhNFQ4U_tT0cdvUMO4attSsYqoSFmbq4RZQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 26/01/2023 14:41, Rob Herring wrote:
> On Thu, Jan 26, 2023 at 4:48 AM Krzysztof Kozlowski
> <krzysztof.kozlowski@linaro.org> wrote:
>>
>> On 25/01/2023 22:13, Rob Herring wrote:
>>> On Wed, Jan 25, 2023 at 06:59:43PM +0100, Krzysztof Kozlowski wrote:
>>>> The Samsung Exynos SoC USB 3.0 DWC3 Controller is a simple wrapper of
>>>> actual DWC3 Controller device node.  It handles necessary Samsung
>>>> Exynos-specific resources (regulators, clocks), but does not have its
>>>> own MMIO address space.
>>>>
>>>> However neither simple-bus bindings nor dtc W=1 accept device nodes in
>>>> soc@ node which do not have unit address.  Therefore allow using
>>>> the address space of child device (actual DWC3 Controller) as the
>>>> wrapper's address.
>>>
>>> The correct fix is 'ranges' should have a value. Though the whole
>>> wrapper thing when there are no registers I dislike...
>>
>> You mean something like this (diff against this patchset):
>> ----------
>> diff --git a/arch/arm/boot/dts/exynos54xx.dtsi
>> b/arch/arm/boot/dts/exynos54xx.dtsi
>> index 08786fd9c6ea..75b6f9678672 100644
>> --- a/arch/arm/boot/dts/exynos54xx.dtsi
>> +++ b/arch/arm/boot/dts/exynos54xx.dtsi
>> @@ -142,16 +142,15 @@ hsi2c_7: i2c@12cd0000 {
>>                         status = "disabled";
>>                 };
>>
>> -               usbdrd3_0: usb-wrapper@12000000 {
>> +               usbdrd3_0: usb-wrapper {
> 
> Why did you drop the unit-address? Unit-address is valid with 'reg' or 'ranges'.

I misunderstood your comment then. To which problem did you refer with
"The correct fix is ranges ...."? To my understanding this only changes
the unit address, so I won't have to change the node name
usb->usb-wrapper. Except this, my patches having empty ranges are
equivalent.


> 
>>                         compatible = "samsung,exynos5250-dwusb3";
>> -                       reg = <0x12000000 0x10000>;
>>                         #address-cells = <1>;
>>                         #size-cells = <1>;
>> -                       ranges;
>> +                       ranges = <0x0 0x12000000 0x10000>;
>>


Best regards,
Krzysztof


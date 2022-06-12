Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 457D9CCA473
	for <linux-samsung-soc@archiver.kernel.org>; Sun, 12 Jun 2022 17:06:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231791AbiFLRGP (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sun, 12 Jun 2022 13:06:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38170 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229864AbiFLRGO (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sun, 12 Jun 2022 13:06:14 -0400
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A8B1F4093D
        for <linux-samsung-soc@vger.kernel.org>; Sun, 12 Jun 2022 10:06:12 -0700 (PDT)
Received: by mail-ej1-x634.google.com with SMTP id gl15so6980103ejb.4
        for <linux-samsung-soc@vger.kernel.org>; Sun, 12 Jun 2022 10:06:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:in-reply-to:content-transfer-encoding;
        bh=e1j5oNyWe6LjPGibCsOkD4pe/7KGmuvi3WqbEeyX52A=;
        b=axtd06CitJ9XTEQlj/DgAkzQO7gwwugoWwZY1AE+3Zgrmx9g1bJNWCNMLWlwF3iEl4
         GhYCjZ1F7rhF6iZMCV3zMH+89SbmhW1HYE2LWqQReDf2b8zTolL4VWga094dShEhTncU
         rXBUN7y3Juwybt8Udriw5j+nE2KAu+rQwc9it6aEmgN54efusB7QLYAaiLredlUnFdpx
         o8Zp+1zZeXtNqmAXKQQzRBNOqMx9wixdGTeA+zOfuR7gU+lFX57Rn3kpULfWzeHw4sfP
         riHzAZNZ4FYDkUtThXbRlJuV1Huhu/47lyl7C8BI7SiPecrv8yOniALBcDn26/A9LB+s
         c3PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=e1j5oNyWe6LjPGibCsOkD4pe/7KGmuvi3WqbEeyX52A=;
        b=UQ/ydxDlnUHLpU9EXDBqfcFBXE37ubFZQ6klFXuJXgYowASbR7GifGHKEgtwbSgSyA
         +IogRMNw2PVuhNXKsGPTzkgEH7ovsW8MwI4jgSrtFsLwasG/nmdBokGth80rz71l6AwT
         a1+A2gsamut/4qdyj1dN2gkpLXna9FJ5jiG57vk+EsOs/cn9MLKHCtHihUQICRQbSKXK
         EZYaPiiDP+0J5OSiCyuzEXYRkq6InXz9RrDNoYT9vffjver19kuy7vwb1uxDaSshmdHb
         YJZ9NerToQlxECtmeBrzUwzLQALK6QpXzFWg/RN+Xwkvbpzuuk1L7omP9ACJVa6eLmYC
         OpaQ==
X-Gm-Message-State: AOAM532ONp9jJNkOi915N51ZpT8HglGPSlcgJOzzGhzWr5hwnFjXr6pI
        b5RmA1Tx1ueP++08pUhiBQvXnQ==
X-Google-Smtp-Source: ABdhPJywtatBoFfH74/PESsNXnL7SJhTfWWSGNB3lg0vls4R1pXgQ7dz3i5/bNXUiIxLtCTPyo5tTQ==
X-Received: by 2002:a17:906:804a:b0:70c:1dac:9bb8 with SMTP id x10-20020a170906804a00b0070c1dac9bb8mr46957960ejw.92.1655053571275;
        Sun, 12 Jun 2022 10:06:11 -0700 (PDT)
Received: from [192.168.0.203] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id pv17-20020a170907209100b00704757b1debsm2675740ejb.9.2022.06.12.10.06.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 12 Jun 2022 10:06:10 -0700 (PDT)
Message-ID: <f1cc0f5a-12fb-28bc-7345-13ac2bf5b74d@linaro.org>
Date:   Sun, 12 Jun 2022 19:06:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 3/3] ARM: dts: exynos: add function and color to aat1290
 flash LED node in Galaxy S3
Content-Language: en-US
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org,
        Simon Shields <simon@lineageos.org>,
        =?UTF-8?Q?Martin_J=c3=bccker?= <martin.juecker@gmail.com>
References: <20220607085343.72414-1-krzysztof.kozlowski@linaro.org>
 <20220607085343.72414-3-krzysztof.kozlowski@linaro.org>
 <4a7f8ab6-c061-3861-5790-b6c0fbd7cad1@gmail.com>
 <ef62a7bb-2217-2947-17dd-fc4a51acdea5@linaro.org>
 <f1402a1d-a74d-f7b9-b9e2-fc3991781e64@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <f1402a1d-a74d-f7b9-b9e2-fc3991781e64@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 12/06/2022 17:09, Jacek Anaszewski wrote:
> On 6/10/22 12:14, Krzysztof Kozlowski wrote:
>> On 09/06/2022 22:31, Jacek Anaszewski wrote:
>>> Hi Krzysztof,
>>>
>>> On 6/7/22 10:53, Krzysztof Kozlowski wrote:
>>>> Add common LED properties - the function and color - to aat1290 flash
>>>> LED node in Galaxy S3.
>>>>
>>>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>>> ---
>>>>    arch/arm/boot/dts/exynos4412-galaxy-s3.dtsi | 3 +++
>>>>    1 file changed, 3 insertions(+)
>>>>
>>>> diff --git a/arch/arm/boot/dts/exynos4412-galaxy-s3.dtsi b/arch/arm/boot/dts/exynos4412-galaxy-s3.dtsi
>>>> index 72901772fcad..d76f3678dcab 100644
>>>> --- a/arch/arm/boot/dts/exynos4412-galaxy-s3.dtsi
>>>> +++ b/arch/arm/boot/dts/exynos4412-galaxy-s3.dtsi
>>>> @@ -7,6 +7,7 @@
>>>>     */
>>>>    
>>>>    /dts-v1/;
>>>> +#include <dt-bindings/leds/common.h>
>>>>    #include "exynos4412-midas.dtsi"
>>>>    
>>>>    / {
>>>> @@ -27,6 +28,8 @@ led-controller {
>>>>    
>>>>    		led {
>>>>    			label = "flash";
>>>> +			function = LED_FUNCTION_FLASH;
>>>> +			color = <LED_COLOR_ID_WHITE>;
>>>
>>> Addition of these two properties will not change anything because
>>> the label has precedence. It is deprecated, but if you introduce
>>> function and color to the binding instead of the label, the resulting
>>> LED class device name will change.
>>
>> Which is not necessarily what we want, right? Adding these properties is
>> a proper description of hardware, regardless whether current Linux
>> implementation uses them or not.
> 
> Actually I'd just drop label in addition to your change.
> I don't think it would break anybody seriously - not expecting it has
> any larger group of users and having uniformly constructed DTS files
> in the mainline has greater value.
> 

What about some PostmarketOSos, LineageOS and other OSes?

Let me Cc here some folks - Simon, Martin, is the label in flash LED
node anyhow important for you? Can it be dropped and replaced with
function+color?

https://lore.kernel.org/all/20220607085343.72414-3-krzysztof.kozlowski@linaro.org/

Best regards,
Krzysztof

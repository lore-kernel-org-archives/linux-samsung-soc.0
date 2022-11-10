Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C80BC43217
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 10 Nov 2022 12:11:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230164AbiKJMLt (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 10 Nov 2022 07:11:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59742 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230088AbiKJMLs (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 10 Nov 2022 07:11:48 -0500
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4D73B1C10C
        for <linux-samsung-soc@vger.kernel.org>; Thu, 10 Nov 2022 04:11:47 -0800 (PST)
Received: by mail-lf1-x133.google.com with SMTP id g12so2849030lfh.3
        for <linux-samsung-soc@vger.kernel.org>; Thu, 10 Nov 2022 04:11:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aUr5GXIjetvqmUBwd3OtcqUULVb7fxkMKk71ECylmYw=;
        b=RzyNMkWzQlNRGMQ957yXWjjTYMYk7hzfCSHU1jaMZgEqtfEqUeKD7s0EqNNelwbla/
         zLzofOCr1d5Lls5/HC4vMnMmmLeY+f9i+e7wJOJaKrQ2aLSDUh4E8GsXxebYXiNJfc/h
         2qO+VAxgS21tYwsT+4DmnnVopOvBBJXtjoGdemSeN9paDBtp3q6woONXUXgTIm6vSzcC
         4rmMFx2BrSQKf44mI+SGjjVAgceQpgFOcnP0cxVfAFnZeh+SWgtX+97s3O8kQ17CKE4C
         b9GYlRXf6EFpJDv/5HF1D8GYBHt0AN29xspQ5xe5SMfNxU90aCukLPlFilxC1m7wic0x
         5zcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aUr5GXIjetvqmUBwd3OtcqUULVb7fxkMKk71ECylmYw=;
        b=fH+RMkFunzEqXEjzfHKx5Enr0I7N4oOZBDV2xLyxRwBydeZsQ6uyWKY8eL6K5331KO
         f6I6564vRzLqAEMQvQ0ZmVolzZ4TLDNFsC1+WDrAs9o6rOEQAdNtGCzqtvnRaU/holzA
         F7+Rl9GCXChrYzoQHecY9RT7yA+znKE5rtF2ls3RYe3M2rpwhBXXzkd8mXzpEModCrhQ
         60ogwngKsuS8J5dl5GFcD6rBbknqrI13acqgoiUJfK9VXlUHrE0OgyRuPjEJgQnz/Jbc
         2DF0Jc5YCFIogGEvUV4lQhTochShJtymVo5S5Ig2vSG3AqpY3v+QEZqj1G4e0GhQ21bn
         m3wg==
X-Gm-Message-State: ACrzQf1RgPthWMZ5+lRHuPBG7utw/IAsh4QixrslUin/m7GLiwCYlczu
        ItZ2gEcuXH4qKTednydosryEQQ==
X-Google-Smtp-Source: AMsMyM4PW+P3N9qX9jt9EOP+3xYgM36df0Ws9nuyGcbcwoI6cdOiJLl8jW4SGeWSSWFhsK9tt/83CQ==
X-Received: by 2002:ac2:5f88:0:b0:4a7:8afe:b741 with SMTP id r8-20020ac25f88000000b004a78afeb741mr21323207lfe.15.1668082305520;
        Thu, 10 Nov 2022 04:11:45 -0800 (PST)
Received: from [192.168.0.20] (088156142199.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.199])
        by smtp.gmail.com with ESMTPSA id f10-20020a056512360a00b004ac088fdfd2sm2727049lfs.85.2022.11.10.04.11.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Nov 2022 04:11:44 -0800 (PST)
Message-ID: <277004ed-3b6b-4ee5-39e4-beb75a272e60@linaro.org>
Date:   Thu, 10 Nov 2022 13:11:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v2 1/6] dt-bindings: Document the SYSREG specific
 compatibles found on FSD SoC
Content-Language: en-US
To:     Vivek Yadav <vivek.2311@samsung.com>, rcsekar@samsung.com,
        krzysztof.kozlowski+dt@linaro.org, wg@grandegger.com,
        mkl@pengutronix.de, davem@davemloft.net, edumazet@google.com,
        kuba@kernel.org, pabeni@redhat.com, pankaj.dubey@samsung.com,
        ravi.patel@samsung.com, alim.akhtar@samsung.com,
        linux-fsd@tesla.com, robh+dt@kernel.org
Cc:     linux-can@vger.kernel.org, netdev@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
        aswani.reddy@samsung.com, sriranjani.p@samsung.com
References: <20221109100928.109478-1-vivek.2311@samsung.com>
 <CGME20221109100245epcas5p38a01aed025f491d39a09508ebcdcef84@epcas5p3.samsung.com>
 <20221109100928.109478-2-vivek.2311@samsung.com>
 <709daf8b-a58e-9247-c5d8-f3be3e60fe70@linaro.org>
 <000001d8f4f6$1c7e96e0$557bc4a0$@samsung.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <000001d8f4f6$1c7e96e0$557bc4a0$@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 10/11/2022 12:18, Vivek Yadav wrote:
>>> +maintainers:
>>> +  - Alim Akhtar <alim.akhtar@samsung.com>
>>> +
>>> +description: |
>>> +  This is a system control registers block, providing multiple low
>>> +level
>>> +  platform functions like board detection and identification,
>>> +software
>>> +  interrupt generation.
>>> +
>>> +properties:
>>> +  compatible:
>>> +    oneOf:
>>
>> No need for oneOf.
>>
> Removing this results into dt_binding_check error, so this is required.

No, this is not required. You do not have more than one condition for oneOf.

>>> +      - items:
>>> +          - enum:
>>> +              - tesla,sysreg_fsys0
>>> +              - tesla,sysreg_peric
>>
>> From where did you get underscores in compatibles?
>>
> I have seen in MCAN Driver <drivers/net/can/m_can/m_can_platform.c> and also too many other yaml files.
> Do you have any ref standard guideline of compatible which says underscore is not allowed.

git grep compatible arch/arm64/boot/dts/exynos/ | grep _
git grep compatible arch/arm/boot/dts/exynos* | grep _

Both give 0 results. For few other SoCs there such cases but that's
really, really exception. Drop underscores.


Best regards,
Krzysztof


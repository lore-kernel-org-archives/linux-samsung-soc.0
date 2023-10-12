Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4617ECDB46E
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 12 Oct 2023 20:03:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1442583AbjJLUDc (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 12 Oct 2023 16:03:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41362 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347375AbjJLUDb (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 12 Oct 2023 16:03:31 -0400
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B3C59D8
        for <linux-samsung-soc@vger.kernel.org>; Thu, 12 Oct 2023 13:03:28 -0700 (PDT)
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-40535597f01so14245975e9.3
        for <linux-samsung-soc@vger.kernel.org>; Thu, 12 Oct 2023 13:03:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697141007; x=1697745807; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XFXAdZ+DOyTqhVoDf02smI8kk3bzOohuxtlB2qnoM+k=;
        b=YzZEc2Av3ejshLKoI/ixT1QBzG4ZiN9AKVlvB1blDgxm5RmfOSLLjfhAN28Np/Fdht
         AkKgCV6+6CYuHOyG7hc5YlWobq1CylyXP98Bc7fXs3CMIMR6ZujQkWwPdO6unfzY2cCC
         9mVL+ZW7WtM1dk6b9WFzr/n/yq+UgrQC/tk/55nyZkYNGFKzCYITMu5NDpSZP3u3Lntt
         STTFKgfzh/GwEXBFHkHPhjiCaSW3hw5s35RPnbs6aNanpD8K7Adrm2ZTjwTMjgMTB3Io
         bf7UI7hLIwylKjveR7gD840/BxrZvzSLtOPIMh6lwtdr+DnDqX2YheQJoH2ekWHPTnfD
         mzUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697141007; x=1697745807;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XFXAdZ+DOyTqhVoDf02smI8kk3bzOohuxtlB2qnoM+k=;
        b=hQB+dW2ZWwhB8KURQFonpiEReKxftwUMYCl7nqIL+2V01bGkVEOaqgkUSl43ICwiZt
         L6QunAc5gYuLIk+HiI1Y8q4HPLCUgpNKxc7PtoDf+MYufaOlJ732hB3MuzWoEOT7GRte
         bH/wybjouFgN2ua+/RQX1GjcG0wmCeZXqtEo3G6Xx2vBlcgMIfQoLI7MZaPet9psWfxJ
         JIYpbQPripzAFygQuj7t6G7JGilSFjYhIIswsU1B2t+J0it0ux0XFj0CgbXwmHg1pJDD
         s28zCKAKRbK1gMIcjPHE1u12fuPtCuIkaPXbGsQVRl2aatjKdEYsIaiWYEdYHlMrHRu9
         dgBw==
X-Gm-Message-State: AOJu0YwV3hSi7U2E0PFGoiBQBmkwSwJDfKxuea6mA6yYHULoXSrL/ai0
        PGVZPZ7hCoVYmNTCJKJnV2atsg==
X-Google-Smtp-Source: AGHT+IGjkAQ86wK69Ci5LhI94Gj/nMXk/RGVVGqelXPAbRFUmgl1V3u2voLRTcE1BA5ZnI5bc9/98A==
X-Received: by 2002:a7b:cb89:0:b0:406:54e4:359c with SMTP id m9-20020a7bcb89000000b0040654e4359cmr21877824wmi.19.1697141007139;
        Thu, 12 Oct 2023 13:03:27 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.100])
        by smtp.gmail.com with ESMTPSA id s15-20020a05600c044f00b0040747010f8csm660770wmb.40.2023.10.12.13.03.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Oct 2023 13:03:26 -0700 (PDT)
Message-ID: <72cf8478-9683-4ea8-830f-fcb46b583f2b@linaro.org>
Date:   Thu, 12 Oct 2023 22:03:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: exynos: Add reserved memory for pstore on
 E850-96
Content-Language: en-US
To:     Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Sam Protsenko <semen.protsenko@linaro.org>
Cc:     Conor Dooley <conor+dt@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Kees Cook <keescook@chromium.org>,
        Tony Luck <tony.luck@intel.com>,
        "Guilherme G. Piccoli" <gpiccoli@igalia.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-hardening@vger.kernel.org
References: <20231008033633.21304-1-semen.protsenko@linaro.org>
 <169714096778.12426.2726125345142435040.b4-ty@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <169714096778.12426.2726125345142435040.b4-ty@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 12/10/2023 22:02, Krzysztof Kozlowski wrote:
> 
> On Sat, 07 Oct 2023 22:36:33 -0500, Sam Protsenko wrote:
>> Reserve a 2 MiB memory region to record kmsg dumps, console, ftrace and
>> userspace messages. The implemented memory split allows capturing and
>> reading corresponding ring buffers:
>>   * dmesg: 6 dumps, 128 KiB each
>>   * console: 128 KiB
>>   * ftrace: 128 KiB for each of 8 CPUs (1 MiB total)
>>   * userspace messages: 128 KiB
>>
>> [...]
> 
> Applied, thanks!
> 
> [1/1] arm64: dts: exynos: Add reserved memory for pstore on E850-96
>       https://git.kernel.org/krzk/linux/c/23e4a49943624dd83199989c852565a3ff760fa7

Thanks, applied.
It is however very late in the cycle, so there is a chance this will
miss the merge window. If this happens, I will keep it for the next
cycle (no need for resending).

Best regards,
Krzysztof


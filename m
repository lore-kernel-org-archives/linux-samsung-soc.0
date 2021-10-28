Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92ADDC433EF
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 28 Oct 2021 14:35:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7881D60F58
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 28 Oct 2021 14:35:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231151AbhJ1Ohv (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 28 Oct 2021 10:37:51 -0400
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:40886
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230406AbhJ1Ohu (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 28 Oct 2021 10:37:50 -0400
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com [209.85.167.71])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 1ADA13F178
        for <linux-samsung-soc@vger.kernel.org>; Thu, 28 Oct 2021 14:35:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1635431718;
        bh=UfC6Za7EDXnJsTRiZd6ux4jhSdUioPONKZicpxuGsRs=;
        h=To:Cc:References:From:Subject:Message-ID:Date:MIME-Version:
         In-Reply-To:Content-Type;
        b=fnhFYy4c4Bt+u5eRwAL/KMxO86pfdwSXA0Y/yBOF7lmvN8DTyKOPmaS7xsQTHpN+F
         fvUkEuVMGpB2T6Mh0XY76zGK2WUBxp8VnJ9mm4KpX4a7aO+rFuU3IGMfg8CRfRhBY4
         x/l7hCXDGFU1oV6WoqrsT1KUIiTKDeK4cA1JQ5QHT2hEmOyIuVHeK9ZghQk6tW4KUm
         erH25E2x7CZCQ1bG/Zksa5kUFLdWtaNWRS4uOZq7JX9yVhbqLtmmRMlc/p+Un47VUm
         Ha1utDBNfqKRyQtjs5Ow/AY1Fj7lHPng4IcERo7uRWmjwl8x/lXAd6CF6TFVytmVH1
         clfVZqogfhTOw==
Received: by mail-lf1-f71.google.com with SMTP id g6-20020a0565123b8600b003ffa7685526so2914717lfv.21
        for <linux-samsung-soc@vger.kernel.org>; Thu, 28 Oct 2021 07:35:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:to:cc:references:from:subject:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=UfC6Za7EDXnJsTRiZd6ux4jhSdUioPONKZicpxuGsRs=;
        b=RsOdjVi+8GdsC6MbIhhRraZRHfUe+UHSaVYPA3pLF6kN1i+l2U4ByF9jCk8M38pZE6
         WHMrbM8Y+qTMjzJwM6inzAo7s+kaQ++Z3XF1fJ6jVHAptAXTsqfPAM4xd7To1BFo/bmy
         LLFjGLimVREA9QseFXAqbEp+vvfyHLnFMiutyqTLWKfV7nEeVG2BpTErUpqS4RaNiUsS
         9dW6eMA2Oni7XllZLy6oUnPyY/Q50vqc0H31S8xXoQyX+1pI1qsl2nsJsGC7euThm6th
         kPDzsn/1IELP7Ej0F8lbBBX894K1IKaL+/mjv42iqpFkeqgi2rxhKzRc5xMkWTarGrE/
         sAhg==
X-Gm-Message-State: AOAM532kSQVPS5Ka4kUna/g8J1RE4PVnq+a047FfyzpmIiy8cYcUOXl/
        i5tX2/PiuPwopU5FP6x4CZmI6FKIbjpJnRTCSn+UVF0APD6BZbO72h6x0fAqjTxSrfOlPmrnKio
        P5sMYFVsYonCRTBjCodZYlegKhrfbeodAQVo5PoDNp/pusuMQ
X-Received: by 2002:a2e:a5c4:: with SMTP id n4mr5077031ljp.72.1635431717486;
        Thu, 28 Oct 2021 07:35:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwOEC4wlvcyuWLOfhIzSL5cyZfWYsGZ42k2Uja8j5sZ/fOp+hWKTyEyakkGWhuywzdmU+vZXw==
X-Received: by 2002:a2e:a5c4:: with SMTP id n4mr5077012ljp.72.1635431717324;
        Thu, 28 Oct 2021 07:35:17 -0700 (PDT)
Received: from [192.168.3.161] (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
        by smtp.gmail.com with ESMTPSA id u7sm292697lju.103.2021.10.28.07.35.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Oct 2021 07:35:16 -0700 (PDT)
To:     Sam Protsenko <semen.protsenko@linaro.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>
Cc:     linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Samsung SOC <linux-samsung-soc@vger.kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Will Deacon <will@kernel.org>,
        Marc Zyngier <marc.zyngier@arm.com>,
        Catalin Marinas <catalin.marinas@arm.com>
References: <20211026115916.31553-1-semen.protsenko@linaro.org>
 <8b3466f1-2b16-80ca-79c7-577860fc90aa@canonical.com>
 <CAPLW+4=YizLzdiZ1mdCGxvPCTYhNjeiomO=q=4Xk-ZxqqH++nA@mail.gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Subject: Re: [PATCH] arm64: Kconfig: Enable MCT timer for ARCH_EXYNOS
Message-ID: <e01b0072-008a-c83d-59b2-2174860c00fd@canonical.com>
Date:   Thu, 28 Oct 2021 16:35:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <CAPLW+4=YizLzdiZ1mdCGxvPCTYhNjeiomO=q=4Xk-ZxqqH++nA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 28/10/2021 16:22, Sam Protsenko wrote:
> On Tue, 26 Oct 2021 at 17:03, Krzysztof Kozlowski
> <krzysztof.kozlowski@canonical.com> wrote:
>>
>> On 26/10/2021 13:59, Sam Protsenko wrote:
>>> Some ARM64 Exynos SoCs have MCT timer block, e.g. Exynos850 and
>>> Exynos5433. CLKSRC_EXYNOS_MCT option is not visible unless COMPILE_TEST
>>> is enabled. Select CLKSRC_EXYNOS_MCT option for ARM64 ARCH_EXYNOS like
>>> it's done in arch/arm/mach-exynos/Kconfig, to enable MCT timer support
>>> for ARM64 Exynos SoCs.
>>>
>>> Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
>>> ---
>>>  arch/arm64/Kconfig.platforms | 1 +
>>>  1 file changed, 1 insertion(+)
>>>
>>
>> +CC Marek, Marc, Mark and Chanwoo,
>> Looks like duplicated:
>> https://lore.kernel.org/lkml/20181018095708.1527-7-m.szyprowski@samsung.com/
>>
>> The topic stalled and I think this particular patch did not make sense
>> on its own, without rest of changes from Marek. I am not sure, though...
>>
> 
> Krzysztof, Marek,
> 
> That series looks nice, I'm quite interested in that being applied. Do
> you think I can do something to help with that (e.g. rebasing,
> re-sending on behalf of Marek, testing on Exynos850, etc)?

I think there were no objections against v4 of this patchset, but
somehow it wasn't applied.

Marek,
Does it make sense to try respinning your v4?

Best regards,
Krzysztof

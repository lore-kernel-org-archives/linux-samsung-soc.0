Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2F07C433F5
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 23 Nov 2021 14:33:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237600AbhKWOgP (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 23 Nov 2021 09:36:15 -0500
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:48408
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S236094AbhKWOgP (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 23 Nov 2021 09:36:15 -0500
Received: from mail-lj1-f199.google.com (mail-lj1-f199.google.com [209.85.208.199])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 82A663F334
        for <linux-samsung-soc@vger.kernel.org>; Tue, 23 Nov 2021 14:33:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1637677986;
        bh=326lX9wKN3/1y9kKpgPOdcQdOWe03RNWKQRp4t2W+xU=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=bLqPT386flnbW3ygo+RnVDIAXxx088yzyxx6dfBlc1Dl2kJq1166oxhZPRojxYRdC
         gcA8QD/3wKlciEo8K/5Bycwa3PL3J9kaLIAR9uqk2Ef7ZxYUaKs7DgfEwevdSQH5VS
         +o6Qr5fOkCGVYh80VP+jcZ6nuJZz6NkC2493UQODKj8ocM5w1jI46/S3bZyR0b5+4J
         Sx8Lglu9cntyCuNRWHXeFCHtEzy1No6B7yqUlaqCrNUDtAWv4WHAu8roFK+WwT1kk+
         r0fPs95YcNg4pWvgSVYvkzcLubinqWett2u3qU2YShULba3tWi68RRZai98uhM7Ae1
         Jjp2giMiZkbNg==
Received: by mail-lj1-f199.google.com with SMTP id w16-20020a05651c103000b00218c9d46faeso1283156ljm.2
        for <linux-samsung-soc@vger.kernel.org>; Tue, 23 Nov 2021 06:33:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=326lX9wKN3/1y9kKpgPOdcQdOWe03RNWKQRp4t2W+xU=;
        b=NpsS5GCW0WrGYBIQkl1IkHP9xlMywScMwhrVP2aYAC3lxdGj1dDugkQKTgNLWyz/rc
         fldPzXyC1vWa7ztMlBwqiEk6qiIWhKJ8z0JnSdSBe33NjGxVoIjWQKCfnlxqukC3U7IV
         Q0H9wmRPwpk55/VhaUnd1igMBoBr9hYTJspZUFdhNEVfQpVQ4Zp11ihxIGI9AFk1Hgm4
         FPFf9azlAwEp85GD9spdw3d9OYpO1r/55WRNugVVAdVLqSXZJ270lYh+xqh7tdetsCMq
         S0kesvqIjG8WGZfmS4dWx7c1nYPq96AApzRWPY2w+NXEPZCqPwWBT1o9Q2shtzffTsav
         zUsQ==
X-Gm-Message-State: AOAM533DsCZSqoePWxSMUlStXgGz1iQgVgKmBJX/Ic59HfyRFV4gYKZl
        cy2e7N5/n5G1hEaPD8JzlesLXcJDo/MuTvvyET3FGEllqHbodi0rKQVj/YVRyZfVKeIWnsX0I0u
        K3+MLTVv3oyoJV+9wXFQqE7o0Lomdemft3x6fT+1BrFi9rU2Q
X-Received: by 2002:a05:6512:b14:: with SMTP id w20mr5251208lfu.164.1637677985433;
        Tue, 23 Nov 2021 06:33:05 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxAoLYTYv1mA1Qx4opkloKhYUlBeDO3gycqIznTJnAjclz2I4jG06bG8BDKv9AWk0WH0TnkUQ==
X-Received: by 2002:a05:6512:b14:: with SMTP id w20mr5251166lfu.164.1637677985240;
        Tue, 23 Nov 2021 06:33:05 -0800 (PST)
Received: from [192.168.3.67] (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
        by smtp.gmail.com with ESMTPSA id b27sm1294737ljf.52.2021.11.23.06.33.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Nov 2021 06:33:04 -0800 (PST)
Message-ID: <72275adf-7c45-bd3c-7e2c-57dafa7af4de@canonical.com>
Date:   Tue, 23 Nov 2021 15:33:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
Subject: Re: (subset) [PATCH 2/2] arm64: platform: Enable Exynos Multi-Core
 Timer driver
Content-Language: en-US
To:     Sam Protsenko <semen.protsenko@linaro.org>
Cc:     Thomas Gleixner <tglx@linutronix.de>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20211101193531.15078-1-semen.protsenko@linaro.org>
 <20211101193531.15078-3-semen.protsenko@linaro.org>
 <163705825120.25687.5616659207045424814.b4-ty@canonical.com>
 <CAPLW+4kYza+oKy5qj8H+_ojdLDrvU6VSEYfQ5K8TkidhC5omrg@mail.gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <CAPLW+4kYza+oKy5qj8H+_ojdLDrvU6VSEYfQ5K8TkidhC5omrg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 23/11/2021 14:32, Sam Protsenko wrote:
> On Tue, 16 Nov 2021 at 12:24, Krzysztof Kozlowski
> <krzysztof.kozlowski@canonical.com> wrote:
>>
>> On Mon, 1 Nov 2021 21:35:31 +0200, Sam Protsenko wrote:
>>> From: Marek Szyprowski <m.szyprowski@samsung.com>
>>>
>>> Some ARM64 Exynos SoCs have MCT timer block, e.g. Exynos850 and
>>> Exynos5433. CLKSRC_EXYNOS_MCT option is not visible unless COMPILE_TEST
>>> is enabled. Select CLKSRC_EXYNOS_MCT option for ARM64 ARCH_EXYNOS like
>>> it's done in arch/arm/mach-exynos/Kconfig, to enable MCT timer support
>>> for ARM64 Exynos SoCs.
>>>
>>> [...]
>>
>> Applied, thanks!
>>
>> [2/2] arm64: platform: Enable Exynos Multi-Core Timer driver
>>       commit: ddb0fc6f055d12518b724fd1ee00669e07f03b96
>>
> 
> Hi Krzysztof,
> 
> Can you please let me know where exactly this one is applied? I've
> checked your tree and linux-next, but wasn't able to find it.
> 


It's in my tree. It should be also in linux-next since it was applied a
week ago. Commit msg seems valid.

Best regards,
Krzysztof

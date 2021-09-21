Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40C74C433EF
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 21 Sep 2021 18:21:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 17BF961211
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 21 Sep 2021 18:21:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232812AbhIUSWh (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 21 Sep 2021 14:22:37 -0400
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:34232
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233389AbhIUSWU (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 21 Sep 2021 14:22:20 -0400
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com [209.85.221.71])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 1454B40192
        for <linux-samsung-soc@vger.kernel.org>; Tue, 21 Sep 2021 18:20:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1632248451;
        bh=s1x0s0nZoSfkDljorxbVXRoxNOeXqYSIOV8lCyGgV/M=;
        h=To:Cc:References:From:Subject:Message-ID:Date:MIME-Version:
         In-Reply-To:Content-Type;
        b=qJooB4jGj3OJliqshupggDLhPTPiWquvNT2XiJvbGYjzoJfyiBgpDUWa1ZrHI37OW
         qLBSI+/Ajf4qoh3GnvW1wrwEg+CwYu0qY7zHEAU6szoDbFkJ0fNaI5hX6IDn+KuYMS
         M1BrBmcf709WEtpUVDNePMIiFKjtnpTB1AOuV+EXXbRNbcJTUhTcIMxX0C1i8JIbJ6
         tQMhYbmqRdRmnsgP6+aQpbb3PH/rZIFT1Jo2njJJISGA5THenxJ3XFM/XtKcsQKz92
         FgR7IxUkLIHqSu+iwytzTH8Xr9rr724s3eHr7NZzTU7jdHiHvecRrfjTtpQ3r+FlDn
         Tqbx6E+0fQ4fg==
Received: by mail-wr1-f71.google.com with SMTP id v1-20020adfc401000000b0015e11f71e65so9576541wrf.2
        for <linux-samsung-soc@vger.kernel.org>; Tue, 21 Sep 2021 11:20:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:to:cc:references:from:subject:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=s1x0s0nZoSfkDljorxbVXRoxNOeXqYSIOV8lCyGgV/M=;
        b=ZKZQo0cR3uTIgzLtUuC8099J9KyWPjv6M8W/1Xd3dx3FMSCVP4p/Nm6Bas1qskAVCN
         ZvZxHh1krfXnjAQJiCNR4qZ5Ca02mu5LnBHIrpOHoabKHACFRujgX6gKDSgD+p1tCnOg
         IEjNngy4ZLdQMqaN6NCfIViHAWBIi3J1tdOC0coj4URuoNaVXqLn9qb3yoovwsfLuFgC
         tOWegu1/AHhl7uVPNpOKdCZ1YKCYZVDKoJOSzAzFoMd2+cp2985MXMhb92p/gH/hZ+fp
         jW79t+oiHOq/MkrSvzQTpOfygXP0sjdBGQbBvwHsYBhiQpMJS0y5D5aJQT4fOMP9SQrh
         sN9Q==
X-Gm-Message-State: AOAM530cWzBr4U4SUDVKL3QInL2dD5zNLtqMUdSGpf8MQB9ppQ5pbHfE
        xvtI8edN54NZjeyQaUOiWOXO4b7icjS5ktp9fqJUd20eS+ICKtGfRmeIqxLgonvIx3/IxNWz/pF
        xy8RFgZBB6vuX638YnsP268inPtRCDgh98utPmpNwKXKT7TrT
X-Received: by 2002:a1c:7714:: with SMTP id t20mr6116131wmi.163.1632248450030;
        Tue, 21 Sep 2021 11:20:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwzFXWldxf5QmNutieh/xiyRvCC3i4k/pd4YG3SgGB01SyUaFQH3M57JkcGsRr4RuTJRGTbMw==
X-Received: by 2002:a1c:7714:: with SMTP id t20mr6116109wmi.163.1632248449844;
        Tue, 21 Sep 2021 11:20:49 -0700 (PDT)
Received: from [192.168.0.134] (lk.84.20.244.219.dc.cable.static.lj-kabel.net. [84.20.244.219])
        by smtp.gmail.com with ESMTPSA id l124sm3715171wml.8.2021.09.21.11.20.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Sep 2021 11:20:49 -0700 (PDT)
To:     Will McVicker <willmcvicker@google.com>,
        Lee Jones <lee.jones@linaro.org>
Cc:     Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        "Cc: Android Kernel" <kernel-team@android.com>,
        linux-arm-kernel@lists.infradead.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-samsung-soc@vger.kernel.org
References: <20210920190350.3860821-1-willmcvicker@google.com>
 <20210920190350.3860821-3-willmcvicker@google.com>
 <2b48a41a-9130-b4cc-40d3-0bc7930ac76a@canonical.com>
 <YUmVj80m/rEC2mT7@google.com>
 <CABYd82a4OwxHNUUmUtBmTpSvWLu-f4sepHMF49kPQtWLU3MkDA@mail.gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Subject: Re: [PATCH v1 2/4] soc: samsung: change SOC_SAMSUNG default config
 logic
Message-ID: <ad2de848-8fce-f275-25de-83a886243645@canonical.com>
Date:   Tue, 21 Sep 2021 20:20:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <CABYd82a4OwxHNUUmUtBmTpSvWLu-f4sepHMF49kPQtWLU3MkDA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 21/09/2021 19:45, Will McVicker wrote:
> On Tue, Sep 21, 2021 at 1:19 AM Lee Jones <lee.jones@linaro.org> wrote:
>>
>> On Tue, 21 Sep 2021, Krzysztof Kozlowski wrote:
>>
>>> On 20/09/2021 21:03, Will McVicker wrote:
>>>> Switch the default logic to enable SOC_SAMSUNG and it's sub-configs to
>>>> be enabled by default via "default y if ARCH_EXYNOS" versus being
>>>> selected by the ARCH_EXYNOS config directly. This allows vendors to
>>>> disable these configs if they wish and provides additional flexibility
>>>> to modularize them in the presence of a generic kernel.
>>>
>>> This is not true. Vendors cannot disable these options as they are not
>>> visible.
>>
>> Good point, well made.
>>
>>> Although I understand that Arnd prefers this way and I do not
>>> object it, but your explanation is incorrect.
> 
> Thanks Krzysztof for the reviews! I'm sorry I missed the whole "hidden
> configs" part. I'll upload the series to include the fix that refactos
> the Samsung SoC drivers menuconfig which will address that and allow
> one to enable/disable those configs. I'm going to hold off though
> until we hash out the rest of the discussion in the cover letter
> email.

No, please first read our discussions, including Lee's and Geert's
comments. The drivers should not be converted to modules or made visible
if such configuration does not work. If it works, please describe your
testing setup.

All these drivers are *necessary* for a multiplatform kernel supporting
Exynos platforms, therefore disabling them does not make any sense (if
you support Exynos platform). If your kernel does not support Exynos
platform, just do not select ARCH_EXYNOS and problem disappears because
none of these drivers will be visible and selected.

Unless you describe here some out-of-tree kernel which wants
ARCH_EXYNOS, because vendor did not upstream it's code, but you do not
want existing Exynos upstream drivers. We do not support such
configuration. Please push your lovely vendor to work with upstream.
That's the only solution.

It's the third time this abuse re-usage of ARCH_EXYNOS appears and the
same as before - the vendor does not like to upstream stuff. There are
few guys trying to upstream recent Samsung SoC support by themself (ping
me for contacts if you would like to participate) but the one party
which should be doing it - the lovely vendor - does not actually
participate and instead sends ridiculous patches like this one here...
or like this [1] [2].

Nope, please work with upstreaming SoC support, instead of abusing
ARCH_EXYNOS for out of tree code from the vendor.

[1]
https://lore.kernel.org/linux-samsung-soc/001001d5a03d$05de1f70$119a5e50$@samsung.com/

[2]
https://lore.kernel.org/linux-usb/20210303022628.6540-1-taehyun.cho@samsung.com/

Best regards,
Krzysztof

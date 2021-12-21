Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0595DC433F5
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 21 Dec 2021 10:42:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229925AbhLUKmX (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 21 Dec 2021 05:42:23 -0500
Received: from mail-lf1-f46.google.com ([209.85.167.46]:40545 "EHLO
        mail-lf1-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233779AbhLUKmW (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 21 Dec 2021 05:42:22 -0500
Received: by mail-lf1-f46.google.com with SMTP id bu9so6790468lfb.7
        for <linux-samsung-soc@vger.kernel.org>; Tue, 21 Dec 2021 02:42:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=bt5icQi9/8DJ8PbiGEtNlO1expmSAnl5MzaYSuUBvNs=;
        b=dMdgEHgcO//8YmJQ6lMP+tEnUT3N2yHdLOTnKTVmyAkYq8S0FVbNQ/Ew82l0D6RP8L
         KA1xX8u/JwW/kTE5+wTJH4kN2ylN2t5rJW5aU6Ovhb8LM9V9zDlNtEwMBiM23wLHHyLH
         dSOPLb8I1eMw+79j/EwNweenxZWkz4PpTZKylS25ZTONOjLB93UAkpoehBs7o3tjyVnq
         hZy2dwmDlGJKdbZAiSDpMh6mCPYZ9eyJ/BK0lHFbDBz27L12UjJz0HbZm121JU5EWgtV
         2aBVij+14T9d+Uy73UD6W7UM3oP64u3LaWiMn6Vrb6OyTBx4sQVII8vo1CbulVbXxQZ+
         mwBQ==
X-Gm-Message-State: AOAM531bBqwvZR36pYrSVVtFdpz1xcSP0M9Oq3GlBm5tnBgbHn4sttg0
        jq/1nNUsEfiygd+fwjG/UDc=
X-Google-Smtp-Source: ABdhPJyJp8iCr9mYEAhkiVV3U3iGyUjfL2PN0VhWnEwqjXQtHKeaz51GQnTUzyt6obJiZN0by1IH5Q==
X-Received: by 2002:ac2:57db:: with SMTP id k27mr2528406lfo.274.1640083340921;
        Tue, 21 Dec 2021 02:42:20 -0800 (PST)
Received: from [192.168.3.67] (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
        by smtp.googlemail.com with ESMTPSA id o14sm2670322lfk.225.2021.12.21.02.42.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Dec 2021 02:42:19 -0800 (PST)
Message-ID: <b484dea4-da88-3e09-64c5-e1b5bb6cd639@kernel.org>
Date:   Tue, 21 Dec 2021 11:42:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [PATCH v4 7/7] ARM: implement support for vmap'ed stacks
Content-Language: en-US
To:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Ard Biesheuvel <ardb@kernel.org>,
        linux-arm-kernel@lists.infradead.org
Cc:     Russell King <linux@armlinux.org.uk>,
        Nicolas Pitre <nico@fluxnic.net>,
        Arnd Bergmann <arnd@arndb.de>,
        Kees Cook <keescook@chromium.org>,
        Keith Packard <keithpac@amazon.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Tony Lindgren <tony@atomide.com>,
        'Linux Samsung SOC' <linux-samsung-soc@vger.kernel.org>
References: <20211122092816.2865873-1-ardb@kernel.org>
 <20211122092816.2865873-8-ardb@kernel.org>
 <CGME20211221103854eucas1p2592e38fcc84c1c3506fce87f1dab6739@eucas1p2.samsung.com>
 <0ffc858f-27e7-6789-4be1-c4c5ad61eb9d@samsung.com>
From:   Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <0ffc858f-27e7-6789-4be1-c4c5ad61eb9d@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 21/12/2021 11:38, Marek Szyprowski wrote:
> Hi,
> 
> On 22.11.2021 10:28, Ard Biesheuvel wrote:
>> Wire up the generic support for managing task stack allocations via vmalloc,
>> and implement the entry code that detects whether we faulted because of a
>> stack overrun (or future stack overrun caused by pushing the pt_regs array)
>>
>> While this adds a fair amount of tricky entry asm code, it should be
>> noted that it only adds a TST + branch to the svc_entry path. The code
>> implementing the non-trivial handling of the overflow stack is emitted
>> out-of-line into the .text section.
>>
>> Since on ARM, we rely on do_translation_fault() to keep PMD level page
>> table entries that cover the vmalloc region up to date, we need to
>> ensure that we don't hit such a stale PMD entry when accessing the
>> stack. So we do a dummy read from the new stack while still running from
>> the old one on the context switch path, and bump the vmalloc_seq counter
>> when PMD level entries in the vmalloc range are modified, so that the MM
>> switch fetches the latest version of the entries.
>>
>> Note that we need to increase the per-mode stack by 1 word, to gain some
>> space to stash a GPR until we know it is safe to touch the stack.
>> However, due to the cacheline alignment of the struct, this does not
>> actually increase the memory footprint of the struct stack array at all.
>>
>> Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
>> Tested-by: Keith Packard <keithpac@amazon.com>
> 
> 
> This patch landed recently in linux-next 20211220 as commit a1c510d0adc6 
> ("ARM: implement support for vmap'ed stacks"). Sadly it breaks 
> suspend/resume operation on all ARM 32bit Exynos SoCs. Probably the 
> suspend/resume related code must be updated somehow (it partially works 
> on physical addresses and disabled MMU), but I didn't analyze it yet. If 
> you have any hints, let me know.
> 
> 

Maybe this one would help?
https://lore.kernel.org/lkml/20211218085843.212497-2-cuigaosheng1@huawei.com/


Best regards,
Krzysztof

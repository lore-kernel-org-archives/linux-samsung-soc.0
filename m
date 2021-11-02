Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B431BC433F5
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  2 Nov 2021 14:55:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8FF38604D2
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  2 Nov 2021 14:55:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233357AbhKBO6G (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 2 Nov 2021 10:58:06 -0400
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:59608
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233348AbhKBO6F (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 2 Nov 2021 10:58:05 -0400
Received: from mail-lj1-f200.google.com (mail-lj1-f200.google.com [209.85.208.200])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id DED8F3F1C0
        for <linux-samsung-soc@vger.kernel.org>; Tue,  2 Nov 2021 14:55:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1635864929;
        bh=1l57wjx0a3onK41N41yLHbCEPI0pyVDuBTZPteBeCAE=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=WsDpMWK+3JIkFGHGdAYMraiKq9++otzjFsokawn/0ByKJft73+lbashXSNKXEirBV
         a8g20lGlgrDv/65PRPFH+iVLxmXlR05Jh2HRp+Js1bPCywGuhKMzmaqERHYvx2ybne
         FqN/gpG90T9R+mt6ZTCcZrLpMHNY+Zo3z/51MrTXp65MFbbX3Ba43RvxfF4gH6zTQh
         s3X5cSgn8fokCNZSEZROgKVNQ3g2sEeHJI/1nMjhENuqu6Tl6K2Sku3NcHEfQh3fCl
         ZMyUfgezhuMQTWVGTKi5Je7Hj3N5LyUW2WXepLQYPRL5SJKn7qgRXGvXk4GacMsP+d
         V61n7jm3xhq4w==
Received: by mail-lj1-f200.google.com with SMTP id c15-20020a2e9d8f000000b00214b0b32471so3252463ljj.5
        for <linux-samsung-soc@vger.kernel.org>; Tue, 02 Nov 2021 07:55:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=1l57wjx0a3onK41N41yLHbCEPI0pyVDuBTZPteBeCAE=;
        b=ix2at2Ymyhx43Ok36LBm9nynMIpCbwi5PXdFQl1uu72m16KG0cSupcFvzmhB7OUA9j
         KmvCCKMMVIwOXNLbBOjJrpDl/LBOqe2gSQsjSBq5QjjoM4QMGZD372MnV2cJ3CGBEdz8
         KRY1N+uDejDEaOZFhkDqk/vR2puuaD1DjQK+p9TkY8nYSaHJ40A3WMqHr6uv8l08vyFm
         J0TDaOI/BWLvCuicnMHRZvBHmX1qwFHtHrJzVgqU3MzVUFQqgLZFbxNybWB4eqmQnbMY
         GFGpeijBeqjMIWZt2dqOw3Lf/Zu43xgQle0H0dIzIGwluyt5Ew8cKzVekg0VCLOUFZpx
         OKTA==
X-Gm-Message-State: AOAM5324SHKyEByc15YWgTm8rOlhM9nVD1K/VGaQgQMZtvRWpmP0zT4n
        1EkI8jkm/7XJQCQmu/gq7MakKpmEXdHUk8TIyV0Z1pIPazTPHVqU+1NDKRtTOkI8XXDs1EEXR0C
        2HaX3fCBbDR5ftX7QudRzR3Y2NZ5ABWc0V53AfCGKjECdaK62
X-Received: by 2002:a05:651c:556:: with SMTP id q22mr26054595ljp.374.1635864928938;
        Tue, 02 Nov 2021 07:55:28 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxPoqTSwnlW0IiQfpoSYvz+g+cYGtvYWlgr/XmqB9ie+7blrt7ma1maQXbww/CaUPLHEEg/Mg==
X-Received: by 2002:a05:651c:556:: with SMTP id q22mr26054549ljp.374.1635864928572;
        Tue, 02 Nov 2021 07:55:28 -0700 (PDT)
Received: from [192.168.3.67] (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
        by smtp.gmail.com with ESMTPSA id i1sm1691248lfr.287.2021.11.02.07.55.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Nov 2021 07:55:28 -0700 (PDT)
Message-ID: <ee51e10d-0fbf-d87f-aa98-a95d97a7e437@canonical.com>
Date:   Tue, 2 Nov 2021 15:55:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.2
Subject: Re: [RFC PATCH] ARM: s3c: mark as deprecated and schedule removal
 after 2022
Content-Language: en-US
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     Russell King <linux@armlinux.org.uk>,
        Linus Walleij <linus.walleij@linaro.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "moderated list:ARM/SAMSUNG EXYNOS ARM ARCHITECTURES" 
        <linux-samsung-soc@vger.kernel.org>,
        Olof Johansson <olof@lixom.net>, Kukjin Kim <kgene@kernel.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Sylwester Nawrocki <snawrocki@kernel.org>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Inki Dae <inki.dae@samsung.com>, Cedric Roux <sed@free.fr>,
        Sam Van Den Berge <sam.van.den.berge@telenet.be>,
        Lihua Yao <ylhuajnu@outlook.com>,
        Heiko Stuebner <heiko@sntech.de>
References: <20211102110519.142434-1-krzysztof.kozlowski@canonical.com>
 <CAK8P3a0KqS-OZoo46ajfaXw1aFXR9HouW2ZezKRWCawMa7yuGA@mail.gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <CAK8P3a0KqS-OZoo46ajfaXw1aFXR9HouW2ZezKRWCawMa7yuGA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 02/11/2021 14:05, Arnd Bergmann wrote:
> On Tue, Nov 2, 2021 at 12:05 PM Krzysztof Kozlowski
> <krzysztof.kozlowski@canonical.com> wrote:
>>
>> The Samsung S3C24xx and S3C64xx platforms are very old designs. S3C2416
>> was introduced in 2008 and S3C6410 in 2009/2010.  They are not widely
>> available anymore - out-of-stock on FriendlyArm (one of manufacturers of
>> boards) and only few specialist stores still offer them for quite a high
>> price.
>>
>> The community around these platforms was not very active, so I suspect
>> no one really uses them anymore. Maintenance takes precious time so
>> there is little sense in keeping them alive if there are no real users.
>>
>> Let's mark all S3C24xx and S3C64xx platforms as deprecated and mention
>> possible removal in one year (after 2022).  The deprecation message will
>> be as text in Kconfig, build message (not a warning though) and runtime
>> print error.
>>
>> If there are any users, they might respond and postpone the removal.
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> 
> Looks good to me.
> 
> We have a couple of platforms that are in a similar state, and we could do
> the same there. I'd have to dig through
> https://lore.kernel.org/linux-arm-kernel/CAK8P3a2VW8T+yYUG1pn1yR-5eU4jJXe1+M_ot6DAvfr2KyXCzQ@mail.gmail.com/
> to see which ones promised to get back to working on the code and
> ended up not doing so. ;-)
> 
> The ones that would help the most in removing are probably omap1,
> pxa, and the strongarm-based platforms: those have a lot of special
> cases in the code base. At least a year ago the maintainers wanted
> to keep those around, but maybe the 2022 LTS kernel is a better
> time for planned EOL.

If the maintainers or users expressed wish to keep them alive, let's
keep them. In fact there might be some industrial machine working for 20
more years...

If you did not receive any feedback about your queries, I am happy to
add similar deprecation-warning notes to these as well. Just let me know
which one should be affected.

> I also still have a backlog of cleanup patches
> for omap1 and pxa (similar to the s3c24xx changes I did) that we
> should get mainlined if we want to keep them around after all.
> 
> At some point later we can also seriously look into removing all
> non-DT machine support, which would impact all of these:
> 
> $ git grep -w MACHINE_START arch/arm/mach-* | cut -f 3 -d/ | uniq -c
>       1 mach-cns3xxx
>      12 mach-davinci
>       2 mach-dove
>      19 mach-ep93xx
>       3 mach-footbridge
>       6 mach-iop32x
>       2 mach-ixp4xx
>      10 mach-mmp
>       3 mach-mv78xx0
>      14 mach-omap1
>      17 mach-orion5x
>      62 mach-pxa
>       1 mach-rpc
>      36 mach-s3c
>      13 mach-sa1100
> 
>> +#pragma message "The platform is deprecated and scheduled in removal (see platform help). " \
>> +               "Please reach to the maintainers of the platform " \
>> +               "and linux-samsung-soc@vger.kernel.org if you still use it." \
>> +               "Without such feedback, the platform will be removed after 2022."
>> diff --git a/arch/arm/mach-s3c/s3c64xx.c b/arch/arm/mach-s3c/s3c64xx.c
>> index 4dfb648142f2..3e248f0e96a2 100644
>> --- a/arch/arm/mach-s3c/s3c64xx.c
>> +++ b/arch/arm/mach-s3c/s3c64xx.c
>> @@ -425,3 +425,8 @@ static int __init s3c64xx_init_irq_eint(void)
>>         return 0;
>>  }
>>  arch_initcall(s3c64xx_init_irq_eint);
>> +
>> +#pragma message "The platform is deprecated and scheduled in removal (see platform help). " \
>> +               "Please reach to the maintainers of the platform " \
>> +               "and linux-samsung-soc@vger.kernel.org if you still use it." \
>> +               "Without such feedback, the platform will be removed after 2022."
> 
> I don't want these to clutter up my randconfig build output, which I keep
> completely empty by default. If you add an
> 
> #ifndef CONFIG_COMPILE_TEST
> 
> check around them, I'm fine with it though -- it would still catch all
> real users
> without bothering build-testing bots.

I like that idea, I'll use it in v2. No one really should build a real
config with COMPILE_TEST and I want to nag and find the real users.

> I think even with CONFIG_WERROR, we don't fail the build for #warning,
> so that would also work in place of #pragma message.

It fails, I tried it. That's why #pragma.

Best regards,
Krzysztof

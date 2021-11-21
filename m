Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BCBBC433EF
	for <linux-samsung-soc@archiver.kernel.org>; Sun, 21 Nov 2021 12:39:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235729AbhKUMmT (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sun, 21 Nov 2021 07:42:19 -0500
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:58484
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S235111AbhKUMmT (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sun, 21 Nov 2021 07:42:19 -0500
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com [209.85.167.69])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 3F5BF40026
        for <linux-samsung-soc@vger.kernel.org>; Sun, 21 Nov 2021 12:39:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1637498353;
        bh=TFA1LNPBLrquSyjdPdpl7pD/tLLoRLNXb4nnei/Z6/0=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=wKtYEE8HPZEor0fGJkjeWWxqqIZVEJ2IF7Bq1MzFxFmqIZMy8aC05NlFUGpsvbPaE
         nsfRic/RtLW2rIoVqfymP2vLlMgKrB1dqEWqU1r0QAwW/ebrXVzzEhO4nKA7VVFks0
         JkS6yhgbdBhA8Ky546uzbE3ftS7zIxI5CVv9PcdTsYpadIATwjQYiuwBCaWKD+iPdy
         ORG2l2c6sRiIP/1cDVVjMbMAZxx7/j6aXq2mRHPMFJE+8eJ4NneqIlN93D1BEU9Z1B
         xyqDWgqVhyI48hEdcNxbOKk4rCbAChRZ7y1aizWRGvYDf3TuGP350xRynKdG3Tk3aJ
         V45MSp2WhLPZA==
Received: by mail-lf1-f69.google.com with SMTP id z12-20020a0565120c0c00b004037427efb7so10014045lfu.1
        for <linux-samsung-soc@vger.kernel.org>; Sun, 21 Nov 2021 04:39:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=TFA1LNPBLrquSyjdPdpl7pD/tLLoRLNXb4nnei/Z6/0=;
        b=JggHk08/FpDnCtxn3LFPuu/JBDk22RuzHOnHT9jfGkfd4Pqy51x44wJltQV/6SqSWi
         ZDSP67fDduOfUourvC2dzmUpAMO+fDDdiTY4Ieu6YD85CZ0e2SL6HJ97yHYCuCG968fj
         1G8B6Sl/Jnoiy5uZ9LhwuEOF0qM7k9igDIo0EOxGgyMb6lTesFZYKYvF81uI8l5bHUUn
         nZvs1gPeRJx8ThQD9+PsUpaw5CDdui6POSvQZj/V6jtdb3edDDgoqrLlZ0JrDcAHEVSF
         qGoYqaFs4ntFON5ju9Mu9GZ00dcBIIq5pGjT7pbIf0ixLFVd3vVqTaO7w6PJrPAAYogF
         LQuw==
X-Gm-Message-State: AOAM5321Pal5vWDCV6aSSzgY3ef+dFw3iO5gmiAd+mUvH2npGtG+9D9t
        xSBkSQmxN6kQUebdtrPgg29AexpHV3ovLKLj+BMA69oCnWnfZpthEEPxUd6bdiUAD08zrZlMDy9
        WlJt7ROV+kP3RszfOggSRnJCUFWjJNaoVv7xPa92Ez4eY/u2u
X-Received: by 2002:ac2:4571:: with SMTP id k17mr49746433lfm.369.1637498352232;
        Sun, 21 Nov 2021 04:39:12 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxYMWr4FvuZ7Nqv9X59p0QzJvAJXMV+d9GpFfumZBpc0w/0S1Kvup1vykMeuihBU1HnXXXRUA==
X-Received: by 2002:ac2:4571:: with SMTP id k17mr49746416lfm.369.1637498352038;
        Sun, 21 Nov 2021 04:39:12 -0800 (PST)
Received: from [192.168.3.67] (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
        by smtp.gmail.com with ESMTPSA id a28sm426341ljm.65.2021.11.21.04.39.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 21 Nov 2021 04:39:11 -0800 (PST)
Message-ID: <b374d1a6-6478-cf2f-924e-425825731ad5@canonical.com>
Date:   Sun, 21 Nov 2021 13:39:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
Subject: Re: [PATCH 1/2] arm: samsung: Remove HAVE_S3C2410_I2C and use direct
 dependencies
Content-Language: en-US
To:     Sam Protsenko <semen.protsenko@linaro.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>
Cc:     Will McVicker <willmcvicker@google.com>,
        Russell King <linux@armlinux.org.uk>,
        Arnd Bergmann <arnd@arndb.de>,
        Andrew Morton <akpm@linux-foundation.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Michael Ellerman <mpe@ellerman.id.au>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org, linux-i2c@vger.kernel.org
References: <20211108134901.20490-1-semen.protsenko@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20211108134901.20490-1-semen.protsenko@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 08/11/2021 14:49, Sam Protsenko wrote:
> A separate Kconfig option HAVE_S3C2410_I2C for Samsung SoCs is not
> really needed and the i2c-s3c24xx driver can depend on Samsung ARM
> architectures instead. This also enables i2c-s3c2410 for arm64 Exynos
> SoCs, which is required for example by Exynos850.
> 
> This is basically continuation of work made in following commits:
>   - commit d96890fca9fd ("rtc: s3c: remove HAVE_S3C_RTC in favor of
>     direct dependencies")
>   - commit 7dd3cae90d85 ("ARM: samsung: remove HAVE_S3C2410_WATCHDOG and
>     use direct dependencies")
> 
> Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
> ---
>  arch/arm/Kconfig                  |  1 -
>  arch/arm/mach-exynos/Kconfig      |  1 -
>  arch/arm/mach-s3c/Kconfig.s3c64xx |  1 -
>  arch/arm/mach-s5pv210/Kconfig     |  1 -
>  drivers/i2c/busses/Kconfig        | 10 ++--------
>  5 files changed, 2 insertions(+), 12 deletions(-)
> 

This does not apply, which is weird because there were no changes here.
It seems you based your work on some older tree, so please rebase and
re-test on current tree (my for-next branch or linux-next).

Best regards,
Krzysztof

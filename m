Return-Path: <SRS0=/9gS=DK=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F0ECC41604
	for <linux-samsung-soc@archiver.kernel.org>; Sat,  3 Oct 2020 19:30:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 33BE02074B
	for <linux-samsung-soc@archiver.kernel.org>; Sat,  3 Oct 2020 19:30:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lixom-net.20150623.gappssmtp.com header.i=@lixom-net.20150623.gappssmtp.com header.b="A5vNPlSg"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725848AbgJCTaK (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sat, 3 Oct 2020 15:30:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39592 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725831AbgJCTaK (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sat, 3 Oct 2020 15:30:10 -0400
Received: from mail-il1-x144.google.com (mail-il1-x144.google.com [IPv6:2607:f8b0:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 84623C0613D0
        for <linux-samsung-soc@vger.kernel.org>; Sat,  3 Oct 2020 12:30:10 -0700 (PDT)
Received: by mail-il1-x144.google.com with SMTP id q1so4361230ilt.6
        for <linux-samsung-soc@vger.kernel.org>; Sat, 03 Oct 2020 12:30:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lixom-net.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=QZ1DkwSWJLJyYMYsQtbtyLF9BA7njwH8/m0Qh4QFyf0=;
        b=A5vNPlSg4HijI19FL1wcWgBkX6IvHjg0QVpuOEIfTEA8iQ0aoSLXQjpE1OgWypVbho
         jrGD4HJhrSprVjPwFBbkNvqHTimfJ/SMXv9HCiSUnn+SqDmpfAZ0Wz8fkZAOjEymHokx
         h3AXG6fpmmeQxZAFyfiAISkonpgr48kELwII8iJiaQo+G414Yq1El+YlpLbkmu80kMzq
         1hze753ZMN1gzExfSrewSMxGEM6bzc5RmgV71myGJR4b2smD3yWwJUDcsFvFe/kfs/g9
         b1InsD0t6ubXRm/B4DQ0rn2qvgqsjakMb9HchoRwzEGcuO2uEvuRmDKzrit7IBboXv6d
         o2dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=QZ1DkwSWJLJyYMYsQtbtyLF9BA7njwH8/m0Qh4QFyf0=;
        b=LzuLA5YBka7NAf7h7O0FxKnty7qioUbtsXLFuJxCvCPvWAHDyU+noAva96PCGoFUKE
         Yaabz3rRv7RmUn3iLtu+JYzb/HCroEKwgkXuxR+t8L7NwIZ2QU5dcDTUjINbyNspiBfC
         9d5LZW0oZ3OEJeVK52uFYyJKiIFgcJA7Q30QRVSkrNzSf9FKn1/ZVVLD4tEhyooDuyMB
         ol3q0Fp2mZlZOpwR7EFqyGhNm8CaePSiIOhu72WO0yyYCUz9I+icXg4RgYkFvIkauLdy
         mh8F1BadZtCPcjPxjOzFr8qJ0LVym7+rDVJhkdgkuwUDrNtlnwSKoa7L5uZkMfwk9lzQ
         vmDw==
X-Gm-Message-State: AOAM531eJ1gAFFidNIKtUYStA/tm9hWVg4w5+pdMBXgbUFUjPLDv/7pF
        9bfAuYgdvOZ81HU3ZoHTDtYZDIkiN5J5Z8kMUklHmQ==
X-Google-Smtp-Source: ABdhPJxKg0IoqJI26FZ9A3MzYx9uR79rmwvgiHj4d/z29C+q8n+2BLlXrFyK67G4mAxZaLLsKBj31wLjA7e6avXfkws=
X-Received: by 2002:a92:6403:: with SMTP id y3mr6327624ilb.72.1601753409817;
 Sat, 03 Oct 2020 12:30:09 -0700 (PDT)
MIME-Version: 1.0
References: <20200920160705.9651-1-krzk@kernel.org> <20200920160705.9651-5-krzk@kernel.org>
 <20200926195026.GA2230@lx2k>
In-Reply-To: <20200926195026.GA2230@lx2k>
From:   Olof Johansson <olof@lixom.net>
Date:   Sat, 3 Oct 2020 21:29:58 +0200
Message-ID: <CAOesGMgQ67n1F-od-amKN8MuG75V3euOhEwdyYryQSQyWH3TBQ@mail.gmail.com>
Subject: Re: [GIT PULL 4/5] ARM: samsung: mach/soc for v5.10
To:     Krzysztof Kozlowski <krzk@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc:     Arnd Bergmann <arnd@arndb.de>,
        ARM-SoC Maintainers <arm@kernel.org>,
        SoC Team <soc@kernel.org>, Kukjin Kim <kgene@kernel.org>,
        Linux ARM Mailing List <linux-arm-kernel@lists.infradead.org>,
        "moderated list:ARM/SAMSUNG EXYNOS ARM ARCHITECTURES" 
        <linux-samsung-soc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Sat, Oct 3, 2020 at 9:29 PM Olof Johansson <olof@lixom.net> wrote:
>
> Hi,
>
> On Sun, Sep 20, 2020 at 06:07:04PM +0200, Krzysztof Kozlowski wrote:
> > Hi,
> >
> > This will conflict around renamed/moved files:
> >
> > 1. arch/arm/mach-s3c/s3c24xx.c:
> >    Merge both changes to new location, so:
> > =======
> >  +#include "s3c24xx.h"
> >  +#include "fb-core-s3c24xx.h"
> >  +#include "nand-core-s3c24xx.h"
> >  +#include "spi-core-s3c24xx.h"
> >
> > - static struct map_desc s3c2416_iodesc[] __initdata = {
> > + static struct map_desc s3c2416_iodesc[] __initdata __maybe_unused = {
> > =======
> >
> > 2. drivers/soc/samsung/Kconfig
> >    Add DEBUG_LL && MMU to SAMSUNG_PM_DEBUG section, so:
> >
> > =======
> >   config EXYNOS_PM_DOMAINS
> >       bool "Exynos PM domains" if COMPILE_TEST
> >  -    depends on PM_GENERIC_DOMAINS || COMPILE_TEST
> >  +    depends on (ARCH_EXYNOS && PM_GENERIC_DOMAINS) || COMPILE_TEST
> >  +
> >  +config SAMSUNG_PM_DEBUG
> >  +    bool "Samsung PM Suspend debug"
> >  +    depends on PM && DEBUG_KERNEL
> >  +    depends on PLAT_S3C24XX || ARCH_S3C64XX || ARCH_S5PV210
> >  +    depends on DEBUG_S3C24XX_UART || DEBUG_S3C2410_UART
> > ++    depends on DEBUG_LL && MMU
> >  +    help
> >  +      Say Y here if you want verbose debugging from the PM Suspend and
> >  +      Resume code. See <file:Documentation/arm/samsung-s3c24xx/suspend.rst>
> >  +      for more information.
> >  +
> > =======
>
> I don't mind doing this conflict resolution, and will merge it now,
> but next time you can just base this branch on the cleanup branch.

Apologies for sitting on this email, I flush the outbound queue by
hand and seem to have forgotten. :)


-Olof

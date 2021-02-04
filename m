Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-23.2 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_IN_DEF_DKIM_WL autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 661EDC433DB
	for <linux-samsung-soc@archiver.kernel.org>; Thu,  4 Feb 2021 18:12:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3E14564F65
	for <linux-samsung-soc@archiver.kernel.org>; Thu,  4 Feb 2021 18:12:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238378AbhBDSMX (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 4 Feb 2021 13:12:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45676 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238928AbhBDSMP (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 4 Feb 2021 13:12:15 -0500
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E2A8CC0613D6
        for <linux-samsung-soc@vger.kernel.org>; Thu,  4 Feb 2021 10:11:34 -0800 (PST)
Received: by mail-pl1-x632.google.com with SMTP id x9so2193655plb.5
        for <linux-samsung-soc@vger.kernel.org>; Thu, 04 Feb 2021 10:11:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=RtK9mH1gkT4tly0aUjleqbTCqo0H1GWRGkm+wgQLcKQ=;
        b=VzWx0dK0F/0P0JbZEaZ7yNuVnXXvvlUt6ZWlIUVzcsmzxQwK0QWShtSdZaJu0SAXdC
         qWQJBu7pYT8MOSGQqxyJ2S6cqveiHyEIfFl0YqmvohE0/IRuuafPGXHtRtswtVSP24As
         v3KylExv9pXuIP1YcK9XeVzoFn9ILZl2JMUb1viSplB3gBRf1sWfjAui3Sn7yGqI5Zso
         NAYvod40+nciWJ+9lcotHZQPdlsyqrzFAcHZU3gRiYrku1qg/3wAxpvtREXsNv4d/Iee
         Sb0MApJzgAMp9CUhnXOhsBd1OgJMoJgOExqhaoHmv4kh30yQHQ2snSw0+3Aq+2R16SYE
         icKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=RtK9mH1gkT4tly0aUjleqbTCqo0H1GWRGkm+wgQLcKQ=;
        b=kXRuvBm1k9IkzUEHUhgHkLNq6F1aYsTPbUPKtNWGd/aTUDeXymrPyOKPPvQPhvPKEr
         5xvg/Qve5uaNlrHZUKoXS6RuoW94gBucupezGX7vk4lbqXwZMnyAAMji3fAvMQz4J8qJ
         9uJ1HdoCKbkR97E2j6ImfUjx9Gd5zzoFqUGaHqZKCxMoOk4i+n7vLloLmN5+/MMQJsp/
         71cUsoaYL9ew+3tWEXj61wS6Jyo4rgG9hQCW4GzSmcPmoKmx77Dx3l5b/Ojif+RMlGdL
         MnOiJWUejnn/9X/eDguoHtzA6u1eIBzVGCIWEw2keXmDwyPVtOGTcSp35fO7GHTya5E+
         UD/g==
X-Gm-Message-State: AOAM531l4P4o7ds39FXtE8aZqUy+UVwNxMnWmvPNldUN+2GxN6E2c5sp
        MKhzc6kYJMALBvmcSwkrRST7F9hHO/OUphIAlNnhvg==
X-Google-Smtp-Source: ABdhPJwM9n11EzR6QjrdGwIT7tXe7o6IvZV4XBcsjcTX9FIJNuwD9dfLJji0WYIC63nh1Z206CveXNSVwbNVcyALRBI=
X-Received: by 2002:a17:90a:8b82:: with SMTP id z2mr190576pjn.25.1612462294295;
 Thu, 04 Feb 2021 10:11:34 -0800 (PST)
MIME-Version: 1.0
References: <20210204162416.3030114-1-arnd@kernel.org>
In-Reply-To: <20210204162416.3030114-1-arnd@kernel.org>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Thu, 4 Feb 2021 10:11:23 -0800
Message-ID: <CAKwvOd=1Cs75KdVU5Fa9W+wYmjo=5fFNBb6m6PnHUp=eoM-H5g@mail.gmail.com>
Subject: Re: [PATCH] ARM: s3c: fix fiq for clang IAS
To:     Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc:     Krzysztof Kozlowski <krzk@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Ben Dooks <ben-linux@fluff.org>, soc@kernel.org,
        Arnd Bergmann <arnd@arndb.de>, Stefan Agner <stefan@agner.ch>,
        Russell King <linux@armlinux.org.uk>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-samsung-soc@vger.kernel.org,
        LKML <linux-kernel@vger.kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Thu, Feb 4, 2021 at 8:24 AM Arnd Bergmann <arnd@kernel.org> wrote:
>
> From: Arnd Bergmann <arnd@arndb.de>
>
> Building with the clang integrated assembler produces a couple of
> errors for the s3c24xx fiq support:
>
> arch/arm/mach-s3c/irq-s3c24xx-fiq.S:52:2: error: instruction 'subne' can not set flags, but 's' suffix specified
>  subnes pc, lr, #4 @@ return, still have work to do
>  ^
> arch/arm/mach-s3c/irq-s3c24xx-fiq.S:64:1: error: invalid symbol redefinition
> s3c24xx_spi_fiq_txrx:
> ^
> arch/arm/mach-s3c/irq-s3c24xx-fiq.S:79:2: error: instruction 'subne' can not set flags, but 's' suffix specified
>  subnes pc, lr, #4 @@ return, still have work to do
>  ^
> arch/arm/mach-s3c/irq-s3c24xx-fiq.S:104:2: error: instruction 'subne' can not set flags, but 's' suffix specified
>  subnes pc, lr, #4 @@ return, still have work to do
>
> There are apparently two problems: one with extraneous or duplicate
> labels, and one with old-style opcode mnemonics. Stefan Agner has
> previously fixed other problems like this, but missed this particular
> file.

Thanks for the patch.  Pre-UAL syntax

Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

>
> Fixes: bec0806cfec6 ("spi_s3c24xx: add FIQ pseudo-DMA support")
> Cc: Stefan Agner <stefan@agner.ch>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  arch/arm/mach-s3c/irq-s3c24xx-fiq.S | 9 +++------
>  1 file changed, 3 insertions(+), 6 deletions(-)
>
> diff --git a/arch/arm/mach-s3c/irq-s3c24xx-fiq.S b/arch/arm/mach-s3c/irq-s3c24xx-fiq.S
> index b54cbd012241..5d238d9a798e 100644
> --- a/arch/arm/mach-s3c/irq-s3c24xx-fiq.S
> +++ b/arch/arm/mach-s3c/irq-s3c24xx-fiq.S
> @@ -35,7 +35,6 @@
>         @ and an offset to the irq acknowledgment word
>
>  ENTRY(s3c24xx_spi_fiq_rx)
> -s3c24xx_spi_fix_rx:
>         .word   fiq_rx_end - fiq_rx_start
>         .word   fiq_rx_irq_ack - fiq_rx_start
>  fiq_rx_start:
> @@ -49,7 +48,7 @@ fiq_rx_start:
>         strb    fiq_rtmp, [ fiq_rspi, # S3C2410_SPTDAT ]
>
>         subs    fiq_rcount, fiq_rcount, #1
> -       subnes  pc, lr, #4              @@ return, still have work to do
> +       subsne  pc, lr, #4              @@ return, still have work to do
>
>         @@ set IRQ controller so that next op will trigger IRQ
>         mov     fiq_rtmp, #0
> @@ -61,7 +60,6 @@ fiq_rx_irq_ack:
>  fiq_rx_end:
>
>  ENTRY(s3c24xx_spi_fiq_txrx)
> -s3c24xx_spi_fiq_txrx:
>         .word   fiq_txrx_end - fiq_txrx_start
>         .word   fiq_txrx_irq_ack - fiq_txrx_start
>  fiq_txrx_start:
> @@ -76,7 +74,7 @@ fiq_txrx_start:
>         strb    fiq_rtmp, [ fiq_rspi, # S3C2410_SPTDAT ]
>
>         subs    fiq_rcount, fiq_rcount, #1
> -       subnes  pc, lr, #4              @@ return, still have work to do
> +       subsne  pc, lr, #4              @@ return, still have work to do
>
>         mov     fiq_rtmp, #0
>         str     fiq_rtmp, [ fiq_rirq, # S3C2410_INTMOD  - S3C24XX_VA_IRQ ]
> @@ -88,7 +86,6 @@ fiq_txrx_irq_ack:
>  fiq_txrx_end:
>
>  ENTRY(s3c24xx_spi_fiq_tx)
> -s3c24xx_spi_fix_tx:
>         .word   fiq_tx_end - fiq_tx_start
>         .word   fiq_tx_irq_ack - fiq_tx_start
>  fiq_tx_start:
> @@ -101,7 +98,7 @@ fiq_tx_start:
>         strb    fiq_rtmp, [ fiq_rspi, # S3C2410_SPTDAT ]
>
>         subs    fiq_rcount, fiq_rcount, #1
> -       subnes  pc, lr, #4              @@ return, still have work to do
> +       subsne  pc, lr, #4              @@ return, still have work to do
>
>         mov     fiq_rtmp, #0
>         str     fiq_rtmp, [ fiq_rirq, # S3C2410_INTMOD  - S3C24XX_VA_IRQ ]
> --
> 2.29.2
>


-- 
Thanks,
~Nick Desaulniers

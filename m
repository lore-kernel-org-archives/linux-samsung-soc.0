Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F1BFC433E0
	for <linux-samsung-soc@archiver.kernel.org>; Sat,  6 Feb 2021 13:13:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 566BB64EB9
	for <linux-samsung-soc@archiver.kernel.org>; Sat,  6 Feb 2021 13:13:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229651AbhBFNNq (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sat, 6 Feb 2021 08:13:46 -0500
Received: from mail-wm1-f53.google.com ([209.85.128.53]:54958 "EHLO
        mail-wm1-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229529AbhBFNNo (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sat, 6 Feb 2021 08:13:44 -0500
Received: by mail-wm1-f53.google.com with SMTP id w4so8268319wmi.4;
        Sat, 06 Feb 2021 05:13:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=TcWqlo7340ClwaNrU2G13HH3PdkJ5tma+WdPpB6m4uk=;
        b=kiLPS0fBWrXABWkf9W8amF/tSRA9L5ezlYqOIW1ARd6Bg4IRUlINzhJADnlLdA1hjC
         7Ln/DXMiEaccsKY4+5KKzMkC0cIwGi+Qx8k7nMIQpiJzsSG9qPElshRHKkoczroU8Sw7
         9F+GCEn41NAA3/9mA7Xz9m182Gm0lX6Qlj270SmuLCB58BkH6rVutFUHfbBFSqSAy8ty
         DZujFkIZo9rN4Zdo0EPqi/KDv6EQGHpU2/GQlgOzviyIBOf9P2mPLcZehbggpkuCPC2G
         0cgHHPAFVb5KAwqFEXJ2bJO7W+EeguBOKwYTKRR40lmd82BIGsMfLsCD9k6rT23NDOjg
         ANBw==
X-Gm-Message-State: AOAM5335Mx+D3HtOweSVAhSX11jIpOzddZ3A+VWKh75zAjYMHFf0Y2HR
        pkY6WkMKEL7TkUw2lUSz1oc=
X-Google-Smtp-Source: ABdhPJxmmMbmWj5ntspZOudiviLyA/AkKCV1/oa2n4cSkwvyp024Ie1So4/dPvxLTHW2DQ2K5hFNrQ==
X-Received: by 2002:a1c:a707:: with SMTP id q7mr7476875wme.15.1612617182491;
        Sat, 06 Feb 2021 05:13:02 -0800 (PST)
Received: from kozik-lap (194-95-143-94.dyn.cable.fcom.ch. [94.143.95.194])
        by smtp.googlemail.com with ESMTPSA id 67sm11724509wmz.46.2021.02.06.05.13.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Feb 2021 05:13:01 -0800 (PST)
Date:   Sat, 6 Feb 2021 14:12:58 +0100
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc:     Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Ben Dooks <ben-linux@fluff.org>, soc@kernel.org,
        Arnd Bergmann <arnd@arndb.de>, Stefan Agner <stefan@agner.ch>,
        Russell King <linux@armlinux.org.uk>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        clang-built-linux@googlegroups.com
Subject: Re: [PATCH] ARM: s3c: fix fiq for clang IAS
Message-ID: <20210206131258.du6tmx7lda35rg5l@kozik-lap>
References: <20210204162416.3030114-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210204162416.3030114-1-arnd@kernel.org>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Thu, Feb 04, 2021 at 05:23:42PM +0100, Arnd Bergmann wrote:
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
> 
> Fixes: bec0806cfec6 ("spi_s3c24xx: add FIQ pseudo-DMA support")
> Cc: Stefan Agner <stefan@agner.ch>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  arch/arm/mach-s3c/irq-s3c24xx-fiq.S | 9 +++------

Thanks, applied.

Best regards,
Krzysztof


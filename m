Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45C83C5519F
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 12 Nov 2020 16:18:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DCCA9206D5
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 12 Nov 2020 16:18:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728599AbgKLQSY (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 12 Nov 2020 11:18:24 -0500
Received: from mail-ed1-f66.google.com ([209.85.208.66]:34106 "EHLO
        mail-ed1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728414AbgKLQSY (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 12 Nov 2020 11:18:24 -0500
Received: by mail-ed1-f66.google.com with SMTP id a15so6967277edy.1;
        Thu, 12 Nov 2020 08:18:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Oi3gnOCxcrOs0+khI8hhtUkNotcrmrGmIvdN+HAPrVQ=;
        b=S0A4nC0SjYSrGr1Egd2aP9IyG0qIy8m+KvUOtRuhrpMl9AKoBttFC69iCntDq9dk4X
         cg9p5H3Sh36AgLnZbm2kuPHJDLsoxFiiV8vgJOCNE6UegqXYOmPEhjcNM4LR9bYFj4JH
         W26pqQ2l4OOW1OEImqyKhqEk3KGMm2L9XK8Mn04+jgZ5J3faibP8EuNjVmv7mFlcpzBj
         JK4Zkf0PaEmtqwgxDfvzDkqn6y4NFa6jkZNdGv2J4hTZ5hSo3J5ZMxziebIe0fClATZv
         XnC1vZLwMr8MUap/vfCsLQ2NMIuNIWlAl8peI5DYwND6AkodWiggkoRCKebaTXBVvVKx
         eJNA==
X-Gm-Message-State: AOAM533AdP2JBps3jUKCLKNiOHrNq+dWPHmRf6bpTtslSmXfN0xtB+GU
        Ow9J6p18Cz7aFSmz0b51wK0=
X-Google-Smtp-Source: ABdhPJxU8A/Q2g0DP+feOmxvU1fP6FCS006FvMp1NfPEruaqw24Y5rJB7Z8fBGQrpkoQw1M8rMTrhw==
X-Received: by 2002:a50:ec10:: with SMTP id g16mr544202edr.63.1605197902687;
        Thu, 12 Nov 2020 08:18:22 -0800 (PST)
Received: from kozik-lap (adsl-84-226-167-205.adslplus.ch. [84.226.167.205])
        by smtp.googlemail.com with ESMTPSA id z13sm2330880ejp.30.2020.11.12.08.18.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2020 08:18:21 -0800 (PST)
Date:   Thu, 12 Nov 2020 17:18:20 +0100
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Sylwester Nawrocki <snawrocki@kernel.org>
Cc:     Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] clk: samsung: allow building the clkout driver as module
Message-ID: <20201112161820.GA17700@kozik-lap>
References: <20201110193749.261367-1-krzk@kernel.org>
 <92ccc476-6afd-4be9-7c72-40c9a9218b03@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <92ccc476-6afd-4be9-7c72-40c9a9218b03@kernel.org>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Thu, Nov 12, 2020 at 03:36:35PM +0100, Sylwester Nawrocki wrote:
> On 11/10/20 20:37, Krzysztof Kozlowski wrote:
> > The Exynos clock output driver can be built as module (it does not have
> > to be part of core init process) for better customization.  Adding a
> > KConfig entry allows also compile testing for build coverage.
> > 
> > Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> 
> This needs to go through your tree due to dependencies on your previous
> patches, so
> 
> Acked-by: Sylwester Nawrocki <s.nawrocki@samsung.com>

Yes, thanks.

> 
> > ---
> >   drivers/clk/samsung/Kconfig             | 10 ++++++++++
> >   drivers/clk/samsung/Makefile            |  2 +-
> >   drivers/clk/samsung/clk-exynos-clkout.c |  1 +
> >   3 files changed, 12 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/clk/samsung/Kconfig b/drivers/clk/samsung/Kconfig
> > index 57d4b3f20417..b6b2cb209543 100644
> > --- a/drivers/clk/samsung/Kconfig
> > +++ b/drivers/clk/samsung/Kconfig
> > @@ -19,6 +19,16 @@ config EXYNOS_AUDSS_CLK_CON
> >   	  on some Exynos SoC variants. Choose M or Y here if you want to
> >   	  use audio devices such as I2S, PCM, etc.
> >   
> > +config EXYNOS_CLK_OUT
> 
> Perhaps change it EXYNOS_CLKOUT for a better match with the SoC documentation? 

Sure, I applied it with name fixup.

Best regards,
Krzysztof

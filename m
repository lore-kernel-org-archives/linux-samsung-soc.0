Return-Path: <SRS0=5Pkx=ED=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03832C388F7
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 28 Oct 2020 22:02:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A704E20EDD
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 28 Oct 2020 22:02:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1603922563;
	bh=pADFI+I4rTuP2uKARPn/R/jbLmiist+W1YMVm+62fvM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=EDOrrG+2HnzELNpVv5pxhWz+EiVSWEoKtjKsurFq3sH2ejtBYeBC8CuY40REskCJf
	 rcQau8Znw6NZ+pa8ewqBZ/fQe2ztZ0xIrPeHk3o4uFgNkW2xgEenSYnufj2ukNZpf7
	 0bE2FL3P+r5MJDvE0RCL3T/ylNeBhbHaiNWBlvUY=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729560AbgJ1WCm (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 28 Oct 2020 18:02:42 -0400
Received: from mail-ej1-f68.google.com ([209.85.218.68]:46545 "EHLO
        mail-ej1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729557AbgJ1WCl (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 28 Oct 2020 18:02:41 -0400
Received: by mail-ej1-f68.google.com with SMTP id t25so999278ejd.13;
        Wed, 28 Oct 2020 15:02:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=4gLV5jqZWEzx0kSjn0ZlymUAXJbYU1uMHL1QmYMs6LA=;
        b=tOyvKkx5fXDVh0D91p75HxFMkGyqloOP+olWNATOeuM34+S65B6Tws9gmDMcZrIPUm
         TupdtucY+YUg/kLIcAymQ/zvgQFCCCMN5z1qSxGxOWwAtuj4MhUDTTbYVKIJl+QMmfJj
         ZUyfMHll0Wq86hWOzNNSMBJl7DbGZ/HutEn6h1EUgpQhq5AfaGoAQg2HDmi2QDu+K3ue
         bF3Zo+diIrGmUbblTDD0VrMjHPVqWcP0JPITksBF02IvNGhXYN56M/cF5FLxWwdEEdqN
         Jx/HonIGisKDmA5w4e4X0pH/WZbMUkqSNbvMJKpAeISEQCQAx67l+MgK9RRA17EOdZAK
         4H/w==
X-Gm-Message-State: AOAM532iKjfjtf4OP972YYSs7xD/g6l0Otn4kSsVj+XUf2Ryis3yZLWK
        G1Cy0ARM7XswQaMVLbJNDxs=
X-Google-Smtp-Source: ABdhPJzTVbBja1pgLqS76H5a7HJ4PpaZGt8w1wdce7Ox6yZdCWF/ZVkaaOZZrdWROtKTG3r7QsBafg==
X-Received: by 2002:a17:906:c2d2:: with SMTP id ch18mr1159055ejb.446.1603922558697;
        Wed, 28 Oct 2020 15:02:38 -0700 (PDT)
Received: from kozik-lap ([194.230.155.184])
        by smtp.googlemail.com with ESMTPSA id oz18sm411058ejb.55.2020.10.28.15.02.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2020 15:02:37 -0700 (PDT)
Date:   Wed, 28 Oct 2020 23:02:35 +0100
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Kukjin Kim <kgene@kernel.org>,
        linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Re: [PATCH 1/2] soc: samsung: exynos-pmu: instantiate clkout driver
 as MFD
Message-ID: <20201028220235.GA271157@kozik-lap>
References: <20201001165646.32279-1-krzk@kernel.org>
 <20201001165646.32279-2-krzk@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20201001165646.32279-2-krzk@kernel.org>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Thu, Oct 01, 2020 at 06:56:45PM +0200, Krzysztof Kozlowski wrote:
> The Exynos clock output (clkout) driver uses same register address space
> (Power Management Unit address space) as Exynos PMU driver and same set
> of compatibles.  It was modeled as clock provider instantiated with
> CLK_OF_DECLARE_DRIVE().
> 
> This however brings ordering problems and lack of probe deferral,
> therefore clkout driver should be converted to a regular module and
> instantiated as a child of PMU driver to be able to use existing
> compatibles and address space.
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---
>  drivers/soc/samsung/exynos-pmu.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)

Applied with all tags.

Best regards,
Krzysztof


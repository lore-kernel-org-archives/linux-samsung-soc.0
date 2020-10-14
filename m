Return-Path: <SRS0=VGRb=DV=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7847DC43457
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 14 Oct 2020 06:17:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 23FA32177B
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 14 Oct 2020 06:17:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1602656259;
	bh=UHTsECGrSzq3FOc11HErzxuMUJhoH4pWRTJFSnaKUDU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=CDEYCCs3EeiS2SPnAj4+s6mBKz2MMvUuRhguGBYq+FCOl3BnXPSZrxfexC0SaHfKR
	 kei1J7SkfGPS6PYKo2CsCnYshxYgcANaxkHLWG/1hb8UzMked4trhim1o+5cDw2T4F
	 AjdW25ds8i5a9DCoNrnrjL60Z2Lj0987uHMJPpSU=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726105AbgJNGRi (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 14 Oct 2020 02:17:38 -0400
Received: from mail-ed1-f67.google.com ([209.85.208.67]:37811 "EHLO
        mail-ed1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725983AbgJNGRi (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 14 Oct 2020 02:17:38 -0400
Received: by mail-ed1-f67.google.com with SMTP id o18so1908331edq.4;
        Tue, 13 Oct 2020 23:17:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=nRETCMUggNgSzB3Ff8f9czD714/ySw0c2TVlidnZhzo=;
        b=PQxKHD1LXYcFmio8bFpN2Z8nNuYPV26V1vnBECcgj5mKGcYAGQcPIzqKgDvFcNNBbT
         ey9FogTyaCuN/c8Nn7gF/hdQk09ELuimknijLpHVaPTmB1HprkF/6VXOQvuyr5v8xsa3
         1Dwh4M0HQlyFCi9Qy3Thv4GTTitFI2ovrl3BlT49OL60G74h1Ec5gtxhwZeZiQIPvSwT
         xWdT1dpDHgLWksfBGEDxg9Onw4zXZpuR83LopJyQESVFCqbkQ5U5JFXRX5ijjt9vwWXb
         nk/tMYEvJM2sJbQU5VyxeOa9wKfU+z/TNZVUZJ4E/0YI5LzGjcICIa36G6wcXN1X7hHP
         qeZA==
X-Gm-Message-State: AOAM533cULYFQ0e7Jk2YZL1eb+LtnK0GqItzgDojnLephULB9pfHQ0cA
        7lYPZQib79ZsqdV9YKROE6qgcGLG9zA=
X-Google-Smtp-Source: ABdhPJzCxYhYBVBaZz5jBqPvgupxLdGCqZC1DrVF7ARKbCN/YsQRr9PIxjYmOwWqoaBiMx1/c/FV/Q==
X-Received: by 2002:a05:6402:651:: with SMTP id u17mr3419101edx.206.1602656255808;
        Tue, 13 Oct 2020 23:17:35 -0700 (PDT)
Received: from kozik-lap ([194.230.155.240])
        by smtp.googlemail.com with ESMTPSA id si13sm1047455ejb.49.2020.10.13.23.17.33
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 13 Oct 2020 23:17:34 -0700 (PDT)
Date:   Wed, 14 Oct 2020 08:17:32 +0200
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Chanwoo Choi <cw00.choi@samsung.com>,
        Kukjin Kim <kgene@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Re: [PATCH 2/2] clk: samsung: exynos-clkout: convert to module driver
Message-ID: <20201014061732.GA3672@kozik-lap>
References: <20201001165646.32279-1-krzk@kernel.org>
 <20201001165646.32279-3-krzk@kernel.org>
 <160264342071.310579.16332243912081691987@swboyd.mtv.corp.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <160264342071.310579.16332243912081691987@swboyd.mtv.corp.google.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Tue, Oct 13, 2020 at 07:43:40PM -0700, Stephen Boyd wrote:
> Quoting Krzysztof Kozlowski (2020-10-01 09:56:46)
> > diff --git a/drivers/clk/samsung/clk-exynos-clkout.c b/drivers/clk/samsung/clk-exynos-clkout.c
> > index 34ccb1d23bc3..68af082d4716 100644
> > --- a/drivers/clk/samsung/clk-exynos-clkout.c
> > +++ b/drivers/clk/samsung/clk-exynos-clkout.c
> > @@ -28,41 +31,103 @@ struct exynos_clkout {
> [...]
> > +       if (!match) {
> > +               dev_err(dev, "cannot match parent device\n");
> > +               return -EINVAL;
> > +       }
> > +       variant = match->data;
> > +
> > +       *mux_mask = variant->mux_mask;
> > +       dev_err(dev, "MATCH: %x\n", variant->mux_mask);
> 
> Is this a debug print?

Debugging left over, thanks for catching this. I'll remove it.

Best regards,
Krzysztof

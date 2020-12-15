Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B19FC4361B
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 15 Dec 2020 09:28:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 06AC622262
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 15 Dec 2020 09:28:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727199AbgLOJ14 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 15 Dec 2020 04:27:56 -0500
Received: from mail-ed1-f66.google.com ([209.85.208.66]:46519 "EHLO
        mail-ed1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726777AbgLOJ1z (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 15 Dec 2020 04:27:55 -0500
Received: by mail-ed1-f66.google.com with SMTP id b73so20198488edf.13;
        Tue, 15 Dec 2020 01:27:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=cNCppxnxSVZJ5/Rvd2n/uLCSYvnwm3DgbdivThOUs1U=;
        b=rekkZYn6GQD83z9zcpa0J55lRuEoOQyXHpUFg5P3GBP0RcOdGzgCKaKEog6zFjwnj4
         Dsoc8XMCg+FtMGBeSPnzP+3koVDyQLVMr3OFkvnONgd5NQS/n/Qn9pDRu3kZrkQ4pXfI
         3sskYvBbKsKkfxyfAh1gO1U7ivZKZo6UNx8MgNr+KMDwMCF018hkP1vdBGtPhplhX5fe
         TP5XG1DYNVXgVSSIB9RxFy9kbP2xqY1ctTCMpmaF0BbGlOkZrkI+6WJZWyHgiHhBBpEG
         cxqC1P+nNMAmcFNoxumDJpddy31F9ahQOTNAmXQ5gZPLJulM0b9hxur1Z6g5KL4tWDg5
         n3YA==
X-Gm-Message-State: AOAM530GWUWr+PLSEXTuLEd3wTGe1zWif8eqWUAKaQMI8Kf0NHiFRE+r
        6jhXRAaGF9Fm9ET0RpZQcJrvVpdDhKVzwA==
X-Google-Smtp-Source: ABdhPJyv4Jp21FdhiZ4PFj7Kmmp9BgurjdgTSjYkQpi5pgzBgcce2qHp0wCJydbLoAn32X6B/i1oEA==
X-Received: by 2002:a50:bacb:: with SMTP id x69mr13198442ede.39.1608024433550;
        Tue, 15 Dec 2020 01:27:13 -0800 (PST)
Received: from kozik-lap (adsl-84-226-167-205.adslplus.ch. [84.226.167.205])
        by smtp.googlemail.com with ESMTPSA id t8sm886403eju.69.2020.12.15.01.27.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Dec 2020 01:27:12 -0800 (PST)
Date:   Tue, 15 Dec 2020 10:27:11 +0100
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc:     b.zolnierkie@samsung.com, mturquette@baylibre.com,
        sboyd@kernel.org, yadi.brar@samsung.com, mturquette@linaro.org,
        linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] clk: s2mps11: Fix a resource leak in error handling
 paths in the probe function
Message-ID: <20201215092711.GA29712@kozik-lap>
References: <20201212122818.86195-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20201212122818.86195-1-christophe.jaillet@wanadoo.fr>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Sat, Dec 12, 2020 at 01:28:18PM +0100, Christophe JAILLET wrote:
> Some resource should be released in the error handling path of the probe
> function, as already done in the remove function.
> 
> The remove function was fixed in commit bf416bd45738 ("clk: s2mps11: Add
> missing of_node_put and of_clk_del_provider")
> 
> Fixes: 7cc560dea415 ("clk: s2mps11: Add support for s2mps11")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
>  drivers/clk/clk-s2mps11.c | 1 +
>  1 file changed, 1 insertion(+)
> 

Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof

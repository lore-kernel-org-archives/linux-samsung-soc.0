Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D1CCC56202
	for <linux-samsung-soc@archiver.kernel.org>; Sun, 22 Nov 2020 11:34:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E0328212CC
	for <linux-samsung-soc@archiver.kernel.org>; Sun, 22 Nov 2020 11:34:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727741AbgKVLec (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sun, 22 Nov 2020 06:34:32 -0500
Received: from mail-ej1-f65.google.com ([209.85.218.65]:41695 "EHLO
        mail-ej1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727373AbgKVLea (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sun, 22 Nov 2020 06:34:30 -0500
Received: by mail-ej1-f65.google.com with SMTP id gj5so19290809ejb.8;
        Sun, 22 Nov 2020 03:34:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=SAUpgXkhpDLUuiNrzQtVU9JDr5pPgmZOexepaOR15kM=;
        b=JY9nQojTgARxcqUTOOVIVtE3WcxwM1Yv+36Lvb9EiSLFMX2VG8FyX1ocP55Cxigztc
         0rSBIRolSLRhpaGZkYjbW2GhHZhUbm1Nhywc1g7v3TQNw3MrbuaOkhjTQPJayLQqeZl4
         wxi/qpglke7NwJ8n+Tjvo7bhjajwbtAZLLAPeJWOXpxbSWqOfxBRa37MBtfY+D7J1mwn
         gbgihabgGJqLZdNvGEJYK2s36/+S+bv+O3PZRNudzt13JD+ANzD9czafLJIRJLmk4ADp
         6QSqny8lTWdp26srDqkzunadTWHVoSn2Ry598h9Mksp1mwn87G9Wv9e1qp86tcpoDaH2
         rGxg==
X-Gm-Message-State: AOAM533p7k70MkpoU8HY3ZkMGkt4uzjwxkob2YrTETpxPdN6nML++vJ0
        Jn/ykT1VIRX5XXkpIQl+ovw=
X-Google-Smtp-Source: ABdhPJwf2cpSra61Bq1x3wiIFVpi+/rv8Zj0QYd2SeuETiIkDycslILQ3sAb1weDhQpNpkIzxFRX7g==
X-Received: by 2002:a17:906:35da:: with SMTP id p26mr40421111ejb.256.1606044867906;
        Sun, 22 Nov 2020 03:34:27 -0800 (PST)
Received: from kozik-lap (adsl-84-226-167-205.adslplus.ch. [84.226.167.205])
        by smtp.googlemail.com with ESMTPSA id rp28sm3481828ejb.77.2020.11.22.03.34.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2020 03:34:26 -0800 (PST)
Date:   Sun, 22 Nov 2020 12:34:25 +0100
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Sylwester Nawrocki <snawrocki@kernel.org>
Cc:     Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: samsung: allow compile testing of Exynos, S3C64xx
 and S5Pv210
Message-ID: <20201122113425.GA6633@kozik-lap>
References: <20201119164509.754851-1-krzk@kernel.org>
 <f44c5f4f-bda4-a1c1-dc6a-dc31efa314c6@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <f44c5f4f-bda4-a1c1-dc6a-dc31efa314c6@kernel.org>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Fri, Nov 20, 2020 at 05:36:35PM +0100, Sylwester Nawrocki wrote:
> On 11/19/20 17:45, Krzysztof Kozlowski wrote:
> > So far all Exynos, S3C64xx and S5Pv210 clock units were selected by
> > respective SOC/ARCH Kconfig option.  On a kernel built for selected
> > SoCs, this allowed to build only limited set of matching clock drivers.
> > However compile testing was not possible in such case as Makefile object
> > depent on SOC/ARCH option.
> 
> "objects depend" or "object depends" ?

"object depends"

> 
> > Add separate Kconfig options for each of them to be able to compile
> > test.
> > 
> > Signed-off-by: Krzysztof Kozlowski<krzk@kernel.org>
> 
> The patch look good to me, thanks.
> Acked-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
> 
> I guess it's best now to merge it through your tree as it depends on 
> patches already sent to arm-soc? Next time it might be better to use 
> immutable branches right away to keep the clk changes in the clk 
> maintainer's tree.

At that time I had only one clk patch so I did not put it on separate
branch.

Anyway, this does not depend on the clkout patches and only minor patch
adjustement is needed. Cherry-pick can solve it (you would need to apply
on next/master and then cherry pick) or I can resend you one rebased on
linus/master.

There should be no conflicts when merging later into next or linus.

I propose you should take it via clk tree.

Best regards,
Krzysztof


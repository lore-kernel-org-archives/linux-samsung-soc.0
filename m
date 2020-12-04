Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1A2FC433FE
	for <linux-samsung-soc@archiver.kernel.org>; Fri,  4 Dec 2020 15:34:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 57EFC22BE9
	for <linux-samsung-soc@archiver.kernel.org>; Fri,  4 Dec 2020 15:34:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730488AbgLDPeR (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 4 Dec 2020 10:34:17 -0500
Received: from mail.kernel.org ([198.145.29.99]:39040 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730404AbgLDPeR (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 4 Dec 2020 10:34:17 -0500
X-Gm-Message-State: AOAM530h/s+LgWboHMpirkMFpY0vQ8GCrDxxS8E+Bm9zDLxQB/nQ5PQ3
        HwGZ1NuogW31ELwqJMvzwC0Hohfz5qFEGa14GBQ=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1607096016;
        bh=yr/o0w9PRpAY+vOIzOHgJtqHu1IRFvnlBsfNiZbopHc=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=IcTNUTFmnQKtw+MPPVPz4YjDUpwgR9a0qZCuWHHF6HdrNQJtM+xCbiQX2tk8BUmRH
         6xQmG0y3Y/WcJsL1GUdiSiTlv5XmMdp+nm8DisEwKHeUC8KoD9L2V6PEMl9F/ZZkit
         fzcNgnLXSuK7cHG+olDPRW95eFfD2wXfEF9jg9ZY99Te106affJtUzs9fvfve+DpH3
         N6EE30dDgzoQDKZ84NIysZmNqJGzjqoI8Vjsdw3qQayHuc6iLb9Xro0ZKaQGLq0KKo
         iLZf1HsqqF3ciQ2s2EffDuDLql0bRvRLy3RgsTPRD86FaVMpA5SPVLYwk8zdHqP7/q
         hM99IYVfhl3pg==
X-Google-Smtp-Source: ABdhPJx9IyMCiMl6+MXjJkDVKgelbRp6j+c8WQloT+BueFKcHbaKDH9cv9tkV7oZbr0UbiebBOIQ0+hrO88ovjjDcug=
X-Received: by 2002:a17:906:7ac7:: with SMTP id k7mr7514979ejo.454.1607096015161;
 Fri, 04 Dec 2020 07:33:35 -0800 (PST)
MIME-Version: 1.0
References: <3548618a-eb36-bf3a-d589-e06fd5f2111b@kernel.org>
In-Reply-To: <3548618a-eb36-bf3a-d589-e06fd5f2111b@kernel.org>
From:   Krzysztof Kozlowski <krzk@kernel.org>
Date:   Fri, 4 Dec 2020 16:33:23 +0100
X-Gmail-Original-Message-ID: <CAJKOXPcaUx5JwVU+VtkJWimTn2LgY5bbBPn3vJLP22oHQiU48g@mail.gmail.com>
Message-ID: <CAJKOXPcaUx5JwVU+VtkJWimTn2LgY5bbBPn3vJLP22oHQiU48g@mail.gmail.com>
Subject: Re: [PATCH] [v2] clk: samsung: mark PM functions as __maybe_unused
To:     Sylwester Nawrocki <snawrocki@kernel.org>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Arnd Bergmann <arnd@arndb.de>,
        "linux-samsung-soc@vger.kernel.org" 
        <linux-samsung-soc@vger.kernel.org>, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Fri, 4 Dec 2020 at 16:28, Sylwester Nawrocki <snawrocki@kernel.org> wrote:
>
> From: Arnd Bergmann <arnd@arndb.de>
>
> The use of SIMPLE_DEV_PM_OPS() means that the suspend/resume
> functions are now unused when CONFIG_PM is disabled:
>
> drivers/clk/samsung/clk-exynos-clkout.c:219:12: error:
> 'exynos_clkout_resume' defined but not used [-Werror=unused-function]
>    219 | static int exynos_clkout_resume(struct device *dev)
>        |            ^~~~~~~~~~~~~~~~~~~~
> drivers/clk/samsung/clk-exynos-clkout.c:210:12: error:
> 'exynos_clkout_suspend' defined but not used [-Werror=unused-function]
>    210 | static int exynos_clkout_suspend(struct device *dev)
>        |            ^~~~~~~~~~~~~~~~~~~~~
>
> Mark them as __maybe_unused to shut up the otherwise harmless warning.
>
> Fixes: 9484f2cb8332 ("clk: samsung: exynos-clkout: convert to module
> driver")
> Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
> v2: add proper changelog text
>
> Acked-by: Sylwester Nawrocki <s.nawrocki@samsung.com>

Indeed this should go via samsung soc tree...

Best regards,
Krzysztof

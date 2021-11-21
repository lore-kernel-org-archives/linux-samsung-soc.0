Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47B28C433EF
	for <linux-samsung-soc@archiver.kernel.org>; Sun, 21 Nov 2021 22:53:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233089AbhKUW45 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sun, 21 Nov 2021 17:56:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35868 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233443AbhKUW44 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sun, 21 Nov 2021 17:56:56 -0500
Received: from mail-ua1-x929.google.com (mail-ua1-x929.google.com [IPv6:2607:f8b0:4864:20::929])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6AD9EC061714
        for <linux-samsung-soc@vger.kernel.org>; Sun, 21 Nov 2021 14:53:51 -0800 (PST)
Received: by mail-ua1-x929.google.com with SMTP id y5so32850421ual.7
        for <linux-samsung-soc@vger.kernel.org>; Sun, 21 Nov 2021 14:53:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=7ZLP9fQhGwNjrWJyLOt3Pzje9V6HonG+6QyQP8b20Tw=;
        b=GZvzyGHvtM96yYXUaTzccRThsxoj/RB9CSGafatzts7iIzjPowy3nFSLfbr7dKw/T6
         /9ipS8Sn74n52fmjuxrCkxUqTYR4Ja519pXOMP9y67W0OWRyzwXLLvtA5WoFnGZjuHgg
         eVBB3sWRsRGHqt5QXvl5IJ12aQCZvEdj5+9coDFrNHz2ZuiTuXH084wDxtwx/wIJJpZx
         SBUu3vQ4I4vq+uZIVnYtsHbBwzcx7f/qHIwhVdYoopjkjYZ4b5oty8NrAxzz+pgnHsgq
         H6OdgquCre14Uhva5UcODqAQIfZgn1OY3XJAFABUgUTw0Z4x9+ThDjzx7LnUWWK5bbb0
         TGmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7ZLP9fQhGwNjrWJyLOt3Pzje9V6HonG+6QyQP8b20Tw=;
        b=neDddCDbcgcerOssCmISEJZ2BBI8kU05pxzrynDfolxgQ02AQHt+Cp84y5BZpmIrTS
         KF6W7CLxFQdmwVOcoPKz2hCYWj4yQBMyXBkJLlDSR0kJgIXODTJcE0NO4GtwtVcAP56K
         5qLcHCWrYjyi5EwU7rQybBScd/8ZwVVZjhKWfjFw+i2fLen4nsNNALtGhu7yI4xvcgGi
         2l/mBLTEWmdK7y9aRuG4uf6sx4B4/WJ0dl5gFXRbnr62qGfaFMLN0yEKL5M1FmQ+L7O1
         AJcbdWhbuVVXWBQZuACMTXUUWGUBhBjbD4lDTtPwgOA21aIVL4W/D+ksIPVXjQJ/LLno
         skfg==
X-Gm-Message-State: AOAM530LKvpgS9SeYXrNcTChQdwt4M2uPcBzTy3+46ypMA2NRPh/0Ml8
        TwxdkaTzSQ5lLrCjFYHiaXg/CvJtw7xDz/UhB7OiKw==
X-Google-Smtp-Source: ABdhPJyZDCljPC+L3CUnOG8d34T+97AClO2CZiiR5mtmJtqr75V48osArA7V2GYS+OHAXlsi01fdjb3drkXCNuLASx8=
X-Received: by 2002:a67:d893:: with SMTP id f19mr120722604vsj.39.1637535225617;
 Sun, 21 Nov 2021 14:53:45 -0800 (PST)
MIME-Version: 1.0
References: <20211109164436.11098-1-semen.protsenko@linaro.org>
In-Reply-To: <20211109164436.11098-1-semen.protsenko@linaro.org>
From:   Sam Protsenko <semen.protsenko@linaro.org>
Date:   Mon, 22 Nov 2021 00:53:34 +0200
Message-ID: <CAPLW+4mLEbmtC=M5q_RJSn7UGca5dk=uTJE9E2ruYTK_9AhxDg@mail.gmail.com>
Subject: Re: [PATCH 0/2] clk: samsung: exynos850: Implement CMU_CMGP
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        =?UTF-8?Q?Pawe=C5=82_Chmiel?= <pawel.mikolaj.chmiel@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     Sumit Semwal <sumit.semwal@linaro.org>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Tue, 9 Nov 2021 at 18:44, Sam Protsenko <semen.protsenko@linaro.org> wrote:
>
> This series adds CMU_CMGP clock domain to Exynos850 clock driver. In
> particular it needs to enable HSI2C (High-Speed I2C) nodes. This series
> depends on CMU_APM series [1].
>
> Tested via /sys/kernel/debug/clk/clk_summary:
>
> <<<<<<<<<<<<<<<<<<<<<<<<<<<< cut here >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
>                                  enable  prepare  protect
>    clock                          count    count    count        rate
> ---------------------------------------------------------------------
>
> clk_rco_cmgp                         0        0        0    49152000
> oscclk                               1        1        0    26000000
>     mout_cmgp_adc                    0        0        0    26000000
> ...
>     gout_clkcmu_cmgp_bus             1        1        0   399750000
>        gout_cmgp_usi1_pclk           0        0        0   399750000
>        gout_cmgp_usi0_pclk           0        0        0   399750000
>        gout_gpio_cmgp_pclk           0        0        0   399750000
>        dout_cmgp_adc                 0        0        0    28553572
>        mout_cmgp_usi1                0        0        0   399750000
>           dout_cmgp_usi1             0        0        0   199875000
>              gout_cmgp_usi1_ipclk    0        0        0   199875000
>        mout_cmgp_usi0                0        0        0   399750000
>           dout_cmgp_usi0             0        0        0   199875000
>              gout_cmgp_usi0_ipclk    0        0        0   199875000
> <<<<<<<<<<<<<<<<<<<<<<<<<<<< cut here >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
>
> [1] https://lkml.org/lkml/2021/10/22/979
>
> Sam Protsenko (2):
>   dt-bindings: clock: samsung: Document Exynos850 CMU_CMGP
>   clk: samsung: exynos850: Implement CMU_CMGP domain
>
>  .../clock/samsung,exynos850-clock.yaml        |  19 ++++
>  drivers/clk/samsung/clk-exynos850.c           | 100 ++++++++++++++++++
>  include/dt-bindings/clock/exynos850.h         |  17 +++
>  3 files changed, 136 insertions(+)
>
> --
> 2.30.2
>

This patch series is superseded by:

    [PATCH 0/6] clk: samsung: exynos850: Clock driver improvements

(going to submit that soon).

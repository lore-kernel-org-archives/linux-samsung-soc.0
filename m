Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7368C71155
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  1 Dec 2020 22:56:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 77C51221E2
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  1 Dec 2020 22:56:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726486AbgLAWzz (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 1 Dec 2020 17:55:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40062 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726482AbgLAWzz (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 1 Dec 2020 17:55:55 -0500
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com [IPv6:2a00:1450:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C4E84C061A48
        for <linux-samsung-soc@vger.kernel.org>; Tue,  1 Dec 2020 14:55:14 -0800 (PST)
Received: by mail-lf1-x143.google.com with SMTP id s30so8077603lfc.4
        for <linux-samsung-soc@vger.kernel.org>; Tue, 01 Dec 2020 14:55:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=zek3Th/B8edX275oK4UQoFClWrn9486n8mnbXM2NC2Y=;
        b=Hk5i6eiY5/+oDJs06GOmfCHlKHo8p3HBzdmov0q+9L3/P0VVaQV0BuPBqi6X9NeEFr
         QOLO8j75gBm1jmxMZ2Ey0gtGb16IFnfz864r/D56jMIqdHPjOSmFjAi0/k6CAyYo27E6
         yHS4ev7edijhpZelG254A5SnxgyLVb1+6prTRWsMIoK15Q0jqsRmLOz2zTybXz7u4Pes
         HMmiucTf56IugTvZ+8DD+znsMNDysM3HOCsJ7uMNHDNBfGs6g387VS4zQfHcHaEwMVJZ
         Dsc+Z2TXIfMo2A+JOc4SJ1npSR2K7Jpl+zZmMWefMWsiPHUO+wqzBdMAK9B6jLTLWv3j
         j+qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zek3Th/B8edX275oK4UQoFClWrn9486n8mnbXM2NC2Y=;
        b=gBz91UYuZ2pFCpg9ByJzJNNSKrkZPuif2gYreCcYJEdvbhUhIdJySIHRmRNnhXG6Gf
         1hVPxRkwQT5rXe94eyZqyuFO7yZhQFjBveiCTn1e1V3d6wbPNANLimgeU1T2VQWQNrgu
         5+CfS6pHIGShzddOGEJpz1f49o+H5toTKOdjGEkPdHualsMEqBRP1nWReJ5Z5VXkAmNH
         nEk83CAWCfSZdoMttnNBJvT25tGIO7baRzfRctsGR1/ta2lb2LM+pS2q6jE7UoeCtlQG
         SqyzoOtvgxZEaCMhf3X5uafXEgougK5pFV9u1xPn/FiTZNR5FF4/iT3T6+BHnV7RD1lv
         Faow==
X-Gm-Message-State: AOAM531vTQGxSqwg1juBAGiCD5eohzlqPqSLiv7Ehv+l3ctIfEZD2Byt
        i/5qnSS58TMNI+0ew7IP/J0Vo87pQuuQV3E6X1mfCQ==
X-Google-Smtp-Source: ABdhPJybfqBt2Tifwmy8kuDNWfeanwDGl7Yn1/jdNn0SkGnsbrwGrAiI9VqQuyyzvwLRXgAHPCcRgqDWctE9pp3nTJ0=
X-Received: by 2002:a19:5f11:: with SMTP id t17mr2132447lfb.572.1606863313318;
 Tue, 01 Dec 2020 14:55:13 -0800 (PST)
MIME-Version: 1.0
References: <20201201204652.22913-1-krzk@kernel.org>
In-Reply-To: <20201201204652.22913-1-krzk@kernel.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 1 Dec 2020 23:55:02 +0100
Message-ID: <CACRpkdY9YqW11sKqcJcF0kCon1tGgXNgASXTdiiZKnU+cjivsQ@mail.gmail.com>
Subject: Re: [GIT PULL] pinctrl: samsung: Pull for v5.11
To:     Krzysztof Kozlowski <krzk@kernel.org>
Cc:     Tomasz Figa <tomasz.figa@gmail.com>,
        Sylwester Nawrocki <snawrocki@kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Tue, Dec 1, 2020 at 9:46 PM Krzysztof Kozlowski <krzk@kernel.org> wrote:

> The following changes since commit 3650b228f83adda7e5ee532e2b90429c03f7b9ec:
>
>   Linux 5.10-rc1 (2020-10-25 15:14:11 -0700)
>
> are available in the Git repository at:
>
>   https://git.kernel.org/pub/scm/linux/kernel/git/pinctrl/samsung.git tags/samsung-pinctrl-5.11
>
> for you to fetch changes up to c5564a50d99019f3c713fa306d5feecc3e909b10:
>
>   pinctrl: samsung: s3c24xx: remove unneeded break (2020-10-26 20:23:29 +0100)

Pulled in for v5.11!

Thanks!
Linus Walleij

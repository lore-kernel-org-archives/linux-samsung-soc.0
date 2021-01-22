Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B37CC433E0
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 22 Jan 2021 13:16:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B98CB23444
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 22 Jan 2021 13:16:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727256AbhAVNQQ (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 22 Jan 2021 08:16:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36264 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726997AbhAVNQL (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 22 Jan 2021 08:16:11 -0500
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5BE29C06174A
        for <linux-samsung-soc@vger.kernel.org>; Fri, 22 Jan 2021 05:15:31 -0800 (PST)
Received: by mail-lj1-x232.google.com with SMTP id f11so6443476ljm.8
        for <linux-samsung-soc@vger.kernel.org>; Fri, 22 Jan 2021 05:15:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=XPOjidGOoz6G849r0XktZlM350N7naajoXOO2w5nwCI=;
        b=FkNuR0pa++Cezk9GaW6HZnS/zZJ6J/6o2Tn/LzPmBo75x+PwTAbHFGWcS0OcozlGpt
         YA79jVcGdWYZBFhYa5ZN/SD9DFgQS3KhorU7QPSx6QSyOcSg1WFq63PyLUNLROusP11h
         MyGLarBcDR83HCx3ROGxToURYaLbH8TW+bk/wTdmW2c9tlU1ELpjD3ruUnQWCvWQaFQH
         X6Z5XtP4ZcV9yu8aRlZh/bkCjaLODi0kbnv3w3q2448bXQa8vyz3kRVGgfO2xkP8lN4S
         BWmj8LAGpcALdRrxFpLFaobstCwurOyZcITDleUNtYrjknWd9JqTXMlzgXTltmlbwGBs
         ngew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=XPOjidGOoz6G849r0XktZlM350N7naajoXOO2w5nwCI=;
        b=PGSe6E2YkRABXrEfb3Ef9viytgmOScw47fQlw7+mPHQUxaj/2vdojqdywG6Du+B8pH
         b6jDUw+ZHg6cXuaJUy1W1AkQVRbaeOmt/BVrNTlhXpeZF1xlm014REeLUAOraiZqIP3W
         NLw9HmN51mQ+gK6WyxhNvPSQYwsr8I9n51cqlFe2EkuDeV3ZwfB5P7uyztARQQDu/RPR
         OB4W6W083yOwNeePaw08rkvdBAnVb+VN6ytBg8N6NizEI/qv6RBLJGAeXLPXUEnxAnyV
         NQvZF5YKCyJgtQAzk6Zofv/lkGv9WjtL0QSfF+Bk9bPRKeqUgPDyI830NQBvrOOmj9VN
         39bw==
X-Gm-Message-State: AOAM532BQWFs71WqBgoqM1NTOzfSHi6GDAK6V2GkesnNt8JM8N7Xt9dN
        44/yIh6eL4Mmky9qfq4NxHQVqc5L0mxAc3mlv5PczA==
X-Google-Smtp-Source: ABdhPJyR4LVnBW4RY9iZkqhMh090DRIFoHPlq+WdeBLHMiG0h0B55OsiSe/VpBs2qHa3ry9L5vYsZ7IANch8ByyfGx8=
X-Received: by 2002:a2e:9dc3:: with SMTP id x3mr771911ljj.326.1611321329706;
 Fri, 22 Jan 2021 05:15:29 -0800 (PST)
MIME-Version: 1.0
References: <CGME20210121030006epcas2p40fd4e30ae5bf514b7891a464462db7be@epcas2p4.samsung.com>
 <20210121030009.25673-1-chanho61.park@samsung.com>
In-Reply-To: <20210121030009.25673-1-chanho61.park@samsung.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 22 Jan 2021 14:15:18 +0100
Message-ID: <CACRpkdZ26sNR+oZy_f6JR4ZuNWS9PoVAm-OuNwgzCAuhEBGTeQ@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: samsung: use raw_spinlock for locking
To:     Chanho Park <chanho61.park@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
Cc:     Tomasz Figa <tomasz.figa@gmail.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-samsung-soc <linux-samsung-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Thu, Jan 21, 2021 at 4:00 AM Chanho Park <chanho61.park@samsung.com> wrote:

> This patch converts spin_[lock|unlock] functions of pin bank to
> raw_spinlock to support preempt-rt. This can avoid BUG() assertion when
> irqchip callbacks are triggerred. Spinlocks can be converted rt_mutex
> which is preemptible when we apply preempt-rt patches.
>
> According to "Documentation/driver-api/gpio/driver.rst",
>
> "Realtime considerations: a realtime compliant GPIO driver should not
> use spinlock_t or any sleepable APIs (like PM runtime) as part of its
> irqchip implementation.
>
> - spinlock_t should be replaced with raw_spinlock_t.[1]
> "
>
> Cc: Tomasz Figa <tomasz.figa@gmail.com>
> Cc: Krzysztof Kozlowski <krzk@kernel.org>
> Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Signed-off-by: Chanho Park <chanho61.park@samsung.com>

Looks correct to me.
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Krzysztof, will you collect Samsung patches for this merge window or
shall I apply it directly?

Yours,
Linus Walleij

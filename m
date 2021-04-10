Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADBAFC433B4
	for <linux-samsung-soc@archiver.kernel.org>; Sat, 10 Apr 2021 00:07:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 858E961105
	for <linux-samsung-soc@archiver.kernel.org>; Sat, 10 Apr 2021 00:07:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235226AbhDJAHy (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 9 Apr 2021 20:07:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41728 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235182AbhDJAHw (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 9 Apr 2021 20:07:52 -0400
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8AC80C061763
        for <linux-samsung-soc@vger.kernel.org>; Fri,  9 Apr 2021 17:07:38 -0700 (PDT)
Received: by mail-lj1-x22e.google.com with SMTP id y1so8376536ljm.10
        for <linux-samsung-soc@vger.kernel.org>; Fri, 09 Apr 2021 17:07:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=wJNZvvQN4sPxM5wTrNOHML+RfF3Y8nDwxuD/Ny2pkH0=;
        b=XzsZoxckL2/lWNBV343T7e8p1OP1MEHfrrQySw3QeHFDCqhKSGv5/ETPu7lgi9+czL
         GCzTdNeJ/sv/szktTSmrR+2owxPBidWWcD6smgH2GCf10wu+l/4m1VF19xWl+Ip+jKLD
         K3ASd9yBJP8nC/sqUXiJNPb9ltqdqFHATegBbiYog/mmJV/XgUf9NGrOm2OOBr3Q7FUe
         1VGb0vo1Cwu5lWjTA+c7G8wgKFe9dw1cSOeyD/vvZL52W5BuLlgkL3qx0LRPCc5TVS1V
         KJN/jbBMZ0u+ZiWmtlTs23MUBSHUYzcx61NGUwKFwZ0xrqON6F5TzDVxbVgCW5wzQL0l
         TyDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=wJNZvvQN4sPxM5wTrNOHML+RfF3Y8nDwxuD/Ny2pkH0=;
        b=tT6u9aLt0SuLaNxZ6UK2ifPtWeTpgi0WugNluQ0DCcF/g0gebKBoTB2CeOnmMg3m35
         qMrSXvE9qnJTCJpYN41RyR7c84iKMsy63I8UtQtTScSEtgdXuW1vJKjPejtBXSbX9oBj
         K2vgzv+a/mjWtQNwKd980ald7l/b5t6lNcQz+VYN7vmYGRw5hVyiItFg3kPUgkwyP3Pu
         e4OugMzSxKCWce0z49y5lMQYHVJupGxIU1Jjwx8hPJQtlBDKT60czUitb7JDeAzNzhrj
         AsN2xhwmQho5qVLAtY8rRJkpTAr8CmR+UleIvgyU5icmm1KEs4WMuVMX70g5q+W1RDGK
         8hJA==
X-Gm-Message-State: AOAM530352c1yxwiaovaWUsco4YZL3Ile/z4yLnX/347c4dquxnQxm0J
        7TVrSkJBL+Vb0a8I2hjDKZKuCtl7e3c0nOzh0cam1A==
X-Google-Smtp-Source: ABdhPJyi9BNKN/wSUa0cnqzp5rwoSw8W2ep8I9VXh2Adb4f1hRty42wJTvzb17wXiXq9jMTCp9/8ZZiGbZUTThq0SQQ=
X-Received: by 2002:a2e:7001:: with SMTP id l1mr10693204ljc.200.1618013256948;
 Fri, 09 Apr 2021 17:07:36 -0700 (PDT)
MIME-Version: 1.0
References: <20210408195029.69974-1-krzysztof.kozlowski@canonical.com>
In-Reply-To: <20210408195029.69974-1-krzysztof.kozlowski@canonical.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sat, 10 Apr 2021 02:07:26 +0200
Message-ID: <CACRpkdYm0yG7mC0H7YwgQdPP1eT=GSkvHbohA7jc6LDsVPsZBQ@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: samsung: use 'int' for register masks in Exynos
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     Tomasz Figa <tomasz.figa@gmail.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Thu, Apr 8, 2021 at 9:50 PM Krzysztof Kozlowski
<krzysztof.kozlowski@canonical.com> wrote:

> The Special Function Registers on all Exynos SoC, including ARM64, are
> 32-bit wide, so entire driver uses matching functions like readl() or
> writel().  On 64-bit ARM using unsigned long for register masks:
> 1. makes little sense as immediately after bitwise operation it will be
>    cast to 32-bit value when calling writel(),
> 2. is actually error-prone because it might promote other operands to
>    64-bit.
>
> Addresses-Coverity: Unintentional integer overflow
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
(...)
> Please apply it directly, I don't have any patches for Samsung pinctrl
> in my tree.

OK! Patch applied!

Yours,
Linus Walleij

Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A78F9C4332F
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  5 Oct 2021 16:08:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 895C661354
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  5 Oct 2021 16:08:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236348AbhJEQKO (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 5 Oct 2021 12:10:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41052 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234539AbhJEQKN (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 5 Oct 2021 12:10:13 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 509E5C061749
        for <linux-samsung-soc@vger.kernel.org>; Tue,  5 Oct 2021 09:08:22 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id g41so88088135lfv.1
        for <linux-samsung-soc@vger.kernel.org>; Tue, 05 Oct 2021 09:08:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=dzfx3fsRo7F5xw3fHSg8nKJV024hLxYFAlzOMQp4+E4=;
        b=uFqA5Cc3evmiBrUl9z6ToXQIVBU296s5VunLco/GeXPzwXHxuPpMdOxZBBU7FsQwzb
         ohznDJht5Qkj9hI2kFgCESrzSMkuWoMc90R6zOxOlAA2xntHYdgt90DkQVT5LQ8qb588
         yeaPyQhKooeku/8QQQEEN67WGwghh7Y3uBzNWseOHcM4GkhJ7PxJERPwq8fjoQgRjhKu
         ektxYB62gxECriYpa30+gxG5IcaPhA8YZ6wowtlTqeamGaePiWoxBgyJjGgLIysYZXUa
         yUCFn8xxFpTQScVpxMRkJM2ZQ7x9YmbSz3Ut/7OJ3qYgAhFiQhHy8Zv0Z/J+7G8gKW2K
         wx0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dzfx3fsRo7F5xw3fHSg8nKJV024hLxYFAlzOMQp4+E4=;
        b=YPcOiqR98O23ttqzciXMtDVbypnqtJDUX0DT9K5Nno7Hw289xLArUAAt8WvXaZUYEv
         8U+w1GxI34aFJslpXb+jA4u43vfE3ePns0nYpco6TbGUJUbfBFzMH1/2PCa0QR2K6qRM
         NneJq6R0Y0s2i3nPOs8udLr2Uq5y4oFOlTnPK1cSTqUVrlm0GGlVVDXabds1sBm6IbRU
         7Vlqb+9gHMS2GnOleYf/+U63DKyFhvHg7LUcB/22a5oRltw1N89WXrpKR4CfXG2Y2zg1
         7RX6ZjZM5X6xQHPMczj6T9vVLzpvXiSj21ctdOfqDMBDVN8XccGmh68KwgHC40DJv2We
         pQzw==
X-Gm-Message-State: AOAM531fkzhna7viCpePTITtLmmwmU1yu8rtxfaOUB8ftKFjh0OJjANa
        6E/A5OPp74wmMY6LUInB4bfpu33XbVs5yCPFWfqwBw==
X-Google-Smtp-Source: ABdhPJwnC31+Ik6u2dpcC0CWhMVXL1AHvSjtDIcmiq1/SWE794/6DgQfUSDzkEj3yIm9x+wD7DVu/FMKUe34DDg+Je4=
X-Received: by 2002:a05:6512:10cc:: with SMTP id k12mr4520941lfg.72.1633450099935;
 Tue, 05 Oct 2021 09:08:19 -0700 (PDT)
MIME-Version: 1.0
References: <20211005155923.173399-1-marcan@marcan.st> <20211005155923.173399-4-marcan@marcan.st>
In-Reply-To: <20211005155923.173399-4-marcan@marcan.st>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 5 Oct 2021 18:08:08 +0200
Message-ID: <CACRpkdanbovvXXLAGGZEEiKXXrNnW+8p1sCONQYWmAjVi-m-9A@mail.gmail.com>
Subject: Re: [PATCH 3/7] soc: apple: Add driver for Apple PMGR power state controls
To:     Hector Martin <marcan@marcan.st>
Cc:     Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Marc Zyngier <maz@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Arnd Bergmann <arnd@kernel.org>,
        Alyssa Rosenzweig <alyssa@rosenzweig.io>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mark Kettenis <mark.kettenis@xs4all.nl>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux PM list <linux-pm@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
        "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi Hector,

On Tue, Oct 5, 2021 at 6:00 PM Hector Martin <marcan@marcan.st> wrote:

>  drivers/soc/apple/Kconfig               |  21 ++
>  drivers/soc/apple/Makefile              |   2 +
>  drivers/soc/apple/apple-pmgr-pwrstate.c | 281 ++++++++++++++++++++++++

This is traditionally where we put the ARM SoC drivers, but
Mac has traditionally used drivers/macintosh for their custom
board etc stuff. Or is that just for any off-chip stuff?

I suppose it doesn't matter much (unless there is code under
drivers/macintosh we want to reuse for M1), but it could be a bit
confusing?

Yours,
Linus Walleij

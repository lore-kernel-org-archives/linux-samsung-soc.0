Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75B0BC433DB
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 12 Feb 2021 09:47:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 45D6864E38
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 12 Feb 2021 09:47:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229983AbhBLJrM (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 12 Feb 2021 04:47:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33892 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229905AbhBLJrJ (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 12 Feb 2021 04:47:09 -0500
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 28495C061574
        for <linux-samsung-soc@vger.kernel.org>; Fri, 12 Feb 2021 01:46:27 -0800 (PST)
Received: by mail-lf1-x12a.google.com with SMTP id b2so12268940lfq.0
        for <linux-samsung-soc@vger.kernel.org>; Fri, 12 Feb 2021 01:46:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=i4ca59SdGEVnFSofi3ZXoX6JlgB2eaV3/YrXqwVKM8w=;
        b=Yy351HLBZUge4sG9PBG2oLCjXOrReyEUMGZdK7mNji7JwMOZqqljspFEyf0HEKVnDc
         ZkyxPuWz5lXXja33P/NlPIJ1NSZGsATcWJKqtMtded81fkJO3ebDhCrDsWb5Np3hwtGL
         WBzhe6ZboL8lBI0ymtSQTMaQfMpmzV+MRwTEOEQw8uCiUwDC3woGumorSBeK6WiQzcoU
         8YwJhBQQKfJAF8+Np3v/9GniuaaJm68pfN/arA/yqwy2xeQnxLIpWNjngsbpUYPWpiqs
         m4EXb4OfhBGb/HP4e9Iql22pw0jzeap/xgK6NHLr6KTupqokL+Wywa/xLc6IOUUmmRDd
         mBlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=i4ca59SdGEVnFSofi3ZXoX6JlgB2eaV3/YrXqwVKM8w=;
        b=QRBithsc8AKMpjkqauiApEh7csfRu8rn9UBb4+MBSLVeyNCRaMuulbEyfK/F7E19QI
         fzQhvtpe08U4CEZm8XLcX/e45kluIfWN/JS7h4cWkxo/79RQ4y37Kh+/0ZfNbzdBnfRk
         pqUqWLwCHSsVL9fQC9zCuB/TfHVXUXYqYHkpeX0dmNsCdl0cC0ROtG5ofm8bIuk71yMJ
         h6pBjH7F+Y0bgiJb8DFhzCYhS3DdYxAH2A7WoEQ85NFOqefucu9T54zhRoHH5Gxrkh1s
         BfY5XT8Va/x8G+iHpbkSjmVuqVKuj+IFMm6npau9e/GOFAkxk0yVCYrMYHxveVlDc03G
         mn9w==
X-Gm-Message-State: AOAM532zMCHHgK6gAwOr4Zc7MOReZHloG0LHiZupNlvngp70ZWrGrqXN
        106b+TJzN6gfjq/z2th/6blRqN+E/oLkskxj/rk5Gg==
X-Google-Smtp-Source: ABdhPJwIYedS7M45SGCJ9oNwPA/7hLc3LJLJFqoY2yYENbG6825pEXbq5JXjPw2/Djuva+5uHhN7aTJfuFaSNzpMinQ=
X-Received: by 2002:a19:70e:: with SMTP id 14mr1094188lfh.157.1613123185577;
 Fri, 12 Feb 2021 01:46:25 -0800 (PST)
MIME-Version: 1.0
References: <20210204125718.1646082-1-geert+renesas@glider.be>
In-Reply-To: <20210204125718.1646082-1-geert+renesas@glider.be>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 12 Feb 2021 10:46:14 +0100
Message-ID: <CACRpkdadDRXa=Hv7dkaTL5pU5hYANQicKgTUhE7jEu6m81Hqvw@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: pinctrl: Group tuples in pin control properties
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Dong Aisheng <aisheng.dong@nxp.com>,
        Fabio Estevam <festevam@gmail.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Stefan Agner <stefan@agner.ch>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Sean Wang <sean.wang@kernel.org>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Thu, Feb 4, 2021 at 7:02 PM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:

> To improve human readability and enable automatic validation, the tuples
> in "pinctrl-*" properties should be grouped using angle brackets.
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Patch applied.

Yours,
Linus Walleij

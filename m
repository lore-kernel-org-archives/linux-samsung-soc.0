Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2EF81CCA479
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 28 Jun 2022 13:55:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346994AbiF1Nz5 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 28 Jun 2022 09:55:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32952 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345626AbiF1Nz5 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 28 Jun 2022 09:55:57 -0400
Received: from mail-yw1-x1131.google.com (mail-yw1-x1131.google.com [IPv6:2607:f8b0:4864:20::1131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 211A43152F
        for <linux-samsung-soc@vger.kernel.org>; Tue, 28 Jun 2022 06:55:56 -0700 (PDT)
Received: by mail-yw1-x1131.google.com with SMTP id 00721157ae682-317741c86fdso117919347b3.2
        for <linux-samsung-soc@vger.kernel.org>; Tue, 28 Jun 2022 06:55:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=kxOhQolvwduRWfHp8nzmrFY1G8WxOuz7AW66OC89GlU=;
        b=aIvg8hbrgemKNvg22KLNdqF1iZoyHZJHvQ+cI+1v3vreL1Y0S/gmjfQZRi5rozr2NI
         n3Mg0QxI1maN80y0myC76XImJj4HD1RLw+ZsrntlrYTIRfINOWrtKjFTl9j9pEHxTRIH
         CaBkZBYNtfv0LqzNEIAyMsaDTCLdG2X6M1ur4zd4FD3M5OM94hTv3E7iOtT+YeLF4fcX
         JYs2H7JNSAHpqyUrfpPnrRfedI/SjA36/E3kp3426It+zCbbrtRlghG2I36Tpgby2rLC
         H7jxp/FZGvL0IT50hh9/1jInVjASJeRXbayWWnpkHzeO4EHnOwgTCJxIv8xpsKUGrzDx
         kxTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=kxOhQolvwduRWfHp8nzmrFY1G8WxOuz7AW66OC89GlU=;
        b=nl30LZxQJ8NdyRD8B/7IxUXjhVTdswzDu0r/cCHbJNiGPDmMZV6sp5VOnavBDAzRxk
         x2sMXorwXvr/mN+xNcL6DSpDWkiLBCwVFmcFdLahIwwUL8Q272oEJkR83t2AfXwpk+nD
         Y/e0rPmuv9ZUFfZpz/NYW5Hp2t/GKU7Oo1YFYsIFS1yyg6siQzYECd/y8JDWJ5XzZion
         YQkDryy4/pfmnUfhNmiDOyld5QoX42BejWlDvpQJvVj/yfFBpHO9lHGPddUL9f1j5aTR
         9YPOWhItadDPoW0u0BTSRD80x25jjSqeH8DZ+gWiYka7S9zPgZvukb9uII1zDgqb2+sO
         iUZA==
X-Gm-Message-State: AJIora/QNR8Dx5X6jnYZSOOZWLfDmLawMKGQ3JWiFiJPQl28k10c2zlW
        b7UwhQ6wgcqlFTvoXm6sUWjV6p8qULdefeBquehliQ==
X-Google-Smtp-Source: AGRyM1szGG02RfG3EL5P+6lP1i3HtBscAKZM0qaNbzmp3Aol7aLOgPMpcWX50uoxmoqOY7esyzE1BBj3sY16WXS+L74=
X-Received: by 2002:a0d:e20a:0:b0:317:ce36:a3a0 with SMTP id
 l10-20020a0de20a000000b00317ce36a3a0mr22354878ywe.448.1656424555304; Tue, 28
 Jun 2022 06:55:55 -0700 (PDT)
MIME-Version: 1.0
References: <20220624081022.32384-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220624081022.32384-1-krzysztof.kozlowski@linaro.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 28 Jun 2022 15:55:44 +0200
Message-ID: <CACRpkdabjb45WNLPa6gRDiCDm0u1swDpYq3D1pju4HmcCetoYA@mail.gmail.com>
Subject: Re: [GIT PULL][PATCH] pinctrl: samsung: do not use bindings header
 with constants
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Tomasz Figa <tomasz.figa@gmail.com>,
        Sylwester Nawrocki <snawrocki@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Fri, Jun 24, 2022 at 10:10 AM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> The Samsung SoC pin controller driver uses only three defines from the
> bindings header with pin configuration register values, which proves
> the point that this header is not a proper bindings-type abstraction
> layer with IDs.
>
> Define the needed register values directly in the driver and stop using
> the bindings header.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Reviewed-by: Chanho Park <chanho61.park@samsung.com>
> Acked-by: Rob Herring <robh@kernel.org>
> Link: https://lore.kernel.org/r/20220605160508.134075-8-krzysztof.kozlowski@linaro.org

Patch applied.

Yours,
Linus Walleij

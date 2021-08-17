Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77926C4338F
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 17 Aug 2021 20:00:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5950F60F39
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 17 Aug 2021 20:00:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233837AbhHQUAw (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 17 Aug 2021 16:00:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48128 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233110AbhHQUAu (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 17 Aug 2021 16:00:50 -0400
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 30D53C061764
        for <linux-samsung-soc@vger.kernel.org>; Tue, 17 Aug 2021 13:00:17 -0700 (PDT)
Received: by mail-lj1-x22a.google.com with SMTP id s3so667402ljp.11
        for <linux-samsung-soc@vger.kernel.org>; Tue, 17 Aug 2021 13:00:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/H0r8Sg8GIHL7ae/SnzMGBl2ub4pG3MMj9Emunm8ABU=;
        b=vbCQI770K13kKYd7TMIMun0s/mtTr+0zoRSb7zwX1BlAtuS74KdBeq5jaYInfx+tl1
         z4irD5FEBUsv1wg2xDereDjPSHTyxDEtxPQ1rX17sw/BUL/uXscQO6hJB86dpoUlrLqD
         fcJF30s3b7TNR7fn7pD7WDHk7/t5CCktNQj6wEwbmg9VeRg2+My5RlETQhQJSC5K3bFL
         y7Qb8orpm4yp7IwbjrGki1N/wrRxyMsULWIUdWsZxmoEong0JgOqy/S3k1Tc61jaT5Pr
         nQtqlRp+W6njDPWodszJFhyLxSR8+fZT3lDLj62l5+J8CfK3HXt0i6qWapDzorjw9u99
         WpvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/H0r8Sg8GIHL7ae/SnzMGBl2ub4pG3MMj9Emunm8ABU=;
        b=r+giNuaP9H4dpw5fMwrQ7KMg0CsVISGNWcwgv8iCenYNO7oghvSnBg0tL/lcDR5roi
         fE3i/QM7B33zZOArTNOw9F8dP2RTQqmKLxwTPjd6VM/WCFqDBGdjcoerC2gI99WsRBub
         urcthmXbrELe+3zmzmuNonRw9bL53zIOssvfXns/re9345mHTqCRJLwXD9nsnHkW6jjK
         ZK5JtiunjNIzVL4HKFbtjjafEU6elSKlXJmwBvHGjqWwce/etcRqzymL2NBcStaNNYzC
         Za9Io9QKdkpzWXWsKrhJ1yZwGdY9CcqwfVH3VsdK18HaPNRm1ogajt/hNibNxYHCumQ5
         g5qg==
X-Gm-Message-State: AOAM532ZjnAGGhHeNXUPkkDk1bsXg8uPp1EddSlnTRmjpo11z+oHt2yn
        NQNiWalwJ8Q4bnzsAL0EMEMHpYH+s7AwtnX6ESVjeQ==
X-Google-Smtp-Source: ABdhPJyf45kXVSLPwK4e20x5z+7OCgIw3RpQIuTIpIw/pWkkjNeCmLonRAsHf8AS/PwbKdQ6GAGyJr6sk5HTVUW/Cik=
X-Received: by 2002:a2e:b819:: with SMTP id u25mr4630513ljo.438.1629230415507;
 Tue, 17 Aug 2021 13:00:15 -0700 (PDT)
MIME-Version: 1.0
References: <20210817070913.6387-1-krzysztof.kozlowski@canonical.com>
In-Reply-To: <20210817070913.6387-1-krzysztof.kozlowski@canonical.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 17 Aug 2021 22:00:03 +0200
Message-ID: <CACRpkdYpFYZsJ_WZ9UMBfZ83=5uFG8CGv38PBX+xg01UntdSNQ@mail.gmail.com>
Subject: Re: [GIT PULL] pinctrl: samsung: pull for v5.15
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     Tomasz Figa <tomasz.figa@gmail.com>,
        Sylwester Nawrocki <snawrocki@kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Sam Protsenko <semen.protsenko@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Tue, Aug 17, 2021 at 9:11 AM Krzysztof Kozlowski
<krzysztof.kozlowski@canonical.com> wrote:

> Just few commits for v5.15.

Ah Sam's 850 support, nice! Pulled in for v5.15.

Yours,
Linus Walleij

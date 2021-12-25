Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A70FC433F5
	for <linux-samsung-soc@archiver.kernel.org>; Sat, 25 Dec 2021 10:18:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231381AbhLYKSZ (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sat, 25 Dec 2021 05:18:25 -0500
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:53062
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229743AbhLYKSZ (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sat, 25 Dec 2021 05:18:25 -0500
Received: from mail-lj1-f197.google.com (mail-lj1-f197.google.com [209.85.208.197])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 660E13F32C
        for <linux-samsung-soc@vger.kernel.org>; Sat, 25 Dec 2021 10:18:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1640427502;
        bh=94o5d0o97vug3NAEYaKgCxWAnPubZXlQ072PvpKMaV4=;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version:Content-Type;
        b=qZ0GPcxqCbDbxE0xpE4h13ehD7+qi0XaOs6vdE6SfdU7G2OOdYo7gHhHFlZUC586h
         FkIIT5VpagDX4y1VxTkj+B0Mc1eSI3dw8R/hTWao58D8VafjDxAtDHna+exzBV5r0e
         GoaZJj5qVGIEQYY/Lw8oaiqYYhvCW91fJyAXG93mi2K1ylozyJ9/wcGGKSpvNGo10w
         NBwRI24gzGBcai0Y0AmTqr+RGb2lOO94ZCsnW8jXUCmb3WbFx69MbPWIhFy8d+U2SX
         ZW+B6D2ex70UfIMsn94tz3VcarSm7vV4jOddK+iAHSi8F0gMnMeyLi2tybJi0RLniR
         KXEY1NldAfeQg==
Received: by mail-lj1-f197.google.com with SMTP id b3-20020a2ebc03000000b0021ffe75b14cso2870118ljf.5
        for <linux-samsung-soc@vger.kernel.org>; Sat, 25 Dec 2021 02:18:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=94o5d0o97vug3NAEYaKgCxWAnPubZXlQ072PvpKMaV4=;
        b=oUREb/dkhZeFlSng/rfcD/LRz8zPwClVB49JdcctYrlYFTKXOnIz5NzhsxYaBKgFLN
         LcUxuQpTWLHsiB16V6etOsctkrU9Sd2XxuYzZYt3wgRSikCjtSlKJmSk81D910sPloe0
         vS133Ml+F7HnwrxeDC4FwnAxZi46VoyMu9WiBaSfkklV5DU+Sdbv4x/ovnk/VuJenqjz
         A/VRyAnd72UKxG4TjamTo8jlgG5kMvAWhoCaolz2wSWDJVlNAUHPiN/JAzFYt7ltHCRE
         r+ZrwOOhFe79jGvQ3Jt6xQ+/R0QSbduKYGyU6ZjaujnaeeCiNAzmIigB3W5qKxXQaxDP
         BmQw==
X-Gm-Message-State: AOAM533nZFcxSUBO9yqU5SO1k1QPBGZdbGbL6pkzF9P5c0Cbi6YBNupd
        YR0zCrcyI/kGrLb3GvZxnbe1prTxOiXyKecFVfyeV47AiyRq6rbrINEyD7nWJNfRLof/amLnsX1
        9DSAg5GS/8yrXZTloDbWmBK72EfP4DqJqTJ0DBkX3VzU1lOSy
X-Received: by 2002:a05:6512:3988:: with SMTP id j8mr6874762lfu.351.1640427499982;
        Sat, 25 Dec 2021 02:18:19 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxXz+wZ4nuQVsKj6gt9lsiW4qR17i5ihkM9J/CWQwKtfUvupodcrU3sp5EnfGF88NTo+IXSRA==
X-Received: by 2002:a05:6512:3988:: with SMTP id j8mr6874747lfu.351.1640427499838;
        Sat, 25 Dec 2021 02:18:19 -0800 (PST)
Received: from krzk-bin.lan (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
        by smtp.gmail.com with ESMTPSA id v77sm1072255lfa.68.2021.12.25.02.18.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Dec 2021 02:18:19 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        linux-gpio@vger.kernel.org,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org,
        Prabhakar <prabhakar.csengg@gmail.com>,
        linux-samsung-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: (subset) [PATCH 1/2] pinctrl: samsung: Use platform_get_irq_optional() to get the interrupt
Date:   Sat, 25 Dec 2021 11:18:17 +0100
Message-Id: <164042749388.4557.7914263989187822148.b4-ty@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211224145748.18754-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20211224145748.18754-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20211224145748.18754-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Fri, 24 Dec 2021 14:57:47 +0000, Lad Prabhakar wrote:
> platform_get_resource(pdev, IORESOURCE_IRQ, ..) relies on static
> allocation of IRQ resources in DT core code, this causes an issue
> when using hierarchical interrupt domains using "interrupts" property
> in the node as this bypasses the hierarchical setup and messes up the
> irq chaining.
> 
> In preparation for removal of static setup of IRQ resource from DT core
> code use platform_get_irq_optional().
> 
> [...]

Applied, thanks!

[1/2] pinctrl: samsung: Use platform_get_irq_optional() to get the interrupt
      commit: a382d568f144b9e533ad210117c6c50d8dbdcaf1

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>

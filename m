Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2318FC433FE
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 15 Dec 2021 15:19:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243895AbhLOPTn (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 15 Dec 2021 10:19:43 -0500
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:51660
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S243890AbhLOPTm (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 15 Dec 2021 10:19:42 -0500
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com [209.85.167.72])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id B810E3F1F6
        for <linux-samsung-soc@vger.kernel.org>; Wed, 15 Dec 2021 15:19:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1639581581;
        bh=YsgM5wVM9boJb3f4RQ+uT9iXUGMe1XTlP9oHfwmk45A=;
        h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version:Content-Type;
        b=da8DrCSKINZY/HNf9Gvm61nO1yqjgrZw8eZ3TGBy7b4NGX3XNiippjrtFY1FhTKll
         FL8kY0vpY34za/7RRAeM7Afs05x0DuYofo5sZ7Sr4Lf1FjHIJZzvj5HJZ8QocYEYRJ
         YTYg3nyz2HRK8/VyR6k7RwgBe6XJMFd/C9RqCtakTZ1tBkb6WnpFwwSC5dF9n9WCcJ
         N5h0eCBsa7BIrMxltNq3+ZvLdzqoCjw7TckKQVPhNJb+aL2ixZiH6aKZOnSpvnVPvu
         hDyDUnpncF/xAUS8hOmu2LB9CGk9ekU/kLweCFWesjfUcYYTslc5ITEKh+Oc9RS3VF
         9G3H3Q7x/v6ZA==
Received: by mail-lf1-f72.google.com with SMTP id h40-20020a0565123ca800b00402514d959fso9773629lfv.7
        for <linux-samsung-soc@vger.kernel.org>; Wed, 15 Dec 2021 07:19:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=YsgM5wVM9boJb3f4RQ+uT9iXUGMe1XTlP9oHfwmk45A=;
        b=cXR9Mp8bI8ICHfqh2xH/OwncUvvHyIMwafARUq//QDN56Sw38u3Q1Q9m629kRXoPqG
         egqfgQUwjarJOA0MWXkWyZmfvAjmFf87DdsIuy9LbCP7md6kZzBGsshnS93bkc+72KQ2
         ZZ0rlwIRpi4oviVUH4MMwzBsxnrc3Ra5BYM+6bwg2fF9d/FXt9gJZmS5v8yJ/0LaVnF3
         usLsAKvd2sfp+tzogss80+I7SZnNl9GSMeBj/IDQAN7RoNhvn7nXSXqoei3BzGhis5aE
         hWL89JMl9Cad+snWzDp1Qu9TZXnulrBQmzLYlGokRilaY6pIRGaXOY6qw2Igxn1wYhln
         8RSQ==
X-Gm-Message-State: AOAM531Tti3phUpNI71qVY/P30//4PgQPAw1HRq2eFS5lq9befP6l0ic
        S4YsxU0wqa3wS7z629QhNt9xqdSf4kKvEhn3PMo4NL1sBs/Ft31Q4xCF1IYEea0yf/yEKEH7ATK
        tYev9jxUe3pjQdqtXhoGI+5tnjPKCsxuMe4H98yjosCjOvnNN
X-Received: by 2002:a2e:a69f:: with SMTP id q31mr11141851lje.236.1639581581021;
        Wed, 15 Dec 2021 07:19:41 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx2IsUQ0xYTrqnY6XxwscM20tZetyuhv4/dvH5xU4yzBjcJu2+c20b2h6TUw6oAw3b4SkqOpg==
X-Received: by 2002:a2e:a69f:: with SMTP id q31mr11141835lje.236.1639581580840;
        Wed, 15 Dec 2021 07:19:40 -0800 (PST)
Received: from localhost.localdomain (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
        by smtp.gmail.com with ESMTPSA id k14sm364798lfu.210.2021.12.15.07.19.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Dec 2021 07:19:40 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     linux-samsung-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH] dt-bindings: soc: samsung: keep SoC driver bindings together
Date:   Wed, 15 Dec 2021 16:19:04 +0100
Message-Id: <163958149735.164220.7940374210521750754.b4-ty@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211213112057.16709-1-krzysztof.kozlowski@canonical.com>
References: <20211213112057.16709-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Mon, 13 Dec 2021 12:20:57 +0100, Krzysztof Kozlowski wrote:
> Recently added Samsung Exynos USI driver devicetree bindings were added
> under ../bindings/soc/samsung/exynos-usi.yaml, so move there also two
> other bindings for Exynos SoC drivers: the PMU and ChipID.
> 
> Update Samsung Exynos MAINTAINERS entry to include this new path.
> 
> 
> [...]

Applied, thanks!

[1/1] dt-bindings: soc: samsung: keep SoC driver bindings together
      commit: 69bac8e4260865ab56d565593c44a519291f36ff

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>

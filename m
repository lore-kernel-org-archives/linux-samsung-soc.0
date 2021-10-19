Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCFEFC433F5
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 19 Oct 2021 08:58:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AEC0560D43
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 19 Oct 2021 08:58:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234561AbhJSJAh (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 19 Oct 2021 05:00:37 -0400
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:51266
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229930AbhJSJAg (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 19 Oct 2021 05:00:36 -0400
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com [209.85.167.71])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 78C683F4A4
        for <linux-samsung-soc@vger.kernel.org>; Tue, 19 Oct 2021 08:58:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1634633903;
        bh=E3RamXCXwP7jsVW/jJ6Nnag1iblPhlMlnb88dq3fIKI=;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version:Content-Type;
        b=kXhhU3v5oCpvB7USzPLpfTOfL4Z6IXCXivWKFa5hR/qzSIn5uzP/T1VQVRcmGIbog
         JdOmN1RTe19J9hzXEFR6M+WN2ynVDBjydZpTytdKHbYE7CDDbWVugN7R8tCXFJkYcp
         4eYe0EHp34+731qGXTihnYDz4PGh4x1EfsCFkBeq7vieNJiSbWyRkM70ARkNl0rUef
         WlTiMUlh/JRw6D5nEa2KuoPoZ/trAcaSaAn1y8eYbFH5TUnlCQBuvpvK6AC/g8DPKl
         NXdmShb6H0Y5JT/kIzJIUDKRAl+S+7Zjd3eKnOd0ohHzaNPePlEmSL1DYxOjeyKA4s
         eNnHL5cncNgxA==
Received: by mail-lf1-f71.google.com with SMTP id y40-20020a0565123f2800b003fded085638so1192438lfa.0
        for <linux-samsung-soc@vger.kernel.org>; Tue, 19 Oct 2021 01:58:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=E3RamXCXwP7jsVW/jJ6Nnag1iblPhlMlnb88dq3fIKI=;
        b=0AYYs+2cIrWzOPFWVv5YdGDX9lHCtTLwLHKd4gAIwmnVF6JAkA4nQRL2o0WDe22qsd
         jFCxFxPrwicA3w5a+iUobjlaJWtsR2To2pEm8jd8CSotJfezbYGsPlHgv4PC7tkOJgS9
         QtrMJNr4ZXVGPzPHQSvJ/03qwwDQ9c/mFI+obigOK41T1ARvdEd/aI4Z9iXEXEs5fH/h
         1o65aBVawWmTvK6OYqXX0X0CLgWNWcwx2Z8jmxpLCdeoH+CEBowvHFZFp5T0uRYML9KW
         ZH/3XlbyCaXaL0za6MRfJkGDU5poUrLfx6VUZLsP87qrn0JRWcCv7HBLNo8L9cAdnoBT
         NM/A==
X-Gm-Message-State: AOAM531htQiwT2AjPvM+vmDlbS6rpGZLZjbQmGnxsANoS8HhIzfT3uAb
        0K5xl+oxXQHtaV+U8E2URHSr9sMU4xtckoW3vywUeLgBfnAvauir1wNK1IVegR6IJODN5TZa3Io
        HxJsksAyq2tXXVgzWjJIqZr2SUzRTbG1vldiAm3PRnGGzYCj0
X-Received: by 2002:a2e:8041:: with SMTP id p1mr5465922ljg.158.1634633902909;
        Tue, 19 Oct 2021 01:58:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzXkL9Oa/Mq5OcoNVFI8nJnyskwDrVCPs4JuPvw1CYnDmFE4T+a5DtFLuErnaFfLL3hKEIdaw==
X-Received: by 2002:a2e:8041:: with SMTP id p1mr5465904ljg.158.1634633902777;
        Tue, 19 Oct 2021 01:58:22 -0700 (PDT)
Received: from kozik-lap.lan (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
        by smtp.gmail.com with ESMTPSA id 195sm1869142ljf.13.2021.10.19.01.58.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Oct 2021 01:58:22 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc:     Sylwester Nawrocki <snawrocki@kernel.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Re: [PATCH 1/3] arm64: dts: exynos: add 'chassis-type' property
Date:   Tue, 19 Oct 2021 10:58:20 +0200
Message-Id: <163463389698.22504.735636032751029230.b4-ty@canonical.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211017101228.19478-1-krzysztof.kozlowski@canonical.com>
References: <20211017101228.19478-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Sun, 17 Oct 2021 12:12:26 +0200, Krzysztof Kozlowski wrote:
> A new 'chassis-type' root node property has recently been approved for
> the device-tree specification.
> 
> Add this property for end-user devices (such as laptops,
> smartphones and tablets) based on Samsung Exynos ARM64 SoCs.
> 
> 
> [...]

Applied, thanks!

[1/3] arm64: dts: exynos: add 'chassis-type' property
      commit: 4b1a78330df4742aa862468911b38c36d3edba30
[2/3] ARM: dts: exynos: add 'chassis-type' property
      commit: 2b91bd8d2bce958f75c97a9bb808a1844d2f5a53
[3/3] ARM: dts: s5pv210: add 'chassis-type' property
      commit: 7b06c1ad884ee80e43604ba2a0bbc5f8ef3524e1

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>

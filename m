Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60897C433F5
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 26 Oct 2021 09:47:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4DA3460F9B
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 26 Oct 2021 09:47:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233765AbhJZJtq (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 26 Oct 2021 05:49:46 -0400
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:53910
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233805AbhJZJto (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 26 Oct 2021 05:49:44 -0400
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com [209.85.167.70])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id CF3CA3FFFA
        for <linux-samsung-soc@vger.kernel.org>; Tue, 26 Oct 2021 09:47:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1635241639;
        bh=sbYrCs8J0Q0Rz6cp+rkJ/lhh0zXOz8q9lqlVQx/f+TQ=;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version;
        b=AfXqFSKK1PV8OHq/RQYcCY1mZBa1tTH6W4z4aDiSSeC9ZMtV2YgeJsB2ojQI3gVnG
         dy7OWl/Ku0UiHewk5K1yi2AOWkVg4T6WUxKocQ5XGSq2rZvF4P3WJZy9A96VswVye7
         1hH3wkOt0XBW6vzzBRd2nIPOgrY+Lcq8/qbE0/m+p9CFjuBsp6JfrfhHzITCi2Diz9
         hOfRYHFNNiq8dyo80vdrbYQCMZqcB1sNq9ow/busKdlfBhs29X91R/dpmmRO7lFpnD
         NLc8zbcBwNIhOJaQlUffet3VvaSL9m5Dm+oPZFVyOsjOIkrxiU2PfVQsgr3g+DzKbF
         UOjcNeOgSPjuQ==
Received: by mail-lf1-f70.google.com with SMTP id j22-20020a05651231d600b003ffacdb8311so1865893lfe.7
        for <linux-samsung-soc@vger.kernel.org>; Tue, 26 Oct 2021 02:47:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=sbYrCs8J0Q0Rz6cp+rkJ/lhh0zXOz8q9lqlVQx/f+TQ=;
        b=IyyJb1ozJmFkZbmXxonmsnHGqHCK5/c1RHnPgahausBvI4Y0iL5b3o78oBPr5X1BRp
         opOtN3/3e+nyuBpH67mtmkBuBIuQrtMgHT6rK4MEaeGmmxUIvYgBmFVkBQ0GVeRUb3QT
         N3O/HiS+ef+761eiWjd8lvUVIHwvhOiUZrW4yXY4JUlXNd6kSiHpKAMAzjTflZzvRbII
         ztzW/AfotiWohOODNiuT42CqbSfHdPBjTvaJQlP0goUXqNU1JnPNY3gBclDIijtyIKQH
         O+2OMs8eLX9j0rITIAFvOC1PdEb3drMitw8E5C3ec4obW7iXKTAZ1z6XTvIQ6v25I7Jo
         jK6g==
X-Gm-Message-State: AOAM531LnpY8V3C73JTz7kKVbhJr+NpJW6lTf/cDMk8mFDs7wkf6B/jl
        zv60iBJxMPUFWFlK+aekvL61rYwJgQzb2NfeKi2XEzCilgx6TDW6s0MB7d7BUb7c/zFnxYL94d4
        EdqZJCyF5G3IWV5uF+vxf3TWgEnpMnHWER8o9F5c/UVeDfumU
X-Received: by 2002:a2e:7304:: with SMTP id o4mr886887ljc.385.1635241636727;
        Tue, 26 Oct 2021 02:47:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzKSsLVNoJZPREVg5VqEAatQtzjWaBPxJNdTK1B4zkn7s0ddrcueJak0ah7O3ADQwivq+qDAQ==
X-Received: by 2002:a2e:7304:: with SMTP id o4mr886837ljc.385.1635241636293;
        Tue, 26 Oct 2021 02:47:16 -0700 (PDT)
Received: from kozik-lap.lan (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
        by smtp.gmail.com with ESMTPSA id v17sm113794lfo.167.2021.10.26.02.47.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Oct 2021 02:47:15 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
List-Id: <soc.lore.kernel.org>
To:     Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>,
        arm@kernel.org, soc@kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>
Subject: [GIT PULL] arm64: dts: samsung: exynos for v5.16
Date:   Tue, 26 Oct 2021 11:47:08 +0200
Message-Id: <20211026094709.75692-4-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211026094709.75692-1-krzysztof.kozlowski@canonical.com>
References: <20211026094709.75692-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi,

On top of previous pull.

Best regards,
Krzysztof


The following changes since commit 2b663ae7152f785732d35ce38ad20ad10aca3116:

  arm64: dts: exynos: add minimal support for exynosautov9 sadk board (2021-10-12 14:20:57 +0200)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-dt64-5.16-2

for you to fetch changes up to b2f217cc7fbd3e6a097021b8b663328a649ea232:

  arm64: dts: exynos: add chipid node for exynosautov9 SoC (2021-10-26 09:17:42 +0200)

----------------------------------------------------------------
Samsung DTS ARM64 changes for v5.16, part two

1. Add chassis-type property.
2. Add ChipID node to ExynosAutov9 DTSI.

----------------------------------------------------------------
Chanho Park (1):
      arm64: dts: exynos: add chipid node for exynosautov9 SoC

Krzysztof Kozlowski (1):
      arm64: dts: exynos: add 'chassis-type' property

 arch/arm64/boot/dts/exynos/exynos5433-tm2.dts  | 1 +
 arch/arm64/boot/dts/exynos/exynos5433-tm2e.dts | 1 +
 arch/arm64/boot/dts/exynos/exynosautov9.dtsi   | 5 +++++
 3 files changed, 7 insertions(+)

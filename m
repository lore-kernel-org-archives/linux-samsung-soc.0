Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5090BC433E6
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 29 Dec 2020 15:59:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2538E21D1B
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 29 Dec 2020 15:59:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726388AbgL2P7t (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 29 Dec 2020 10:59:49 -0500
Received: from mail.kernel.org ([198.145.29.99]:50960 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726126AbgL2P7s (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 29 Dec 2020 10:59:48 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 30B0F20825;
        Tue, 29 Dec 2020 15:59:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1609257548;
        bh=v/VmxBfST1VNE2KH/YayabS5pElscBAieF5iBl52QOQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=cLOe2tRB2e4b2BeVjA8CZNRcD+f1BgBT4jDWA7fg7xYKAKkwNhoiKxq8yRiYFOAwj
         t5dmYiV6LETIyGWTgqp5BAmxSt9VOpF96kakS4LfMyk5+bQhQf+zju9hgtM98yavrD
         xnc7zF1UuA2iZDvZ3oIFvz5RVmvZFNNaIp2shHB4kEIE/Y8qv9Rcvd8YB0fLzYauKO
         ytAHbQEpssz4lEGx/p4DiJwGFATPJju/KEXdQbOWh7bF30gRTvhI5zRibJ96WV0LKA
         kXS2VuMv74P42y1DvRUiIXNYCeUZ4uy0woDbVGcHTVnU9ys/0F277XJ1hQVHdgetGl
         TKiiU7vLhXH+w==
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     linux-samsung-soc@vger.kernel.org,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Lee Jones <lee.jones@linaro.org>,
        linux-arm-kernel@lists.infradead.org
Cc:     Sylwester Nawrocki <snawrocki@kernel.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Re: [PATCH 1/9] ARM: dts: exynos: correct PMIC interrupt trigger level on Artik 5
Date:   Tue, 29 Dec 2020 16:59:03 +0100
Message-Id: <160925752160.16584.10559520648834741759.b4-ty@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201210212903.216728-1-krzk@kernel.org>
References: <20201210212903.216728-1-krzk@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Thu, 10 Dec 2020 22:28:55 +0100, Krzysztof Kozlowski wrote:
> The Samsung PMIC datasheets describe the interrupt line as active low
> with a requirement of acknowledge from the CPU.  Without specifying the
> interrupt type in Devicetree, kernel might apply some fixed
> configuration, not necessarily working for this hardware.

Applied, thanks!

[1/9] ARM: dts: exynos: correct PMIC interrupt trigger level on Artik 5
      commit: 58139a7837133538099dc59447f33765b61f5c27
[2/9] ARM: dts: exynos: correct PMIC interrupt trigger level on Monk
      commit: c9b260c91ab61d4094a3c152546d88d41259d647
[3/9] ARM: dts: exynos: correct PMIC interrupt trigger level on Rinato
      commit: 2c9f52d2b09abd25bd00ef2a5a35d9246fc92d88
[4/9] ARM: dts: exynos: correct PMIC interrupt trigger level on Spring
      commit: 1d6f6eee94da4f60ddb2107ffcf55629083711df
[5/9] ARM: dts: exynos: correct PMIC interrupt trigger level on Arndale Octa
      commit: 4a96ea5cf0550766397f5e9221c4f2a949492ee6
[6/9] ARM: dts: exynos: correct PMIC interrupt trigger level on Odroid XU3 family
      commit: 0274326ce6796813842998141174bd5a0e9ff908
[7/9] arm64: dts: exynos: correct PMIC interrupt trigger level on TM2
      commit: 9fd8f10d119c6c48899ace33ff0f7e8702ad1d66
[8/9] arm64: dts: exynos: correct PMIC interrupt trigger level on Espresso
      commit: acdd83e384c41d20d66bc0045f5eb67b6d67ed69

Best regards,
-- 
Krzysztof Kozlowski <krzk@kernel.org>

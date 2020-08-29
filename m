Return-Path: <SRS0=6CO4=CH=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A90E0C43461
	for <linux-samsung-soc@archiver.kernel.org>; Sat, 29 Aug 2020 14:25:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8989520C56
	for <linux-samsung-soc@archiver.kernel.org>; Sat, 29 Aug 2020 14:25:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1598711120;
	bh=VJgmaHOiFr4Fh3o7/4L/xwE3OpzSFh8uHcUHZhrsTq4=;
	h=From:To:Cc:Subject:Date:List-ID:From;
	b=mh0kJKY1aqQgnmoQ4LcWLi7wPh18nIihBTI+KsYMKY+cD3BP2BgXyGsxr9DjoCKmq
	 3YRiKMbUX7yuORMhryt001Ge3TwwHvyC0YNxpCn9RQL5r5+ZLT3oCknaWZmEBVjM3B
	 ZL4biZt4Y+4D5Gf58aa0x1S75cMiOR0QX9m+YoGQ=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728048AbgH2OZT (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sat, 29 Aug 2020 10:25:19 -0400
Received: from mail.kernel.org ([198.145.29.99]:52720 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727772AbgH2OZS (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sat, 29 Aug 2020 10:25:18 -0400
Received: from localhost.localdomain (unknown [194.230.155.216])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D20C6207BB;
        Sat, 29 Aug 2020 14:25:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1598711117;
        bh=VJgmaHOiFr4Fh3o7/4L/xwE3OpzSFh8uHcUHZhrsTq4=;
        h=From:To:Cc:Subject:Date:From;
        b=m/ieACvW6suXsaUtcmA8tY0AiX8TbuCAQ5yuktwagq3YGnoIoyhEBBUjnUpgM7KHt
         SwsEyA4Q6gaPubpI4Punw3NRCLIaKUslvN/PuE4h6rwvxOK+4qsAvNeHRf+BInb54S
         lieXhxY4hjK9NDcq3cWo9j0ESnXGlQD68AIYz2/Q=
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Kukjin Kim <kgene@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Lee Jones <lee.jones@linaro.org>,
        Sangbeom Kim <sbkim73@samsung.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        alsa-devel@alsa-project.org
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Sylwester Nawrocki <snawrocki@kernel.org>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Inki Dae <inki.dae@samsung.com>
Subject: [PATCH 01/10] dt-bindings: arm: samsung: pmu: Use unevaluatedProperties
Date:   Sat, 29 Aug 2020 16:24:52 +0200
Message-Id: <20200829142501.31478-1-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Additional properties actually might appear (e.g. assigned-clocks) so
use unevaluatedProperties to fix dtbs_check warnings like:

  arch/arm64/boot/dts/exynos/exynos5433-tm2.dt.yaml: system-controller@105c0000:
    'assigned-clock-parents', 'assigned-clocks' do not match any of the regexes: 'pinctrl-[0-9]+'

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 Documentation/devicetree/bindings/arm/samsung/pmu.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/arm/samsung/pmu.yaml b/Documentation/devicetree/bindings/arm/samsung/pmu.yaml
index 686c13c14e32..30ff2da81416 100644
--- a/Documentation/devicetree/bindings/arm/samsung/pmu.yaml
+++ b/Documentation/devicetree/bindings/arm/samsung/pmu.yaml
@@ -86,7 +86,7 @@ required:
   - compatible
   - reg
 
-additionalProperties: false
+unevaluatedProperties: false
 
 allOf:
   - if:
-- 
2.17.1


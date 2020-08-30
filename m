Return-Path: <SRS0=9Nct=CI=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50910C433E7
	for <linux-samsung-soc@archiver.kernel.org>; Sun, 30 Aug 2020 13:54:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2648D2087D
	for <linux-samsung-soc@archiver.kernel.org>; Sun, 30 Aug 2020 13:54:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1598795687;
	bh=dntaJd2KBUwd+eFxt4V8ub4xtGKB6claLcPp8UaAV/k=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=gH8ztv8IimFkA0oNkDXXVCxbZe5Y9wS6M61yzKVR4zTG5r16kSSxqATj4y8/wGNUz
	 FkxnOmUEgAbYZ3QpaM/BDN9phcqXkkrtnESV9zNHazAFm8WK04j8ql0Gu0Dozr7b/K
	 c029Pg5vQjhcE4Q8AO8lfKayUNU2yNOs6M69rk2w=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728924AbgH3Nyk (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sun, 30 Aug 2020 09:54:40 -0400
Received: from mail.kernel.org ([198.145.29.99]:55338 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728911AbgH3NyZ (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sun, 30 Aug 2020 09:54:25 -0400
Received: from localhost.localdomain (unknown [194.230.155.216])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 4651A20757;
        Sun, 30 Aug 2020 13:54:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1598795664;
        bh=dntaJd2KBUwd+eFxt4V8ub4xtGKB6claLcPp8UaAV/k=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=PjuxlQuxyrWWzhDWOvglWoFwRrg8HJ9V4KD8ThMq99eD+BZdOxKgy9yLWo+3mvCPS
         a/bJxEsRocj2ysICFOuuhn5CjG4KF1EXmWWS6WrAIefiljh0ziUh4IIhDQu3u7NbyC
         YaI66UWOnAVuvndqrrJqrt4m6YIb0Iyd90X8dX3k=
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Rob Herring <robh+dt@kernel.org>, Kukjin Kim <kgene@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        "Denis GNUtoo Carikli" <GNUtoo@cyberdimension.org>,
        Simon Shields <simon@lineageos.org>
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Sylwester Nawrocki <snawrocki@kernel.org>
Subject: [PATCH 10/33] ARM: dts: exynos: Add and enable 32 kHz modem clock in Trats
Date:   Sun, 30 Aug 2020 15:51:37 +0200
Message-Id: <20200830135200.24304-10-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200830135200.24304-1-krzk@kernel.org>
References: <20200830135200.24304-1-krzk@kernel.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

The PMIC has a 32768 Hz clock used by the modem which is implemented by
driver as a regulator.  Add and enable it to be sure modem get's its
signal.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 arch/arm/boot/dts/exynos4210-trats.dts | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm/boot/dts/exynos4210-trats.dts b/arch/arm/boot/dts/exynos4210-trats.dts
index 634f009b622e..0f3af293d9d3 100644
--- a/arch/arm/boot/dts/exynos4210-trats.dts
+++ b/arch/arm/boot/dts/exynos4210-trats.dts
@@ -456,6 +456,11 @@
 				regulator-name = "EN32KHZ_AP";
 				regulator-always-on;
 			};
+
+			EN32KHZ_CP {
+				regulator-name = "EN32KHZ_CP";
+				regulator-always-on;
+			};
 		};
 	};
 };
-- 
2.17.1


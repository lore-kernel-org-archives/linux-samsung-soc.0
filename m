Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3AAE7C433F5
	for <linux-samsung-soc@archiver.kernel.org>; Sat, 22 Jan 2022 13:26:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232999AbiAVN0G (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sat, 22 Jan 2022 08:26:06 -0500
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:44496
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233128AbiAVN0D (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sat, 22 Jan 2022 08:26:03 -0500
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com [209.85.218.71])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id A022440018
        for <linux-samsung-soc@vger.kernel.org>; Sat, 22 Jan 2022 13:26:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1642857962;
        bh=BqbA7EkPEkiPvdyZCRRPSvgPxXK4nwiMlYWc8IskYBk=;
        h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version;
        b=JVBmnUZdohntqKv6YtehxcysFpATEpMPwbqJ4y0e7blCiQ7sOaAuQ86HNrRAxm6KR
         xXIEhrQgYgahfRWcXCiw9N4GuOjsBRps3gEGzxnNrCtJd+IS6+2r21uuYzuYlOcGv0
         vG/f60nsu7ahNpiTWYfPueseavLefye7LoOfHsqrdoFNdGyDdFTBYq6acCo56OST/H
         aUUeIw1zQq0oELscqYytUzJ3ajosbUzjl+ZfqVJlo3J3lUmoOTupGnWd0Nbpi9kuCU
         hdNqIpJJcHnUoZZkttmbwA0l1vaYBa/YdRIABZ5kRRYNSQa2glv2+DTNiZm9U3ctGH
         PB1s2nPyPMq3A==
Received: by mail-ej1-f71.google.com with SMTP id rl11-20020a170907216b00b006b73a611c1aso252614ejb.22
        for <linux-samsung-soc@vger.kernel.org>; Sat, 22 Jan 2022 05:26:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=BqbA7EkPEkiPvdyZCRRPSvgPxXK4nwiMlYWc8IskYBk=;
        b=Qc8r9yUtZvdlZFzZEvBEIQ6dgdmNb4n+G83KfGdCuiZQPgwyA62QA9y2wrRH7s5L5y
         GLaO+1+n93mzjx8LYdPV5u5snXYvuJLfiNxnAPb8mqCxVHKk0mjmiFkX5L4j4fkNJOhQ
         Oy9uKZxazYrtsSU0u3XtNfzBPPIQxmboEci/q+XinLelLwBrmE6jX62XE5zixGBw3m3r
         EZlwahuCMH/gsNUGCy5a2ZsDZQgqAeWyL7ZhJ7fqrFhxZTeeMoPv3TXjYMN9u7glRmIe
         48vZXR36TBdMllP7RB2PDvwkxD3PFm9SU9aIL8qIGFuQWmIxOIMnYQDBFgH9WtXpozJK
         oryA==
X-Gm-Message-State: AOAM532FGn6AYK0ve96xj+bfDwoAEGwmUCmQngADq9sEVNyC3nAsAWUt
        LyKFAOToOMeSw+07GuG70DFvsYpkCZ8zqFGY5cAFnV5JlIKA1mtuk2m4x7qIt4iMo4bxhG6cux3
        y8DM1iiyZBy6aLy9RFXc2DOSWoqLpH46E747XWvpO2CZIc4o7
X-Received: by 2002:a17:907:96a3:: with SMTP id hd35mr6710107ejc.54.1642857961540;
        Sat, 22 Jan 2022 05:26:01 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyCIMPDmVKcXXxAx4iet6N1pLQk9bbQfelsIWrYapFJ3WqFqZr3kDLh7HQhhUY2Ppfihyu2OQ==
X-Received: by 2002:a17:907:96a3:: with SMTP id hd35mr6710090ejc.54.1642857961371;
        Sat, 22 Jan 2022 05:26:01 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-168-84.adslplus.ch. [188.155.168.84])
        by smtp.gmail.com with ESMTPSA id v2sm2373060ejb.114.2022.01.22.05.25.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Jan 2022 05:26:00 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Amit Kucheria <amitk@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] MAINTAINERS: thermal: samsung: drop obsolete properties
Date:   Sat, 22 Jan 2022 14:25:54 +0100
Message-Id: <20220122132554.65192-3-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220122132554.65192-1-krzysztof.kozlowski@canonical.com>
References: <20220122132554.65192-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Update the Samsung Exynos SoC thermal driver entry to match reality and
add Krzysztof Kozlowski as co-maintainer (as he maintains entire Samsung
SoC).  The rationale:
1. Bartlomiej's Samsung email bounces, since he is not working in
   Samsung for some time.
2. The mentioned Lukasz Majewski's Git tree was not updated
   since 2015.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 MAINTAINERS | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 27730a5a6345..928fb4cebe09 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -17118,11 +17118,12 @@ S:	Supported
 F:	drivers/net/ethernet/samsung/sxgbe/
 
 SAMSUNG THERMAL DRIVER
-M:	Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
+M:	Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>
+M:	Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
 L:	linux-pm@vger.kernel.org
 L:	linux-samsung-soc@vger.kernel.org
-S:	Supported
-T:	git https://github.com/lmajewski/linux-samsung-thermal.git
+S:	Maintained
+F:	Documentation/devicetree/bindings/thermal/samsung,exynos-thermal.yaml
 F:	drivers/thermal/samsung/
 
 SAMSUNG USB2 PHY DRIVER
-- 
2.32.0


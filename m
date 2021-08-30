Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1927C432BE
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 30 Aug 2021 06:56:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9F11160FC0
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 30 Aug 2021 06:56:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231839AbhH3G5p (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 30 Aug 2021 02:57:45 -0400
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:50396
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232358AbhH3G5p (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 30 Aug 2021 02:57:45 -0400
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com [209.85.128.70])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 6DED4407AA
        for <linux-samsung-soc@vger.kernel.org>; Mon, 30 Aug 2021 06:56:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1630306611;
        bh=bJIz4Y19rg7/qUpPpJZXaZHk00J2jiCSJoqVtvYx8rM=;
        h=From:To:Subject:Date:Message-Id:MIME-Version;
        b=fxT5nLDxFQvGqRK9Dixxb0e2YJych8iDzHwbGcZhJiET0NpdQ5ZyibS10J9QE+pdL
         1iX+KIG5iNlnNs/NXbpv4T7p0Ds5OVTo4j9smmgogK42aEmHJvPypSMqNbirHCP6Q2
         5+X6UfwmNKLwVhCblxT6G0SOqKNKZVmG33h6CZ0+mJGszSmpGkcCppdKXesfvj8uBN
         /ZbmU91zVum7UQrwHJx7xJUPfIwvtDm0LSiPvJDggivgQhI8zFEcnInZSEVr19WkIw
         uvG/AuCxrqZXhhqW/Cdrp24QxWBpWLkOCEqqxP2jpD3cOI0SQlSoz7R/39ckqjc4to
         HYgoPxuvzwE4Q==
Received: by mail-wm1-f70.google.com with SMTP id p11-20020a05600c204b00b002f05aff1663so1412887wmg.2
        for <linux-samsung-soc@vger.kernel.org>; Sun, 29 Aug 2021 23:56:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=bJIz4Y19rg7/qUpPpJZXaZHk00J2jiCSJoqVtvYx8rM=;
        b=EeF5SBim0rRnK1I2fOqrYEhkaeB7BAnS/RO2TVV/FUNDELc861G3oMaNuPoupoNvo8
         ePsmUmTsDxx181MTNEbGyuNbS5XsuaElTG5OrB8l5oiE6zV6qH22cxiwrqeHTrOGp4vi
         cEz0mzyGyYdFsp16+oJ4/3RcuM8jEXSELtGJaCu4vZD0pCgwVxDwFrTOxaffjRF2kh6S
         WkIvgB1APw2BZHQImA4gbcqtfsdFlRZ/i77iKFGjMwKoTKkQwK1vK7ZxeMtupgI0hAlf
         LfT53CGDtyOcYFmkz/yT/P25g6Fh42gVCLW9XXzeFX3yH9RkA2Vbf3BENryaauu+tbnR
         GCiw==
X-Gm-Message-State: AOAM531fbjqVvUuhWQ9oIqWHxenjNOLdg5OoMhb1SX43iWpMWCK4yquE
        GQS5wwheL3gd/inoutR1spEivrdXbeT44fowxzm5l1iJYD+t+RDZSe6y0sbejUVbwOWsjz0BEUU
        L6HTpsm3fPRpFTVURY8AAqGT6BKBHQVhys+rnFu0O0BG3GIXq
X-Received: by 2002:a7b:cb44:: with SMTP id v4mr20854919wmj.169.1630306611059;
        Sun, 29 Aug 2021 23:56:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwK8X4s4FNWxNwNlnkSyjRacYY9cst9eFmFThFx2kZOVW+PU7vFqpTEqByV44UA+6qTAbJKBw==
X-Received: by 2002:a7b:cb44:: with SMTP id v4mr20854909wmj.169.1630306610948;
        Sun, 29 Aug 2021 23:56:50 -0700 (PDT)
Received: from kozik-lap.lan ([79.98.112.21])
        by smtp.gmail.com with ESMTPSA id a10sm17991221wmj.44.2021.08.29.23.56.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Aug 2021 23:56:50 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH] MAINTAINERS: clock: samsung: include S3C/S5P header bindings
Date:   Mon, 30 Aug 2021 08:56:47 +0200
Message-Id: <20210830065647.5386-1-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Include S3C24xx, S3C64xx and S5Pv210 SoC clock headers with bindings in
the Samsung SoC Clock drivers entry.  The clock drivers for these SoCs
are already covered.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 MAINTAINERS | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index eee4c926003b..c17299c30ea7 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -16582,6 +16582,9 @@ F:	Documentation/devicetree/bindings/clock/samsung,s3c*
 F:	Documentation/devicetree/bindings/clock/samsung,s5p*
 F:	drivers/clk/samsung/
 F:	include/dt-bindings/clock/exynos*.h
+F:	include/dt-bindings/clock/s3c24*.h
+F:	include/dt-bindings/clock/s5pv210*.h
+F:	include/dt-bindings/clock/samsung,s3c64xx-clock.h
 F:	include/linux/clk/samsung.h
 F:	include/linux/platform_data/clk-s3c2410.h
 
-- 
2.30.2


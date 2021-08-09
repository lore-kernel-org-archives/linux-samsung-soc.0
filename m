Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01799C4320E
	for <linux-samsung-soc@archiver.kernel.org>; Mon,  9 Aug 2021 14:00:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D2BEE60F35
	for <linux-samsung-soc@archiver.kernel.org>; Mon,  9 Aug 2021 14:00:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234643AbhHIOAv (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 9 Aug 2021 10:00:51 -0400
Received: from smtp-relay-canonical-1.canonical.com ([185.125.188.121]:53210
        "EHLO smtp-relay-canonical-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234779AbhHIOAt (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 9 Aug 2021 10:00:49 -0400
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com [209.85.208.69])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPS id 1984640676
        for <linux-samsung-soc@vger.kernel.org>; Mon,  9 Aug 2021 14:00:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1628517628;
        bh=ogcKwTXTNYwj+j1SOoDVMuNAFMs2asYIwm4+FNw/esM=;
        h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version;
        b=intbm6++GHyRvl/jNImpuCeR5EP4S0dzPseQahUW5DfI+xaQzoxVzvmDMZpRAmRHz
         jspcJ2m/8+7x2PTydpS5QkWV3swog+tk+IhtcXZMUy3jxR0n4XjM+q8uViKZxMWGO7
         XEohb+JExqd40v6IdReMSLPzbSOe92k7cPbaVqmX2YKx62tYXP2zcrDmOORo8k2tFB
         Avwkrv251fB3vOW1QfXXZGqcO43SQxibEXHCxC6QeYt5T9JVglFQahcQJPXl4v0yaQ
         L+GgQunGo0L6BnadxKsRV3N9JY2JDYr6K5AK4EOEn236Dfp1w6vy59seuZpEBZI8Og
         KueGchOTYFSBA==
Received: by mail-ed1-f69.google.com with SMTP id dh21-20020a0564021d35b02903be0aa37025so6677990edb.7
        for <linux-samsung-soc@vger.kernel.org>; Mon, 09 Aug 2021 07:00:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ogcKwTXTNYwj+j1SOoDVMuNAFMs2asYIwm4+FNw/esM=;
        b=MrGJoUSWjPcWi8qsMsF/3G83nXz2B+NQYTVdW+NSXEE1m5EFAWO2zLCzgyZLcpUEZJ
         18Q8WLy5NQ58HID/Q0oC0vkE1pkQ+RzUDi7Baq0X+zqqs37v/v3cGt6u10t84pLnFSPV
         9SHTTd7mxioyj3Bzizd60DljVdQDRhg7X5uzGYLB7gPutcNXjA5ZtJGpAQXKvA6Q8BuC
         dJSI1Uf+SAveixoubbLjvS08IXdTtgZ95WIwUp9/kMx0MwUC9ApOxJLfOEslRtyQhFAz
         6LNVs49RvhNGXi3V5WjIqY8hMSh6uudtGlv7fuKEXrYSQKobnzL8qGMrsa4j4AePz0CO
         1hjA==
X-Gm-Message-State: AOAM532FrVNstqtBcBKPuHkc+E59FEIcqdh2PQXMM7PfoLWoFsUSJocc
        q5/BH2icUKiubdi8JHlIaP44acjgJ/Hv/gfSoSDddEUZ5ONFEmvR19ZYbxkFJm1fiG/f8vpnbQ4
        HqCbTbijlsa5SAsut/SlSLTjIIu2qemw0/wkiSl9dcy9e5WLA
X-Received: by 2002:a50:eb95:: with SMTP id y21mr3033508edr.5.1628517627880;
        Mon, 09 Aug 2021 07:00:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzrg+ozBKK4x83aTava67CJhBK41FPyP3TvrzsZD3SsSwXCBJSszou+evSlMSrS/YsyQeeDcQ==
X-Received: by 2002:a50:eb95:: with SMTP id y21mr3033487edr.5.1628517627750;
        Mon, 09 Aug 2021 07:00:27 -0700 (PDT)
Received: from localhost.localdomain ([86.32.42.198])
        by smtp.gmail.com with ESMTPSA id b17sm7909686edd.27.2021.08.09.07.00.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Aug 2021 07:00:27 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] MAINTAINERS: clock: include S3C and S5P in Samsung SoC clock entry
Date:   Mon,  9 Aug 2021 15:59:42 +0200
Message-Id: <20210809135942.100744-4-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210809135942.100744-1-krzysztof.kozlowski@canonical.com>
References: <20210809135942.100744-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Cover the S3C and S5Pv210 clock controller binding headers by Samsung
SoC clock controller drivers maintainer entry.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 MAINTAINERS | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 2dbacacac3f5..7846ce554b07 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -16496,6 +16496,9 @@ F:	Documentation/devicetree/bindings/clock/samsung,s3c*
 F:	Documentation/devicetree/bindings/clock/samsung,s5p*
 F:	drivers/clk/samsung/
 F:	include/dt-bindings/clock/exynos*.h
+F:	include/dt-bindings/clock/s3c*.h
+F:	include/dt-bindings/clock/s5p*.h
+F:	include/dt-bindings/clock/samsung,*.h
 F:	include/linux/clk/samsung.h
 F:	include/linux/platform_data/clk-s3c2410.h
 
-- 
2.30.2


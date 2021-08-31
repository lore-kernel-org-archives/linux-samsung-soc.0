Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC427C4320A
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 31 Aug 2021 13:06:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 89F2C601FD
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 31 Aug 2021 13:06:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233966AbhHaNHp (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 31 Aug 2021 09:07:45 -0400
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:36244
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233826AbhHaNHp (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 31 Aug 2021 09:07:45 -0400
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com [209.85.128.69])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 292F44017F
        for <linux-samsung-soc@vger.kernel.org>; Tue, 31 Aug 2021 13:06:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1630415209;
        bh=jb4Ta6fMMydeh8dJ+siO8U0aOew1wuXL5oWGSgaOpHo=;
        h=From:To:Subject:Date:Message-Id:MIME-Version;
        b=Q0h6XMgoZHs4ubypvbFh7KYyRummsK8XQ55uUwJNB/xYyl4bhSoM3NW1Kj2kAnxha
         l7IUapjvJOSdcw5vBn3YdjmHCMQ97f2lE88IRKf19pcaWgF0s7Mio5i+uOOq/ftOmQ
         MvNHI6CslO+P+d5tqatovwjYKF0u2FvdGXYQlbAHU04FQdsBPIVPfPqtG4MZXKf4Fn
         Zie2WMwinefEP4TzgUvxUdI4oMLvFnRPDFO++MoaxEU+B4aqKIw2JhfguL/w9myKLd
         5Z9EgSJC4NTLNKwXSuO5Lfd4gDjSGz4nornIDi7fxbTiR8uStiqjbmFTWDF86Dqb/r
         a0FbSSGMv9kGw==
Received: by mail-wm1-f69.google.com with SMTP id u1-20020a05600c210100b002e74fc5af71so5957228wml.1
        for <linux-samsung-soc@vger.kernel.org>; Tue, 31 Aug 2021 06:06:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jb4Ta6fMMydeh8dJ+siO8U0aOew1wuXL5oWGSgaOpHo=;
        b=qu7d4BNKkQT+OgLMjt750VEB74xrXzBEsFWb6I1YV0E+tFTCvUui4xBB+WIuGKDMxU
         3cG12uiAXvgocNRQxdRRU0WZcDv3tItNOR99aZhsy461j3hQPHczqTcCWnEg+YUlOiTg
         3s0TMKhFKMuSKUQ7M4kYtOGQ069y1p1ZqClWQRtQWZ3SiN4YZCG82g5oTEjxXXS6MVFO
         uik5dXD0rIFtIoQBFkcNbBzYtXlTEk8GZLm8zXZgOsXSRYeuZbtPpE/2XHotWe7fDbLe
         oNO4mLveoxIGPMprktTaL/wO/b1m9rhwK6DTGDCbY4+SGhL/Jy7vajMLtF+gOvp19IUW
         IO1g==
X-Gm-Message-State: AOAM5324UehIk0BrZ1HY4afFndrukOLfooUl9WB6Xlm3fBk8ti5UHslX
        iLFkZdeNxQbDHDlzZzJ+HICaEZaC1Ns2Bruld/PJun0KUP7FY2+2jmHy14JlcwurjM1ZIbIevht
        1gd3ODT0GaU27igKHkG8Bsdd2sAKSA/VB43x13Gk5lmxvsf69
X-Received: by 2002:a1c:1d42:: with SMTP id d63mr4034752wmd.113.1630415208043;
        Tue, 31 Aug 2021 06:06:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyRzBmZSNKQmsvfdl3PEsodfUa1SAbfBbCTnsvKSPFIvVjQbifNg+VvzvXV88t2ef5XMKkkKA==
X-Received: by 2002:a1c:1d42:: with SMTP id d63mr4034739wmd.113.1630415207887;
        Tue, 31 Aug 2021 06:06:47 -0700 (PDT)
Received: from kozik-lap.lan ([79.98.113.233])
        by smtp.gmail.com with ESMTPSA id u2sm2450035wmj.29.2021.08.31.06.06.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Aug 2021 06:06:47 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: clock: samsung: fix header path in example
Date:   Tue, 31 Aug 2021 15:06:43 +0200
Message-Id: <20210831130643.83249-1-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

The proper header is exynos4.h:

    samsung,exynos4412-isp-clock.example.dts:19:18: fatal error: dt-bindings/clock/exynos4412.h: No such file or directory

Fixes: 7ac615780926 ("dt-bindings: clock: samsung: convert Exynos4 to dtschema")
Reported-by: Stephen Boyd <sboyd@kernel.org>
Reported-by: Rob Herring <robh+dt@kernel.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>

---

The SHA in fixes tag is from linux-next. Might not be stable.
---
 .../devicetree/bindings/clock/samsung,exynos4412-isp-clock.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/clock/samsung,exynos4412-isp-clock.yaml b/Documentation/devicetree/bindings/clock/samsung,exynos4412-isp-clock.yaml
index 7b405bcd6fef..1ed64add4355 100644
--- a/Documentation/devicetree/bindings/clock/samsung,exynos4412-isp-clock.yaml
+++ b/Documentation/devicetree/bindings/clock/samsung,exynos4412-isp-clock.yaml
@@ -52,7 +52,7 @@ additionalProperties: false
 
 examples:
   - |
-    #include <dt-bindings/clock/exynos4412.h>
+    #include <dt-bindings/clock/exynos4.h>
     clock-controller@10048000 {
         compatible = "samsung,exynos4412-isp-clock";
         reg = <0x10048000 0x1000>;
-- 
2.30.2


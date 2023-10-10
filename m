Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D90A1CD98CB
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 10 Oct 2023 22:50:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344122AbjJJWuD (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 10 Oct 2023 18:50:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54906 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234314AbjJJWty (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 10 Oct 2023 18:49:54 -0400
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C7E3AF
        for <linux-samsung-soc@vger.kernel.org>; Tue, 10 Oct 2023 15:49:49 -0700 (PDT)
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-40684f53bfcso57861945e9.0
        for <linux-samsung-soc@vger.kernel.org>; Tue, 10 Oct 2023 15:49:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696978187; x=1697582987; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PfXAqV1pyqFtMV/UH+Un6VZ7ftSnQ6lOtRR1W2sjfGg=;
        b=al+VRbYRJRz9idIz4YM+RbMhUnDVdhZ7iJKSVzpedXqf4f7rvTH02P468vL+eUNcAb
         0pan5rk5nxEmNZv0pPFvo/xVxVsUyHmD5SmAuYFJZSVrJDRvMKTQ+Fgu1Qrpw1JdBUQ5
         COBv0ZSoLS14Uqk40eEdGJmbrr40pidfUsSwhozySBdxEkaponSyziHOYtQok9O+hYW5
         K5qcpIOb3rSHLS2H8JeWT0haxs9YRmK5DCuUQE2WcV7mlX5zPBUAXkJ37g+0hugNT1ib
         MszP1oQ6A6Pz9Ckjl/AKYIHFVb4UEmBvr77YTG8rB/8iPpDxwFVvv5u51GZ+tLyX9NyD
         Ighw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696978187; x=1697582987;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PfXAqV1pyqFtMV/UH+Un6VZ7ftSnQ6lOtRR1W2sjfGg=;
        b=DaFskiyW0rs544p5bNHikj5CuCKfnfBEFzvB96Te6xz3m7w2VTx/CyNsya3hyc0qO+
         4KVJXJzp1AQKjVWMewwz6gGSRoZ2WOmjlbikwWEMfiGIasl92hZloSLjxRf2iv0vL/I4
         bUH5at3+pvdUpKcNo1kfNx01zJA4D99SmuJWne6KFMpwwWivNuOxTiI/KH/FnOSvQ1t3
         y1JYpBXGaLeZ0pkBAbO4qTzEwDO1n14YnuG/1DKPAiu4ULK56+cAieJ9yNH3TK5KzXiH
         LOpBLPpDsGJUfqA0FfudOU8jLltfLzqy447/N4v90a8XfszhyalCIPRGDPNgDF9FzG4t
         aR/Q==
X-Gm-Message-State: AOJu0Yz3qkJSGwUL9kXilwHYWBmESz7Koq/OCCL8u9129LcVInHWvhFj
        IrW7woyJc6zyG7HtzyY2nN1yxg==
X-Google-Smtp-Source: AGHT+IEP2zxTpzOtUkFiPwRcOFsFqoBVvQ/ZCYKp0kk0nhdPzn6bCsAwihOCSclOVBe2WDi/PfNAUQ==
X-Received: by 2002:a7b:cbd4:0:b0:401:b76d:3b8b with SMTP id n20-20020a7bcbd4000000b00401b76d3b8bmr17968520wmi.16.1696978187754;
        Tue, 10 Oct 2023 15:49:47 -0700 (PDT)
Received: from gpeter-l.lan (host-92-12-225-146.as13285.net. [92.12.225.146])
        by smtp.gmail.com with ESMTPSA id j13-20020adfe50d000000b003196b1bb528sm13689547wrm.64.2023.10.10.15.49.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Oct 2023 15:49:47 -0700 (PDT)
From:   Peter Griffin <peter.griffin@linaro.org>
To:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        mturquette@baylibre.com, conor+dt@kernel.org, sboyd@kernel.org,
        tomasz.figa@gmail.com, s.nawrocki@samsung.com,
        linus.walleij@linaro.org, wim@linux-watchdog.org,
        linux@roeck-us.net, catalin.marinas@arm.com, will@kernel.org,
        arnd@arndb.de, olof@lixom.net, cw00.choi@samsung.com
Cc:     peter.griffin@linaro.org, tudor.ambarus@linaro.org,
        andre.draszik@linaro.org, semen.protsenko@linaro.org,
        saravanak@google.com, willmcvicker@google.com, soc@kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-watchdog@vger.kernel.org,
        kernel-team@android.com, linux-serial@vger.kernel.org
Subject: [PATCH v2 01/20] dt-bindings: soc: samsung: exynos-pmu: Add gs101 compatible
Date:   Tue, 10 Oct 2023 23:49:09 +0100
Message-ID: <20231010224928.2296997-2-peter.griffin@linaro.org>
X-Mailer: git-send-email 2.42.0.609.gbb76f46606-goog
In-Reply-To: <20231010224928.2296997-1-peter.griffin@linaro.org>
References: <20231010224928.2296997-1-peter.griffin@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Add gs101-pmu compatible to the bindings documentation.

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
 Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml b/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
index e1d716df5dfa..9e497c310532 100644
--- a/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
+++ b/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
@@ -15,6 +15,7 @@ select:
     compatible:
       contains:
         enum:
+          - google,gs101-pmu
           - samsung,exynos3250-pmu
           - samsung,exynos4210-pmu
           - samsung,exynos4212-pmu
@@ -35,6 +36,7 @@ properties:
     oneOf:
       - items:
           - enum:
+              - google,gs101-pmu
               - samsung,exynos3250-pmu
               - samsung,exynos4210-pmu
               - samsung,exynos4212-pmu
-- 
2.42.0.609.gbb76f46606-goog


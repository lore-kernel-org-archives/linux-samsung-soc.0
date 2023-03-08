Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D6DEC74A44
	for <linux-samsung-soc@archiver.kernel.org>; Wed,  8 Mar 2023 23:09:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229751AbjCHXJh (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 8 Mar 2023 18:09:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52134 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230045AbjCHXJg (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 8 Mar 2023 18:09:36 -0500
Received: from mail-oa1-x2f.google.com (mail-oa1-x2f.google.com [IPv6:2001:4860:4864:20::2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 69D5264218
        for <linux-samsung-soc@vger.kernel.org>; Wed,  8 Mar 2023 15:09:34 -0800 (PST)
Received: by mail-oa1-x2f.google.com with SMTP id 586e51a60fabf-17638494edbso455324fac.10
        for <linux-samsung-soc@vger.kernel.org>; Wed, 08 Mar 2023 15:09:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678316973;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+EZCn0NdbTVrvM23U+e5p/n9AtAvNh9rjheRTu832dQ=;
        b=U2CVKkl/ZZuBfeI0jW1ZRVsvfuNzbJ2tfTxcMSf7yfLuNGGUEAos2v9A5+76sjUOMn
         bLfP0R9A21kYBAMAsP2q5NrLkd1Nk0j12aoP0R8SNFbxCSz2Xhn/4q2Iqw6Bq0eczdXq
         CFlHSvrKbNpb6us/ow+CgWfcjNJ8+osRuuUCUQOq+LPXVOmIsJDEjREmDvyYRk2eIKVO
         7pE0gWM/6/bcO2dUaBKUPejJWb3RX2lVSmHa2S4pTQ0apLSnx+xNghPARTX4sp2f+utz
         D98WBVxCB5evOgVqd/CvsrirOv7krNr2sCtPZGzZjXhWUQrYY4tOESrS4yFHpCr/86H4
         psaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678316973;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+EZCn0NdbTVrvM23U+e5p/n9AtAvNh9rjheRTu832dQ=;
        b=2Uzz+BySAZiGMIhSlO/aQlsQjXKY9QQdyIIvJRdMZ8zLpprH0cSbK8S+oXUlrfYFjC
         i5qMiOD/WinXAMUvyCrS8vTv4321/ugzRueW9PBMqY1NFJLiWt0ZhgL7u2sEWuoQkLUZ
         s2cAlqzTQ86m7aExkbUCcPbFmL4ZMKI5GE9DPcsMdLX9z89gScdtfj5Iep9ulk6U58Lj
         TE3bpHFYazUI9O/BkHiNe7MxLP/VkfwniDqcKXDfIL9xhAoAsajPOO9rTQC8Z4wCJtxI
         76KqSRXmA3ZUr9M+XL55NSNWSYB9hsIhKaz3jLR9gPVcdPgKfTO1CWVvBRCGX/Mm/yam
         ftoQ==
X-Gm-Message-State: AO0yUKUbWZ7f1N+EFjgDsP+hlkKcclghCNHSQHMD4yi2hzPbV+CuhFwy
        7gIJmmI17W4ViQwqGDzoacAtYQ==
X-Google-Smtp-Source: AK7set8WrlFPXvBp65SgkmLYgtk/hwpjy3GwLMvFVTawJ5bKZVU6MMUVfwzfFfbn6b215ppGtxMHFw==
X-Received: by 2002:a05:6870:a786:b0:172:9ad0:8d5 with SMTP id x6-20020a056870a78600b001729ad008d5mr11331196oao.35.1678316973745;
        Wed, 08 Mar 2023 15:09:33 -0800 (PST)
Received: from localhost ([136.49.140.41])
        by smtp.gmail.com with ESMTPSA id w16-20020a056870431000b00172428894e0sm6633286oah.28.2023.03.08.15.09.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Mar 2023 15:09:33 -0800 (PST)
From:   Sam Protsenko <semen.protsenko@linaro.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Alim Akhtar <alim.akhtar@samsung.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Chanho Park <chanho61.park@samsung.com>,
        David Virag <virag.david003@gmail.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 1/6] dt-bindings: power: pd-samsung: Add Exynos850 support
Date:   Wed,  8 Mar 2023 17:09:26 -0600
Message-Id: <20230308230931.27261-2-semen.protsenko@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230308230931.27261-1-semen.protsenko@linaro.org>
References: <20230308230931.27261-1-semen.protsenko@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Document the compatible string for Exynos850 power domains controller.
Also add power domain indices which can be used in "samsung,pd-index"
property to specify a particular power domain in the device tree.

Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
---
 .../devicetree/bindings/power/pd-samsung.yaml   |  1 +
 MAINTAINERS                                     |  1 +
 .../dt-bindings/power/samsung,exynos850-power.h | 17 +++++++++++++++++
 3 files changed, 19 insertions(+)
 create mode 100644 include/dt-bindings/power/samsung,exynos850-power.h

diff --git a/Documentation/devicetree/bindings/power/pd-samsung.yaml b/Documentation/devicetree/bindings/power/pd-samsung.yaml
index 9c2c51133457..a353a705292c 100644
--- a/Documentation/devicetree/bindings/power/pd-samsung.yaml
+++ b/Documentation/devicetree/bindings/power/pd-samsung.yaml
@@ -21,6 +21,7 @@ properties:
     enum:
       - samsung,exynos4210-pd
       - samsung,exynos5433-pd
+      - samsung,exynos850-pd
 
   reg:
     maxItems: 1
diff --git a/MAINTAINERS b/MAINTAINERS
index 8d5bc223f305..53e11e48639c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2720,6 +2720,7 @@ F:	drivers/pwm/pwm-samsung.c
 F:	drivers/soc/samsung/
 F:	drivers/tty/serial/samsung*
 F:	include/clocksource/samsung_pwm.h
+F:	include/dt-bindings/power/samsung,*
 F:	include/linux/platform_data/*s3c*
 F:	include/linux/serial_s3c.h
 F:	include/linux/soc/samsung/
diff --git a/include/dt-bindings/power/samsung,exynos850-power.h b/include/dt-bindings/power/samsung,exynos850-power.h
new file mode 100644
index 000000000000..a8d877b5515a
--- /dev/null
+++ b/include/dt-bindings/power/samsung,exynos850-power.h
@@ -0,0 +1,17 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) 2023 Linaro Ltd.
+ * Author: Sam Protsenko <semen.protsenko@linaro.org>
+ */
+
+#ifndef _DT_BINDINGS_POWER_EXYNOS850_POWER_H
+#define _DT_BINDINGS_POWER_EXYNOS850_POWER_H
+
+#define EXYNOS850_PD_HSI		0
+#define EXYNOS850_PD_G3D		1
+#define EXYNOS850_PD_MFCMSCL		2
+#define EXYNOS850_PD_DPU		3
+#define EXYNOS850_PD_AUD		4
+#define EXYNOS850_PD_IS			5
+
+#endif /* _DT_BINDINGS_POWER_EXYNOS850_POWER_H */
-- 
2.39.2


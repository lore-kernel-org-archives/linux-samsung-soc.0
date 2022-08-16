Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35151C3F6B0
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 16 Aug 2022 13:30:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235732AbiHPNao (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 16 Aug 2022 09:30:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46242 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235799AbiHPNa3 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 16 Aug 2022 09:30:29 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3657CB8F32
        for <linux-samsung-soc@vger.kernel.org>; Tue, 16 Aug 2022 06:30:24 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id r17so14913225lfm.11
        for <linux-samsung-soc@vger.kernel.org>; Tue, 16 Aug 2022 06:30:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=rpFTAZjl2pleYfeFAlCfw7Z2JDn36v61i5OIVLO2w5I=;
        b=uvTyRrDNC6QxEbZyA44Zxl3dL5k8aNXBoKjruHNBXGtk2zV6fnuu5vtZ4/2VwKy1/w
         1JPKp2UYomYYlmfRq6xgSv65G3QbqSt8okEA9Zal7bs2g+N4DMft9up8OGlH4E6QA0Lt
         gy6tWDnwimp4O8ZuTVeavEa2wTzOcaqmwRTDXQ+178hWWkkIYdpgmXZzNih2pdvWejUb
         Y80rYquHbGE7znX/n+mmZRKoTN7NsS4gLtmmP2jqzK9V3KV4Jcm3WPaKdIWpppfwue8f
         oRQfxNDbbIaNn2yyXcxDSeONpbGTpxdrECS+nJ5Z20pVahG3+E+mbhZS3/1UuAFSWG0r
         Yr1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=rpFTAZjl2pleYfeFAlCfw7Z2JDn36v61i5OIVLO2w5I=;
        b=BdMkEYAkcLCcc1W8XBcFBymhLS09T05Y+Zcg8jeGpZKY2vEjdE1phPprR8BH/kgkYb
         LyT/qIvIeXcT0P3+LbSTnx7itZyfgjCBSNYa9pi4U1SA1bbYbCsV6O+fab5VlpRDvxxt
         BJgZVaOa0rUWhgxbZi6Bl+o+C71zJK4CVlciJSRi6tVdgfGAbY6mTbws5N4BxN/ZSLmY
         2Pc4UMb55tk8ljIK26/g2HiUpmSrVYYbyNrUcP5emS88c/7QDa/KNtb3daqZfioLvkwZ
         jLQwQcVeGjUR17NMAZ07/zUNIR43/ZMLkAwrZSDpgm5NWTmZnvyMtFeIJP2IpI/wYi33
         r/LQ==
X-Gm-Message-State: ACgBeo0lUSh3JaIxcTYbp+pwR/H5C4dA9cqCJYLHkjSbot6SV4aVPZAp
        9bBsL32UZaMvq58X9fBoWMrXFw==
X-Google-Smtp-Source: AA6agR4Goe1n8aiYtC29+SCFdUP5bbCFlxfNYNF/MgBrjfL/Ht7JGKQpdw+rOfy5V5n3hRIXo+LcWA==
X-Received: by 2002:a05:6512:39c3:b0:48b:90c2:da4c with SMTP id k3-20020a05651239c300b0048b90c2da4cmr6806066lfu.282.1660656622369;
        Tue, 16 Aug 2022 06:30:22 -0700 (PDT)
Received: from krzk-bin.. (d15l54g8c71znbtrbzt-4.rev.dnainternet.fi. [2001:14bb:ae:539c:1782:dd68:b0c1:c1a4])
        by smtp.gmail.com with ESMTPSA id k19-20020a2eb753000000b0025e42f8e771sm1816301ljo.34.2022.08.16.06.30.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Aug 2022 06:30:21 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Tomasz Figa <tomasz.figa@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Chanho Park <chanho61.park@samsung.com>,
        Rob Herring <robh@kernel.org>
Subject: [PATCH v4 2/2] dt-bindings: pinctrl: samsung: deprecate header with register constants
Date:   Tue, 16 Aug 2022 16:30:16 +0300
Message-Id: <20220816133016.77553-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220816133016.77553-1-krzysztof.kozlowski@linaro.org>
References: <20220816133016.77553-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

For convenience (less code duplication, some meaning added to raw
number), the pin controller pin configuration register values
were defined in the bindings header.  These are not some IDs or other
abstraction layer but raw numbers used in the registers

These constants do not fit the purpose of bindings.  They do not provide
any abstraction, any hardware and driver independent ID.  With minor
exceptions, the Linux drivers actually do not use the bindings header at
all.

All of the constants were moved already to headers local to DTS
(residing in DTS directory) and to Samsung pinctrl driver (where
applicable), so remove any references to the bindings header and add a
warning tha tit is deprecated.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Chanho Park <chanho61.park@samsung.com>
Acked-by: Rob Herring <robh@kernel.org>
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
---
 include/dt-bindings/pinctrl/samsung.h | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/include/dt-bindings/pinctrl/samsung.h b/include/dt-bindings/pinctrl/samsung.h
index 950970634dfe..d1da5ff68d0c 100644
--- a/include/dt-bindings/pinctrl/samsung.h
+++ b/include/dt-bindings/pinctrl/samsung.h
@@ -10,6 +10,13 @@
 #ifndef __DT_BINDINGS_PINCTRL_SAMSUNG_H__
 #define __DT_BINDINGS_PINCTRL_SAMSUNG_H__
 
+/*
+ * These bindings are deprecated, because they do not match the actual
+ * concept of bindings but rather contain pure register values.
+ * Instead include the header in the DTS source directory.
+ */
+#warning "These bindings are deprecated. Instead use the header in the DTS source directory."
+
 #define EXYNOS_PIN_PULL_NONE		0
 #define EXYNOS_PIN_PULL_DOWN		1
 #define EXYNOS_PIN_PULL_UP		3
-- 
2.34.1


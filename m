Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6DB59C63708
	for <linux-samsung-soc@archiver.kernel.org>; Wed,  7 Dec 2022 10:23:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230357AbiLGKXH (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 7 Dec 2022 05:23:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49956 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230392AbiLGKXE (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 7 Dec 2022 05:23:04 -0500
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 82D12EE3D
        for <linux-samsung-soc@vger.kernel.org>; Wed,  7 Dec 2022 02:23:01 -0800 (PST)
Received: by mail-lj1-x230.google.com with SMTP id bn5so20384483ljb.2
        for <linux-samsung-soc@vger.kernel.org>; Wed, 07 Dec 2022 02:23:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LfazEVXJDWm5fHCm2MG3wz5cKNMzAQ0JQdcxbxRWLtQ=;
        b=C9yLsR5b/Cx52mByQQifB57ckxFCXxoBQpv9fFs31Z9hQwWZdnwzn6ag5f30h5tVub
         xCF4E6N0rLWswWVuAMaOKopQCNSUkFyby4tzB7k00DtJKZ13lk32MAenHcVOz+f14Ml3
         E+Egy1LmlxDIfDRfIkZYOH3tunSAYTM2P4tLzqOocbJqHk9oNu9CevgDaXrqQcznG85P
         9PoSUkRNzDYjUa5+8FbxKphUC8GcdOo7FB/Vghu5yOAAj0BmyCdbbgiZPagZ3ud6iEwp
         NnkTIYwoiWJYzLbs1l3JPWI1eXYygn+Aeg0j+SlE2MhAo00Kf6JGWvKG3r8PjEkWISQe
         RUfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LfazEVXJDWm5fHCm2MG3wz5cKNMzAQ0JQdcxbxRWLtQ=;
        b=t7sR+tIKN0zFnPd9SdwA88MHpxNVttDEhi4sYZkGSpvRm6IhNXDL28eswcWefwo+wN
         /jynMVL0HkXAi0IPOYYYJOpqngU1iAIwaS+gkXnNty8OXFmGJpq9TEfkflP/BRwxbgq3
         vkETUbwTaNOF5PN7uQAiKNh9zi2YkMcCzuqzqvWlq3F5OOz9VTno2T7yNk0yj/GUET3t
         cRhyC5CXjc+PCBD2boGJkA0Symspo1TDL/C5LsasXaD5YW6dNFcL6ntv65hV2rbpWt9j
         sDN96LUuhNe3Fmr0TVzrzhd9GyeuSJynHFXZUo4QF2xm+eRueQbc1naLsdxqOQZXxwD9
         LTOA==
X-Gm-Message-State: ANoB5pncIsK6y0nVfd81oJXqc/nprRd1clsb2n/W3QDC2L6sa6QvuFqt
        xtHihOE1abxqYLYynIOfyvH+uQ==
X-Google-Smtp-Source: AA0mqf41SM4D2vM+BSmHmNdhhKcC4/vtMSw8znb1EFc9AIfv2Wzh+NgjzB/04efqO1eqlaMTQ2zZIg==
X-Received: by 2002:a2e:bcc5:0:b0:279:3851:1420 with SMTP id z5-20020a2ebcc5000000b0027938511420mr24972408ljp.265.1670408579931;
        Wed, 07 Dec 2022 02:22:59 -0800 (PST)
Received: from krzk-bin.NAT.warszawa.vectranet.pl (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id bu31-20020a056512169f00b00499b27a329esm1953183lfb.300.2022.12.07.02.22.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Dec 2022 02:22:59 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Alain Volmat <alain.volmat@foss.st.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Joe Tessler <jrt@google.com>,
        Yannick Fertre <yannick.fertre@foss.st.com>,
        Jeff Chase <jnchase@google.com>, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Rob Herring <robh@kernel.org>
Subject: [PATCH v3 2/9] media: dt-bindings: st,stm32-cec: move to cec subfolder
Date:   Wed,  7 Dec 2022 11:22:46 +0100
Message-Id: <20221207102253.26663-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221207102253.26663-1-krzysztof.kozlowski@linaro.org>
References: <20221207102253.26663-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Move st,stm32-cec.yaml bindings to cec subfolder and drop unneeded
"bindings" in the title.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Acked-by: Rob Herring <robh@kernel.org>
---
 .../devicetree/bindings/media/{ => cec}/st,stm32-cec.yaml     | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename Documentation/devicetree/bindings/media/{ => cec}/st,stm32-cec.yaml (89%)

diff --git a/Documentation/devicetree/bindings/media/st,stm32-cec.yaml b/Documentation/devicetree/bindings/media/cec/st,stm32-cec.yaml
similarity index 89%
rename from Documentation/devicetree/bindings/media/st,stm32-cec.yaml
rename to Documentation/devicetree/bindings/media/cec/st,stm32-cec.yaml
index 77144cc6f7db..2314a9a14650 100644
--- a/Documentation/devicetree/bindings/media/st,stm32-cec.yaml
+++ b/Documentation/devicetree/bindings/media/cec/st,stm32-cec.yaml
@@ -1,10 +1,10 @@
 # SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
 %YAML 1.2
 ---
-$id: http://devicetree.org/schemas/media/st,stm32-cec.yaml#
+$id: http://devicetree.org/schemas/media/cec/st,stm32-cec.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: STMicroelectronics STM32 CEC bindings
+title: STMicroelectronics STM32 CEC
 
 maintainers:
   - Yannick Fertre <yannick.fertre@foss.st.com>
-- 
2.34.1


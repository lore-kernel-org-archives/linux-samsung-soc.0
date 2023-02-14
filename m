Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36BDBC61DA4
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 14 Feb 2023 10:47:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232171AbjBNKrV (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 14 Feb 2023 05:47:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54088 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232543AbjBNKrR (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 14 Feb 2023 05:47:17 -0500
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 126E72658E
        for <linux-samsung-soc@vger.kernel.org>; Tue, 14 Feb 2023 02:46:54 -0800 (PST)
Received: by mail-wm1-x335.google.com with SMTP id l37-20020a05600c1d2500b003dfe46a9801so11245736wms.0
        for <linux-samsung-soc@vger.kernel.org>; Tue, 14 Feb 2023 02:46:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Nl8VzIg0XTBtuUGCbgymYwhmqQdV9/S2Londk08mfDc=;
        b=e4OnI8eRgdDV5nWzruUH+D85OEMv8id+GLyjj+enskPa21a+fZaDXRg0dRBEJcY7vp
         tt75Mvl4GhZq9jBUx/VCfrS7GXlZ/ZT+RVOBDeW8xWfpZuOPzjhNM5qToPBdduxhwXDs
         cnILBfofxI/putHCd7utWgel5cvJBN+4zBctVxRrXqUFW9xxaVLCxawhbFphaiM2s8UT
         u/SV1AZwzjPB2LobLgVJpxBReU/cZEN34hLtDoJOD1RslNI5Ou5fRUZ4x+YTJai3KYTN
         BdSd3PJCStDML0fe6YWWN1ors7nJ/Ol8CjWEg2ttS7STaIOhRu8Fy/p2kN7AG+c4WNUA
         n9xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Nl8VzIg0XTBtuUGCbgymYwhmqQdV9/S2Londk08mfDc=;
        b=k+zqySMydVIf+rA2kdkwPS/8e8u5O96agqc+EkvEQbTjyNH1gaOwUpu6ct0nHLLzU1
         QzlhDhFawI1ltiVhnyxvXDny8UPo9KXs2JBYEEyQ5YxgNGtH6Hvz8lVCujRxPAcdCEBw
         t6BeDb7RtSSCAjAeHxYQdC21/CK5taaGRBRB0nGwJPBcPKspJ4nOj5tUDWu17awp39Sx
         JaU6qy3pBaascdCGNW4Dvpt7zo84ihggJHRndQwyOA8k2Xl9Hu7hdwxsTaasg3PsALEP
         4efKLYJRQY/Pc5f9bkdNp9tY2cq6bdcE1P1F3d4hAL4WVS/pWlowkKKnVO91rofZKcX/
         WjRw==
X-Gm-Message-State: AO0yUKVdXjDlYi4p0px8c8VcXd2d2k3AnjOx9+YmupjTuf9K26GSE04n
        Jj6TRuVyb1RKH7Mojdv1YXWFQcFmc+6zb+Af
X-Google-Smtp-Source: AK7set8IWpV4gIam5FjkNJq193Kp8r7oGbJn7a6xJJYQ3amCGBylgRDvL4zzPX7AUA4xCzfoKuAwhg==
X-Received: by 2002:a05:600c:a297:b0:3dc:5a9f:1c7a with SMTP id hu23-20020a05600ca29700b003dc5a9f1c7amr1660447wmb.30.1676371610511;
        Tue, 14 Feb 2023 02:46:50 -0800 (PST)
Received: from krzk-bin.. ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id m20-20020a05600c4f5400b003e1f319b87bsm2623719wmq.24.2023.02.14.02.46.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Feb 2023 02:46:50 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 0/7] media: dt-bindings: Convert Samsung SoC Camera to DT schema
Date:   Tue, 14 Feb 2023 11:45:01 +0100
Message-Id: <20230214104508.51955-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi,

Changes since v1
================
1. Collect few independent patches into one patchset.

The patchset depends on:
https://lore.kernel.org/all/20230207205834.673163-1-krzysztof.kozlowski@linaro.org/

Best regards,
Krzysztof

Krzysztof Kozlowski (7):
  media: dt-bindings: i2c: samsung,s5k6a3: convert to dtschema
  media: dt-bindings: i2c: samsung,s5k5baf: convert to dtschema
  media: dt-bindings: samsung,exynos4210-csis: convert to dtschema
  media: dt-bindings: samsung,exynos4212-fimc-lite: convert to dtschema
  media: dt-bindings: samsung,exynos4212-is: convert to dtschema
  media: dt-bindings: samsung,fimc: convert to dtschema
  media: dt-bindings: samsung,s5c73m3: convert to dtschema

 .../bindings/media/exynos-fimc-lite.txt       |  16 -
 .../bindings/media/exynos4-fimc-is.txt        |  50 ----
 .../bindings/media/i2c/samsung,s5k5baf.yaml   | 101 +++++++
 .../bindings/media/i2c/samsung,s5k6a3.yaml    |  98 ++++++
 .../media/samsung,exynos4210-csis.yaml        | 170 +++++++++++
 .../media/samsung,exynos4210-fimc.yaml        | 152 ++++++++++
 .../media/samsung,exynos4212-fimc-is.yaml     | 221 ++++++++++++++
 .../media/samsung,exynos4212-fimc-lite.yaml   |  63 ++++
 .../bindings/media/samsung,fimc.yaml          | 279 ++++++++++++++++++
 .../bindings/media/samsung,s5c73m3.yaml       | 165 +++++++++++
 .../bindings/media/samsung-fimc.txt           | 210 -------------
 .../bindings/media/samsung-mipi-csis.txt      |  81 -----
 .../bindings/media/samsung-s5c73m3.txt        |  97 ------
 .../bindings/media/samsung-s5k5baf.txt        |  58 ----
 .../bindings/media/samsung-s5k6a3.txt         |  33 ---
 MAINTAINERS                                   |   6 +
 16 files changed, 1255 insertions(+), 545 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/media/exynos-fimc-lite.txt
 delete mode 100644 Documentation/devicetree/bindings/media/exynos4-fimc-is.txt
 create mode 100644 Documentation/devicetree/bindings/media/i2c/samsung,s5k5baf.yaml
 create mode 100644 Documentation/devicetree/bindings/media/i2c/samsung,s5k6a3.yaml
 create mode 100644 Documentation/devicetree/bindings/media/samsung,exynos4210-csis.yaml
 create mode 100644 Documentation/devicetree/bindings/media/samsung,exynos4210-fimc.yaml
 create mode 100644 Documentation/devicetree/bindings/media/samsung,exynos4212-fimc-is.yaml
 create mode 100644 Documentation/devicetree/bindings/media/samsung,exynos4212-fimc-lite.yaml
 create mode 100644 Documentation/devicetree/bindings/media/samsung,fimc.yaml
 create mode 100644 Documentation/devicetree/bindings/media/samsung,s5c73m3.yaml
 delete mode 100644 Documentation/devicetree/bindings/media/samsung-fimc.txt
 delete mode 100644 Documentation/devicetree/bindings/media/samsung-mipi-csis.txt
 delete mode 100644 Documentation/devicetree/bindings/media/samsung-s5c73m3.txt
 delete mode 100644 Documentation/devicetree/bindings/media/samsung-s5k5baf.txt
 delete mode 100644 Documentation/devicetree/bindings/media/samsung-s5k6a3.txt

-- 
2.34.1


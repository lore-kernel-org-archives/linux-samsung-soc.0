Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA4D1C4332F
	for <linux-samsung-soc@archiver.kernel.org>; Sun,  6 Mar 2022 11:11:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233316AbiCFLMo (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sun, 6 Mar 2022 06:12:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49606 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233326AbiCFLMk (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sun, 6 Mar 2022 06:12:40 -0500
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 904B460CF0
        for <linux-samsung-soc@vger.kernel.org>; Sun,  6 Mar 2022 03:11:47 -0800 (PST)
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com [209.85.218.71])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 209253F1B7
        for <linux-samsung-soc@vger.kernel.org>; Sun,  6 Mar 2022 11:11:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1646565094;
        bh=wIiMX0XUCkTo8b0ATD0IcXb9TBhD0CdDLNQdfZCqwBY=;
        h=From:To:Subject:Date:Message-Id:MIME-Version;
        b=WNIFPfJiAfFBZVOKKS/6APhHrMkxFBaHMKY6D8FE828BwO2unyn8xpNcRjsVpvVpO
         GhTtQeBYerh1MTeOYvfcOBMLooViIZ5Zdq+QGV/LDkD+yWNAWN7IYzAP2IIz0EUm0q
         IlA9PdWXepfarBk9d4fWD/R2QcBCPVoHF/SJa6+1sdrlTdtxZHpgXdLrQwTSlnNW1T
         ht9KuWEFlei9xxpBJ/nc0FOQNeItCEa6Z14N6eQMK7Mh/WlEcEi9q4j5hjcMPOu8nF
         bWR9iFcEbPj2FBJIWCM2BsCUteR2V2AK5Vmc9dzH7zXSfqhBbtCo+r8aLoJRIaE8ai
         NWCFSJjGq0acw==
Received: by mail-ej1-f71.google.com with SMTP id lf15-20020a170906ae4f00b006da86a43346so4992663ejb.14
        for <linux-samsung-soc@vger.kernel.org>; Sun, 06 Mar 2022 03:11:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=wIiMX0XUCkTo8b0ATD0IcXb9TBhD0CdDLNQdfZCqwBY=;
        b=iG/5FCxdqebV2wLn6zU/pbcZ+2QpaDCcZdSlLEiXHvqt4KGfQWTc5sD7/XdKwN7l7c
         HqNJ1uCR/JSeFafAxJAbOgzI7vdOe6rEuH0bZOwHU2zhtNidJoy2P1Y20/gK360x583c
         LAewu2/MmRjRmowBMQSIRPUgWMfpo/nSelMz13THwz0/NG7uWddO8366hlLBRrT8Kk4Y
         wllFTwfgrT82pKsnCNiRgZBtD9o5BTiRsLdgSeyYxed0k5Xkxy/jxUEIx0VFFG26uO4L
         QboGNWgkA8rfBjojjuLDuloXagZAjbObga2O7a8Inad3HJdShmqJEpeT4monDSFcjFI9
         62BQ==
X-Gm-Message-State: AOAM532knR7LcX9rgby6E76+MMlpDzOC5Q+8l9s6l/dWJfSpBJu60oFw
        kg/CGlgLB5yV/ODJVLer855svC5leYDbd0BaCP9UnpXki+tvUjt3WnWDWKb1Pw+1F9/mETLQAfg
        uxZ+7670mJHjCpOo2nGN5/Gw264PEbEuqUxwAZSeQMpMYhLpp
X-Received: by 2002:aa7:c80b:0:b0:416:463c:309c with SMTP id a11-20020aa7c80b000000b00416463c309cmr415354edt.413.1646565089794;
        Sun, 06 Mar 2022 03:11:29 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzP9L+8xDUVkpWxiFjFj1GYgye5Xlluz6YMq3chqBtolnFZUO6sIbZcQekE9OTuQDMjNAfrdQ==
X-Received: by 2002:aa7:c80b:0:b0:416:463c:309c with SMTP id a11-20020aa7c80b000000b00416463c309cmr415331edt.413.1646565089569;
        Sun, 06 Mar 2022 03:11:29 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-181-108.adslplus.ch. [188.155.181.108])
        by smtp.gmail.com with ESMTPSA id a9-20020a1709066d4900b006da888c3ef0sm3720444ejt.108.2022.03.06.03.11.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Mar 2022 03:11:28 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@wdc.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Wei Xu <xuwei5@hisilicon.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Jan Kotas <jank@cadence.com>, Li Wei <liwei213@huawei.com>,
        Stanley Chu <stanley.chu@mediatek.com>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        linux-scsi@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org,
        linux-mediatek@lists.infradead.org
Subject: [PATCH v3 00/12] dt-bindings: ufs: add common platform bindings + fixes
Date:   Sun,  6 Mar 2022 12:11:13 +0100
Message-Id: <20220306111125.116455-1-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi,

Not tested on hardware, so please kindly test.
Bindings maintainers might need checking - taken from git log.

Changes since v2
================
1. Do not deprecate freq-table-hz, but instead update dtschema to accept
   uint32-matrix. See:
   https://github.com/devicetree-org/dt-schema/pull/69
2. Drop patches and changes related to freq-table-hz -> freq-table conversion.
3. Add tags.
4. Change maintainer of qcom,ufs.

Changes since v1
================
1. Make freq-table as matrix of tuples (Nishanth).
2. New patches: convert all bindings and fix up DTS files.
3. Several minor fixes in UFS bindings.

Dependencies
============
None dependencies. The DTS patches can go independently via respective
maintainers. The dt-bindings patches could go via UFS tree.

Best regards,
Krzysztof

Krzysztof Kozlowski (12):
  dt-bindings: ufs: add common platform bindings
  dt-bindings: ufs: samsung,exynos-ufs: use common bindings
  dt-bindings: ufs: cdns,ufshc: convert to dtschema
  dt-bindings: ufs: drop unused/old ufs-qcom PHY bindings
  dt-bindings: ufs: qcom,ufs: convert to dtschema
  dt-bindings: ufs: hisilicon,ufs: convert to dtschema
  dt-bindings: ufs: mediatek,ufs: convert to dtschema
  dt-bindings: ufs: snps,tc-dwc-g210: convert to dtschema
  arm64: dts: hisilicon: align 'freq-table-hz' with dtschema in UFS
  arm64: dts: qcom: msm8996: drop unsupported UFS
    vddp-ref-clk-max-microamp
  arm64: dts: qcom: msm8996: correct UFS compatible
  arm64: dts: qcom: sm8350: drop duplicated ref_clk in UFS

 .../devicetree/bindings/ufs/cdns,ufshc.txt    |  32 ---
 .../devicetree/bindings/ufs/cdns,ufshc.yaml   |  68 +++++
 .../bindings/ufs/hisilicon,ufs.yaml           |  90 +++++++
 .../devicetree/bindings/ufs/mediatek,ufs.yaml |  67 +++++
 .../devicetree/bindings/ufs/qcom,ufs.yaml     | 242 ++++++++++++++++++
 .../bindings/ufs/samsung,exynos-ufs.yaml      |  13 +-
 .../bindings/ufs/snps,tc-dwc-g210.yaml        |  51 ++++
 .../bindings/ufs/tc-dwc-g210-pltfrm.txt       |  26 --
 .../devicetree/bindings/ufs/ti,j721e-ufs.yaml |   7 +-
 .../devicetree/bindings/ufs/ufs-common.yaml   |  82 ++++++
 .../devicetree/bindings/ufs/ufs-hisi.txt      |  42 ---
 .../devicetree/bindings/ufs/ufs-mediatek.txt  |  45 ----
 .../devicetree/bindings/ufs/ufs-qcom.txt      |  63 -----
 .../devicetree/bindings/ufs/ufshcd-pltfrm.txt |  90 -------
 MAINTAINERS                                   |   1 +
 arch/arm64/boot/dts/hisilicon/hi3660.dtsi     |   4 +-
 arch/arm64/boot/dts/hisilicon/hi3670.dtsi     |   4 +-
 .../boot/dts/qcom/msm8996-xiaomi-common.dtsi  |   1 -
 arch/arm64/boot/dts/qcom/msm8996.dtsi         |   3 +-
 arch/arm64/boot/dts/qcom/sm8350.dtsi          |   3 -
 20 files changed, 614 insertions(+), 320 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/ufs/cdns,ufshc.txt
 create mode 100644 Documentation/devicetree/bindings/ufs/cdns,ufshc.yaml
 create mode 100644 Documentation/devicetree/bindings/ufs/hisilicon,ufs.yaml
 create mode 100644 Documentation/devicetree/bindings/ufs/mediatek,ufs.yaml
 create mode 100644 Documentation/devicetree/bindings/ufs/qcom,ufs.yaml
 create mode 100644 Documentation/devicetree/bindings/ufs/snps,tc-dwc-g210.yaml
 delete mode 100644 Documentation/devicetree/bindings/ufs/tc-dwc-g210-pltfrm.txt
 create mode 100644 Documentation/devicetree/bindings/ufs/ufs-common.yaml
 delete mode 100644 Documentation/devicetree/bindings/ufs/ufs-hisi.txt
 delete mode 100644 Documentation/devicetree/bindings/ufs/ufs-mediatek.txt
 delete mode 100644 Documentation/devicetree/bindings/ufs/ufs-qcom.txt
 delete mode 100644 Documentation/devicetree/bindings/ufs/ufshcd-pltfrm.txt

-- 
2.32.0


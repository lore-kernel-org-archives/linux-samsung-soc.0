Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC9ECC433F5
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 22 Feb 2022 14:59:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233011AbiBVPAJ (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 22 Feb 2022 10:00:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47476 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232783AbiBVPAI (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 22 Feb 2022 10:00:08 -0500
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A7AB410DA4E
        for <linux-samsung-soc@vger.kernel.org>; Tue, 22 Feb 2022 06:59:42 -0800 (PST)
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com [209.85.208.72])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 1AC503FCAD
        for <linux-samsung-soc@vger.kernel.org>; Tue, 22 Feb 2022 14:59:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1645541981;
        bh=+TIgQRioLLZ9zOW6KKmdTDTPf4m59BMseVHbquTVcCc=;
        h=From:To:Subject:Date:Message-Id:MIME-Version;
        b=Hg3sk6AEE3RSA/qbTAKERDjf8+2yL3I5TGp5O3i6JYvGxHOTthP+9YEIyF8X8HpWb
         /NTvBUHW8fzu9QRd4QnBzztaEypjOO8kBccS7JE9sXY2tauUa3EeXzudym6V3IPmHO
         GFiyQdsTPrTfU2fLAdOVY3ELhwekPbeaf0lcb0o7O04b4W3Le2yAoIe5QNZnfjlkCv
         jxBwaZ8x4PZlaP57r1NxYcc45LnV4IEAUu7DoCd0Me94nlY9BlXX/QAbuCnBJugbL0
         0KTn7XPsyvbdQZpARE/v8obRLzSi6uUOtB9OxJlLIzMRpRHLU94OTO2rNy0sSSP7dG
         RfRJ73HWqA0Zg==
Received: by mail-ed1-f72.google.com with SMTP id n7-20020a05640205c700b0040b7be76147so12086739edx.10
        for <linux-samsung-soc@vger.kernel.org>; Tue, 22 Feb 2022 06:59:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+TIgQRioLLZ9zOW6KKmdTDTPf4m59BMseVHbquTVcCc=;
        b=MlXbEr78KPmJhbN3PaHiGaB3PrE1MrDr/T0AIMwOlsHev4SVXVRtkj+lNeFSZ6rT1p
         oFnz+BkVk2SQEo8Fd5g4HtgWH4EmVg617NgjD5iVHraIjNTUPq1Vp+fQtELT8F2FwFi5
         cxp2OLLeZ6/egS6HEM8PoO/ZpqY3dZL+hhZcaKaW6rpeMxZs8DnoX4T68wBeWYtjtQfS
         jbrvbLZKjlFu+iY+k2NtU8tcuQ62/0z9LATXXIneeQ26CujMyTFi4Zt11ivzxIc6MZ9F
         FCmx+5LsTzopHLwGS0GCF/vZWkSfnFF1jjsCQXkk1NiQ56HW+RVOGXnRL18LXQW9W1to
         f90Q==
X-Gm-Message-State: AOAM5332JGoKFdOexjjFUHlHagmfpFNF3x1h3o3Bn+79reEXCHnvnusL
        YaNkEXJGp1YSG+CHDf59anz4HuYK/ier1hNaUzdOmPW7Y2ZJlz5a9gHkQXLQz2gnqK3zrfH+gc1
        IW53EUI7jyceyyiMQm/D6f2P3woKEAJU57iEYsDEXcR7smKsd
X-Received: by 2002:aa7:c391:0:b0:410:83fb:abab with SMTP id k17-20020aa7c391000000b0041083fbababmr27025539edq.435.1645541980502;
        Tue, 22 Feb 2022 06:59:40 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwFDKifwtFFrCmwLKT4NC984SQd8SdrxWDXIgJnHsNvfVTg37pGq0CPqLSpORQdHqU3VFVDJQ==
X-Received: by 2002:aa7:c391:0:b0:410:83fb:abab with SMTP id k17-20020aa7c391000000b0041083fbababmr27025516edq.435.1645541980307;
        Tue, 22 Feb 2022 06:59:40 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-181-108.adslplus.ch. [188.155.181.108])
        by smtp.gmail.com with ESMTPSA id m2sm2467960ejb.20.2022.02.22.06.59.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Feb 2022 06:59:39 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@wdc.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Wei Xu <xuwei5@hisilicon.com>, Nishanth Menon <nm@ti.com>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Tero Kristo <kristo@kernel.org>,
        "James E.J. Bottomley" <jejb@linux.ibm.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        Jan Kotas <jank@cadence.com>, Li Wei <liwei213@huawei.com>,
        Stanley Chu <stanley.chu@mediatek.com>,
        Yaniv Gardi <ygardi@codeaurora.org>,
        linux-scsi@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org,
        linux-mediatek@lists.infradead.org
Subject: [PATCH v2 00/15] dt-bindings: ufs: add common platform bindings + fixes
Date:   Tue, 22 Feb 2022 15:58:39 +0100
Message-Id: <20220222145854.358646-1-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi,

Not tested on hardware, so please kindly test.
Bindings maintainers might need checking - taken from git log.

Changes since v1
================
1. Make freq-table as matrix of tuples (Nishanth).
2. New patches: convert all bindings and fix up DTS files.
3. Several minor fixes in UFS bindings.

Dependencies
============
1. The DTS patches (10-15) depend on scsi/ufs driver change (patch 9), so
   they should go in a following release, after merging driver.

   This is also might affect out-of-tree users of these DTSes (other
   projects, e.g. U-boot).

Best regards,
Krzysztof

Krzysztof Kozlowski (15):
  dt-bindings: ufs: add common platform bindings
  dt-bindings: ufs: samsung,exynos-ufs: use common bindings
  dt-bindings: ufs: cdns,ufshc: convert to dtschema
  dt-bindings: ufs: drop unused/old ufs-qcom PHY bindings
  dt-bindings: ufs: qcom,ufs: convert to dtschema
  dt-bindings: ufs: hisilicon,ufs: convert to dtschema
  dt-bindings: ufs: mediatek,ufs: convert to dtschema
  dt-bindings: ufs: snps,tc-dwc-g210: convert to dtschema
  scsi: ufs: deprecate 'freq-table-hz' property
  arm64: dts: hi3670: use 'freq-table' in UFS node
  arm64: dts: ti: use 'freq-table' in UFS node
  arm64: dts: qcom: use 'freq-table' in UFS node
  arm64: dts: qcom: msm8996: drop unsupported UFS
    vddp-ref-clk-max-microamp
  arm64: dts: qcom: msm8996: correct UFS compatible
  arm64: dts: qcom: sm8350: drop duplicated ref_clk in UFS

 .../devicetree/bindings/ufs/cdns,ufshc.txt    |  32 ---
 .../devicetree/bindings/ufs/cdns,ufshc.yaml   |  68 +++++
 .../bindings/ufs/hisilicon,ufs.yaml           |  90 +++++++
 .../devicetree/bindings/ufs/mediatek,ufs.yaml |  67 +++++
 .../devicetree/bindings/ufs/qcom,ufs.yaml     | 241 ++++++++++++++++++
 .../bindings/ufs/samsung,exynos-ufs.yaml      |  13 +-
 .../bindings/ufs/snps,tc-dwc-g210.yaml        |  51 ++++
 .../bindings/ufs/tc-dwc-g210-pltfrm.txt       |  26 --
 .../devicetree/bindings/ufs/ti,j721e-ufs.yaml |   9 +-
 .../devicetree/bindings/ufs/ufs-common.yaml   |  88 +++++++
 .../devicetree/bindings/ufs/ufs-hisi.txt      |  42 ---
 .../devicetree/bindings/ufs/ufs-mediatek.txt  |  45 ----
 .../devicetree/bindings/ufs/ufs-qcom.txt      |  63 -----
 .../devicetree/bindings/ufs/ufshcd-pltfrm.txt |  90 -------
 MAINTAINERS                                   |   1 +
 arch/arm64/boot/dts/hisilicon/hi3670.dtsi     |   4 +-
 .../boot/dts/qcom/msm8996-xiaomi-common.dtsi  |   1 -
 arch/arm64/boot/dts/qcom/msm8996.dtsi         |   5 +-
 arch/arm64/boot/dts/qcom/msm8998.dtsi         |   2 +-
 arch/arm64/boot/dts/qcom/sdm845.dtsi          |   2 +-
 arch/arm64/boot/dts/qcom/sm8150.dtsi          |   2 +-
 arch/arm64/boot/dts/qcom/sm8250.dtsi          |   2 +-
 arch/arm64/boot/dts/qcom/sm8350.dtsi          |   5 +-
 arch/arm64/boot/dts/qcom/sm8450.dtsi          |   2 +-
 arch/arm64/boot/dts/ti/k3-j721e-main.dtsi     |   4 +-
 drivers/scsi/ufs/ufshcd-pltfrm.c              |  21 +-
 26 files changed, 641 insertions(+), 335 deletions(-)
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


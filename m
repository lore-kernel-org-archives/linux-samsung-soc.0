Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A17FC433FE
	for <linux-samsung-soc@archiver.kernel.org>; Sat, 19 Feb 2022 18:42:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242840AbiBSSm5 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sat, 19 Feb 2022 13:42:57 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:43322 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237333AbiBSSm4 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sat, 19 Feb 2022 13:42:56 -0500
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 62F0E26AEC
        for <linux-samsung-soc@vger.kernel.org>; Sat, 19 Feb 2022 10:42:35 -0800 (PST)
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com [209.85.208.69])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 613D140041
        for <linux-samsung-soc@vger.kernel.org>; Sat, 19 Feb 2022 18:42:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1645296149;
        bh=MgKjv9z7uNr3RRUsHMHa/DUOLnVSfcojasTHu53YzZ0=;
        h=From:To:Subject:Date:Message-Id:MIME-Version;
        b=SqQwyttShZ+JCsjv3Kg9+c85yAn2/U4XRggyj/EuFGnvG7bNLI35ELDEUv/qhz9eQ
         /SoSKMqRHhSvx3doyKlD3k2NYgeO2Wt7w9Kvo6kdEiGSHA7hoTZOEX80Fc7hlcAlZJ
         Rcilp2BVZFZ3aUAxw9+9AZSHbZPkDiSYsh9fKr+1mKhhZ+7tPyt3wNPofTKZIEdAt2
         ogylwwBfu4KYyjAcreXEvKjCr3Et+NSjidJ0FRLhoYO+M6Yq3ThmU7zIMutAdx2tcZ
         E2OGAVT9Oqv429iVc3FPWvBej1rulqC/9C3ph7x0nABGjzDb8i391xvEpUiFU9InnA
         UaD9JnEGSypZw==
Received: by mail-ed1-f69.google.com with SMTP id dy17-20020a05640231f100b00412897682b4so5805138edb.18
        for <linux-samsung-soc@vger.kernel.org>; Sat, 19 Feb 2022 10:42:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=MgKjv9z7uNr3RRUsHMHa/DUOLnVSfcojasTHu53YzZ0=;
        b=q1JE/SHWPPBgngH87/4IpyrgPoofTYp7N5DoGiEO1ubVZ4SMXgvvGHXyb5BTO+EKnX
         7Bj+8fnFLCZlzSF7ArI6GNQ4Or7oPCbYTkOxF6fPY4vnEZFs3lUX6VteF8uYff0CWrh5
         mKmDRMyNyLyRnBmbru8JnEh1qRfXkYe+VxAUVpKIO1F1ipngdZ7ChQSPkqHdw/3qARJ9
         2bE3mvGnCjrgdNaneDmewpUP6a78pT/0L+11CVwWOuplxi/+fWepHy68QlrVFijDqMdX
         jgUsqPSM8J5Mzjp6eKxMYQde8rdeydG6ZvwEjBCFBIHAj4f7IVDVYACUKZoFvvLyDVGw
         USDw==
X-Gm-Message-State: AOAM5338J3TGp0JnHknCuHG4HqDJwlfsK4C+4ukqBte0aO3PH2GHAM2v
        gbmqeWmcpFA0xi4gvbuyr99dlnuuAczhDVu5b/X9nfppCZJKNccWK3WjcDI5O0xJ9FEmIlpJfMM
        jin97M1lijFzm171Z+qWJoNxpo3V9rV04WsYfc7Mubwxqr+r6
X-Received: by 2002:a05:6402:90b:b0:412:a7cc:f5f9 with SMTP id g11-20020a056402090b00b00412a7ccf5f9mr12839307edz.136.1645296148108;
        Sat, 19 Feb 2022 10:42:28 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz9AksoCFm+UDOtkXMW7lwQ/A6+F6VdlAYu3MK0g2Dmm81uCBlm5twd4SJuMN4mjgnv445xsg==
X-Received: by 2002:a05:6402:90b:b0:412:a7cc:f5f9 with SMTP id g11-20020a056402090b00b00412a7ccf5f9mr12839290edz.136.1645296147918;
        Sat, 19 Feb 2022 10:42:27 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-181-108.adslplus.ch. [188.155.181.108])
        by smtp.gmail.com with ESMTPSA id j8sm6680745edw.40.2022.02.19.10.42.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Feb 2022 10:42:27 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@wdc.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Wei Xu <xuwei5@hisilicon.com>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Nishanth Menon <nm@ti.com>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Tero Kristo <kristo@kernel.org>,
        "James E.J. Bottomley" <jejb@linux.ibm.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        Chanho Park <chanho61.park@samsung.com>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Jan Kotas <jank@cadence.com>, linux-scsi@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: [RFC PATCH 0/8] dt-bindings: ufs: add common platform bindings + fixes
Date:   Sat, 19 Feb 2022 19:42:16 +0100
Message-Id: <20220219184224.44339-1-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi,

Not tested, so please kindly test.

I am sending as RFC to gather some comments.  If it looks good, I will
convert other TXT bindings to DT schema format.

Dependencies
============
1. The DTS patches (5-8) depend on scsi/ufs driver change (patch 4), so
   they should go in a following release, after merging driver.

   This is also might affect out-of-tree users of these DTSes (other
   projects, e.g. U-boot).

Best regards,
Krzysztof

Krzysztof Kozlowski (8):
  dt-bindings: ufs: add common platform bindings
  dt-bindings: ufs: samsung,exynos-ufs: use common bindings
  dt-bindings: ufs: cdns,ufshc: convert to dtschema
  scsi: ufs: deprecate 'freq-table-hz' property
  arm64: dts: hi3670: use 'freq-table' in UFS node
  arm64: dts: exynos: use 'freq-table' in UFS node
  arm64: dts: qcom: use 'freq-table' in UFS node
  arm64: dts: ti: use 'freq-table' in UFS node

 .../devicetree/bindings/ufs/cdns,ufshc.txt    | 32 -------
 .../devicetree/bindings/ufs/cdns,ufshc.yaml   | 56 ++++++++++++
 .../bindings/ufs/samsung,exynos-ufs.yaml      | 10 +--
 .../devicetree/bindings/ufs/ti,j721e-ufs.yaml |  2 +-
 .../devicetree/bindings/ufs/ufs-common.yaml   | 86 +++++++++++++++++++
 .../devicetree/bindings/ufs/ufs-hisi.txt      |  4 +-
 MAINTAINERS                                   |  1 +
 arch/arm64/boot/dts/exynos/exynos7.dtsi       |  3 +-
 arch/arm64/boot/dts/exynos/exynosautov9.dtsi  |  3 +-
 arch/arm64/boot/dts/hisilicon/hi3670.dtsi     |  4 +-
 arch/arm64/boot/dts/qcom/msm8996.dtsi         | 23 +++--
 arch/arm64/boot/dts/qcom/msm8998.dtsi         | 17 ++--
 arch/arm64/boot/dts/qcom/sdm845.dtsi          | 19 ++--
 arch/arm64/boot/dts/qcom/sm8150.dtsi          | 19 ++--
 arch/arm64/boot/dts/qcom/sm8250.dtsi          | 17 ++--
 arch/arm64/boot/dts/qcom/sm8350.dtsi          | 19 ++--
 arch/arm64/boot/dts/qcom/sm8450.dtsi          | 17 ++--
 arch/arm64/boot/dts/ti/k3-j721e-main.dtsi     |  4 +-
 drivers/scsi/ufs/ufshcd-pltfrm.c              | 21 +++--
 19 files changed, 234 insertions(+), 123 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/ufs/cdns,ufshc.txt
 create mode 100644 Documentation/devicetree/bindings/ufs/cdns,ufshc.yaml
 create mode 100644 Documentation/devicetree/bindings/ufs/ufs-common.yaml

-- 
2.32.0


Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BEC43C43331
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 14 Jan 2021 06:27:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9921F238E7
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 14 Jan 2021 06:27:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726131AbhANG1D (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 14 Jan 2021 01:27:03 -0500
Received: from mail.kernel.org ([198.145.29.99]:45384 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726883AbhANG0r (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 14 Jan 2021 01:26:47 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 14E162395C;
        Thu, 14 Jan 2021 06:26:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1610605567;
        bh=FSBQ/ZcELPYdvjP8GKtIR/vCbIgRYzrs8KV4KniOBUU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=gjKFIQxnPAaOoJCM+CDOi5qRBgVAHpKaA0rq06t0cPt2u6bIOcvivX7MrqZ8bS/3o
         N4QYOYp9uTD49rtQ5lNH5LKAN5g5kgLANrSinLFp5csat6X664CSYPgykeoo7qZqhj
         T0d6zNQw/TTgcPL+mHvMmAMlDV+v/IHZW9HJfUEUf3qNt+Rf6QSuUPxRu5H0JTbdi1
         oFGbsXMNhGtSPDgNgcgf95MKGycJYTTwZYDZczbZfwVjVbtpHLn91/I3qQSR6JPWj4
         Flq8mf/6SklyS23qqQUNGvb+KXJGsAIk7lnTkj3A137r16C2tA2FW3a5BsntvBE53X
         Xabc6IJqbmwAw==
Received: by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1kzw56-00EJ7E-GZ; Thu, 14 Jan 2021 07:26:04 +0100
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        "Jonathan Corbet" <corbet@lwn.net>,
        "Linux Doc Mailing List" <linux-doc@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        linux-usb@vger.kernel.org
Subject: [PATCH 1/3] dt-bindings: usb: update snps,dwc3.yaml references
Date:   Thu, 14 Jan 2021 07:25:58 +0100
Message-Id: <97704f110f0282fb47eb85dea430cc94cfd93a4b.1610605373.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <cover.1610605373.git.mchehab+huawei@kernel.org>
References: <cover.1610605373.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Changeset 389d77658801 ("dt-bindings: usb: Convert DWC USB3 bindings to DT schema")
renamed: Documentation/devicetree/bindings/usb/dwc3.txt
to: Documentation/devicetree/bindings/usb/snps,dwc3.yaml.

Update its cross-references accordingly.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/devicetree/bindings/usb/dwc3-st.txt    | 2 +-
 Documentation/devicetree/bindings/usb/exynos-usb.txt | 2 +-
 Documentation/devicetree/bindings/usb/omap-usb.txt   | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/usb/dwc3-st.txt b/Documentation/devicetree/bindings/usb/dwc3-st.txt
index df0e02e1ee43..ad526e76f2a8 100644
--- a/Documentation/devicetree/bindings/usb/dwc3-st.txt
+++ b/Documentation/devicetree/bindings/usb/dwc3-st.txt
@@ -31,7 +31,7 @@ See: Documentation/devicetree/bindings/pinctrl/pinctrl-bindings.txt
 Sub-nodes:
 The dwc3 core should be added as subnode to ST DWC3 glue as shown in the
 example below. The DT binding details of dwc3 can be found in:
-Documentation/devicetree/bindings/usb/dwc3.txt
+Documentation/devicetree/bindings/usb/snps,dwc3.yaml
 
 NB: The dr_mode property described in [1] is NOT optional for this driver, as the default value
 is "otg", which isn't supported by this SoC. Valid dr_mode values for dwc3-st are either "host"
diff --git a/Documentation/devicetree/bindings/usb/exynos-usb.txt b/Documentation/devicetree/bindings/usb/exynos-usb.txt
index 6aae1544f240..f7ae79825d7d 100644
--- a/Documentation/devicetree/bindings/usb/exynos-usb.txt
+++ b/Documentation/devicetree/bindings/usb/exynos-usb.txt
@@ -93,7 +93,7 @@ Sub-nodes:
 The dwc3 core should be added as subnode to Exynos dwc3 glue.
 - dwc3 :
    The binding details of dwc3 can be found in:
-   Documentation/devicetree/bindings/usb/dwc3.txt
+   Documentation/devicetree/bindings/usb/snps,dwc3.yaml
 
 Example:
 	usb@12000000 {
diff --git a/Documentation/devicetree/bindings/usb/omap-usb.txt b/Documentation/devicetree/bindings/usb/omap-usb.txt
index 38d9bb8507cf..f0dbc5ae45ae 100644
--- a/Documentation/devicetree/bindings/usb/omap-usb.txt
+++ b/Documentation/devicetree/bindings/usb/omap-usb.txt
@@ -65,7 +65,7 @@ Sub-nodes:
 The dwc3 core should be added as subnode to omap dwc3 glue.
 - dwc3 :
    The binding details of dwc3 can be found in:
-   Documentation/devicetree/bindings/usb/dwc3.txt
+   Documentation/devicetree/bindings/usb/snps,dwc3.yaml
 
 omap_dwc3 {
 	compatible = "ti,dwc3";
-- 
2.29.2


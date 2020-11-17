Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BC71C63697
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 17 Nov 2020 20:11:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 98DCC206E0
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 17 Nov 2020 20:11:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="e/RtBqy3"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730520AbgKQULM (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 17 Nov 2020 15:11:12 -0500
Received: from mail.kernel.org ([198.145.29.99]:35868 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725771AbgKQULL (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 17 Nov 2020 15:11:11 -0500
Received: from localhost.localdomain (adsl-84-226-167-205.adslplus.ch [84.226.167.205])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D8829204EC;
        Tue, 17 Nov 2020 20:11:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1605643871;
        bh=8HWyKvGDgZHotW6gzkecqpL2zTAPO0Z8/+rsf/h4zUw=;
        h=From:To:Subject:Date:From;
        b=e/RtBqy35hhyVrdBRG5zjsUCzTW1nBiY4eqG6lyQbUdyh2n4DIMg0iiRigOZIeS3y
         4gG1acJ1KYJPo5N7NUAOpoo/KrjzrrohFmyURwXOx9F2RKqdcT6Ju8I+sQxaKlajGp
         CSAHxbrHtpj01+c+9rM366pRNyiHKKgjRiI+0Fr8=
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Krzysztof Kozlowski <krzk@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 1/4] dt-bindings: arm: samsung: document SMDK2416 board binding
Date:   Tue, 17 Nov 2020 21:11:03 +0100
Message-Id: <20201117201106.128813-1-krzk@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Add binding for the SMDK2416 board.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 .../devicetree/bindings/arm/samsung/samsung-boards.yaml     | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml b/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
index 272508010b02..332b07b7f4fb 100644
--- a/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
+++ b/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
@@ -14,6 +14,12 @@ properties:
     const: '/'
   compatible:
     oneOf:
+      - description: S3C2416 based boards
+        items:
+          - enum:
+              - samsung,smdk2416                # Samsung SMDK2416
+          - const: samsung,s3c2416
+
       - description: S5PV210 based boards
         items:
           - enum:
-- 
2.25.1


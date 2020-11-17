Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC6F2C64E7B
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 17 Nov 2020 20:11:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 63666206C0
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 17 Nov 2020 20:11:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="FulGZF9a"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731715AbgKQULO (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 17 Nov 2020 15:11:14 -0500
Received: from mail.kernel.org ([198.145.29.99]:35874 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731550AbgKQULN (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 17 Nov 2020 15:11:13 -0500
Received: from localhost.localdomain (adsl-84-226-167-205.adslplus.ch [84.226.167.205])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 90CCE20707;
        Tue, 17 Nov 2020 20:11:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1605643872;
        bh=kd498cQy0aWOM6FRzhtjAo8fKl+E/C/qy8XzkjCs9xI=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=FulGZF9aN8t429qk9TWwMRFXPSPXS4LzX33w8wwi7b6AwwUpKiuxfdCfV7YKXM6uC
         MrRT61bw15neh0juDLuKFKXC/4pO3wXLmj8y30wtFNSDBon9bo+YkxEMpIOPlDmvEn
         UiGG1Z/OmB51qCyVXf2n0PpY9g1ZYjpCz4W3FNKo=
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Krzysztof Kozlowski <krzk@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 2/4] dt-bindings: arm: samsung: document S3C6410-based boards binding
Date:   Tue, 17 Nov 2020 21:11:04 +0100
Message-Id: <20201117201106.128813-2-krzk@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201117201106.128813-1-krzk@kernel.org>
References: <20201117201106.128813-1-krzk@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Add bindings for the FriendlyARM Mini6410 and Samsung SMDK6410 boards.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 .../devicetree/bindings/arm/samsung/samsung-boards.yaml    | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml b/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
index 332b07b7f4fb..eaec2a6c08a9 100644
--- a/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
+++ b/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
@@ -20,6 +20,13 @@ properties:
               - samsung,smdk2416                # Samsung SMDK2416
           - const: samsung,s3c2416
 
+      - description: S3C6410 based boards
+        items:
+          - enum:
+              - friendlyarm,mini6410            # FriendlyARM Mini6410
+              - samsung,smdk6410                # Samsung SMDK6410
+          - const: samsung,s3c6410
+
       - description: S5PV210 based boards
         items:
           - enum:
-- 
2.25.1


Return-Path: <SRS0=oxPC=CM=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ACB3DC433E2
	for <linux-samsung-soc@archiver.kernel.org>; Thu,  3 Sep 2020 19:14:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8AC9920C56
	for <linux-samsung-soc@archiver.kernel.org>; Thu,  3 Sep 2020 19:14:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1599160493;
	bh=lXKQONHU131LLANPalwdk6k0iSEqtYKE3hqj1CGpK0g=;
	h=From:To:Subject:Date:In-Reply-To:References:List-ID:From;
	b=NvtvOxFUKov7fMeEd2MjUGK+Jww9Mynln9Awb3w26OqWM+Q8Q0plX4sRwHAyH3mva
	 xwttBRFfT/wPpUWu+5HEODRk/do5cukM0ADRKZkXUCKrr90YikAyZmH5G89V2JJqhs
	 6MoQqEXOHGQZKCGr2ey1HRooawpCpA3CG4Q0ZyKk=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729319AbgICTOw (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 3 Sep 2020 15:14:52 -0400
Received: from mail.kernel.org ([198.145.29.99]:35778 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729309AbgICTOv (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 3 Sep 2020 15:14:51 -0400
Received: from localhost.localdomain (unknown [194.230.155.106])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 24D41214D8;
        Thu,  3 Sep 2020 19:14:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1599160490;
        bh=lXKQONHU131LLANPalwdk6k0iSEqtYKE3hqj1CGpK0g=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=Xk18qlWMCPHtVfcaNrNYGbagNOgMhFcdme81aScQ+F99M/aonwWllr0lXFFm9NHsK
         b5P5vWxZVUomJmiKLTGrR8qlz/ylkuxg1wK8ygWJjsG3xgu8UH3OPrAM8ohVXmfOZ7
         qIfUO2NA9y6TXj9fdfy7JrC1PJ5aC4oBRBDncAxE=
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Kukjin Kim <kgene@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Maxime Ripard <mripard@kernel.org>,
        Heiko Stuebner <heiko@sntech.de>,
        Inki Dae <inki.dae@samsung.com>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
Subject: [PATCH v2 3/6] dt-bindings: gpu: arm,mali-utgard: Correct Maxime's email
Date:   Thu,  3 Sep 2020 21:14:35 +0200
Message-Id: <20200903191438.12781-3-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200903191438.12781-1-krzk@kernel.org>
References: <20200903191438.12781-1-krzk@kernel.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Update the address of Maxime Ripard as one in @free-electrons.com does
not work.

Cc: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
Acked-by: Maxime Ripard <mripard@kernel.org>

---

Changes since v1:
1. Add Ack
---
 Documentation/devicetree/bindings/gpu/arm,mali-utgard.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/gpu/arm,mali-utgard.yaml b/Documentation/devicetree/bindings/gpu/arm,mali-utgard.yaml
index 30d421e6ba38..eceaa176bd57 100644
--- a/Documentation/devicetree/bindings/gpu/arm,mali-utgard.yaml
+++ b/Documentation/devicetree/bindings/gpu/arm,mali-utgard.yaml
@@ -8,7 +8,7 @@ title: ARM Mali Utgard GPU
 
 maintainers:
   - Rob Herring <robh@kernel.org>
-  - Maxime Ripard <maxime.ripard@free-electrons.com>
+  - Maxime Ripard <mripard@kernel.org>
   - Heiko Stuebner <heiko@sntech.de>
 
 properties:
-- 
2.17.1


Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE915C04FE2
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 15 Aug 2023 06:10:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234990AbjHOGJi (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 15 Aug 2023 02:09:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41016 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235070AbjHOGJA (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 15 Aug 2023 02:09:00 -0400
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E9AA2D55
        for <linux-samsung-soc@vger.kernel.org>; Mon, 14 Aug 2023 23:07:49 -0700 (PDT)
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-99c4923195dso689655466b.2
        for <linux-samsung-soc@vger.kernel.org>; Mon, 14 Aug 2023 23:07:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692079667; x=1692684467;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1eTUAES+PjBvQLtO17D5OEYj5uIqydF+x2YtGRgLnbo=;
        b=H72fNmAPH4wHA+OXV+7CNf+53M0fTZ+j8faZ3SCcJnl+auBlnAdFJMhtBWEldoADCA
         /ka74oywof0otFVGiIi8HkLP0/2FEWTiUk/pFeV4j97ZMARn1TiUIQ96W6aboZzM9Szk
         zp4WIZe4tw/OYNfIHYeKqUXnWzedWGYucYqlLghdrxakLDrcTfAyEDc8nE8Gc9Y68hgX
         JPPtFkDi113yOW8iwSNRWf0RzTtKL76dLR47/VjTQEFvTtZYyhELdUdynIHvn1ibj/2d
         dUHuBaZEQcHhTBvPv8mkM8TcJGIN6B7q/UjbMS9gzcZbmi801Waeh6RdAk97+o7H/4Os
         UJ0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692079667; x=1692684467;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1eTUAES+PjBvQLtO17D5OEYj5uIqydF+x2YtGRgLnbo=;
        b=ZN72cdw+qiHdyMlphZPMSGm2fSQHzLoRWdosm8Odx27YldzAn9kc3rdNPZpcOa1ghN
         j9Zav82pAvmLOETZ9gjXxJ+iXF+91KNxgjJBPxUCo7D/ysXjE9tegDq+PWIey926lCXH
         RJPGRNRp6y2jH6G2PagG6otJ5UaeAvN6O9UWCtN0Rbl9zh0tq3M9OdS1cXaSgl7fX9vI
         nRPPX7SLHlJAu5fLvQiV5EkTkNzDkR6MK2pBkLeJaPR65POD8xUx4DOTn5PkZKnWMaeB
         RDZMGmJDxm4UHKThT6QMuVnOe4XLrmzovZyErvU2Pwv7FZ/4LbtmagatFq0DUnpAT60Z
         FKFg==
X-Gm-Message-State: AOJu0YyqG6JQRKKuvq0IOkjLyzZncG4x879LDsa69WEkebishoX1w1hn
        8cQsFVRKIOWl7voWBAdxpnJfHw==
X-Google-Smtp-Source: AGHT+IF6ACgNcnYcHUhfee/MdzJ+x+8yGLtSpa2a0zxQSRfBPFoCSU7DzrJ1eLX6CBZF+rUmeisMow==
X-Received: by 2002:a17:906:76d1:b0:99c:ad52:b01 with SMTP id q17-20020a17090676d100b0099cad520b01mr9363081ejn.57.1692079667607;
        Mon, 14 Aug 2023 23:07:47 -0700 (PDT)
Received: from krzk-bin.. ([178.197.214.188])
        by smtp.gmail.com with ESMTPSA id gw4-20020a170906f14400b00993b381f808sm6528093ejb.38.2023.08.14.23.07.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Aug 2023 23:07:47 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v3 3/3] media: exynos4-is: fimc-is: replace duplicate pmu node with phandle
Date:   Tue, 15 Aug 2023 08:07:39 +0200
Message-Id: <20230815060739.30160-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230815060739.30160-1-krzysztof.kozlowski@linaro.org>
References: <20230815060739.30160-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Devicetree for the FIMC IS camera included duplicated PMU node as its
child like:

  soc@0 {
    system-controller@10020000 { ... }; // Real PMU

    camera@11800000 {
      fimc-is@12000000 {
        // FIMC IS camera node
        pmu@10020000 {
          reg = <0x10020000 0x3000>; // Fake PMU node
        };
      };
    };
  };

This is not a correct representation of the hardware.  Mapping the PMU
(Power Management Unit) IO memory should be via syscon-like phandle
(samsung,pmu-syscon, already used for other drivers), not by duplicating
"pmu" Devicetree node inside the FIMC IS.  Backward compatibility is
preserved.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Changes in v3:
1. Print deprecated warning only if child node "pmu" is not found.
   "Finding" -> "Found".

Changes in v2:
1. Use IOMEM_ERR_PTR (Hans)
---
 .../platform/samsung/exynos4-is/fimc-is.c     | 33 ++++++++++++++-----
 1 file changed, 24 insertions(+), 9 deletions(-)

diff --git a/drivers/media/platform/samsung/exynos4-is/fimc-is.c b/drivers/media/platform/samsung/exynos4-is/fimc-is.c
index 530a148fe4d3..a08c87ef6e2d 100644
--- a/drivers/media/platform/samsung/exynos4-is/fimc-is.c
+++ b/drivers/media/platform/samsung/exynos4-is/fimc-is.c
@@ -767,12 +767,32 @@ static void fimc_is_debugfs_create(struct fimc_is *is)
 static int fimc_is_runtime_resume(struct device *dev);
 static int fimc_is_runtime_suspend(struct device *dev);
 
+static void __iomem *fimc_is_get_pmu_regs(struct device *dev)
+{
+	struct device_node *node;
+	void __iomem *regs;
+
+	node = of_parse_phandle(dev->of_node, "samsung,pmu-syscon", 0);
+	if (!node) {
+		node = of_get_child_by_name(dev->of_node, "pmu");
+		if (!node)
+			return IOMEM_ERR_PTR(-ENODEV);
+		dev_warn(dev, "Found PMU node via deprecated method, update your DTB\n");
+	}
+
+	regs = of_iomap(node, 0);
+	of_node_put(node);
+	if (!regs)
+		return IOMEM_ERR_PTR(-ENOMEM);
+
+	return regs;
+}
+
 static int fimc_is_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct fimc_is *is;
 	struct resource res;
-	struct device_node *node;
 	int ret;
 
 	is = devm_kzalloc(&pdev->dev, sizeof(*is), GFP_KERNEL);
@@ -794,14 +814,9 @@ static int fimc_is_probe(struct platform_device *pdev)
 	if (IS_ERR(is->regs))
 		return PTR_ERR(is->regs);
 
-	node = of_get_child_by_name(dev->of_node, "pmu");
-	if (!node)
-		return -ENODEV;
-
-	is->pmu_regs = of_iomap(node, 0);
-	of_node_put(node);
-	if (!is->pmu_regs)
-		return -ENOMEM;
+	is->pmu_regs = fimc_is_get_pmu_regs(dev);
+	if (IS_ERR(is->pmu_regs))
+		return PTR_ERR(is->pmu_regs);
 
 	is->irq = irq_of_parse_and_map(dev->of_node, 0);
 	if (!is->irq) {
-- 
2.34.1


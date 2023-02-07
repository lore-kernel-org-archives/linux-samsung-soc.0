Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBEC1C64EC4
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  7 Feb 2023 20:58:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229623AbjBGU6s (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 7 Feb 2023 15:58:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47012 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229727AbjBGU6r (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 7 Feb 2023 15:58:47 -0500
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2F230196B5
        for <linux-samsung-soc@vger.kernel.org>; Tue,  7 Feb 2023 12:58:46 -0800 (PST)
Received: by mail-wm1-x32d.google.com with SMTP id z13so4466870wmp.2
        for <linux-samsung-soc@vger.kernel.org>; Tue, 07 Feb 2023 12:58:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dRrfTafHWOPP66W8TWUXdxmmbu6jMm7VMDj6nUG7ys4=;
        b=DqtTAyD+/DfVIXIixTTLeibbPWfARnoKPtZ503G/plOAdpSOZov9AsNRpB3pUQJUCv
         5FCNQSbkC0AV7x/c4JKBbGIsoJuPYgqyzs2xF/miMtoLpyWrGtikd+RQT0vvCwpOV1c/
         LVTXvBnhyoXTiKlSEA51+3WcZhlTyji8x5IDX0Mn2tghG16exPAaIpGzWridsqZMAxkx
         VxKKiazE0E9AuPVSkwv+0S9b9bro79BmeeJuIJsR8uaXenubEjuo5LA+Zoz2D1YzSnPv
         MGCiAbPamcfmHPYxaGJLC6H7KwYpZsFvUAOhnYsAIRJaKV7/5/MSyTniqrwxKqarbPsk
         QrEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dRrfTafHWOPP66W8TWUXdxmmbu6jMm7VMDj6nUG7ys4=;
        b=EL2lRy/dD+E8sAgzyKIhh1+i8zsea1mHEZwhHpDh9WgZScFE0i/Up9hDiui/dnQR61
         LLxGbE3KcAdcWf23ZefkTK4eGTbYv9TQwYQfyyXPqyN3wqPE1BmCd0iR0wSaThKxkw5E
         OKX3JGf5ZVQ7JgeTdHrbQrj5Y0hSAiECZbbczYrCvn2Gvfo8R8W6CZ+LtWOhksGFGXN/
         zJx4uxl08A9CHFeF1Jy0PHxRTOtMbvMHz1e/jOqbdKJzOCNVkv/GIPdg5t/psN5XT9tl
         sbp1t5YBdl43ygrtf2foekQK1bfEQT/ShBO6odh7uXetGjMUQmEBm6Jl21bxMUtUdDzC
         qb2Q==
X-Gm-Message-State: AO0yUKX9zCCx08xK/O5VC1AP5p/66aaqoeFcmEx8Ck49lHd6FqbeXWaW
        KHN3IOTb99cotwPp6z0mbpWm/w==
X-Google-Smtp-Source: AK7set8unV2JpGoXq+wRRje/TXgj4zlNonWi0Sr7sORRaCG8wxSrplHwWE6VetjIA5RfaZHnpx1ibg==
X-Received: by 2002:a05:600c:4383:b0:3dc:57e8:1d1c with SMTP id e3-20020a05600c438300b003dc57e81d1cmr5511078wmn.9.1675803524727;
        Tue, 07 Feb 2023 12:58:44 -0800 (PST)
Received: from krzk-bin.. ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id h27-20020a05600c2cbb00b003db12112fcfsm16555649wmc.4.2023.02.07.12.58.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Feb 2023 12:58:44 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 3/4] media: samsung: exynos4-is: do not require pinctrl
Date:   Tue,  7 Feb 2023 21:58:33 +0100
Message-Id: <20230207205834.673163-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230207205834.673163-1-krzysztof.kozlowski@linaro.org>
References: <20230207205834.673163-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Driver does not handle pin configuration switching and several DTS
provide empty pinctrl property, just to satisfy the driver's requirement
for it.  Drop requirement for pinctrl property as it is really optional.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Changes since v1:
1. New patch
---
 drivers/media/platform/samsung/exynos4-is/media-dev.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/samsung/exynos4-is/media-dev.c b/drivers/media/platform/samsung/exynos4-is/media-dev.c
index 98a60f01129d..22baa429ed5d 100644
--- a/drivers/media/platform/samsung/exynos4-is/media-dev.c
+++ b/drivers/media/platform/samsung/exynos4-is/media-dev.c
@@ -1470,10 +1470,8 @@ static int fimc_md_probe(struct platform_device *pdev)
 		goto err_v4l2dev;
 
 	pinctrl = devm_pinctrl_get(dev);
-	if (IS_ERR(pinctrl)) {
-		ret = dev_err_probe(dev, PTR_ERR(pinctrl), "Failed to get pinctrl\n");
-		goto err_clk;
-	}
+	if (IS_ERR(pinctrl))
+		dev_dbg(dev, "Failed to get pinctrl: %pe\n", pinctrl);
 
 	platform_set_drvdata(pdev, fmd);
 
-- 
2.34.1


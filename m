Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B35EBC433EF
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 28 Oct 2021 14:43:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 96D4461106
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 28 Oct 2021 14:43:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231303AbhJ1Opt (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 28 Oct 2021 10:45:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35038 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230493AbhJ1Opq (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 28 Oct 2021 10:45:46 -0400
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 87FA8C061767
        for <linux-samsung-soc@vger.kernel.org>; Thu, 28 Oct 2021 07:43:19 -0700 (PDT)
Received: by mail-lj1-x234.google.com with SMTP id q16so11173897ljg.3
        for <linux-samsung-soc@vger.kernel.org>; Thu, 28 Oct 2021 07:43:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=O53AHUgACpwOyqnjRAL2GRxe71zIKofdn1555ZmaTgk=;
        b=uDm1ThkqYSTH37pvAeBSIac3/jrGqvTNFtAPZ0KSPpEx1wpOgN4s1YquOXvOcDpCey
         8s77v6r3YHA23g8jGZUQgdyafiNoJWFN5E6w9PjSGhnyaku2qjsKqkmsVnv+f+hRk69i
         tx4FkijDrj7xrzfnNFrn33GpzlSsisfvClxbjMZUsuCdEunfSFkAQ/QQfJwlliI0ihy5
         7W0EbDR7Clw7smY+qe3YGJGSMJEWS89ZiBqGfoyEqKyGc+yPpJYLS/X+jRr/jtZKNiTu
         6GPIEVfwU02OcWI1dJhMe0y1Bq+lwBwrRF0lZwdZaSM06TFsYiTiR4zLGA3yqXAXg321
         oztg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=O53AHUgACpwOyqnjRAL2GRxe71zIKofdn1555ZmaTgk=;
        b=e8TjLba1sCM7RAyLDVN4iKsHFyieg/2g4Q7w1lhV38BAO42Mx1ex85lpoPV6l2C0kK
         AWCiV0dblzJ7tKMz8uWvAI3zB0lr+4Zrs43i7cCW/S2j+GpnI6OAo1ZyHt3mVJX5P5ay
         TTsrhhuNgVEK4eJubU92QZV0mxI5bkHATJJ2f93wOv79f+2whE0R/3G+heSYQsVPr0M9
         aGKLL5ObW4CzZrKdWTUiHHU1GIHJhawvfVoDVFCsbBLS4D2yiU7+rcNmckTpS7CpPHql
         TdXGe0/cXrBF5LCF2lIVtl8BtZrH975VWsrMaDHLZGyIBen1F7RCCIL1fCFXmANwSldu
         IkFQ==
X-Gm-Message-State: AOAM533YrFoGuan6whToGJ1Jv60KD2BPAqELaQamd8jdKvJSBTS5B1r1
        r0T1tlMEj1wpFuxQdTdwzy+3tg==
X-Google-Smtp-Source: ABdhPJwmFDPA7CH5Ie55u0g0CIVwKuzI6JmcYwigAWJx30oJsS8kwg3hYpdWKSFo18/72ymQXXTK7w==
X-Received: by 2002:a2e:bd09:: with SMTP id n9mr3482129ljq.40.1635432196435;
        Thu, 28 Oct 2021 07:43:16 -0700 (PDT)
Received: from localhost ([31.134.121.151])
        by smtp.gmail.com with ESMTPSA id y3sm28967ljg.47.2021.10.28.07.43.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Oct 2021 07:43:15 -0700 (PDT)
From:   Sam Protsenko <semen.protsenko@linaro.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] soc: samsung: exynos-pmu: Add Exynos850 support
Date:   Thu, 28 Oct 2021 17:43:13 +0300
Message-Id: <20211028144313.9444-2-semen.protsenko@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211028144313.9444-1-semen.protsenko@linaro.org>
References: <20211028144313.9444-1-semen.protsenko@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Exynos850 SoC can reuse PMU driver functionality. Add corresponding
compatible string.

Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
---
 drivers/soc/samsung/exynos-pmu.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/soc/samsung/exynos-pmu.c b/drivers/soc/samsung/exynos-pmu.c
index a18c93a4646c..732c86ce2be8 100644
--- a/drivers/soc/samsung/exynos-pmu.c
+++ b/drivers/soc/samsung/exynos-pmu.c
@@ -94,6 +94,8 @@ static const struct of_device_id exynos_pmu_of_device_ids[] = {
 		.compatible = "samsung,exynos5433-pmu",
 	}, {
 		.compatible = "samsung,exynos7-pmu",
+	}, {
+		.compatible = "samsung,exynos850-pmu",
 	},
 	{ /*sentinel*/ },
 };
-- 
2.30.2


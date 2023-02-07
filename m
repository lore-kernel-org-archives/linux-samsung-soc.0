Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83BE4C636D4
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  7 Feb 2023 20:58:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229585AbjBGU6v (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 7 Feb 2023 15:58:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47082 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229545AbjBGU6t (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 7 Feb 2023 15:58:49 -0500
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0BB6E126E1
        for <linux-samsung-soc@vger.kernel.org>; Tue,  7 Feb 2023 12:58:48 -0800 (PST)
Received: by mail-wm1-x32b.google.com with SMTP id bg5-20020a05600c3c8500b003e00c739ce4so8573wmb.5
        for <linux-samsung-soc@vger.kernel.org>; Tue, 07 Feb 2023 12:58:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZVDEkwpSNBnNA5bvC0eSecX/xh6oUxrJTLdGIKP8nY4=;
        b=uH2KAUVklw9v43h9yxNBufniyLS6TjEIIWPQXE6iftGk2v0fGkbNJAd8CeWQXDyGTO
         3+jQagCE3g33wzfpDvz1FKzLwayfNTWXZNUcGSwHDCQsY+10LxPptS0u9tN4OmmlfFp4
         htkSYBlpb35kapv9Bddhu7pUZi6razflGKlvnFtGXW45pT/knPZScLm0kaj7vZDkGSMR
         ZfG4xCoTvpdrG+4szCkJASSht4esYG0MqkaPVSJzHa0os1OC2MJRRiftDXTcvRO00kTg
         AY4PXW31vld/2p1G2SfdyAP7/xPUMTFv2mefqhx+SpSVz9eHHvVpvL2nyB0DjMCGYV6L
         +PKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZVDEkwpSNBnNA5bvC0eSecX/xh6oUxrJTLdGIKP8nY4=;
        b=onTGR/Z8dTtMq37c0cmVijnszhU0BtQ+N9zbtHveK8xZF0OoYkkY9DXKyNJUi5ZWdP
         abCBTNW6QKIiZrHnE0vMHo8PbfPvpV0F6pUuJ9HjWW7/OfkeXwhxwUGyrDE8zup8gpvJ
         u3jLWZTTCVWYonLFjegUemJA7RsPOKmcQgic/k4iSbnBSoPvGCnmj0hDDto4eUnjQGiC
         79AkXabLlPonOSOcrcMHbR76/Bkg6xGd7D5cvIFrrLrTmqN0N5YDByI8vhdbKaZrAxlt
         S2rbpZtZjMcjYOYq3GFedpc9RJLsparVqv/IGj3bTg4psHxNZdWE6aP8rr1qLBAv1qtg
         LblQ==
X-Gm-Message-State: AO0yUKUxhX/rP8qf9US4TW/oKgwQvgZNMfICAm01UYHyR+cZKeN4Gi40
        uz0Op8H2nJ8x3xB8YMmBI+MtLg==
X-Google-Smtp-Source: AK7set9g0Q4PXzjyBw/7a9A5YeoIjf44d801s6Qofr8X7o0oi+hxj5dbCa8KvDcVQ6d9cBKnOlSLiQ==
X-Received: by 2002:a05:600c:1688:b0:3dc:4042:5c21 with SMTP id k8-20020a05600c168800b003dc40425c21mr4443353wmn.6.1675803527622;
        Tue, 07 Feb 2023 12:58:47 -0800 (PST)
Received: from krzk-bin.. ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id h27-20020a05600c2cbb00b003db12112fcfsm16555649wmc.4.2023.02.07.12.58.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Feb 2023 12:58:47 -0800 (PST)
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
Subject: [PATCH v2 4/4] media: samsung: exynos4-is: drop simple-bus from compatibles
Date:   Tue,  7 Feb 2023 21:58:34 +0100
Message-Id: <20230207205834.673163-4-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230207205834.673163-1-krzysztof.kozlowski@linaro.org>
References: <20230207205834.673163-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

The FIMC camera node wrapper is not a bus, so using simple-bus fallback
compatible just to instantiate its children nodes was never correct.
Driver should explicitly populate all its children devices.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Changes since v1:
1. Do not depopulate on errors because it causes several errors.
---
 drivers/media/platform/samsung/exynos4-is/media-dev.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/media/platform/samsung/exynos4-is/media-dev.c b/drivers/media/platform/samsung/exynos4-is/media-dev.c
index 22baa429ed5d..6839007edf1d 100644
--- a/drivers/media/platform/samsung/exynos4-is/media-dev.c
+++ b/drivers/media/platform/samsung/exynos4-is/media-dev.c
@@ -1440,6 +1440,10 @@ static int fimc_md_probe(struct platform_device *pdev)
 	if (!fmd)
 		return -ENOMEM;
 
+	ret = of_platform_populate(dev->of_node, NULL, NULL, dev);
+	if (ret < 0)
+		return -ENOMEM;
+
 	spin_lock_init(&fmd->slock);
 	INIT_LIST_HEAD(&fmd->pipelines);
 	fmd->pdev = pdev;
-- 
2.34.1


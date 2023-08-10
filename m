Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D046CC04A94
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 10 Aug 2023 09:14:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234738AbjHJJOR (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 10 Aug 2023 05:14:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38770 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234549AbjHJJNw (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 10 Aug 2023 05:13:52 -0400
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 76A5835BC
        for <linux-samsung-soc@vger.kernel.org>; Thu, 10 Aug 2023 02:13:22 -0700 (PDT)
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-52327d63d7cso811699a12.1
        for <linux-samsung-soc@vger.kernel.org>; Thu, 10 Aug 2023 02:13:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691658801; x=1692263601;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=g3SpD5yxs/exW7oqYDwh6NeT5Hd31MRlZzqVBk8xwU8=;
        b=D4wxknROpd8rYS825uf312+KYogA9ZDVqxH9TibWxJxmTZJ5j8iG47lwgyvoR8H1tc
         Q3m15P8P2+lfhcFyAyjk/1NE6W32I9+COf/UbrQ4lwwa+VqWxFfwlvde/UKZqI5o7rRv
         wsyEKqRZhupBg4Qg0Gfp+yPO53U1ZFHOJWKZ2pjE3uT+GRpzuPwLPV+TNqxqiSyMNfOQ
         apDmXv+SmiridApSDYDwwh6LNbizRROmBeJWuM9hJtVX6OZE38IJbZJ+g7NNLC7dFTtA
         WtLQnwyYmrD8rlTOz1wlz4BKy52xwMdwtj3Fuxc3jvT5Z8uDvzv+BV8elKyPD+PRKipq
         n5UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691658801; x=1692263601;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=g3SpD5yxs/exW7oqYDwh6NeT5Hd31MRlZzqVBk8xwU8=;
        b=lbde17QRrhjmvqCKdwT4l4w1U0vb7fkdWvF5yTUAMOJIHsJ5940/CLDhO8EsXXfWPM
         HkHK9Q+Fy7wxRtUo3uIoOc21cQnwHBgPjkcqTOsdeFFnZMS5A3Y0XPakqAwuX03ShxM9
         zcEtJGYi1nRY+Oeg49e9OzDh6Wt/7Wg4UpudtP3Dao10lvTYdTljRWhiL+4MwNfjLefE
         fth192G6olNVH+3zuNvXoMBnkiDxJiEdmFdO6ABVz85Od58GGYndJPehlgfWfMIiTSVd
         YjjkdZWgc7NPi0D9qi5YyKsUGRz5kNqFlaOA+cJveEhqAslah/5t8cCu9BxzEgUKUeut
         Aw4g==
X-Gm-Message-State: AOJu0Ywg1k6cEEV9Xyn9c7EQ+ebwZpqi8AY4rI0lteqAnByWZ5q9oTF9
        FfgjNQcmBDR2i6EcNzWIYihciNl3wQAxko8GS8ezZQ==
X-Google-Smtp-Source: AGHT+IEAg+m9R2DlQPa4LDbgsuO3OxpClGBb4Zy/Wi4GmUdfNIwkALvNZ+bxZDFUMnc+zmgzgZgiZQ==
X-Received: by 2002:a17:906:cc54:b0:99c:a23b:b4f5 with SMTP id mm20-20020a170906cc5400b0099ca23bb4f5mr1499184ejb.53.1691658801041;
        Thu, 10 Aug 2023 02:13:21 -0700 (PDT)
Received: from krzk-bin.. ([178.197.222.113])
        by smtp.gmail.com with ESMTPSA id a18-20020a170906469200b00993150e5325sm653868ejr.60.2023.08.10.02.13.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Aug 2023 02:13:20 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Amit Kucheria <amitk@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        linux-pm@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc:     Andi Shyti <andi.shyti@kernel.org>
Subject: [PATCH net-next] thermal: samsung: fix Wvoid-pointer-to-enum-cast warning
Date:   Thu, 10 Aug 2023 11:13:18 +0200
Message-Id: <20230810091318.70261-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

'soc' is an enum, thus cast of pointer on 64-bit compile test with W=1
causes:

  exynos_tmu.c:890:14: error: cast to smaller integer type 'enum soc_type' from 'const void *' [-Werror,-Wvoid-pointer-to-enum-cast]

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/thermal/samsung/exynos_tmu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/thermal/samsung/exynos_tmu.c b/drivers/thermal/samsung/exynos_tmu.c
index 58f4d8f7a3fd..e5bc2c82010f 100644
--- a/drivers/thermal/samsung/exynos_tmu.c
+++ b/drivers/thermal/samsung/exynos_tmu.c
@@ -887,7 +887,7 @@ static int exynos_map_dt_data(struct platform_device *pdev)
 		return -EADDRNOTAVAIL;
 	}
 
-	data->soc = (enum soc_type)of_device_get_match_data(&pdev->dev);
+	data->soc = (uintptr_t)of_device_get_match_data(&pdev->dev);
 
 	switch (data->soc) {
 	case SOC_ARCH_EXYNOS4210:
-- 
2.34.1


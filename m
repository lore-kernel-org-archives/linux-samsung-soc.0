Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ACDC1C74A4B
	for <linux-samsung-soc@archiver.kernel.org>; Sat, 11 Mar 2023 17:39:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230488AbjCKRje (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sat, 11 Mar 2023 12:39:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40652 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230165AbjCKRjN (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sat, 11 Mar 2023 12:39:13 -0500
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 70D3026C2D
        for <linux-samsung-soc@vger.kernel.org>; Sat, 11 Mar 2023 09:38:41 -0800 (PST)
Received: by mail-ed1-x52b.google.com with SMTP id g10so4184171eda.1
        for <linux-samsung-soc@vger.kernel.org>; Sat, 11 Mar 2023 09:38:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678556275;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=M5xwpl4H01ebuofJIsmyDXhZifNKbULLaWH0tgMeLQs=;
        b=uHRXvcl4aQRMKSbMkJJVDHQLeJeor/p2qFQVGFmp4HbBcIjyvzBQXOOEOuHg5McWei
         YkEPMsW0vdZEVtKDleHnOWn0qxL8bUYhMoWrRanE2Q2WOI6Ym1g3EC3UmWNyUUjGyR7y
         V1CQmCVvmgjhZNEAg9xJW1pzDAlsnROIIVkXlqZ9BOSVhlPHNFzQPaCiSM4la7NDl4ZN
         LuGw47EWnCQsi7sVTaNLg123uR3NHmj731YlMoLQDWIYnzcOBnmYYzHnWYGAk3vdYvkz
         GAaeaSOr4LaUH1Fj4WcphjEjgnK3vmLSV+Dt51eeykqpi1RCcbC/3ro+zK/leUzQWe2f
         42dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678556275;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=M5xwpl4H01ebuofJIsmyDXhZifNKbULLaWH0tgMeLQs=;
        b=5IhvNW1u0axrF0AUqZb4LmLClTc4aOtKNYr7qEUF0CcUrY2tzQj9XvACV5jehaw4SM
         HKw4IQ+quQ3CfyZmi0jus6Sl9aSvb7f2cQTnxiNEO8ufz1Hdlo3ihwkz8Uh/Ohs65p23
         Z9lsSUkQCsn0TZwxFTWRP/4g2hYn/Y8ZZqd4UXBKqsXJjTqMcs26RYJUuvvPOK1t/yzs
         M27jTZr2dpMvdLcdbftafctjA3cYpAnxK9o+Qe51QqOws4nSuX5K6BYmaOLNXQBT5ga2
         +0jwa865FrjFqCwYPwuyTshQSEdFVvJCA1A5dIeHGGTzy56NnxkFuD3yGxVuxHcq6fbw
         8neA==
X-Gm-Message-State: AO0yUKVwzYHUm/DJl7ZBSp4l2bAPTnXUIe1E5dsCBJ8GT7b/BLXAtgK5
        vC/+9uSALgZhk6JFD6zvkmoAxO+qxFOygRlc5e0=
X-Google-Smtp-Source: AK7set9jGiGyUzTtS/mgdFjFwFwViy1GgJ823I/8lO8D9gRcovvMXzCapYxYjktiKP9R3ILihDBvIg==
X-Received: by 2002:aa7:d58b:0:b0:4ad:7ad3:de18 with SMTP id r11-20020aa7d58b000000b004ad7ad3de18mr26993394edq.28.1678556275117;
        Sat, 11 Mar 2023 09:37:55 -0800 (PST)
Received: from krzk-bin.. ([2a02:810d:15c0:828:6927:e94d:fc63:9d6e])
        by smtp.gmail.com with ESMTPSA id q4-20020a50cc84000000b004bc15a440f1sm1421975edi.78.2023.03.11.09.37.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Mar 2023 09:37:54 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Chanwoo Choi <cw00.choi@samsung.com>,
        MyungJoo Ham <myungjoo.ham@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        linux-pm@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH] devfreq: exyos-bus: drop of_match_ptr for ID table
Date:   Sat, 11 Mar 2023 18:37:53 +0100
Message-Id: <20230311173753.263390-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

The driver can match only via the DT table so the table should be always
used and the of_match_ptr does not have any sense (this also allows ACPI
matching via PRP0001, even though it might not be relevant here).

  drivers/devfreq/exynos-bus.c:504:34: error: ‘exynos_bus_of_match’ defined but not used [-Werror=unused-const-variable=]

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/devfreq/exynos-bus.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/devfreq/exynos-bus.c b/drivers/devfreq/exynos-bus.c
index 027e8f336acc..f7c554051232 100644
--- a/drivers/devfreq/exynos-bus.c
+++ b/drivers/devfreq/exynos-bus.c
@@ -513,7 +513,7 @@ static struct platform_driver exynos_bus_platdrv = {
 	.driver = {
 		.name	= "exynos-bus",
 		.pm	= &exynos_bus_pm,
-		.of_match_table = of_match_ptr(exynos_bus_of_match),
+		.of_match_table = exynos_bus_of_match,
 	},
 };
 module_platform_driver(exynos_bus_platdrv);
-- 
2.34.1


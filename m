Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5469C636CC
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  7 Feb 2023 21:00:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229670AbjBGVAh (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 7 Feb 2023 16:00:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49262 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229509AbjBGVAg (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 7 Feb 2023 16:00:36 -0500
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 095163EC53
        for <linux-samsung-soc@vger.kernel.org>; Tue,  7 Feb 2023 13:00:26 -0800 (PST)
Received: by mail-wm1-x32a.google.com with SMTP id bg13-20020a05600c3c8d00b003d9712b29d2so18172wmb.2
        for <linux-samsung-soc@vger.kernel.org>; Tue, 07 Feb 2023 13:00:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RUVaoheynYuPBZIl2P8uumz3FtGDoBwSbFJg7uXrdag=;
        b=zBTflR7+KqJgouh69ORKmJpVf519ralGzIclUlw+jTtpQBOoyQ/9eGPyaUAisKWy7v
         O+YodHBS7tazSc19se3qlW/lF7x5fllSJ6zsLJizyxLxsgKcA6ReBKL7H7G/Iv2lbXWK
         KVAn6Bw8euZJX53zGnjbWhkHhVZrobGdklEgZmoIi2zztMVwi9vvTIVxewnfzQQqBoC1
         FAXPjlGOB8rQoaD0K4mPXOdQzY4OBthLmN/QZge/AQ7/LoAfMl6npJ1lVsA28Rg0dNRn
         K1aCTsDZ03rKYh5D92ofPlfhzdoaRoTMxj+DX4L48pwum4xEIBSEo2q/oHE1QfXWX/8J
         BjDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RUVaoheynYuPBZIl2P8uumz3FtGDoBwSbFJg7uXrdag=;
        b=ZLVv5FFSUYZk8vuMbpxU7MMtnWClxBnmiJiRSnhw7kEtUS9NQeut7ig3a6m4px4TTr
         HoKVtD5sfjQ/eDkWXQkx8kXDEwmOQD5Fzf8W5QuuseSFHIXFcbfCEP5mS1zVZzYcRaUG
         aDCryGmkcqKa7hPCKYHbzt23kNQW5tEWlLR0Bubp3W05h1w6+/cdw95qLDnYs5Z7ttxF
         amHlro4PWRKIna/qjgOKuWmQ14iDwa4kh0mYKj9cCRyszV77o4/y7Toh253SStzWyzOL
         +MZIVF6eQzWmMm7nfRCGZmcvsNaYyf/i8nv12FjVpeSQY5WtPn0St8Owthb1jpVQSjXx
         U9iQ==
X-Gm-Message-State: AO0yUKX9/HrUluPtgkh3SyZDZzyt+N+6dpPgM7+VIcxnptdpMbWX7YFT
        DuSB+I/USTsyzm5g39y/uKOyKw==
X-Google-Smtp-Source: AK7set9jhJY/IWTXUEu5ibMOFtpXEGJQcwmxoVDLHyxllonp0xaHZrVElLOan6ooaFS5oyk44Dh07g==
X-Received: by 2002:a05:600c:18a6:b0:3d3:4f56:62e1 with SMTP id x38-20020a05600c18a600b003d34f5662e1mr4240915wmp.27.1675803624580;
        Tue, 07 Feb 2023 13:00:24 -0800 (PST)
Received: from krzk-bin.. ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id f9-20020a05600c44c900b003dc4fd6e624sm8041631wmo.19.2023.02.07.13.00.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Feb 2023 13:00:24 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 1/7] ARM: dts: exynos: Remove empty camera pinctrl configuration in Trats
Date:   Tue,  7 Feb 2023 22:00:14 +0100
Message-Id: <20230207210020.677007-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

The camera's pinctrl configuration is simply empty and not effective.
Remove it to fix dtbs_check warning:

  arch/arm/boot/dts/exynos4210-trats.dt.yaml: camera: pinctrl-0: True is not of type 'array'

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Resend old patch after fixing FIMC driver. Depends on:
---
 arch/arm/boot/dts/exynos4210-trats.dts | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm/boot/dts/exynos4210-trats.dts b/arch/arm/boot/dts/exynos4210-trats.dts
index b8e9dd23fc51..9a9a744a88da 100644
--- a/arch/arm/boot/dts/exynos4210-trats.dts
+++ b/arch/arm/boot/dts/exynos4210-trats.dts
@@ -144,8 +144,6 @@ pmic_ap_clk: pmic-ap-clk {
 };
 
 &camera {
-	pinctrl-names = "default";
-	pinctrl-0 = <>;
 	status = "okay";
 };
 
-- 
2.34.1


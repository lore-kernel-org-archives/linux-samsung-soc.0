Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE707C636CC
	for <linux-samsung-soc@archiver.kernel.org>; Wed,  8 Feb 2023 16:50:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230055AbjBHQuC (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 8 Feb 2023 11:50:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58576 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231776AbjBHQtu (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 8 Feb 2023 11:49:50 -0500
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E88253B0F8
        for <linux-samsung-soc@vger.kernel.org>; Wed,  8 Feb 2023 08:49:47 -0800 (PST)
Received: by mail-wr1-x42e.google.com with SMTP id j23so2217781wra.0
        for <linux-samsung-soc@vger.kernel.org>; Wed, 08 Feb 2023 08:49:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zOVpiA9bQoklU4o2dljZY43CBbu8RtR1NwpXNWDYasE=;
        b=H29feLPkuAsqMJ3Bjfji8adSbgdNAnfPUHW8GlWuFDn/4k2xCjjJaAfKevVxKdCCZ6
         B7xhMdg6G+Jsi4e3aJsp2HRbQXL2tLQKiYqHvUdlPHyKgQ4+L/QeAwfG7i2kyCounZfs
         MBbyQHcXL30w8y3JdY61/LJlJF+foto0SD9gC+ZWMPWRoMmzPeq2OAk0JhNj1LQ7yYZB
         9e7Vekg+QP0tUnoov+DtkPFbEZF8ngnroSNap7yv9Qd1brL0iKQAzeXD5oPztyniAiv/
         e40lr6mQF/IAX3VIphsQgNEj3wzq0WpVJjK4fikT6VWqm+b1P+spgXS+vO9MUrQYvqKz
         jfyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zOVpiA9bQoklU4o2dljZY43CBbu8RtR1NwpXNWDYasE=;
        b=VXb3GSLDdDiVc+5XfT0UQc7Sus59fgCuYusnF4094U37XeNkmKq/WhGzR/s6V5nRkQ
         fMmlvvD2AgvkNGjFK3AJSt6ZjwqmXctdlPA06MBlb2mMIV/7Y19qxwQQpFPN0RbwZ5mt
         1+l65t7QqVqTip5H7zzTDLTk7PtBkv5EeqEn99doHTMuCqd2QkSLrsig2x+6CS4HX+59
         OZKgIFMsJzTQxknbeR1RNYjzTwdtyGqOeIohbmxBJLslg6PJVA2L1LmJiAC1nJCgCdKq
         f35VCV8+cltcXGmvCFtA6aWc0bXZFd3/t055WvE1ViLINe2XuSu4g6b81CDSpJJpnu5s
         mxcQ==
X-Gm-Message-State: AO0yUKX56/4wu55vMiB8Lk2GCSjCZ5aof4HURm6QI/DnLAEZmLuQ3gsf
        dku4asKR9lJ5Hd66B65HQHWRNg==
X-Google-Smtp-Source: AK7set9K7KvdCjwK0eDX13Uh3erBqstkIvVypRtzkwfl6qhku2fcQxKP3u+1xFO9t/ej/2+T9sRcAQ==
X-Received: by 2002:a5d:6043:0:b0:2c3:ea78:35be with SMTP id j3-20020a5d6043000000b002c3ea7835bemr2259611wrt.19.1675874986505;
        Wed, 08 Feb 2023 08:49:46 -0800 (PST)
Received: from krzk-bin.. ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id x7-20020a5d4907000000b002c3e306d3eesm9637434wrq.17.2023.02.08.08.49.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Feb 2023 08:49:46 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 1/2] ARM: dts: exynos: correct SPI nor compatible in SMDKv310
Date:   Wed,  8 Feb 2023 17:49:41 +0100
Message-Id: <20230208164942.387390-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

SPI NOR flash compatible should come with generic jedec,spi-nor fallback
and proper vendor prefix:

  exynos4210-smdkv310.dtb: /soc/spi@13940000/flash@0: failed to match any schema with compatible: ['w25x80']

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm/boot/dts/exynos4210-smdkv310.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/exynos4210-smdkv310.dts b/arch/arm/boot/dts/exynos4210-smdkv310.dts
index a5dfd7fd49b3..181c99eca675 100644
--- a/arch/arm/boot/dts/exynos4210-smdkv310.dts
+++ b/arch/arm/boot/dts/exynos4210-smdkv310.dts
@@ -203,7 +203,7 @@ &spi_2 {
 	flash@0 {
 		#address-cells = <1>;
 		#size-cells = <1>;
-		compatible = "w25x80";
+		compatible = "winbond,w25x80", "jedec,spi-nor";
 		reg = <0>;
 		spi-max-frequency = <1000000>;
 
-- 
2.34.1


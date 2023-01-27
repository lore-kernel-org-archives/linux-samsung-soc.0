Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DEB8C636CB
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 27 Jan 2023 19:43:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231855AbjA0TnG (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 27 Jan 2023 14:43:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50656 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231872AbjA0Tm5 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 27 Jan 2023 14:42:57 -0500
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E07B28242C
        for <linux-samsung-soc@vger.kernel.org>; Fri, 27 Jan 2023 11:42:29 -0800 (PST)
Received: by mail-wr1-x436.google.com with SMTP id h12so5890003wrv.10
        for <linux-samsung-soc@vger.kernel.org>; Fri, 27 Jan 2023 11:42:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pXcEOV+ikhaaev3YUpdV3LTjyGNwDAC89LChkvoW52Y=;
        b=ECGkYC22kGhYCVIAgJfs1kwNkbHusNO0OIv7monN00IxJ/o2bSlbuNHUJze5Ozrt/M
         ujaHYFsD/x9rlkGuD+eWGdVwmMPJM4zpZD/SkU7AtFYhB2aQHfkN35l5Zw9ykEasQDBX
         7zihqPGLiYXL432GMeBiWsG5IKcqyRrynqy3bSa7f3VShNqilVQ4CMz6eV1ALCYNpLrP
         wepGiVaixK8VgQAjQUC6eWm7qUnwtBj4RaodXkl3Q0YEhL7QuRNtbs1T57/gXikIz/n0
         BI7ydf2oiSjn0OoOnPtaMh+wtpBVpw9s2XgkClagH/8gU6K1DrlKCcdlliWnqWq/Nkbs
         rTJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pXcEOV+ikhaaev3YUpdV3LTjyGNwDAC89LChkvoW52Y=;
        b=eTk2gh5Y0e2SS9/CKoRN1nVSsFzJw8R9eP+ECoofskQBffkoeGKoSaarMNWdPAFlLH
         mF9Tl12wuai0bu78Ccq45dcqfiWmDg38dQEUI9I5lzTVxKt+E7QVeHTsgsL03RY5EjxH
         CP9zZ8bVB+8tksf/LgZfsc9/UZROUocdFcc1F11cLCM4Awtr8hH1KRgQUBOzNtiulCEC
         cLvXw8a8PszZBR0ScpJ9/ISZynnOkLyDbg1bRdpCRf/XTdNHn6Ljbv+XuEN/ToWUCVVd
         /k+PfMGw6Wy6EIRUicWdIxBiDtGhxhVv081jqdPPzTEKr4cHIX+nAhCpG2AOuswfzqIb
         nG7w==
X-Gm-Message-State: AFqh2kraMIz6i2voHtCzX4aBlzeuMbMo1eTpN8mohoI7TPCNrlbwjFhT
        dGwJbeglopCaPut0tTHgBK2FdA==
X-Google-Smtp-Source: AMrXdXtnxP2pNNbbdNfNhQSvTB/2VE/w9WDZOg/rAZpkuBD5arji3hv5ReYPbhPestFCp0q1weUkqw==
X-Received: by 2002:a05:6000:8d:b0:2be:3a6a:f565 with SMTP id m13-20020a056000008d00b002be3a6af565mr27343065wrx.38.1674848470759;
        Fri, 27 Jan 2023 11:41:10 -0800 (PST)
Received: from krzk-bin.. ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id y17-20020adffa51000000b002238ea5750csm5822417wrr.72.2023.01.27.11.41.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jan 2023 11:41:10 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
Cc:     replicant@osuosl.org, phone-devel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        =?UTF-8?q?Martin=20J=C3=BCcker?= <martin.juecker@gmail.com>,
        Henrik Grimler <henrik@grimler.se>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 2/8] dt-bindings: phy: samsung,dp-video-phy: deprecate syscon phandle
Date:   Fri, 27 Jan 2023 20:40:51 +0100
Message-Id: <20230127194057.186458-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230127194057.186458-1-krzysztof.kozlowski@linaro.org>
References: <20230127194057.186458-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

The DisplayPort phy is actually part of the Power Management Unit system
controller, thus it should be its child, instead of sibling node with
syscon phandle.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/phy/samsung,dp-video-phy.yaml        | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/phy/samsung,dp-video-phy.yaml b/Documentation/devicetree/bindings/phy/samsung,dp-video-phy.yaml
index b03b2f00cc5b..3bee3f8733f7 100644
--- a/Documentation/devicetree/bindings/phy/samsung,dp-video-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/samsung,dp-video-phy.yaml
@@ -22,13 +22,13 @@ properties:
 
   samsung,pmu-syscon:
     $ref: /schemas/types.yaml#/definitions/phandle
+    deprecated: true
     description:
-      Phandle to PMU system controller interface.
+      Phandle to PMU system controller interface (if not a child of PMU).
 
 required:
   - compatible
   - "#phy-cells"
-  - samsung,pmu-syscon
 
 additionalProperties: false
 
@@ -36,6 +36,5 @@ examples:
   - |
     phy {
         compatible = "samsung,exynos5420-dp-video-phy";
-        samsung,pmu-syscon = <&pmu_system_controller>;
         #phy-cells = <0>;
     };
-- 
2.34.1


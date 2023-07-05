Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA54EC0015E
	for <linux-samsung-soc@archiver.kernel.org>; Wed,  5 Jul 2023 15:00:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232877AbjGEPAO (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 5 Jul 2023 11:00:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35846 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232684AbjGEPAM (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 5 Jul 2023 11:00:12 -0400
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF25D19B1
        for <linux-samsung-soc@vger.kernel.org>; Wed,  5 Jul 2023 07:59:47 -0700 (PDT)
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-9926623e367so791889666b.0
        for <linux-samsung-soc@vger.kernel.org>; Wed, 05 Jul 2023 07:59:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688569186; x=1691161186;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tHXjpogIHzpcwoVSrVrgGvL8fGQQLUb9SkktXSFG/ek=;
        b=M/KR4eK+B++BFOo+bylXOH+HPcZjilmonE9ssLyC7XVDDf24x6f5RtobAs22GELi29
         XrPQMkIj22MLr6ni4zJduzDAdIwA205RM/OPsgwB0VrdpU6YYtUMXvNIikT0QpmKXPnf
         wIXj12NMLQLkKapiJWvH6giy5hYJblOJQMaCNUgkBkcc6jehid0wlibG7RG75dHJOecC
         bNvOtXi+eQbgzc126gH+z6Gmtf0vmCBrpmOOORfObDOUixdIlVmnPA1rqCsqklkA8UYW
         2EleFWNQAatlUHlSQNZHHqg3CVkr2nM+ICjvIb0u5Yx1koMnQkn7RE+502eLe9ANpEfs
         sMmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688569186; x=1691161186;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tHXjpogIHzpcwoVSrVrgGvL8fGQQLUb9SkktXSFG/ek=;
        b=h1SjmueuEyK+erlkF/PoCLnowlnlarTRupIJ+rOa/ez3KCv8eBBqklQcuEn0ww6Kop
         ZblmlSRMzVFTVHPI8GoYFnR+8qiGDUMotEW3diRcmpV8EeGS66digSA9wOOLav/yc2Og
         ZuYJAo3DHdX1mTAf55ENWj1+v2YkbpdqIK+j5Ekv6hycGpucvkkrnEPjwiGP+Jk7nu38
         nUgz+4SwtJjCKzGZY/AMdkHPdS/wzsum0ciXdrc2VZq4yuqtm66mqelR6MR9PvKFMTJm
         GeFjI1Fi8ssSj63C4yUVzb+xfrruIchNv3k42Vw1uyCFOG5fw7jNb/Cpb82/cOSaenoG
         IoIA==
X-Gm-Message-State: ABy/qLaMP37jH3tB9jt3p8DDfE9TtYAqxjczGLWwg7zM6jWqVX4mow5A
        YCH+XCm6FTEz6cxWobkWPmAYNQ==
X-Google-Smtp-Source: APBJJlF3sByEtXi4pOjthmEOeN2Qp8nr/Grc3C8LVVeWAIqanI/eg/nwt8pbwL9LC0On+yPn8LLonQ==
X-Received: by 2002:a17:906:4a54:b0:992:6e93:ce38 with SMTP id a20-20020a1709064a5400b009926e93ce38mr11404492ejv.41.1688569185742;
        Wed, 05 Jul 2023 07:59:45 -0700 (PDT)
Received: from krzk-bin.. ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id rn20-20020a170906d93400b00993004239a4sm6775263ejb.215.2023.07.05.07.59.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Jul 2023 07:59:45 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] arm64: dts: exynos: add missing space before {
Date:   Wed,  5 Jul 2023 16:59:42 +0200
Message-Id: <20230705145942.293527-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Add missing whitespace between node name/label and opening {.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/exynos/exynosautov9.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/exynos/exynosautov9.dtsi b/arch/arm64/boot/dts/exynos/exynosautov9.dtsi
index d3c5cdeff47f..a986749dd49f 100644
--- a/arch/arm64/boot/dts/exynos/exynosautov9.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynosautov9.dtsi
@@ -313,7 +313,7 @@ wakeup-interrupt-controller {
 			};
 		};
 
-		pinctrl_aud: pinctrl@19c60000{
+		pinctrl_aud: pinctrl@19c60000 {
 			compatible = "samsung,exynosautov9-pinctrl";
 			reg = <0x19c60000 0x1000>;
 		};
-- 
2.34.1


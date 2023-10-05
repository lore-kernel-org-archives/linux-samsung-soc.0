Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27B7BE93718
	for <linux-samsung-soc@archiver.kernel.org>; Thu,  5 Oct 2023 16:05:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239831AbjJEQFL (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 5 Oct 2023 12:05:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58018 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237417AbjJEQED (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 5 Oct 2023 12:04:03 -0400
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 34A5287D64
        for <linux-samsung-soc@vger.kernel.org>; Thu,  5 Oct 2023 08:57:52 -0700 (PDT)
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-327b7e08456so1168568f8f.2
        for <linux-samsung-soc@vger.kernel.org>; Thu, 05 Oct 2023 08:57:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696521470; x=1697126270; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a4JuZ7X35qvWXE20Wsg1MXbq38lz7Ou1Ypqzl+RcadA=;
        b=G7UllliZAu+TQqprqdyamnnX01PMrFa7o1Na2adSvrSlXMTqUV2ythEpjnSIJXZ+SL
         fPpSfKI9f0lTF2KOdnFe4PGos6m5bvvXeqdPYpBsxhycAqVZsdqPPm7kMS8wrLPe5+he
         WEkw5t1a25g8fyijsFUoNQFQTKjEO8Cjyl4Z6eHmaiewHnQR6fWho31vzP44VtuCupJQ
         Tpw8DOmn2ookY+YRIbFT3MzxzPnNAkVgi0nhctMNpOLFYQ/v4+LsvkjSLy7oCFvMbd7b
         3m3DFXwNcQz6c6pITJPsEvTziPg/8gGS2a1BcdhwipYm3jWXRu9SiX/1hRTNKav2JOcq
         z7FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696521470; x=1697126270;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a4JuZ7X35qvWXE20Wsg1MXbq38lz7Ou1Ypqzl+RcadA=;
        b=n06L66epYkQ9gbqF3PAU1/0XOeKESTioaDiiSSP1xKP50x0+ZbB13DLZj4sTiRQrcK
         CLr+NK7sutzIp0Kmd+FTqkO5n7KtIOxr3cHPqoIug9TlpKr4EJ8uyKLPNdYmz40QYi5s
         KQBZ7egZQuqCWj7hEEIo1ypmdZwrHDSfKPPPdajpN5lEXDhsKwyTgDzD8r380oFm7O2P
         bVR+Xe6CaxBZlsI4QhfD9AMDooZGNR75jytgSChSCf8ytqAOnllIGV79CgObsh2bPt1F
         i79L0PpNyT0xMEn/xDeb91C7D4tqgyGpT521ZrPQKJptuj33quPjB6yW4vNlkg2DWqiM
         nGkQ==
X-Gm-Message-State: AOJu0YwNl6dCFI20lRQibdcyGvtwvipmDNhg7tGkUlYWCsb3WwYD2rhD
        3ei9Gp/uaryWXWysRdLjhfqNDQ==
X-Google-Smtp-Source: AGHT+IFbZgmrAFgMgn9TqyI9AVF1sigX3yfBCAI0y1Q+AU/F8Aul93TO5hp6QuL8KkpRC2ND2wHS9A==
X-Received: by 2002:a5d:4b4f:0:b0:31d:8fed:c527 with SMTP id w15-20020a5d4b4f000000b0031d8fedc527mr4634488wrs.42.1696521470518;
        Thu, 05 Oct 2023 08:57:50 -0700 (PDT)
Received: from gpeter-l.lan (host-92-12-225-146.as13285.net. [92.12.225.146])
        by smtp.gmail.com with ESMTPSA id t9-20020a5d4609000000b0031f8a59dbeasm2084336wrq.62.2023.10.05.08.57.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Oct 2023 08:57:49 -0700 (PDT)
From:   Peter Griffin <peter.griffin@linaro.org>
To:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        mturquette@baylibre.com, conor+dt@kernel.org, sboyd@kernel.org,
        tomasz.figa@gmail.com, s.nawrocki@samsung.com,
        linus.walleij@linaro.org, wim@linux-watchdog.org,
        linux@roeck-us.net, catalin.marinas@arm.com, will@kernel.org,
        arnd@arndb.de, olof@lixom.net, cw00.choi@samsung.com
Cc:     peter.griffin@linaro.org, tudor.ambarus@linaro.org,
        andre.draszik@linaro.org, semen.protsenko@linaro.org,
        soc@kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-watchdog@vger.kernel.org
Subject: [PATCH 20/21] arm64: defconfig: Enable Google Tensor SoC
Date:   Thu,  5 Oct 2023 16:56:17 +0100
Message-ID: <20231005155618.700312-21-peter.griffin@linaro.org>
X-Mailer: git-send-email 2.42.0.582.g8ccd20d70d-goog
In-Reply-To: <20231005155618.700312-1-peter.griffin@linaro.org>
References: <20231005155618.700312-1-peter.griffin@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Add the Google Tensor SoC to the arm64 defconfig

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 5315789f4868..8a34603b1822 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -41,6 +41,7 @@ CONFIG_ARCH_BCMBCA=y
 CONFIG_ARCH_BRCMSTB=y
 CONFIG_ARCH_BERLIN=y
 CONFIG_ARCH_EXYNOS=y
+CONFIG_ARCH_GOOGLE_TENSOR=y
 CONFIG_ARCH_SPARX5=y
 CONFIG_ARCH_K3=y
 CONFIG_ARCH_LG1K=y
-- 
2.42.0.582.g8ccd20d70d-goog


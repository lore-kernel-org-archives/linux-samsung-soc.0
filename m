Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD58FC433F5
	for <linux-samsung-soc@archiver.kernel.org>; Mon,  8 Nov 2021 13:49:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C7F136124D
	for <linux-samsung-soc@archiver.kernel.org>; Mon,  8 Nov 2021 13:49:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240100AbhKHNv4 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 8 Nov 2021 08:51:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59990 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240098AbhKHNvu (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 8 Nov 2021 08:51:50 -0500
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 28C80C061766
        for <linux-samsung-soc@vger.kernel.org>; Mon,  8 Nov 2021 05:49:06 -0800 (PST)
Received: by mail-lf1-x12a.google.com with SMTP id x27so36332163lfu.5
        for <linux-samsung-soc@vger.kernel.org>; Mon, 08 Nov 2021 05:49:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=0gjDtZyn15X3kTimy0RoEkC8ib1mpgy6W5NT1wcHcys=;
        b=feUQtXs9k99VsJAxmytIgDEH90K6qL0jZpgZCmKsXwLKLe6lZYJTXGsMtFhyMywlJk
         38WIHfQfPmDXfIhJ3QNr+MsFZf9F1NpOSGC0HtUE+zQgDVsr7WB/HfM8rgMd+Shkc62A
         RUvnUJoDT4tY2SJ+0oINotp5dgp4kahD9yN3VJ6YI9pFd+E3ZiHZhu/n29wTxenNc/cV
         QyxN6mofwdcKg/GnsjoAIjXdW3/4HF/7P2IpStfc2Vemm4IDcjT3qrVHhptn0roryxZ5
         YATTaWkKNaRfe7UYNxWvXtXN+U5d4Vrc2XIRslOaPNiQjXs4HHgoyTxe1jXR2QFQlDiq
         zUBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0gjDtZyn15X3kTimy0RoEkC8ib1mpgy6W5NT1wcHcys=;
        b=loDlj39dOp+OT93M+r2iWNH3Hbl/SsuwnQ5ZWWI9Au72GrL5SQCo4kzBMOZj5uMJQa
         HkX6fo3/YtxsaaT4b9NltSpVlVC26D3kOT5QTuWrOelkL2YbHLnKwvD/1Cuq9bv2D4WA
         TvUNFBp70WIuYEYFLE5R0t0TSYqkwtxlvNK4XLCmy/tvzxs1VWICo6dzyk3eHjZ9zrXf
         wjFG+ZpUHY7BnE0//pANkJ51Y2Y5KcMIoY6u+eFTt1a/vYawnGj912ddtYS0HcZMsH25
         a/brvi3WFtdYlguvLHry5U2jGmVhLrzkmW++6aw+YTOqEiZuUcqbj5oic0rNmA/P5K4W
         Hf6w==
X-Gm-Message-State: AOAM533nfyT9URTW8ACW0JkqUXTROhv8zu8m3I4bGkX9yh5Z3UTCGJoL
        o/SexVy2v/oYui4QG45o1WLhsw==
X-Google-Smtp-Source: ABdhPJz2mqqO5lcRy+OTg3aNweJ2v20tqd4fcl+GUINwIspD6PI5q/g372E2+f5rM+4O7+6jdZ25ug==
X-Received: by 2002:ac2:4313:: with SMTP id l19mr44994988lfh.132.1636379344522;
        Mon, 08 Nov 2021 05:49:04 -0800 (PST)
Received: from localhost ([31.134.121.151])
        by smtp.gmail.com with ESMTPSA id c21sm1278437lfv.29.2021.11.08.05.49.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Nov 2021 05:49:04 -0800 (PST)
From:   Sam Protsenko <semen.protsenko@linaro.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>
Cc:     Will McVicker <willmcvicker@google.com>,
        Russell King <linux@armlinux.org.uk>,
        Arnd Bergmann <arnd@arndb.de>,
        Andrew Morton <akpm@linux-foundation.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Michael Ellerman <mpe@ellerman.id.au>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org, linux-i2c@vger.kernel.org
Subject: [PATCH 2/2] arm64: defconfig: Enable Samsung I2C driver
Date:   Mon,  8 Nov 2021 15:49:01 +0200
Message-Id: <20211108134901.20490-2-semen.protsenko@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211108134901.20490-1-semen.protsenko@linaro.org>
References: <20211108134901.20490-1-semen.protsenko@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

i2c-s3c2410 driver is needed for some arm64 Exynos SoCs, e.g. Exynos850.

Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 545197bc0501..7c6a3b91e55d 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -461,6 +461,7 @@ CONFIG_I2C_QCOM_CCI=m
 CONFIG_I2C_QCOM_GENI=m
 CONFIG_I2C_QUP=y
 CONFIG_I2C_RK3X=y
+CONFIG_I2C_S3C2410=y
 CONFIG_I2C_SH_MOBILE=y
 CONFIG_I2C_TEGRA=y
 CONFIG_I2C_UNIPHIER_F=y
-- 
2.30.2


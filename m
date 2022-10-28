Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11655C38A02
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 28 Oct 2022 19:13:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229997AbiJ1TNB (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 28 Oct 2022 15:13:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60660 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229898AbiJ1TMz (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 28 Oct 2022 15:12:55 -0400
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 660D0236413
        for <linux-samsung-soc@vger.kernel.org>; Fri, 28 Oct 2022 12:12:51 -0700 (PDT)
Received: by mail-ed1-x52a.google.com with SMTP id r14so9227688edc.7
        for <linux-samsung-soc@vger.kernel.org>; Fri, 28 Oct 2022 12:12:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qUVwjtsAbEyzghccJECNwNsjlSoqmLTE2vHEiHldKUM=;
        b=CkF81J/bLhvEkbgXDZGNJrKhZjbpw+En5vy4szWyGlma2xmTKHj5xj9sZzF5Q8OWsc
         X/636m+maiTax3O8F/vnzePPJ+ep/UPQtYyXQRhxy6oRL6BaETpoXRxf1ljWNYZh6CFK
         2wAcy6JjIS5d4JaN4blaIfzXY3ksGwPhPrE44iAXEbyBqBdiN7EXrHJE2AoMGpw++KaB
         ATi151tirBbCWy7f+OYD6hoPFbYlqeZBf02NlIlvuyWBxXIZXdrJzn/df1+qIyPZGP8+
         pgMCUhO/un3a41nf6CmoyGdHEpDTI6gAQY9WE+vGWvxYZs1bZScdTCWZPL4EIgdetta/
         kW3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qUVwjtsAbEyzghccJECNwNsjlSoqmLTE2vHEiHldKUM=;
        b=d2+BQesSgD9512Cn+F1BQvfy1eWbl1lMWcg/S4Fwq/sRFgvBMRE59OQumdEtsoKfGS
         4agDeUTis0LoRv6paPPiZkGfC7wBJPYRGdDZHDd99NqYnOcqT7VaKx2pBa12jqgnU8zG
         /BSGWL2E43ZIF+171CXIGKKFEW4RG2icQuy2mqGv7iGAwNFJAgDnHIG+w92zLEkKsI7W
         ne/qEcgvl5vcuOVNWUE5S11l/eqcO+5+H3NGIQkEMqtSnuGM1LOTWdyPc9DgIT1oY/Av
         OgidWAf+Mh7NUIATxJ+6nlGsUfHdrfGbzGXmVCZEKAOGBoWDbm5SbH4INNgEo3oBFzg0
         22wQ==
X-Gm-Message-State: ACrzQf13ydU7SdNnEKBL8a9jbojo2wfWVAAEk/9TyyGTy+JLgvQ4npxf
        czzN6Hw0k00iYxwOTSExCimG5g==
X-Google-Smtp-Source: AMsMyM73CJQV9riRlOH59LzJeHaMT4ntFQfG7aPZVrY8/uEhUdNtkiyoiLeQF8sy6jwfL8NE7PaAfg==
X-Received: by 2002:a05:6402:847:b0:453:943b:bf4 with SMTP id b7-20020a056402084700b00453943b0bf4mr886550edz.301.1666984369908;
        Fri, 28 Oct 2022 12:12:49 -0700 (PDT)
Received: from localhost (cgw.msart-bajzova4.ke.cust.o2bs.sk. [90.176.4.227])
        by smtp.gmail.com with ESMTPSA id ky20-20020a170907779400b00770812e2394sm2512302ejc.160.2022.10.28.12.12.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Oct 2022 12:12:49 -0700 (PDT)
From:   Sam Protsenko <semen.protsenko@linaro.org>
To:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Janghyuck Kim <janghyuck.kim@samsung.com>,
        Cho KyongHo <pullip.cho@samsung.com>,
        Daniel Mentz <danielmentz@google.com>,
        David Virag <virag.david003@gmail.com>, iommu@lists.linux.dev,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
Subject: [PATCH 2/4] iommu/exynos: Fix retval on getting clocks in probe
Date:   Fri, 28 Oct 2022 21:12:41 +0200
Message-Id: <20221028191243.31721-3-semen.protsenko@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221028191243.31721-1-semen.protsenko@linaro.org>
References: <20221028191243.31721-1-semen.protsenko@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

checkpatch reports next warning for clock getting code in probe
function:

    WARNING: ENOSYS means 'invalid syscall nr' and nothing else

Replace it with -ENOINT to make checkpatch happy.

Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
---
 drivers/iommu/exynos-iommu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/iommu/exynos-iommu.c b/drivers/iommu/exynos-iommu.c
index 45fd4850bacb..0d150b383d04 100644
--- a/drivers/iommu/exynos-iommu.c
+++ b/drivers/iommu/exynos-iommu.c
@@ -689,7 +689,7 @@ static int exynos_sysmmu_probe(struct platform_device *pdev)
 
 	if (!data->clk && (!data->aclk || !data->pclk)) {
 		dev_err(dev, "Failed to get device clock(s)!\n");
-		return -ENOSYS;
+		return -ENOENT;
 	}
 
 	data->clk_master = devm_clk_get(dev, "master");
-- 
2.35.1


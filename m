Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57E2EC433EF
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 12 Oct 2021 17:18:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3A0FD60E74
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 12 Oct 2021 17:18:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229495AbhJLRUI (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 12 Oct 2021 13:20:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41794 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232300AbhJLRSc (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 12 Oct 2021 13:18:32 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E09C1C061570
        for <linux-samsung-soc@vger.kernel.org>; Tue, 12 Oct 2021 10:16:30 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id c16so73295lfb.3
        for <linux-samsung-soc@vger.kernel.org>; Tue, 12 Oct 2021 10:16:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=WFagVVyJxqKqo+ujXIDBsFHUAz6WyHhioBswXi9enzg=;
        b=l8tZ/XIpe2FjRZm6OpvZ89THhtR+7+bJk8clRVzRy77EY2k97mh4wp6d6tFOppLwB1
         g6melgiBFoChsTlxxWF2hnj8l4krWFPiogh86W0M2J971xPgUfjylimzBUq2uUDCSfDO
         MRGgM++68kRYWN+ibHvoxuibIUlhJwuiN452gnwI/EPDmodSdio9xc64/e3I7+J3tOKx
         mWmwCyB4uK2fsFZQhH5Ac0U2t13dzPmwybMhQWqRsZPuiNo5++w1yf/yzgDFfIV0840Q
         K1MON+2CB14+D0+h6aap2878Nsw1PL28BWSROpuHzdkYulIKZZpr+fTWVc/fTuUBXCy2
         1GBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=WFagVVyJxqKqo+ujXIDBsFHUAz6WyHhioBswXi9enzg=;
        b=dvGoq2aiAB4bm0Cxaq99D4u9tPBIvS2540Wf2fMQAJhUo5Bz4VsgDENPZ+JR7tPf6k
         8OaQodaM/tp25gDY4/xsk4nNGNSTL/PvDnTm9DJgFYbzvEp8QEwesIELsSrl21GNqA/9
         c5Ov25XR1+TY7liyaQ3cXXv5FBGHk9ux+APBief4gEPB7gub4lIbnxHsTssan2RY4hCM
         /ws9XCoWQzSzjkd16+pXrUx3H8byh8679edYDZ+LoaBWvCB3XgUXFUmhoUOsHqqT3eBJ
         +9J6MZamLNh5Jgq/u3u0BWm0M2pdDm94qokU7Fslkl54+QSBCXgS0GxWoRSDN+e6BMSt
         AHUw==
X-Gm-Message-State: AOAM532OQzr8m2WAvQSi7B0HB5rd5XyVvK32eTE+fT1JSOae0CGAkJnI
        Wz867TETuFqvGfQOeg5TE+kXpEAuBZUNG9Jr
X-Google-Smtp-Source: ABdhPJxCbQwIeJWlyTDgoEFoTvwbUkzTmQ1L43vpOdiNZ2m5MzmzHVSa5dNqORrTV4PL9kSTf2ZptA==
X-Received: by 2002:a2e:9c92:: with SMTP id x18mr3738268lji.445.1634058988981;
        Tue, 12 Oct 2021 10:16:28 -0700 (PDT)
Received: from localhost ([31.134.121.151])
        by smtp.gmail.com with ESMTPSA id v3sm713082lfr.61.2021.10.12.10.16.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Oct 2021 10:16:28 -0700 (PDT)
From:   Sam Protsenko <semen.protsenko@linaro.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Sumit Semwal <sumit.semwal@linaro.org>,
        linux-samsung-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] soc: samsung: exynos-chipid: Add Exynos850 support
Date:   Tue, 12 Oct 2021 20:16:24 +0300
Message-Id: <20211012171624.14338-3-semen.protsenko@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211012171624.14338-1-semen.protsenko@linaro.org>
References: <20211012171624.14338-1-semen.protsenko@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Add chip-id support for Exynos850 SoC. Despite its "E3830" ID, the
actual SoC name is Exynos850 (Exynos3830 name is internal and outdated).

Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
---
 drivers/soc/samsung/exynos-chipid.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/soc/samsung/exynos-chipid.c b/drivers/soc/samsung/exynos-chipid.c
index 1264a18aef97..d160f9b082c4 100644
--- a/drivers/soc/samsung/exynos-chipid.c
+++ b/drivers/soc/samsung/exynos-chipid.c
@@ -54,6 +54,7 @@ static const struct exynos_soc_id {
 	{ "EXYNOS5440", 0xE5440000 },
 	{ "EXYNOS5800", 0xE5422000 },
 	{ "EXYNOS7420", 0xE7420000 },
+	{ "EXYNOS850", 0xE3830000 },
 };
 
 static const char *product_id_to_soc_id(unsigned int product_id)
@@ -167,10 +168,19 @@ static const struct exynos_chipid_variant exynos4210_chipid_drv_data = {
 	.sub_rev_bit	= 4,
 };
 
+static const struct exynos_chipid_variant exynos850_chipid_drv_data = {
+	.rev_reg	= 0x10,
+	.main_rev_bit	= 20,
+	.sub_rev_bit	= 16,
+};
+
 static const struct of_device_id exynos_chipid_of_device_ids[] = {
 	{
 		.compatible	= "samsung,exynos4210-chipid",
 		.data		= &exynos4210_chipid_drv_data,
+	}, {
+		.compatible	= "samsung,exynos850-chipid",
+		.data		= &exynos850_chipid_drv_data,
 	},
 	{ }
 };
-- 
2.30.2


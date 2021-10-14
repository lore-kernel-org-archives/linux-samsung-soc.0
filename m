Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BF85C4332F
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 14 Oct 2021 13:35:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id F3C52610D0
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 14 Oct 2021 13:35:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231425AbhJNNhZ (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 14 Oct 2021 09:37:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55850 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231570AbhJNNhY (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 14 Oct 2021 09:37:24 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B2427C061570
        for <linux-samsung-soc@vger.kernel.org>; Thu, 14 Oct 2021 06:35:17 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id y15so27139860lfk.7
        for <linux-samsung-soc@vger.kernel.org>; Thu, 14 Oct 2021 06:35:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=pqqO0gNi0mXrcSrr2tK+8Xmxyib6Rh9OQgAHrafODtI=;
        b=h4udT+jjdzxi0xaSpw4odBM9ABs3u1SPjhJdtmjl2nxhuLLxPe+ZKGm8kiF+UNhK2/
         muAkzeBnUJMS5WxdeO/3S1viCW+Yk2lgGHWQzOglKSR2n7aTBwxfGBl9/R2sMsuKhc6n
         tWyYE89zjbgRdlObGEF+W6yAMVh/MEO0Ikfuw552na1s0WSz8nlbopEsSRtdwEpJpMAr
         jKBtPJwEchAx1WYWWAJX0otQGyobDMdmBfHNcezJXUoE8L8vvVPfVUjNvHbN7WH9zaou
         gG582YzqcZ1aFKQXhS6ZffD4VZw7l97JunUj/Kb10VWTdjCA1oKraxw7EZbflnRkcXe1
         Uk6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=pqqO0gNi0mXrcSrr2tK+8Xmxyib6Rh9OQgAHrafODtI=;
        b=Y3UMgL/iw0jlAl9Cr3pEqxnuDlhf3dm358FU0AH4rwhlN7sjeqA7mURQ+2jR+/yM7Y
         CfM8Tfd6blBiLsLUQV7VKi5c5/Qf2uXO1+rI5bbbUCmAcoh4/PDpRFMCOtmjpYlN1ErI
         /G3FEQa3UBVKr9JdK7WdO+cu874iFOGV0/izb664jNwN6jXW7Lymy+5iTBqyLLQWYxBy
         Bi9xJ6zjlKxiEvH4yg+qJJt+Amyml1b3t7YAZC5oAGE3CLzWolnJ4cw3k0pUblmK0m2f
         v1soILbezd0nm4PpdAl2aDZ3jBj1tPNeC2Cs0YkVPawLSGxZEfA2mK+pJ5fgYYa3Rv6p
         D6SA==
X-Gm-Message-State: AOAM530WDL99MyMszMMHycvwvlXe21qhtWdL68hJfTlITnWD+Jw1AB07
        bWlQu+Dub/Rsp2u5UrsaGDYopw==
X-Google-Smtp-Source: ABdhPJz4nppwU9Q9ZIiV+yAZXTac7SZINJwnDRxlDVNNLp7A/5ZHqwk0azy4kI8NrtKyVjl5/H4tXg==
X-Received: by 2002:a2e:750a:: with SMTP id q10mr6147584ljc.518.1634218512940;
        Thu, 14 Oct 2021 06:35:12 -0700 (PDT)
Received: from localhost ([31.134.121.151])
        by smtp.gmail.com with ESMTPSA id l5sm139234ljh.66.2021.10.14.06.35.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Oct 2021 06:35:12 -0700 (PDT)
From:   Sam Protsenko <semen.protsenko@linaro.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Sumit Semwal <sumit.semwal@linaro.org>,
        linux-samsung-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v3 3/3] soc: samsung: exynos-chipid: Add Exynos850 support
Date:   Thu, 14 Oct 2021 16:35:08 +0300
Message-Id: <20211014133508.1210-3-semen.protsenko@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211014133508.1210-1-semen.protsenko@linaro.org>
References: <20211014133508.1210-1-semen.protsenko@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Add chip-id support for Exynos850 SoC. Despite its "E3830" ID, the
actual SoC name is Exynos850 (Exynos3830 name is internal and outdated).

Format of Product_ID register in Exynos850 (offset 0x0):

     [31:0] Product ID (identification)

Format of CHIPID_REV register in Exynos850 (offset 0x10):

    [23:20] Main revision
    [19:16] Sub revision

Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
---
Changes in v2:
  - Renamed *_rev_bit fields in 'struct exynos_chipid_variant' to
    *_rev_shift

Changes in v3:
  - Rebased on top of krzk/for-next
  - Added Exynos850 chip-id registers format in commit message

 drivers/soc/samsung/exynos-chipid.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/soc/samsung/exynos-chipid.c b/drivers/soc/samsung/exynos-chipid.c
index 986978e83661..0aeb24bcc11a 100644
--- a/drivers/soc/samsung/exynos-chipid.c
+++ b/drivers/soc/samsung/exynos-chipid.c
@@ -55,6 +55,7 @@ static const struct exynos_soc_id {
 	{ "EXYNOS5440", 0xE5440000 },
 	{ "EXYNOS5800", 0xE5422000 },
 	{ "EXYNOS7420", 0xE7420000 },
+	{ "EXYNOS850", 0xE3830000 },
 };
 
 static const char *product_id_to_soc_id(unsigned int product_id)
@@ -169,10 +170,19 @@ static const struct exynos_chipid_variant exynos4210_chipid_drv_data = {
 	.sub_rev_shift	= 0,
 };
 
+static const struct exynos_chipid_variant exynos850_chipid_drv_data = {
+	.rev_reg	= 0x10,
+	.main_rev_shift	= 20,
+	.sub_rev_shift	= 16,
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


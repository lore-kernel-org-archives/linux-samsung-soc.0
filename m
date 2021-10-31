Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50D56C433F5
	for <linux-samsung-soc@archiver.kernel.org>; Sun, 31 Oct 2021 17:54:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2CC246108F
	for <linux-samsung-soc@archiver.kernel.org>; Sun, 31 Oct 2021 17:54:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229838AbhJaR47 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sun, 31 Oct 2021 13:56:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38268 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229732AbhJaR47 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sun, 31 Oct 2021 13:56:59 -0400
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 09E20C061570;
        Sun, 31 Oct 2021 10:54:27 -0700 (PDT)
Received: by mail-ed1-x531.google.com with SMTP id s1so56969830edd.3;
        Sun, 31 Oct 2021 10:54:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1iAI21X6r8lOvu6IMD//lyW5AueJtXMjsVhWS1XSI7s=;
        b=P4Y6pGdY1kCCdlxUfYxN4cn+cnbp2EYtYyUMaR2fdI75Z75I9xWLEJ4FDu4XdYYT1i
         jRrI/ejB/z63ubbA9ix8MIE89eI8uT9gL82T209mZPz41PN66FytsLO7oGCwjF0g83PM
         zW1HDrmtCqG/6mGXi24wZsSdg7Up4BXcHjUZq3ULU5a+s2zegFYtd2+6SP+5F5lvYaDy
         0vDclfWVbMUSiGX8RXUL3S5loIZlrrxtFv30w9k9B9BzpRs8S3Vq6yPHNP7731HVKsAF
         pawyKegtCn4fifBbquCZSMj+OxsJTdH78jMv4sOyKRVWyJq1G7abmS+vGhaYSRXsj7my
         7Y+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1iAI21X6r8lOvu6IMD//lyW5AueJtXMjsVhWS1XSI7s=;
        b=kWr9p/Sd0oKj5JmFYnNQiD+6uQpGd/5qjJEPVcPueD+PVZeFHkzSfsJy15i5dxSFUc
         4YJCqqr75QcLeEd/8x01JkrqqHjaAWx9yLHgXjy2dGYn/BMsmpqJnrRTRMFGXRTLWJZt
         5vK+TQ0yEPY7+jpBfy2HZb6iD/tCTHSc/5lGnq3J6YdO+pD35vdqKQTHE1Xct8+GMJYv
         3iuyzTtZm8E0REBxNRfgYKWknw0olvjZie3NOT1+XvvOV9QesqVXvkw2EE3KPS8Kao5U
         xqLbFo6GJXZGmixLcYxMptkMezR6OD8QGVHQtf0MyPNcXHuk8ApIC8SvKiADhyf9HdQR
         u54g==
X-Gm-Message-State: AOAM532rRMdetHaNVpWHBACL7XH14DDdsY60xcu4BR4GAVJkS1OZFTZm
        Dvd8rUlAAWzBrwleVAHkdc1Mc1VduEeJJ50NxM0=
X-Google-Smtp-Source: ABdhPJylON3W+t6x4QKpdZ1ZTKyzua3+6/PDrTQvrCkk2dZZqhzaTZFX2SoHaqZQj7/vIbACptW/+g==
X-Received: by 2002:a50:d8cf:: with SMTP id y15mr34414191edj.66.1635702865644;
        Sun, 31 Oct 2021 10:54:25 -0700 (PDT)
Received: from localhost.localdomain ([2a02:ab88:368f:2080:eab:126a:947d:3008])
        by smtp.googlemail.com with ESMTPSA id r26sm5986917ejd.85.2021.10.31.10.54.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 Oct 2021 10:54:25 -0700 (PDT)
From:   David Virag <virag.david003@gmail.com>
Cc:     David Virag <virag.david003@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] samsung: exynos-chipid: add Exynos7885 SoC support
Date:   Sun, 31 Oct 2021 18:53:29 +0100
Message-Id: <20211031175329.27843-1-virag.david003@gmail.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Exynos 7885 has product id "0xE7885000". Add this id to the ids with
the name.

The downstream driver sets sub_rev to 2 if we are on Exynos 7885, we
detected sub_rev 1 and the 27th bit of the revision register is set.
This is presumably because Samsung might have set the wrong bits on
rev2 of the SoC in the chipid, but we may never know as we have no
manual.

Both the SM-A530F/jackpotlte with Exynos7885 and the SM-M305/m30lte
with Exynos7904 (rebranded Exynos7885 with lower clock speeds) seem
to have this bit set to 1 and have a sub_rev of 1 otherwise, but the
downstream driver corrects it to 2.
Let's replicate this behaviour in upstream too!

Signed-off-by: David Virag <virag.david003@gmail.com>
---
 drivers/soc/samsung/exynos-chipid.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/soc/samsung/exynos-chipid.c b/drivers/soc/samsung/exynos-chipid.c
index a28053ec7e6a..ec8c76275aec 100644
--- a/drivers/soc/samsung/exynos-chipid.c
+++ b/drivers/soc/samsung/exynos-chipid.c
@@ -55,6 +55,7 @@ static const struct exynos_soc_id {
 	{ "EXYNOS5440", 0xE5440000 },
 	{ "EXYNOS5800", 0xE5422000 },
 	{ "EXYNOS7420", 0xE7420000 },
+	{ "EXYNOS7885", 0xE7885000 },
 	{ "EXYNOS850", 0xE3830000 },
 	{ "EXYNOSAUTOV9", 0xAAA80000 },
 };
@@ -88,6 +89,14 @@ static int exynos_chipid_get_chipid_info(struct regmap *regmap,
 	}
 	main_rev = (val >> data->main_rev_shift) & EXYNOS_REV_PART_MASK;
 	sub_rev = (val >> data->sub_rev_shift) & EXYNOS_REV_PART_MASK;
+
+	//Exynos 7885 revision 2 apparently has the 27th bit set instead of having
+	//a sub_rev of 2. Correct for this!
+	if (soc_info->product_id == 0xE7885000) {
+		if ((sub_rev == 1) && (val & 0x04000000))
+			sub_rev = 2;
+	}
+
 	soc_info->revision = (main_rev << EXYNOS_REV_PART_SHIFT) | sub_rev;
 
 	return 0;
-- 
2.33.1


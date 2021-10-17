Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B2C7C433EF
	for <linux-samsung-soc@archiver.kernel.org>; Sun, 17 Oct 2021 17:19:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6EC2A61038
	for <linux-samsung-soc@archiver.kernel.org>; Sun, 17 Oct 2021 17:19:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344373AbhJQRVf (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sun, 17 Oct 2021 13:21:35 -0400
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:35432
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1344364AbhJQRVe (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sun, 17 Oct 2021 13:21:34 -0400
Received: from mail-lj1-f197.google.com (mail-lj1-f197.google.com [209.85.208.197])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 9527F3FFF4
        for <linux-samsung-soc@vger.kernel.org>; Sun, 17 Oct 2021 17:19:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1634491163;
        bh=tc6OAWZma4StYZbOIZ+kSi44xAhH87y/4JEHuyJG814=;
        h=From:To:Cc:Subject:Date:Message-Id:MIME-Version;
        b=PpYbUr363t79E2/GQsCNcgnd6tABW4/O85egynNVEdlLFC5MzpIFKhi9L1hvSG5Z9
         nqZ+z5ItCTGPKpH2/F3IZpREN9QU+useG5w8TGQqQeVYM5j0ddjpYfWL8JVFpjI6hI
         xAMxtl2XfLm8KbnjfpJLOf8F3k+ClW3IyvGb080VKpy2gdJye2z6b7l1uUGJwACkYx
         WRqP+q0yJ0dvdEkQaDcCgu5RwutMq0Ayme7z0AhrmN8DH1R8vKtbVSts+g4OthkEMS
         cVW86WNdibTTfBc5O/p7xea5M9PV6FGVhUF/n60/CwwCmonfZiQBlCKlzOqQjrFr0e
         LHTmPbWGfprqw==
Received: by mail-lj1-f197.google.com with SMTP id e26-20020a2e985a000000b00211109b97e6so578796ljj.0
        for <linux-samsung-soc@vger.kernel.org>; Sun, 17 Oct 2021 10:19:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=tc6OAWZma4StYZbOIZ+kSi44xAhH87y/4JEHuyJG814=;
        b=1h2PHGiBR6m3S5g6mgGn/sx5QBOX1DuF6ftx0dcWOTAuJL3LKseIvQwdvHnwL7Ct14
         EHdBopADLVkBCfwodIjZ6scjfsA1YEygHs3Aht2y2muweMCyO3H/BDDarJFcr+1V1ifc
         6VXr7TkzNaUrKNnZtYWy/5eZegm0Z5JnxsnjQG/d9gRsPziSeoacaqdkeCvHcLHH1YzC
         yWLIaPQkBKu4q1vhqt/RdbOLT0MDh0EvaCn693areZKqxrKsVSjhrD0g9t5e+3aE++W4
         PDlRSsc3Kk1wz49ThRXcxZ5GWpnMH9LVFLVfiZlpjsYXpgGXaRP8EyInHFxrQOZJjU4Z
         sWFQ==
X-Gm-Message-State: AOAM532g4r+agPDhOhc5LGbdFr7bixySfutEnzn31zBc384fduHhyAh1
        D4dPR/AgVNYxll4HaKr1ACGl4t/mOP5NU5lPeTcZTjDpIrer+kfplR2lq+g2xeXyBimZveL3zZ1
        uS2bSSjkscK0VCJRZjLG28inNUk2vqyZP/xndfPhtEXenQzfF
X-Received: by 2002:a05:6512:b08:: with SMTP id w8mr23265477lfu.505.1634491162875;
        Sun, 17 Oct 2021 10:19:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyJllZcIsmv0rxhj8q/YDYepSIO/aaLE7+j5S/EziJMkCLd/jAQpb+qpP4Lngr0FYMgw+JM+A==
X-Received: by 2002:a05:6512:b08:: with SMTP id w8mr23265463lfu.505.1634491162688;
        Sun, 17 Oct 2021 10:19:22 -0700 (PDT)
Received: from kozik-lap.lan (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
        by smtp.gmail.com with ESMTPSA id l5sm1271722lje.33.2021.10.17.10.19.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Oct 2021 10:19:22 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Tomasz Figa <tomasz.figa@gmail.com>,
        Sylwester Nawrocki <snawrocki@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Subject: [PATCH] pinctrl: samsung: support ExynosAutov9 SoC pinctrl
Date:   Sun, 17 Oct 2021 19:19:12 +0200
Message-Id: <20211017171912.5044-1-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

From: Chanho Park <chanho61.park@samsung.com>

Add pinctrl data for ExynosAuto v9 SoC.

- GPA0, GPA1: 10, External wake up interrupt
- GPQ0: 2, XbootLDO, Speedy PMIC I/F
- GPB0, GPB1, GPB2, GPB3: 29, I2S 7 CH
- GPF0, GPF1, GPF2, GPF3,GPF4, GPF5, GPF6, GPF8: 52, FSYS
- GPG0, GPG1, GPG2, GPG3: 25, GPIO x 24, SMPL_INT
- GPP0, GPP1, GPP2, GPP3, GPP4, GPP5: 48, USI 12 CH

Signed-off-by: Chanho Park <chanho61.park@samsung.com>
Link: https://lore.kernel.org/r/20211008091443.44625-2-chanho61.park@samsung.com
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---

Hi Linus,

Please apply it directly, I have only one patch in the queue.


Best regards,
Krzysztof

---
 .../bindings/pinctrl/samsung-pinctrl.txt      |   1 +
 .../pinctrl/samsung/pinctrl-exynos-arm64.c    | 108 ++++++++++++++++++
 drivers/pinctrl/samsung/pinctrl-samsung.c     |   2 +
 drivers/pinctrl/samsung/pinctrl-samsung.h     |   1 +
 4 files changed, 112 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/samsung-pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/samsung-pinctrl.txt
index e7a1b1880375..b8b475967ff9 100644
--- a/Documentation/devicetree/bindings/pinctrl/samsung-pinctrl.txt
+++ b/Documentation/devicetree/bindings/pinctrl/samsung-pinctrl.txt
@@ -23,6 +23,7 @@ Required Properties:
   - "samsung,exynos5433-pinctrl": for Exynos5433 compatible pin-controller.
   - "samsung,exynos7-pinctrl": for Exynos7 compatible pin-controller.
   - "samsung,exynos850-pinctrl": for Exynos850 compatible pin-controller.
+  - "samsung,exynosautov9-pinctrl": for ExynosAutov9 compatible pin-controller.
 
 - reg: Base address of the pin controller hardware module and length of
   the address space it occupies.
diff --git a/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c b/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c
index fe5f6046fbd5..6b77fd24571e 100644
--- a/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c
+++ b/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c
@@ -538,3 +538,111 @@ const struct samsung_pinctrl_of_match_data exynos850_of_data __initconst = {
 	.ctrl		= exynos850_pin_ctrl,
 	.num_ctrl	= ARRAY_SIZE(exynos850_pin_ctrl),
 };
+
+/* pin banks of exynosautov9 pin-controller 0 (ALIVE) */
+static const struct samsung_pin_bank_data exynosautov9_pin_banks0[] __initconst = {
+	EXYNOS850_PIN_BANK_EINTW(8, 0x000, "gpa0", 0x00),
+	EXYNOS850_PIN_BANK_EINTW(2, 0x020, "gpa1", 0x04),
+	EXYNOS850_PIN_BANK_EINTN(2, 0x040, "gpq0"),
+};
+
+/* pin banks of exynosautov9 pin-controller 1 (AUD) */
+static const struct samsung_pin_bank_data exynosautov9_pin_banks1[] __initconst = {
+	EXYNOS850_PIN_BANK_EINTG(5, 0x000, "gpb0", 0x00),
+	EXYNOS850_PIN_BANK_EINTG(8, 0x020, "gpb1", 0x04),
+	EXYNOS850_PIN_BANK_EINTG(8, 0x040, "gpb2", 0x08),
+	EXYNOS850_PIN_BANK_EINTG(8, 0x060, "gpb3", 0x0C),
+};
+
+/* pin banks of exynosautov9 pin-controller 2 (FSYS0) */
+static const struct samsung_pin_bank_data exynosautov9_pin_banks2[] __initconst = {
+	EXYNOS850_PIN_BANK_EINTG(6, 0x000, "gpf0", 0x00),
+	EXYNOS850_PIN_BANK_EINTG(6, 0x020, "gpf1", 0x04),
+};
+
+/* pin banks of exynosautov9 pin-controller 3 (FSYS1) */
+static const struct samsung_pin_bank_data exynosautov9_pin_banks3[] __initconst = {
+	EXYNOS850_PIN_BANK_EINTG(6, 0x000, "gpf8", 0x00),
+};
+
+/* pin banks of exynosautov9 pin-controller 4 (FSYS2) */
+static const struct samsung_pin_bank_data exynosautov9_pin_banks4[] __initconst = {
+	EXYNOS850_PIN_BANK_EINTG(4, 0x000, "gpf2", 0x00),
+	EXYNOS850_PIN_BANK_EINTG(8, 0x020, "gpf3", 0x04),
+	EXYNOS850_PIN_BANK_EINTG(7, 0x040, "gpf4", 0x08),
+	EXYNOS850_PIN_BANK_EINTG(8, 0x060, "gpf5", 0x0C),
+	EXYNOS850_PIN_BANK_EINTG(7, 0x080, "gpf6", 0x10),
+};
+
+/* pin banks of exynosautov9 pin-controller 5 (PERIC0) */
+static const struct samsung_pin_bank_data exynosautov9_pin_banks5[] __initconst = {
+	EXYNOS850_PIN_BANK_EINTG(8, 0x000, "gpp0", 0x00),
+	EXYNOS850_PIN_BANK_EINTG(8, 0x020, "gpp1", 0x04),
+	EXYNOS850_PIN_BANK_EINTG(8, 0x040, "gpp2", 0x08),
+	EXYNOS850_PIN_BANK_EINTG(5, 0x060, "gpg0", 0x0C),
+};
+
+/* pin banks of exynosautov9 pin-controller 6 (PERIC1) */
+static const struct samsung_pin_bank_data exynosautov9_pin_banks6[] __initconst = {
+	EXYNOS850_PIN_BANK_EINTG(8, 0x000, "gpp3", 0x00),
+	EXYNOS850_PIN_BANK_EINTG(8, 0x020, "gpp4", 0x04),
+	EXYNOS850_PIN_BANK_EINTG(8, 0x040, "gpp5", 0x08),
+	EXYNOS850_PIN_BANK_EINTG(8, 0x060, "gpg1", 0x0C),
+	EXYNOS850_PIN_BANK_EINTG(8, 0x080, "gpg2", 0x10),
+	EXYNOS850_PIN_BANK_EINTG(4, 0x0A0, "gpg3", 0x14),
+};
+
+static const struct samsung_pin_ctrl exynosautov9_pin_ctrl[] __initconst = {
+	{
+		/* pin-controller instance 0 ALIVE data */
+		.pin_banks      = exynosautov9_pin_banks0,
+		.nr_banks       = ARRAY_SIZE(exynosautov9_pin_banks0),
+		.eint_wkup_init = exynos_eint_wkup_init,
+		.suspend        = exynos_pinctrl_suspend,
+		.resume         = exynos_pinctrl_resume,
+	}, {
+		/* pin-controller instance 1 AUD data */
+		.pin_banks      = exynosautov9_pin_banks1,
+		.nr_banks       = ARRAY_SIZE(exynosautov9_pin_banks1),
+	}, {
+		/* pin-controller instance 2 FSYS0 data */
+		.pin_banks      = exynosautov9_pin_banks2,
+		.nr_banks       = ARRAY_SIZE(exynosautov9_pin_banks2),
+		.eint_gpio_init = exynos_eint_gpio_init,
+		.suspend        = exynos_pinctrl_suspend,
+		.resume         = exynos_pinctrl_resume,
+	}, {
+		/* pin-controller instance 3 FSYS1 data */
+		.pin_banks      = exynosautov9_pin_banks3,
+		.nr_banks       = ARRAY_SIZE(exynosautov9_pin_banks3),
+		.eint_gpio_init = exynos_eint_gpio_init,
+		.suspend        = exynos_pinctrl_suspend,
+		.resume         = exynos_pinctrl_resume,
+	}, {
+		/* pin-controller instance 4 FSYS2 data */
+		.pin_banks      = exynosautov9_pin_banks4,
+		.nr_banks       = ARRAY_SIZE(exynosautov9_pin_banks4),
+		.eint_gpio_init = exynos_eint_gpio_init,
+		.suspend        = exynos_pinctrl_suspend,
+		.resume         = exynos_pinctrl_resume,
+	}, {
+		/* pin-controller instance 5 PERIC0 data */
+		.pin_banks      = exynosautov9_pin_banks5,
+		.nr_banks       = ARRAY_SIZE(exynosautov9_pin_banks5),
+		.eint_gpio_init = exynos_eint_gpio_init,
+		.suspend        = exynos_pinctrl_suspend,
+		.resume         = exynos_pinctrl_resume,
+	}, {
+		/* pin-controller instance 6 PERIC1 data */
+		.pin_banks      = exynosautov9_pin_banks6,
+		.nr_banks       = ARRAY_SIZE(exynosautov9_pin_banks6),
+		.eint_gpio_init = exynos_eint_gpio_init,
+		.suspend        = exynos_pinctrl_suspend,
+		.resume         = exynos_pinctrl_resume,
+	},
+};
+
+const struct samsung_pinctrl_of_match_data exynosautov9_of_data __initconst = {
+	.ctrl		= exynosautov9_pin_ctrl,
+	.num_ctrl	= ARRAY_SIZE(exynosautov9_pin_ctrl),
+};
diff --git a/drivers/pinctrl/samsung/pinctrl-samsung.c b/drivers/pinctrl/samsung/pinctrl-samsung.c
index 2a0fc63516f1..23f355ae9ca0 100644
--- a/drivers/pinctrl/samsung/pinctrl-samsung.c
+++ b/drivers/pinctrl/samsung/pinctrl-samsung.c
@@ -1266,6 +1266,8 @@ static const struct of_device_id samsung_pinctrl_dt_match[] = {
 		.data = &exynos7_of_data },
 	{ .compatible = "samsung,exynos850-pinctrl",
 		.data = &exynos850_of_data },
+	{ .compatible = "samsung,exynosautov9-pinctrl",
+		.data = &exynosautov9_of_data },
 #endif
 #ifdef CONFIG_PINCTRL_S3C64XX
 	{ .compatible = "samsung,s3c64xx-pinctrl",
diff --git a/drivers/pinctrl/samsung/pinctrl-samsung.h b/drivers/pinctrl/samsung/pinctrl-samsung.h
index 4c2149e9c544..547968a31aed 100644
--- a/drivers/pinctrl/samsung/pinctrl-samsung.h
+++ b/drivers/pinctrl/samsung/pinctrl-samsung.h
@@ -340,6 +340,7 @@ extern const struct samsung_pinctrl_of_match_data exynos5420_of_data;
 extern const struct samsung_pinctrl_of_match_data exynos5433_of_data;
 extern const struct samsung_pinctrl_of_match_data exynos7_of_data;
 extern const struct samsung_pinctrl_of_match_data exynos850_of_data;
+extern const struct samsung_pinctrl_of_match_data exynosautov9_of_data;
 extern const struct samsung_pinctrl_of_match_data s3c64xx_of_data;
 extern const struct samsung_pinctrl_of_match_data s3c2412_of_data;
 extern const struct samsung_pinctrl_of_match_data s3c2416_of_data;
-- 
2.30.2


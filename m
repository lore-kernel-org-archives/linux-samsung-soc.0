Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75C04C433EF
	for <linux-samsung-soc@archiver.kernel.org>; Fri,  8 Oct 2021 09:16:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 543A260EC0
	for <linux-samsung-soc@archiver.kernel.org>; Fri,  8 Oct 2021 09:16:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237064AbhJHJSp (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 8 Oct 2021 05:18:45 -0400
Received: from mailout2.samsung.com ([203.254.224.25]:41708 "EHLO
        mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237335AbhJHJSo (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 8 Oct 2021 05:18:44 -0400
Received: from epcas2p4.samsung.com (unknown [182.195.41.56])
        by mailout2.samsung.com (KnoxPortal) with ESMTP id 20211008091647epoutp02d4081587cd3a35ae9872836bab9c6561~sA36f9w1-3038430384epoutp024
        for <linux-samsung-soc@vger.kernel.org>; Fri,  8 Oct 2021 09:16:47 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20211008091647epoutp02d4081587cd3a35ae9872836bab9c6561~sA36f9w1-3038430384epoutp024
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1633684607;
        bh=gxlME/vQOeSoiUF8ab0Hvgt9ejsJsdl8GhGeSf8MaXE=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=jekYOopqArZdlAWW25EhvtCtlrzDU3SXkcbc/IDEXa2zYhtAanLasNiG6TW6MLWps
         L8Hir/ctEdgF/XvyyitLsQ0kgeD/8No1WtlnboLghOPA73SgQmC48uLAg8zla+bbs8
         dxTKyeUXNPw1AgpEF75bbWE7C0852endq45Hstjc=
Received: from epsnrtp2.localdomain (unknown [182.195.42.163]) by
        epcas2p2.samsung.com (KnoxPortal) with ESMTP id
        20211008091646epcas2p2de6a7187ac88b7c54d7527c5330cf829~sA35gW_B61824518245epcas2p2L;
        Fri,  8 Oct 2021 09:16:46 +0000 (GMT)
Received: from epsmges2p1.samsung.com (unknown [182.195.36.90]) by
        epsnrtp2.localdomain (Postfix) with ESMTP id 4HQjHX56CFz4x9QF; Fri,  8 Oct
        2021 09:16:40 +0000 (GMT)
Received: from epcas2p1.samsung.com ( [182.195.41.53]) by
        epsmges2p1.samsung.com (Symantec Messaging Gateway) with SMTP id
        6A.8C.09717.87C00616; Fri,  8 Oct 2021 18:16:40 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
        epcas2p2.samsung.com (KnoxPortal) with ESMTPA id
        20211008091639epcas2p28339f2f73755a3c842fbb95f313bf7d9~sA3ztdPHL3039730397epcas2p2k;
        Fri,  8 Oct 2021 09:16:39 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
        epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20211008091639epsmtrp129fe592fe6ffc48fcfb862257e53a8eb~sA3zsO_mt2134221342epsmtrp1q;
        Fri,  8 Oct 2021 09:16:39 +0000 (GMT)
X-AuditID: b6c32a45-4abff700000025f5-38-61600c7897c6
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
        epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
        1D.6A.09091.77C00616; Fri,  8 Oct 2021 18:16:39 +0900 (KST)
Received: from localhost.localdomain (unknown [10.229.9.51]) by
        epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20211008091639epsmtip1364503ce5856f2eeaf26a9eea027e593~sA3zjGjyB2850628506epsmtip1N;
        Fri,  8 Oct 2021 09:16:39 +0000 (GMT)
From:   Chanho Park <chanho61.park@samsung.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Rob Herring <robh+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     Tomasz Figa <tomasz.figa@gmail.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Chanho Park <chanho61.park@samsung.com>
Subject: [PATCH v2 1/3] pinctrl: samsung: support ExynosAutov9 SoC pinctrl
Date:   Fri,  8 Oct 2021 18:14:41 +0900
Message-Id: <20211008091443.44625-2-chanho61.park@samsung.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211008091443.44625-1-chanho61.park@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprGJsWRmVeSWpSXmKPExsWy7bCmqW4FT0Kiwd9dWhaX92tbzD9yjtVi
        49sfTBZT/ixnsphxfh+TReveI+wWh9+0s1qs2vWH0YHDY1ZDL5vHzll32T02repk87hzbQ+b
        R9+WVYwenzfJBbBFZdtkpCampBYppOYl56dk5qXbKnkHxzvHm5oZGOoaWlqYKynkJeam2iq5
        +AToumXmAN2jpFCWmFMKFApILC5W0rezKcovLUlVyMgvLrFVSi1IySkwL9ArTswtLs1L18tL
        LbEyNDAwMgUqTMjOODK7m72gy67i+e3NTA2M+0y6GDk5JARMJH6vWM/YxcjFISSwg1Hi0Jdt
        7BDOJ0aJMz1LWSCcb4wSq5Y9Z4ZpOTt7CROILSSwF6jqSC1E0UdGiYkP1rOBJNgEdCW2PH8F
        NldEoJNRYuW3bWAdzAIHGCW2XLADsYUFvCS6l05jBLFZBFQl/ky+D2bzCthJ3L73jB1im7zE
        kV+dYJs5BewljrZ3Q9UISpyc+YQFYqa8RPPW2cwgyyQEvrJL/L47mxGi2UXi+9fbUGcLS7w6
        vgVqqJTEy/42doiGbkaJ1kf/oRKrGSU6G30gbHuJX9O3sHYxcgBt0JRYv0sfxJQQUJY4cgtq
        L59Ex+G/7BBhXomONiGIRnWJA9uns0DYshLdcz6zQtgeEq/mvoEG7yRGiRuf2lgmMCrMQvLO
        LCTvzEJYvICReRWjWGpBcW56arFRgSE8ipPzczcxghOolusOxslvP+gdYmTiYDzEKMHBrCTC
        m28fmyjEm5JYWZValB9fVJqTWnyI0RQY2BOZpUST84EpPK8k3tDE0sDEzMzQ3MjUwFxJnHfu
        P6dEIYH0xJLU7NTUgtQimD4mDk6pBiatFxdmH72++lGS4/p3by++yZRSzvrorlC6eNpRs87o
        TcVe7i8DhWQsBCrN2Nb4GsyRVKpvY9gpNEFnp7zR+lvL3H5Wnu1hMVdj/nLIQSzXMuWm0yc/
        jkbLj+oTfzN/eeTEfpC3543Gq2btCRH5LbKJtxkDfIPN4823xPxKXr7Mnc3L1uv8CZ/pM27x
        rd50v6/6StwTuVmywlKHn95a0nC8Z7vM/fmlW2qPvpr9bYewdMHD2nRB6wqtnP5qp7LFbw51
        eHmHXw6bfW/e/g2qn9dunLJUudjptPetL/8e1+4xfv+U8fzjiycW+W+6tUXrx3tGPvtpNqYJ
        80uddX4pNb6et+n/bu3Cd3dX7lvXfnuJEktxRqKhFnNRcSIABHeWaikEAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrELMWRmVeSWpSXmKPExsWy7bCSnG45T0KiwYnryhaX92tbzD9yjtVi
        49sfTBZT/ixnsphxfh+TReveI+wWh9+0s1qs2vWH0YHDY1ZDL5vHzll32T02repk87hzbQ+b
        R9+WVYwenzfJBbBFcdmkpOZklqUW6dslcGUcmd3NXtBlV/H89mamBsZ9Jl2MnBwSAiYSZ2cv
        Yepi5OIQEtjNKPF+bz8zREJW4tm7HewQtrDE/ZYjrBBF7xklWt+cZwFJsAnoSmx5/ooRJCEi
        0M0o0d/YCzaKWeAIo8T/77/AqoQFvCS6l05jBLFZBFQl/ky+D2bzCthJ3L73DGqFvMSRX51g
        qzkF7CWOtneD1QgB1Tx5sZkFol5Q4uTMJ2A2M1B989bZzBMYBWYhSc1CklrAyLSKUTK1oDg3
        PbfYsMAwL7Vcrzgxt7g0L10vOT93EyM42LU0dzBuX/VB7xAjEwfjIUYJDmYlEd58+9hEId6U
        xMqq1KL8+KLSnNTiQ4zSHCxK4rwXuk7GCwmkJ5akZqemFqQWwWSZODilGphCN5i9K5h+s9Jg
        osCqctZzwov+J6VVvTzfs265WddNvwXPRSInJy+yrkyeJ+kfcig2fPeXf9vTmGZs5S3WmmvP
        8korLa2g76kN79Q3Smsbs1ZM5Xp78OGXXOX8Q9GPjD8/2K3zIGPeEr26hH8tNZ887/gvfPjq
        s/zVR2+OPvusfXXLtUirn+kOW50T+z6q7xSZqfbhE+d/ZQmbvuk5vDFPRLy/Xr3mV9nI+yHi
        Tnwzy5qI6VffZmkd2bjoRIHZd2nDtdphq3PfhwYv/Tn7GkOY1wPGm7/DDtanC11L37DLb/eH
        dRd2HZypmGc6NUevqSdedtXZxnk5M2Q91kyoW9zAnh+4vf2xtvE1xZDDyusklFiKMxINtZiL
        ihMBK6n13uUCAAA=
X-CMS-MailID: 20211008091639epcas2p28339f2f73755a3c842fbb95f313bf7d9
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20211008091639epcas2p28339f2f73755a3c842fbb95f313bf7d9
References: <20211008091443.44625-1-chanho61.park@samsung.com>
        <CGME20211008091639epcas2p28339f2f73755a3c842fbb95f313bf7d9@epcas2p2.samsung.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Add pinctrl data for ExynosAuto v9 SoC.

- GPA0, GPA1: 10, External wake up interrupt
- GPQ0: 2, XbootLDO, Speedy PMIC I/F
- GPB0, GPB1, GPB2, GPB3: 29, I2S 7 CH
- GPF0, GPF1, GPF2, GPF3,GPF4, GPF5, GPF6, GPF8: 52, FSYS
- GPG0, GPG1, GPG2, GPG3: 25, GPIO x 24, SMPL_INT
- GPP0, GPP1, GPP2, GPP3, GPP4, GPP5: 48, USI 12 CH

Signed-off-by: Chanho Park <chanho61.park@samsung.com>
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
2.33.0


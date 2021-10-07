Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F304AC43217
	for <linux-samsung-soc@archiver.kernel.org>; Thu,  7 Oct 2021 12:11:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DE6D361261
	for <linux-samsung-soc@archiver.kernel.org>; Thu,  7 Oct 2021 12:11:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231821AbhJGMM7 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 7 Oct 2021 08:12:59 -0400
Received: from mailout4.samsung.com ([203.254.224.34]:35551 "EHLO
        mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241175AbhJGMM6 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 7 Oct 2021 08:12:58 -0400
Received: from epcas2p4.samsung.com (unknown [182.195.41.56])
        by mailout4.samsung.com (KnoxPortal) with ESMTP id 20211007121102epoutp04ff7807a522911ef48abcb89efb807c5c~rvmxRjHL91999519995epoutp04Y
        for <linux-samsung-soc@vger.kernel.org>; Thu,  7 Oct 2021 12:11:02 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20211007121102epoutp04ff7807a522911ef48abcb89efb807c5c~rvmxRjHL91999519995epoutp04Y
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1633608662;
        bh=08u7Kj1mo9W4jMqTpNc+wOEnmkVekepWzR2Nq0NwREU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=LLY3t1j5ofndgSw4Ea83wS7F7Jq95MMIReFQSOYBYw1Eejxof0ChJHD5I25AHr8op
         TK99t6wAf9AKXmrFjNu4jQFx/GHjuXC0D83gNiZ5FMegpyNZ+PedmabnW0TnOanoNQ
         fEOK7nFOT1c7LJqPglFMPmscRBtinsaNkQK5rxnU=
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
        epcas2p2.samsung.com (KnoxPortal) with ESMTP id
        20211007121101epcas2p2f2e95b10db936cf1f55eba7cf0a8c4b9~rvmwu_2EP3253632536epcas2p2n;
        Thu,  7 Oct 2021 12:11:01 +0000 (GMT)
Received: from epsmges2p2.samsung.com (unknown [182.195.36.98]) by
        epsnrtp3.localdomain (Postfix) with ESMTP id 4HQ9C4746jz4x9Pw; Thu,  7 Oct
        2021 12:10:56 +0000 (GMT)
Received: from epcas2p3.samsung.com ( [182.195.41.55]) by
        epsmges2p2.samsung.com (Symantec Messaging Gateway) with SMTP id
        39.0C.09816.0D3EE516; Thu,  7 Oct 2021 21:10:56 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
        epcas2p2.samsung.com (KnoxPortal) with ESMTPA id
        20211007121055epcas2p2ed43488faa0c856c5009a3a2f3b779ed~rvmrINfw13249732497epcas2p2c;
        Thu,  7 Oct 2021 12:10:55 +0000 (GMT)
Received: from epsmgms1p2.samsung.com (unknown [182.195.42.42]) by
        epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20211007121055epsmtrp12fe573fc8a1210318a005b190020b9c0~rvmrHhgFj0890508905epsmtrp1i;
        Thu,  7 Oct 2021 12:10:55 +0000 (GMT)
X-AuditID: b6c32a46-625ff70000002658-6d-615ee3d01f13
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
        epsmgms1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
        85.DC.08750.FC3EE516; Thu,  7 Oct 2021 21:10:55 +0900 (KST)
Received: from localhost.localdomain (unknown [10.229.9.51]) by
        epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20211007121055epsmtip1605f1eb86ce601d2cf131c1493b18bab~rvmq9dXpC0981909819epsmtip1F;
        Thu,  7 Oct 2021 12:10:55 +0000 (GMT)
From:   Chanho Park <chanho61.park@samsung.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Rob Herring <robh+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     Tomasz Figa <tomasz.figa@gmail.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Chanho Park <chanho61.park@samsung.com>
Subject: [PATCH 1/3] pinctrl: samsung: support ExynosAutov9 SoC pinctrl
Date:   Thu,  7 Oct 2021 21:08:53 +0900
Message-Id: <20211007120855.56555-2-chanho61.park@samsung.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211007120855.56555-1-chanho61.park@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprKJsWRmVeSWpSXmKPExsWy7bCmue6Fx3GJBr+mmlhc3q9tMf/IOVaL
        jW9/MFlM+bOcyWLG+X1MFq17j7BbHH7TzmqxatcfRgcOj1kNvWweO2fdZffYtKqTzePOtT1s
        Hn1bVjF6fN4kF8AWlW2TkZqYklqkkJqXnJ+SmZduq+QdHO8cb2pmYKhraGlhrqSQl5ibaqvk
        4hOg65aZA3SPkkJZYk4pUCggsbhYSd/Opii/tCRVISO/uMRWKbUgJafAvECvODG3uDQvXS8v
        tcTK0MDAyBSoMCE748XLxewFP20qbvw5z97AuNe4i5GTQ0LAROLChmlsXYxcHEICOxglVv1b
        wwThfGKUmNqwgwXC+cwoceHxayaYlnsfu6ASuxglnv+8DOV8ZJRoX3UYrIpNQFdiy/NXjCAJ
        EYFORomV37aBJZgFDjBKbLlgB2ILC7hLtPV8YQOxWQRUJf6/vs8IYvMK2Ek0fOhnhFgnL3Hk
        VycziM0pYC8x6dEDVogaQYmTM5+wQMyUl2jeOpsZov4ru8TC2VCnukjsnXOaDcIWlnh1fAs7
        hC0l8bK/jR3kOAmBbkaJ1kf/oRKrGSU6G30gbHuJX9O3AC3jAFqgKbF+lz6IKSGgLHHkFtRa
        PomOw3/ZIcK8Eh1tQhCN6hIHtk9ngbBlJbrnfGaFsD0klnxYALZISGASo8T+5uoJjAqzkDwz
        C8kzsxD2LmBkXsUollpQnJueWmxUYASP4eT83E2M4PSp5baDccrbD3qHGJk4GA8xSnAwK4nw
        5tvHJgrxpiRWVqUW5ccXleakFh9iNAUG9URmKdHkfGACzyuJNzSxNDAxMzM0NzI1MFcS5537
        zylRSCA9sSQ1OzW1ILUIpo+Jg1OqgankwQbjFSvl6+1Vuzl1EjO79x6u1km49XNPe/vU72sD
        Y3dt1Wzrq7Fh3zTlZdw3g4olB+/9Dlm6aFrJwjtPvWdzn3rv/4Tbf8X/kkv33ofY2b646OEU
        Ok+BVXHyXOftkfLpJz7f2P7hxiSpuqDwzyuPu6nsP+TNsnHdnoDLH/UO+Xw59WLmoxeJRwx2
        TOC2qEnnzM+Yf8nzDxtvW7DBx5S6ROOdGTOumS0XFk5KyYuNiMxskVW792VX7axHBTM+a+wy
        671V8lZy9YUUD9UffVa/+PznqM3f1JV3I+2CkP8y2RO9euJtPRsXTn103mvaPNVOr73fo3oE
        YmwWBwesnOO+79X3ov/B8TV+n51anj9QYinOSDTUYi4qTgQAGtjHtygEAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrELMWRmVeSWpSXmKPExsWy7bCSnO75x3GJBmf+K1pc3q9tMf/IOVaL
        jW9/MFlM+bOcyWLG+X1MFq17j7BbHH7TzmqxatcfRgcOj1kNvWweO2fdZffYtKqTzePOtT1s
        Hn1bVjF6fN4kF8AWxWWTkpqTWZZapG+XwJXx4uVi9oKfNhU3/pxnb2Dca9zFyMkhIWAice9j
        F0sXIxeHkMAORol7R38wQSRkJZ6928EOYQtL3G85wgpR9J5RYkH/LxaQBJuArsSW568YQRIi
        At2MEv2NvUwgDrPAEUaJ/98hqoQF3CXaer6wgdgsAqoS/1/fZwSxeQXsJBo+9DNCrJCXOPKr
        kxnE5hSwl5j06AEriC0EVNN2bApUvaDEyZlPwGYyA9U3b53NPIFRYBaS1CwkqQWMTKsYJVML
        inPTc4sNC4zyUsv1ihNzi0vz0vWS83M3MYKDXUtrB+OeVR/0DjEycTAeYpTgYFYS4c23j00U
        4k1JrKxKLcqPLyrNSS0+xCjNwaIkznuh62S8kEB6YklqdmpqQWoRTJaJg1OqgUmwWcrY24Sf
        s6JmkuGNV616T7SNbxyo55jIOWV5e+/mfa8sN+xm13zzjcc/7aRI9OzgXplr81cuOHvoXdEG
        PUe/7PkpK9Jnyi0I4Ot0MdNjkHsTJLPvFEPtwdCj877M9rIvT8j+sIBzw9J688Tm0r5LLe3N
        lr8TfMW5vl7L2f8qkiftx/IomSNAAbFg5nNyxlvnv/Q4lfS9pIpDu8/F9ezDNavV6tfa/jtR
        FhDTd6Qp6m+VZtP0FdKdFv6TpKIVZe8t4g7y/xajFSzb+WX7uVDJ6ayR8x/JRF/w/7Bv6etY
        RtmpzWsT94VsS9h0nn9qIqfU2uwKn6/blxb62Cstenj7eCbnoylVLmnnGyqVWIozEg21mIuK
        EwHLZsVu5QIAAA==
X-CMS-MailID: 20211007121055epcas2p2ed43488faa0c856c5009a3a2f3b779ed
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20211007121055epcas2p2ed43488faa0c856c5009a3a2f3b779ed
References: <20211007120855.56555-1-chanho61.park@samsung.com>
        <CGME20211007121055epcas2p2ed43488faa0c856c5009a3a2f3b779ed@epcas2p2.samsung.com>
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
index fe5f6046fbd5..3bf18e844402 100644
--- a/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c
+++ b/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c
@@ -538,3 +538,111 @@ const struct samsung_pinctrl_of_match_data exynos850_of_data __initconst = {
 	.ctrl		= exynos850_pin_ctrl,
 	.num_ctrl	= ARRAY_SIZE(exynos850_pin_ctrl),
 };
+
+/* pin banks of exynosautov9 pin-controller 0 (ALIVE) */
+static struct samsung_pin_bank_data exynosautov9_pin_banks0[] = {
+	EXYNOS850_PIN_BANK_EINTW(8, 0x000, "gpa0", 0x00),
+	EXYNOS850_PIN_BANK_EINTW(2, 0x020, "gpa1", 0x04),
+	EXYNOS850_PIN_BANK_EINTN(2, 0x040, "gpq0"),
+};
+
+/* pin banks of exynosautov9 pin-controller 1 (AUD) */
+static struct samsung_pin_bank_data exynosautov9_pin_banks1[] = {
+	EXYNOS850_PIN_BANK_EINTG(5, 0x000, "gpb0", 0x00),
+	EXYNOS850_PIN_BANK_EINTG(8, 0x020, "gpb1", 0x04),
+	EXYNOS850_PIN_BANK_EINTG(8, 0x040, "gpb2", 0x08),
+	EXYNOS850_PIN_BANK_EINTG(8, 0x060, "gpb3", 0x0C),
+};
+
+/* pin banks of exynosautov9 pin-controller 2 (FSYS0) */
+static struct samsung_pin_bank_data exynosautov9_pin_banks2[] = {
+	EXYNOS850_PIN_BANK_EINTG(6, 0x000, "gpf0", 0x00),
+	EXYNOS850_PIN_BANK_EINTG(6, 0x020, "gpf1", 0x04),
+};
+
+/* pin banks of exynosautov9 pin-controller 3 (FSYS1) */
+static struct samsung_pin_bank_data exynosautov9_pin_banks3[] = {
+	EXYNOS850_PIN_BANK_EINTG(6, 0x000, "gpf8", 0x00),
+};
+
+/* pin banks of exynosautov9 pin-controller 4 (FSYS2) */
+static struct samsung_pin_bank_data exynosautov9_pin_banks4[] = {
+	EXYNOS850_PIN_BANK_EINTG(4, 0x000, "gpf2", 0x00),
+	EXYNOS850_PIN_BANK_EINTG(8, 0x020, "gpf3", 0x04),
+	EXYNOS850_PIN_BANK_EINTG(7, 0x040, "gpf4", 0x08),
+	EXYNOS850_PIN_BANK_EINTG(8, 0x060, "gpf5", 0x0C),
+	EXYNOS850_PIN_BANK_EINTG(7, 0x080, "gpf6", 0x10),
+};
+
+/* pin banks of exynosautov9 pin-controller 5 (PERIC0) */
+static struct samsung_pin_bank_data exynosautov9_pin_banks5[] = {
+	EXYNOS850_PIN_BANK_EINTG(8, 0x000, "gpp0", 0x00),
+	EXYNOS850_PIN_BANK_EINTG(8, 0x020, "gpp1", 0x04),
+	EXYNOS850_PIN_BANK_EINTG(8, 0x040, "gpp2", 0x08),
+	EXYNOS850_PIN_BANK_EINTG(5, 0x060, "gpg0", 0x0C),
+};
+
+/* pin banks of exynosautov9 pin-controller 6 (PERIC1) */
+static struct samsung_pin_bank_data exynosautov9_pin_banks6[] = {
+	EXYNOS850_PIN_BANK_EINTG(8, 0x000, "gpp3", 0x00),
+	EXYNOS850_PIN_BANK_EINTG(8, 0x020, "gpp4", 0x04),
+	EXYNOS850_PIN_BANK_EINTG(8, 0x040, "gpp5", 0x08),
+	EXYNOS850_PIN_BANK_EINTG(8, 0x060, "gpg1", 0x0C),
+	EXYNOS850_PIN_BANK_EINTG(8, 0x080, "gpg2", 0x10),
+	EXYNOS850_PIN_BANK_EINTG(4, 0x0A0, "gpg3", 0x14),
+};
+
+const struct samsung_pin_ctrl exynosautov9_pin_ctrl[] = {
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


Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B7A3C433EF
	for <linux-samsung-soc@archiver.kernel.org>; Mon,  7 Mar 2022 17:28:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244422AbiCGR3V (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 7 Mar 2022 12:29:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49272 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244444AbiCGR3Q (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 7 Mar 2022 12:29:16 -0500
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C7034329A8
        for <linux-samsung-soc@vger.kernel.org>; Mon,  7 Mar 2022 09:28:20 -0800 (PST)
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com [209.85.218.69])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 772F93F4C2
        for <linux-samsung-soc@vger.kernel.org>; Mon,  7 Mar 2022 17:28:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1646674099;
        bh=zWqkAeekz2GA5fDk4zNgeAU/W+NGxH0bY9P4VqyG+q4=;
        h=From:To:Cc:Subject:Date:Message-Id:MIME-Version;
        b=h4nys6dARqH1HOAALE3Fwwh8ziSOds/uvfoNsZIrxfsEPewbGLOhjUz3GCCIfLt9H
         0qpqFxYEnGWgp8FdkwOGMPDGXbB16/TIID3OR/nTEHx9J8Ayx8JKiLLASVF0HeyjSb
         GbIJFVCeiRBvVgc0D2anaRExn7Z3ZBh4/98LjkSbaj9tOCaFZX3soThIWgfDFPaw5s
         tHKyhEkC2sHVO+IqsKVTqvYAund9bDaai8ruSiX7QUlsSgsKxf5XfbungTFjABdUQ4
         s+A9J7/5234SMyqv9RZRQ9vVDLitb7IeqCwUrzmWSTn5VNxwuc2YAZT4JYJWoeyVaH
         wdRiaOQqWSCQw==
Received: by mail-ej1-f69.google.com with SMTP id 13-20020a170906328d00b006982d0888a4so7251643ejw.9
        for <linux-samsung-soc@vger.kernel.org>; Mon, 07 Mar 2022 09:28:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=zWqkAeekz2GA5fDk4zNgeAU/W+NGxH0bY9P4VqyG+q4=;
        b=KHgyq7IunSm2fG0rzrDM6JJBqAS6CHxAKOQs5nVwDgcrCuTzIdFHnn021rsDcGqb5j
         Zy2HHoyyZvqTsL2y5ytlJzXdse1jJPq879GnG/t2l+8JDNzrU3ga5gpaO4gZiotgutQQ
         lUAvi5eZPIvf5f3YWlMEzqrn3hFEz2/R4nbqazSkpLIbVfv6vdWK1iHvh3SncE8EK9ty
         ZS0p5HNOcaysFNFLxk7+f/zg9O/NRz9vd6gluanY/SCknOLORz0QHUjS0sUUC//YETNS
         DLnekNSdeKHRrxwVcyOImzYpAxCkJpggjOZJKf+9UendcUxQHgcChutvl8Y/FpYaDryE
         3HQQ==
X-Gm-Message-State: AOAM533OxZzszn5GK4D9WOERUhFlLNdhGc+vJPJnIRyBtMaj7unx1bzM
        EgRs9y3mr17wsIpE4egjc0pqxuR253L3CbpeYH6jrJ293h/gwpnoH7SgJYaI/yP5hjNWrj/oV3O
        DoDUsynMl4AHAurN6VDGcPJq2NXtjD00AykOyfeAfo+taoKuJ
X-Received: by 2002:a17:907:1c0f:b0:6db:fb2:ff94 with SMTP id nc15-20020a1709071c0f00b006db0fb2ff94mr6386423ejc.581.1646674099014;
        Mon, 07 Mar 2022 09:28:19 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxFsbDaiR0foKLH8GCD7HHZMCXBWAvQszk0lRq624IFRdPIjSR6SL8eJwUWJp7owpT4k6uG1g==
X-Received: by 2002:a17:907:1c0f:b0:6db:fb2:ff94 with SMTP id nc15-20020a1709071c0f00b006db0fb2ff94mr6386406ejc.581.1646674098773;
        Mon, 07 Mar 2022 09:28:18 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-174-239.adslplus.ch. [188.155.174.239])
        by smtp.gmail.com with ESMTPSA id g13-20020a50bf4d000000b00410d407da2esm6557971edk.13.2022.03.07.09.28.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Mar 2022 09:28:18 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>,
        arm@kernel.org, soc@kernel.org
Cc:     linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Rob Herring <robh+dt@kernel.org>
Subject: [PATCH] MAINTAINERS: update Krzysztof Kozlowski's email
Date:   Mon,  7 Mar 2022 18:28:05 +0100
Message-Id: <20220307172805.156760-1-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Use Krzysztof Kozlowski's @kernel.org account in maintainer entries.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>

---

Hi Arnd and Olof,

Could you take this one directly for fixes?

My email address also appears in the bindings. For now mailmap will
handle it. I will change it after merge window, because some of the
bindings are in separate for-next branches.
---
 .mailmap                            |  1 +
 MAINTAINERS                         | 34 ++++++++++++++---------------
 drivers/soc/samsung/exynos-chipid.c |  2 +-
 3 files changed, 19 insertions(+), 18 deletions(-)

diff --git a/.mailmap b/.mailmap
index 29a45c106dfb..f9781674e7e7 100644
--- a/.mailmap
+++ b/.mailmap
@@ -217,6 +217,7 @@ Koushik <raghavendra.koushik@neterion.com>
 Krishna Manikandan <quic_mkrishn@quicinc.com> <mkrishn@codeaurora.org>
 Krzysztof Kozlowski <krzk@kernel.org> <k.kozlowski.k@gmail.com>
 Krzysztof Kozlowski <krzk@kernel.org> <k.kozlowski@samsung.com>
+Krzysztof Kozlowski <krzk@kernel.org> <krzysztof.kozlowski@canonical.com>
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
 Kuogee Hsieh <quic_khsieh@quicinc.com> <khsieh@codeaurora.org>
 Leonardo Bras <leobras.c@gmail.com> <leonardo@linux.ibm.com>
diff --git a/MAINTAINERS b/MAINTAINERS
index d7ea92ce1b1d..4e88b4e17e35 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2627,7 +2627,7 @@ F:	sound/soc/rockchip/
 N:	rockchip
 
 ARM/SAMSUNG S3C, S5P AND EXYNOS ARM ARCHITECTURES
-M:	Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
+M:	Krzysztof Kozlowski <krzk@kernel.org>
 R:	Alim Akhtar <alim.akhtar@samsung.com>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 L:	linux-samsung-soc@vger.kernel.org
@@ -11852,7 +11852,7 @@ F:	drivers/iio/proximity/mb1232.c
 
 MAXIM MAX17040 FAMILY FUEL GAUGE DRIVERS
 R:	Iskren Chernev <iskren.chernev@gmail.com>
-R:	Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
+R:	Krzysztof Kozlowski <krzk@kernel.org>
 R:	Marek Szyprowski <m.szyprowski@samsung.com>
 R:	Matheus Castello <matheus@castello.eng.br>
 L:	linux-pm@vger.kernel.org
@@ -11862,7 +11862,7 @@ F:	drivers/power/supply/max17040_battery.c
 
 MAXIM MAX17042 FAMILY FUEL GAUGE DRIVERS
 R:	Hans de Goede <hdegoede@redhat.com>
-R:	Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
+R:	Krzysztof Kozlowski <krzk@kernel.org>
 R:	Marek Szyprowski <m.szyprowski@samsung.com>
 R:	Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>
 R:	Purism Kernel Team <kernel@puri.sm>
@@ -11907,7 +11907,7 @@ F:	Documentation/devicetree/bindings/power/supply/maxim,max77976.yaml
 F:	drivers/power/supply/max77976_charger.c
 
 MAXIM MUIC CHARGER DRIVERS FOR EXYNOS BASED BOARDS
-M:	Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
+M:	Krzysztof Kozlowski <krzk@kernel.org>
 M:	Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
 L:	linux-pm@vger.kernel.org
 S:	Supported
@@ -11917,7 +11917,7 @@ F:	drivers/power/supply/max77693_charger.c
 
 MAXIM PMIC AND MUIC DRIVERS FOR EXYNOS BASED BOARDS
 M:	Chanwoo Choi <cw00.choi@samsung.com>
-M:	Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
+M:	Krzysztof Kozlowski <krzk@kernel.org>
 M:	Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
 L:	linux-kernel@vger.kernel.org
 S:	Supported
@@ -12607,7 +12607,7 @@ F:	mm/memblock.c
 F:	tools/testing/memblock/
 
 MEMORY CONTROLLER DRIVERS
-M:	Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
+M:	Krzysztof Kozlowski <krzk@kernel.org>
 L:	linux-kernel@vger.kernel.org
 S:	Maintained
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux-mem-ctrl.git
@@ -13748,7 +13748,7 @@ F:	include/uapi/linux/nexthop.h
 F:	net/ipv4/nexthop.c
 
 NFC SUBSYSTEM
-M:	Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
+M:	Krzysztof Kozlowski <krzk@kernel.org>
 L:	linux-nfc@lists.01.org (subscribers-only)
 L:	netdev@vger.kernel.org
 S:	Maintained
@@ -14062,7 +14062,7 @@ F:	Documentation/devicetree/bindings/regulator/nxp,pf8x00-regulator.yaml
 F:	drivers/regulator/pf8x00-regulator.c
 
 NXP PTN5150A CC LOGIC AND EXTCON DRIVER
-M:	Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
+M:	Krzysztof Kozlowski <krzk@kernel.org>
 L:	linux-kernel@vger.kernel.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/extcon/extcon-ptn5150.yaml
@@ -15515,7 +15515,7 @@ F:	drivers/pinctrl/renesas/
 
 PIN CONTROLLER - SAMSUNG
 M:	Tomasz Figa <tomasz.figa@gmail.com>
-M:	Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
+M:	Krzysztof Kozlowski <krzk@kernel.org>
 M:	Sylwester Nawrocki <s.nawrocki@samsung.com>
 R:	Alim Akhtar <alim.akhtar@samsung.com>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
@@ -17193,7 +17193,7 @@ W:	http://www.ibm.com/developerworks/linux/linux390/
 F:	drivers/s390/scsi/zfcp_*
 
 S3C ADC BATTERY DRIVER
-M:	Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
+M:	Krzysztof Kozlowski <krzk@kernel.org>
 L:	linux-samsung-soc@vger.kernel.org
 S:	Odd Fixes
 F:	drivers/power/supply/s3c_adc_battery.c
@@ -17238,7 +17238,7 @@ F:	Documentation/admin-guide/LSM/SafeSetID.rst
 F:	security/safesetid/
 
 SAMSUNG AUDIO (ASoC) DRIVERS
-M:	Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
+M:	Krzysztof Kozlowski <krzk@kernel.org>
 M:	Sylwester Nawrocki <s.nawrocki@samsung.com>
 L:	alsa-devel@alsa-project.org (moderated for non-subscribers)
 S:	Supported
@@ -17246,7 +17246,7 @@ F:	Documentation/devicetree/bindings/sound/samsung*
 F:	sound/soc/samsung/
 
 SAMSUNG EXYNOS PSEUDO RANDOM NUMBER GENERATOR (RNG) DRIVER
-M:	Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
+M:	Krzysztof Kozlowski <krzk@kernel.org>
 L:	linux-crypto@vger.kernel.org
 L:	linux-samsung-soc@vger.kernel.org
 S:	Maintained
@@ -17281,7 +17281,7 @@ S:	Maintained
 F:	drivers/platform/x86/samsung-laptop.c
 
 SAMSUNG MULTIFUNCTION PMIC DEVICE DRIVERS
-M:	Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
+M:	Krzysztof Kozlowski <krzk@kernel.org>
 M:	Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
 L:	linux-kernel@vger.kernel.org
 L:	linux-samsung-soc@vger.kernel.org
@@ -17307,7 +17307,7 @@ F:	drivers/media/platform/s3c-camif/
 F:	include/media/drv-intf/s3c_camif.h
 
 SAMSUNG S3FWRN5 NFC DRIVER
-M:	Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
+M:	Krzysztof Kozlowski <krzk@kernel.org>
 M:	Krzysztof Opasiak <k.opasiak@samsung.com>
 L:	linux-nfc@lists.01.org (subscribers-only)
 S:	Maintained
@@ -17329,7 +17329,7 @@ S:	Supported
 F:	drivers/media/i2c/s5k5baf.c
 
 SAMSUNG S5P Security SubSystem (SSS) DRIVER
-M:	Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
+M:	Krzysztof Kozlowski <krzk@kernel.org>
 M:	Vladimir Zapolskiy <vz@mleia.com>
 L:	linux-crypto@vger.kernel.org
 L:	linux-samsung-soc@vger.kernel.org
@@ -17364,7 +17364,7 @@ F:	include/linux/clk/samsung.h
 F:	include/linux/platform_data/clk-s3c2410.h
 
 SAMSUNG SPI DRIVERS
-M:	Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
+M:	Krzysztof Kozlowski <krzk@kernel.org>
 M:	Andi Shyti <andi@etezian.org>
 L:	linux-spi@vger.kernel.org
 L:	linux-samsung-soc@vger.kernel.org
@@ -17382,7 +17382,7 @@ F:	drivers/net/ethernet/samsung/sxgbe/
 
 SAMSUNG THERMAL DRIVER
 M:	Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>
-M:	Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
+M:	Krzysztof Kozlowski <krzk@kernel.org>
 L:	linux-pm@vger.kernel.org
 L:	linux-samsung-soc@vger.kernel.org
 S:	Maintained
diff --git a/drivers/soc/samsung/exynos-chipid.c b/drivers/soc/samsung/exynos-chipid.c
index 2746d05936d3..0fb3631e7346 100644
--- a/drivers/soc/samsung/exynos-chipid.c
+++ b/drivers/soc/samsung/exynos-chipid.c
@@ -204,7 +204,7 @@ module_platform_driver(exynos_chipid_driver);
 
 MODULE_DESCRIPTION("Samsung Exynos ChipID controller and ASV driver");
 MODULE_AUTHOR("Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>");
-MODULE_AUTHOR("Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>");
+MODULE_AUTHOR("Krzysztof Kozlowski <krzk@kernel.org>");
 MODULE_AUTHOR("Pankaj Dubey <pankaj.dubey@samsung.com>");
 MODULE_AUTHOR("Sylwester Nawrocki <s.nawrocki@samsung.com>");
 MODULE_LICENSE("GPL");
-- 
2.32.0


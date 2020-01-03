Return-Path: <SRS0=A+3s=2Y=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D11EC32767
	for <linux-samsung-soc@archiver.kernel.org>; Fri,  3 Jan 2020 17:12:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 6609524649
	for <linux-samsung-soc@archiver.kernel.org>; Fri,  3 Jan 2020 17:12:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1578071545;
	bh=CzIa2N9KGP+EU0AOPbMu7y5bL3h/GE34GGQxLaUQRxs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=ncWoVSokndFgfqJluE8Ops+kL5tTD9DKrvkRuUX6EL5r+ZW4bmHEZx2VkN0YrJd2e
	 grzrClJhIRBd1iJwYHWwLoGP7Pyc3sw2Ye7nQIKWgRaUNEu+UsvjMi1v5ZT528N8P5
	 /rk0DTmX//VGRZ7WQxlrciiAj30mJ8X1DV4lTOQ4=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728227AbgACRMT (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 3 Jan 2020 12:12:19 -0500
Received: from mail.kernel.org ([198.145.29.99]:46692 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728216AbgACRMS (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 3 Jan 2020 12:12:18 -0500
Received: from localhost.localdomain (unknown [194.230.155.149])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id CCD77215A4;
        Fri,  3 Jan 2020 17:12:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1578071537;
        bh=CzIa2N9KGP+EU0AOPbMu7y5bL3h/GE34GGQxLaUQRxs=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=XzfXWud9ou17ogSUbC65mr/HJKbT5kLK8tCal03+UL6i3M+4DpZL63h/M7cGaFNE8
         GMTzc2LARA27yR6uu8A1cpLrs2ct4R0zt7e2+bRo+08fySLCjwOnVlExkQWY6tWKdU
         TtGKvU0O5Y9evv3B9//vsqdJC31jiNwGS9FkfBP0=
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzk@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Kukjin Kim <kgene@kernel.org>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
Subject: [PATCH 06/19] media: samsung: Rename Samsung and Exynos to lowercase
Date:   Fri,  3 Jan 2020 18:11:18 +0100
Message-Id: <20200103171131.9900-7-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200103171131.9900-1-krzk@kernel.org>
References: <20200103171131.9900-1-krzk@kernel.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Fix up inconsistent usage of upper and lowercase letters in "Samsung"
and "Exynos" names.

"SAMSUNG" and "EXYNOS" are not abbreviations but regular trademarked
names.  Therefore they should be written with lowercase letters starting
with capital letter.

The lowercase "Exynos" name is promoted by its manufacturer Samsung
Electronics Co., Ltd., in advertisement materials and on website.

Although advertisement materials usually use uppercase "SAMSUNG", the
lowercase version is used in all legal aspects (e.g. on Wikipedia and in
privacy/legal statements on
https://www.samsung.com/semiconductor/privacy-global/).

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 .../devicetree/bindings/media/exynos-jpeg-codec.txt         | 2 +-
 Documentation/devicetree/bindings/media/exynos5-gsc.txt     | 2 +-
 Documentation/devicetree/bindings/media/samsung-fimc.txt    | 2 +-
 .../devicetree/bindings/media/samsung-mipi-csis.txt         | 2 +-
 Documentation/media/v4l-drivers/fimc.rst                    | 6 +++---
 Documentation/media/v4l-drivers/tuners.rst                  | 2 +-
 drivers/media/platform/exynos4-is/media-dev.c               | 2 +-
 drivers/media/platform/s3c-camif/camif-core.c               | 2 +-
 8 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/exynos-jpeg-codec.txt b/Documentation/devicetree/bindings/media/exynos-jpeg-codec.txt
index 38941db23dd2..ce9a22689e53 100644
--- a/Documentation/devicetree/bindings/media/exynos-jpeg-codec.txt
+++ b/Documentation/devicetree/bindings/media/exynos-jpeg-codec.txt
@@ -1,4 +1,4 @@
-Samsung S5P/EXYNOS SoC series JPEG codec
+Samsung S5P/Exynos SoC series JPEG codec
 
 Required properties:
 
diff --git a/Documentation/devicetree/bindings/media/exynos5-gsc.txt b/Documentation/devicetree/bindings/media/exynos5-gsc.txt
index bc963a6d305a..1872688fa408 100644
--- a/Documentation/devicetree/bindings/media/exynos5-gsc.txt
+++ b/Documentation/devicetree/bindings/media/exynos5-gsc.txt
@@ -1,6 +1,6 @@
 * Samsung Exynos5 G-Scaler device
 
-G-Scaler is used for scaling and color space conversion on EXYNOS5 SoCs.
+G-Scaler is used for scaling and color space conversion on Exynos5 SoCs.
 
 Required properties:
 - compatible: should be one of
diff --git a/Documentation/devicetree/bindings/media/samsung-fimc.txt b/Documentation/devicetree/bindings/media/samsung-fimc.txt
index 48c599dacbdf..f91b9dc80eb3 100644
--- a/Documentation/devicetree/bindings/media/samsung-fimc.txt
+++ b/Documentation/devicetree/bindings/media/samsung-fimc.txt
@@ -1,4 +1,4 @@
-Samsung S5P/EXYNOS SoC Camera Subsystem (FIMC)
+Samsung S5P/Exynos SoC Camera Subsystem (FIMC)
 ----------------------------------------------
 
 The S5P/Exynos SoC Camera subsystem comprises of multiple sub-devices
diff --git a/Documentation/devicetree/bindings/media/samsung-mipi-csis.txt b/Documentation/devicetree/bindings/media/samsung-mipi-csis.txt
index be45f0b1a449..a4149c9434ea 100644
--- a/Documentation/devicetree/bindings/media/samsung-mipi-csis.txt
+++ b/Documentation/devicetree/bindings/media/samsung-mipi-csis.txt
@@ -1,4 +1,4 @@
-Samsung S5P/EXYNOS SoC series MIPI CSI-2 receiver (MIPI CSIS)
+Samsung S5P/Exynos SoC series MIPI CSI-2 receiver (MIPI CSIS)
 -------------------------------------------------------------
 
 Required properties:
diff --git a/Documentation/media/v4l-drivers/fimc.rst b/Documentation/media/v4l-drivers/fimc.rst
index 74585ba48b7f..2783aef65c01 100644
--- a/Documentation/media/v4l-drivers/fimc.rst
+++ b/Documentation/media/v4l-drivers/fimc.rst
@@ -2,7 +2,7 @@
 
 .. include:: <isonum.txt>
 
-The Samsung S5P/EXYNOS4 FIMC driver
+The Samsung S5P/Exynos4 FIMC driver
 ===================================
 
 Copyright |copy| 2012 - 2013 Samsung Electronics Co., Ltd.
@@ -19,7 +19,7 @@ drivers/media/platform/exynos4-is directory.
 Supported SoCs
 --------------
 
-S5PC100 (mem-to-mem only), S5PV210, EXYNOS4210
+S5PC100 (mem-to-mem only), S5PV210, Exynos4210
 
 Supported features
 ------------------
@@ -65,7 +65,7 @@ Media device interface
 ~~~~~~~~~~~~~~~~~~~~~~
 
 The driver supports Media Controller API as defined at :ref:`media_controller`.
-The media device driver name is "SAMSUNG S5P FIMC".
+The media device driver name is "Samsung S5P FIMC".
 
 The purpose of this interface is to allow changing assignment of FIMC instances
 to the SoC peripheral camera input at runtime and optionally to control internal
diff --git a/Documentation/media/v4l-drivers/tuners.rst b/Documentation/media/v4l-drivers/tuners.rst
index 7509be888909..d7924141c544 100644
--- a/Documentation/media/v4l-drivers/tuners.rst
+++ b/Documentation/media/v4l-drivers/tuners.rst
@@ -18,7 +18,7 @@ These differ mainly by the bandswitch byte.
 Tuner Manufacturers
 -------------------
 
-- SAMSUNG Tuner identification: (e.g. TCPM9091PD27)
+- Samsung Tuner identification: (e.g. TCPM9091PD27)
 
 .. code-block:: none
 
diff --git a/drivers/media/platform/exynos4-is/media-dev.c b/drivers/media/platform/exynos4-is/media-dev.c
index 9aaf3b8060d5..96e336b19cc3 100644
--- a/drivers/media/platform/exynos4-is/media-dev.c
+++ b/drivers/media/platform/exynos4-is/media-dev.c
@@ -1439,7 +1439,7 @@ static int fimc_md_probe(struct platform_device *pdev)
 	INIT_LIST_HEAD(&fmd->pipelines);
 	fmd->pdev = pdev;
 
-	strscpy(fmd->media_dev.model, "SAMSUNG S5P FIMC",
+	strscpy(fmd->media_dev.model, "Samsung S5P FIMC",
 		sizeof(fmd->media_dev.model));
 	fmd->media_dev.ops = &fimc_md_ops;
 	fmd->media_dev.dev = dev;
diff --git a/drivers/media/platform/s3c-camif/camif-core.c b/drivers/media/platform/s3c-camif/camif-core.c
index c6fbcd7036d6..92f43c0cbc0c 100644
--- a/drivers/media/platform/s3c-camif/camif-core.c
+++ b/drivers/media/platform/s3c-camif/camif-core.c
@@ -304,7 +304,7 @@ static int camif_media_dev_init(struct camif_dev *camif)
 	int ret;
 
 	memset(md, 0, sizeof(*md));
-	snprintf(md->model, sizeof(md->model), "SAMSUNG S3C%s CAMIF",
+	snprintf(md->model, sizeof(md->model), "Samsung S3C%s CAMIF",
 		 ip_rev == S3C6410_CAMIF_IP_REV ? "6410" : "244X");
 	strscpy(md->bus_info, "platform", sizeof(md->bus_info));
 	md->hw_revision = ip_rev;
-- 
2.17.1


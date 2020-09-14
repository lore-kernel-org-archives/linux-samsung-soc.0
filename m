Return-Path: <SRS0=fOmg=CX=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E7FEC433E2
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 14 Sep 2020 06:14:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EF534206F4
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 14 Sep 2020 06:14:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U+xrXrSD"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726081AbgINGOK (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 14 Sep 2020 02:14:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45868 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726027AbgINGOG (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 14 Sep 2020 02:14:06 -0400
Received: from mail-ej1-x642.google.com (mail-ej1-x642.google.com [IPv6:2a00:1450:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F280AC06174A;
        Sun, 13 Sep 2020 23:14:05 -0700 (PDT)
Received: by mail-ej1-x642.google.com with SMTP id i26so21440921ejb.12;
        Sun, 13 Sep 2020 23:14:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=rIC1oHrjeeueYz0HBFCkUv0ag151JIWmWoXarLnIZ+0=;
        b=U+xrXrSDw4TAeqmWS5MUGHGG2D46SgGKRCAiPepOWuqpLsn0bLYNR2enUp8NXYi6g3
         vLiKwgup66PPSTNeN9SJfuqjvdiDxtc2wvUXQJ7PI5UVXMzc4bNndtvu3NVq8Q2LLtGZ
         jr1zbApXt4OzE3NdcscJPlS/GBKAOtROtHG5RFuke677Gc1VhiFo0nbisXSeBiCzfaO6
         9dbajD5pPZPDSJVyfTPh5Avn8JRo+zpdsYWmwiXzIxtrDME7xU7ThX6P2tlDC/JIxAdC
         JQHm21cS7XFAPh0fQp0y5YYzZp/N/h8qDacwzlbtJyPhM2YFcB4XU482n6Hanfc8E2bc
         fgZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=rIC1oHrjeeueYz0HBFCkUv0ag151JIWmWoXarLnIZ+0=;
        b=l8ngG3XsCewBTVH+iJNcrHL4hsq2LSB1lAtR6JXro27/J0qBfuzVfxYBuI9ympxPrK
         d2s1uX++mKshgzkX1fO5KaygK+Kx/+S85XZAiRdDPyR7bpSLrQ27Dzv4YUCNo0hUBrmV
         M53/6goGbnZIj3UzVVXVje9i6RsZyEatlmowBkeq6l8OXjG0bOz0mW+txgiFtbimQHHD
         QUFMCTD5bAnmU8CTy/8JW/NxS8lF6HwnZ/7kcNGrhtXbXQJ8FAR7izV+ZVayy6K2/Kqj
         fW/BJCEmYNR80dSjwJkyRKaatp7kSieB21gdiN5UYokdckXNEO+zHXpfZ9l4S2jSQSzY
         KcHw==
X-Gm-Message-State: AOAM530zlU5fJk7INmOz3OtOSVBeyaclMxvRJIblP+u73yKxCIfFJCXz
        5GEL2hM3zUaG7K5vhbVqlRQ=
X-Google-Smtp-Source: ABdhPJxhBiboB7fvBSZBflKPyaSYrlFG8klS6slvEQ6v0pbn8KL5pzjo9IHEjVDrbIZLulUhgCKyWw==
X-Received: by 2002:a17:906:72d2:: with SMTP id m18mr13009569ejl.220.1600064044596;
        Sun, 13 Sep 2020 23:14:04 -0700 (PDT)
Received: from felia.fritz.box ([2001:16b8:2ddc:3000:7936:d9d0:986e:cca5])
        by smtp.gmail.com with ESMTPSA id dv6sm6865615ejb.7.2020.09.13.23.14.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2020 23:14:04 -0700 (PDT)
From:   Lukas Bulwahn <lukas.bulwahn@gmail.com>
To:     Krzysztof Kozlowski <k.kozlowski.k@gmail.com>,
        linux-samsung-soc@vger.kernel.org
Cc:     Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
        Pia Eichinger <pia.eichinger@st.oth-regensburg.de>,
        Joe Perches <joe@perches.com>, kernel-janitors@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Lukas Bulwahn <lukas.bulwahn@gmail.com>
Subject: [PATCH] MAINTAINERS: mark linux-samsung-soc list non-moderated
Date:   Mon, 14 Sep 2020 08:13:53 +0200
Message-Id: <20200914061353.17535-1-lukas.bulwahn@gmail.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

In fifteen entries mentioning linux-samsung-soc@vger.kernel.org in
MAINTAINERS, seven entries mention the list being moderated for
non-subscribers and eight entries do not. Clearly only one can be right,
though.

Joe Perches suggested that all vger.kernel.org are not moderated for
non-subscribers.

Remove all the remarks from the entries following Joe's suggestion.

Link: https://lore.kernel.org/lkml/da6f30896a8fd78635b3ca454d77a5292a9aa76d.camel@perches.com/
Suggested-by: Joe Perches <joe@perches.com>
Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
---
applies cleanly on v5.9-rc5 and next-20200911

Krzysztof, please pick this minor non-urgent cleanup patch.

This patch submission will also show me if linux-samsung-soc is moderated
or not. I have not subscribed to linux-samsung-soc and if it shows up
quickly in the archive, the list is probably not moderated, and hence,
validating the patch.

 MAINTAINERS | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 0d0862b19ce5..de8741d24cb0 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2399,7 +2399,7 @@ ARM/SAMSUNG EXYNOS ARM ARCHITECTURES
 M:	Kukjin Kim <kgene@kernel.org>
 M:	Krzysztof Kozlowski <krzk@kernel.org>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
-L:	linux-samsung-soc@vger.kernel.org (moderated for non-subscribers)
+L:	linux-samsung-soc@vger.kernel.org
 S:	Maintained
 Q:	https://patchwork.kernel.org/project/linux-samsung-soc/list/
 F:	Documentation/arm/samsung/
@@ -2441,7 +2441,7 @@ F:	drivers/media/platform/s5p-g2d/
 
 ARM/SAMSUNG S5P SERIES HDMI CEC SUBSYSTEM SUPPORT
 M:	Marek Szyprowski <m.szyprowski@samsung.com>
-L:	linux-samsung-soc@vger.kernel.org (moderated for non-subscribers)
+L:	linux-samsung-soc@vger.kernel.org
 L:	linux-media@vger.kernel.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/media/s5p-cec.txt
@@ -13321,7 +13321,7 @@ PCI DRIVER FOR SAMSUNG EXYNOS
 M:	Jingoo Han <jingoohan1@gmail.com>
 L:	linux-pci@vger.kernel.org
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
-L:	linux-samsung-soc@vger.kernel.org (moderated for non-subscribers)
+L:	linux-samsung-soc@vger.kernel.org
 S:	Maintained
 F:	drivers/pci/controller/dwc/pci-exynos.c
 
@@ -13729,7 +13729,7 @@ M:	Tomasz Figa <tomasz.figa@gmail.com>
 M:	Krzysztof Kozlowski <krzk@kernel.org>
 M:	Sylwester Nawrocki <s.nawrocki@samsung.com>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
-L:	linux-samsung-soc@vger.kernel.org (moderated for non-subscribers)
+L:	linux-samsung-soc@vger.kernel.org
 S:	Maintained
 Q:	https://patchwork.kernel.org/project/linux-samsung-soc/list/
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/pinctrl/samsung.git
@@ -15275,7 +15275,7 @@ F:	include/linux/mfd/samsung/
 SAMSUNG S3C24XX/S3C64XX SOC SERIES CAMIF DRIVER
 M:	Sylwester Nawrocki <sylvester.nawrocki@gmail.com>
 L:	linux-media@vger.kernel.org
-L:	linux-samsung-soc@vger.kernel.org (moderated for non-subscribers)
+L:	linux-samsung-soc@vger.kernel.org
 S:	Maintained
 F:	drivers/media/platform/s3c-camif/
 F:	include/media/drv-intf/s3c_camif.h
@@ -15324,7 +15324,7 @@ SAMSUNG SOC CLOCK DRIVERS
 M:	Sylwester Nawrocki <s.nawrocki@samsung.com>
 M:	Tomasz Figa <tomasz.figa@gmail.com>
 M:	Chanwoo Choi <cw00.choi@samsung.com>
-L:	linux-samsung-soc@vger.kernel.org (moderated for non-subscribers)
+L:	linux-samsung-soc@vger.kernel.org
 S:	Supported
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/snawrocki/clk.git
 F:	Documentation/devicetree/bindings/clock/exynos*.txt
@@ -15338,7 +15338,7 @@ M:	Kukjin Kim <kgene@kernel.org>
 M:	Krzysztof Kozlowski <krzk@kernel.org>
 M:	Andi Shyti <andi@etezian.org>
 L:	linux-spi@vger.kernel.org
-L:	linux-samsung-soc@vger.kernel.org (moderated for non-subscribers)
+L:	linux-samsung-soc@vger.kernel.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/spi/spi-samsung.txt
 F:	drivers/spi/spi-s3c*
-- 
2.17.1


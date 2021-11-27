Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B51DCC43219
	for <linux-samsung-soc@archiver.kernel.org>; Sat, 27 Nov 2021 22:40:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1356565AbhK0WoM (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sat, 27 Nov 2021 17:44:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58002 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1356581AbhK0WmM (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sat, 27 Nov 2021 17:42:12 -0500
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9EAE6C06139A
        for <linux-samsung-soc@vger.kernel.org>; Sat, 27 Nov 2021 14:33:09 -0800 (PST)
Received: by mail-wm1-x32f.google.com with SMTP id c6-20020a05600c0ac600b0033c3aedd30aso9367164wmr.5
        for <linux-samsung-soc@vger.kernel.org>; Sat, 27 Nov 2021 14:33:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=LJ8LcarI7xqEtvO5iVdRS56QktsqqAOlLhc5CcWcfZQ=;
        b=r/qaO9nQajEHTbRAiXJq5PBzELxh5SYcoGDHjkN5FwgvsS/VnF/bAOJx+7tp53JVEF
         i/t/XIzQCEyV+pEoUklfZrciszvg94BS/pQNz2A3MeVo01sPBNRVRbaCye70p75cV+t9
         2oGmdCE46DQUSKfznDj4vh4OXQcT07HJryqQcYO4iYmdkQ/1tVg3+0Bz7ZKCVenrVQZg
         vIfZzm/thV8mBebncIzTNzu9qDfvmdD2lo9EjUEneA0fuKw8zj2ExbnSqJ6jRQaStZoS
         yKcNUcq0cYJ4y0FKW61tt2FFcZ/imS6ZDC8X4XwoOYa1SAb+cLLcZsFVTzXL0GcdSW3g
         Y7JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=LJ8LcarI7xqEtvO5iVdRS56QktsqqAOlLhc5CcWcfZQ=;
        b=0wlTssFDAqC3kKWBFuIO9T7mUFtaz1KWygHaJnEUwy+wYeXHzL10mFIHSLsqfuPqh9
         Yjn6U2yQzswyNfJLTQWavxrmWoXE5R0kqD9zp190xJ4PLWCiWLmQG6jaocyupE1FlRE5
         vBdhau1SKaGt/+ITRSrqfil4J6diDNPdPzvpMZG4UrWqDVy7cHcDsv6LeKU4gAhQWukm
         jCprVTwhBcBv+nlFEkThPV333h/+PKv6lkbIhkBjgduLtrSfus5sR2rtome+DoQJuHfV
         QpV94rXzY4tir923iQDsTtNxRHPO0LW/m7rEflTUTdDPE+1pU1BETLsa9phT7Ut7qlpS
         spPA==
X-Gm-Message-State: AOAM530UkwywLGYVxlAk6HOUwXRaEbc6Hqdz7NOVXdTV/I9XSNXbo9EK
        s7Jb0YnLipuBYnPyH1Q6nKpXqg==
X-Google-Smtp-Source: ABdhPJybLPuiYuY26o40e1ovZYC7Flhu8vSAfHRGwdZ9hn+tl2NYlm7OSVmgTPh6Mb5T6RqHSb/bIA==
X-Received: by 2002:a1c:770e:: with SMTP id t14mr24560888wmi.173.1638052388201;
        Sat, 27 Nov 2021 14:33:08 -0800 (PST)
Received: from localhost ([31.134.121.151])
        by smtp.gmail.com with ESMTPSA id g13sm13152129wrd.57.2021.11.27.14.33.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Nov 2021 14:33:07 -0800 (PST)
From:   Sam Protsenko <semen.protsenko@linaro.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Brown <broonie@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Jaewon Kim <jaewon02.kim@samsung.com>,
        Chanho Park <chanho61.park@samsung.com>,
        David Virag <virag.david003@gmail.com>,
        Youngmin Nam <youngmin.nam@samsung.com>,
        devicetree@vger.kernel.org, linux-spi@vger.kernel.org,
        linux-serial@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        linux-i2c@vger.kernel.org
Subject: [PATCH 8/8] spi: Make SPI_S3C64XX=y impossible when EXYNOS_USI_V2=m
Date:   Sun, 28 Nov 2021 00:32:53 +0200
Message-Id: <20211127223253.19098-9-semen.protsenko@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211127223253.19098-1-semen.protsenko@linaro.org>
References: <20211127223253.19098-1-semen.protsenko@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

When S3C64XX SPI is encapsulated in USIv2 block (e.g. in Exynos850),
USIv2 driver must be loaded first, as it's preparing USI hardware for
particular protocol use. Make it impossible for spi-s3c64xx driver to be
built-in when USIv2 driver is built as a module, to prevent incorrect
booting order for those drivers.

Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
---
 drivers/spi/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/spi/Kconfig b/drivers/spi/Kconfig
index b2a8821971e1..fbdf901248be 100644
--- a/drivers/spi/Kconfig
+++ b/drivers/spi/Kconfig
@@ -761,6 +761,7 @@ config SPI_S3C24XX_FIQ
 config SPI_S3C64XX
 	tristate "Samsung S3C64XX/Exynos SoC series type SPI"
 	depends on (PLAT_SAMSUNG || ARCH_S5PV210 || ARCH_EXYNOS || COMPILE_TEST)
+	depends on EXYNOS_USI_V2 || !EXYNOS_USI_V2
 	help
 	  SPI driver for Samsung S3C64XX, S5Pv210 and Exynos SoCs.
 	  Choose Y/M here only if you build for such Samsung SoC.
-- 
2.30.2


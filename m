Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03C33C433F5
	for <linux-samsung-soc@archiver.kernel.org>; Sat, 27 Nov 2021 22:36:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1356473AbhK0Wja (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sat, 27 Nov 2021 17:39:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57400 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1356380AbhK0Wh3 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sat, 27 Nov 2021 17:37:29 -0500
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 85A46C061756
        for <linux-samsung-soc@vger.kernel.org>; Sat, 27 Nov 2021 14:32:56 -0800 (PST)
Received: by mail-wr1-x433.google.com with SMTP id d9so6386039wrw.4
        for <linux-samsung-soc@vger.kernel.org>; Sat, 27 Nov 2021 14:32:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=z2taSSZqsXJEO0VA8diRrTsYi9SJ790CZvpQPDqqNZE=;
        b=LOur6N1y5xzdgX12hTaFwltrnm5zvCLhWldD+Rl9jlEvfMRldDw40M/x6oPSkO19i4
         23Fzx9L9CebdnPb0FvEVBqSK5jKmxlKjINOJDQwEeVtkcwoAN0Q791DBiWB0m7yjJsGw
         90nFt5fwo9dY7PkYiy/O6Crz9dRXXVu7yWD2zwr4u+/M3p/svEWz653H9RXoF2sj8Gb5
         zh8sXclIRRcGbdG8czsj5cPoXuGjLLsJukLPI5ul96EsU6IGcWk3aQy8T1KPIvG4lw/7
         ucdhjOVs2FXQayU0+yPz3UEYB/Z/YLJPvVh9PME8xAOdymyd/VBl7m1UHXucZb9bZSZM
         8Xbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=z2taSSZqsXJEO0VA8diRrTsYi9SJ790CZvpQPDqqNZE=;
        b=xjznUe1E+GwU9HwP5roYh2E2f2g+rO+58wHKoHiJZDTyuItL7w/h9ZsYFU+2kcnN+F
         ALFu+J1lT1mZp0yr97xeAPdrS5ARyUWiWv1EJnMnWZIA1VR2+QdPFJqVXv2Cuw5Ho0KI
         FO3zDnGUMKK/us7//VD1zYJzYc+cWNSk9RxWMQlWaBvb/To2VDO/MzYThBrzJ5eMfb3s
         FDg6bBs+EVC1m2Tt058Ww7/BEZxIc8WbgaZO1DHpCp4UP6DZLGmk7dC48qnIs0GoPfTH
         8poiqiImfJ/aCOSZapduwIP1iCh0QHQylNScUY9x7vjoLDggwd2Bm5arww+Dbr7Gs16/
         +5YA==
X-Gm-Message-State: AOAM533zoNFw+qQ7ReYm3qUt/CGRoK8NtczC0Ljzdnhng2s47qhmCcCW
        ylsXCuRhfXsd+yL2pLcL6aWNpg==
X-Google-Smtp-Source: ABdhPJyCcnxpWR4dFaC85jKD7bENEJ80SAoHMyrFnbQIWpGsXj8wt6LmpB61URonCWXxDcNOVVklIQ==
X-Received: by 2002:adf:d1e2:: with SMTP id g2mr23919419wrd.346.1638052374975;
        Sat, 27 Nov 2021 14:32:54 -0800 (PST)
Received: from localhost ([31.134.121.151])
        by smtp.gmail.com with ESMTPSA id p12sm11761288wrr.10.2021.11.27.14.32.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Nov 2021 14:32:54 -0800 (PST)
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
Subject: [PATCH 0/8] soc: samsung: Add USIv2 driver
Date:   Sun, 28 Nov 2021 00:32:45 +0200
Message-Id: <20211127223253.19098-1-semen.protsenko@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

USIv2 IP-core provides selectable serial protocol (UART, SPI or
High-Speed I2C); only one can be chosen at a time. This series
implements USIv2 driver, which allows one to select particular USI
function in device tree, and also performs USI block initialization.

With that driver implemented, it's not needed to do USI initialization
in protocol drivers anymore, so that code is removed from the serial
driver.

Because USI driver is tristate (can be built as a module), serial driver
was reworked so it's possible to use its console part as a module too.
This way we can load serial driver module from user space and still have
serial console functional.

Make it impossible to build UART/SPI/I2C driver as a built-in when USIv2
driver built as a module: USIv2 configuration must be always done before
tinkering with particular protocol it implements.

Design features:
  - "reg" property contains USI registers start address (0xc0 offset);
    it's used in the driver to access USI_CON and USI_OPTION registers.
    This way all USI initialization (reset, HWACG, etc) can be done in
    USIv2 driver separately, rather than duplicating that code over
    UART/SPI/I2C drivers
  - System Register (system controller node) and its SW_CONF register
    offset are provided in "samsung,sysreg" property; it's used to
    select USI function (protocol to be used)
  - USI function is specified in "samsung,mode" property; integer value
    is used to simplify parsing
  - there is "samsung,clkreq-on" bool property, which makes driver
    disable HWACG control (needed for UART to work properly)
  - PCLK and IPCLK clocks are both provided to USI node; apparently both
    need to be enabled to access USI registers
  - protocol nodes are embedded (as a child nodes) in USI node; it
    allows correct init order, and reflects HW properly
  - USIv2 driver is a tristate: can be also useful from Android GKI
    requirements point of view
  - driver functions are implemented with further development in mind:
    we might want to add some SysFS interface later for example, or
    provide some functions to serial drivers with EXPORT_SYMBOL(), etc

Sam Protsenko (8):
  dt-bindings: soc: samsung: Add Exynos USIv2 bindings
  dt-bindings: soc: samsung: Add Exynos USIv2 bindings doc
  soc: samsung: Add USIv2 driver
  tty: serial: samsung: Remove USI initialization
  tty: serial: samsung: Enable console as module
  tty: serial: Make SERIAL_SAMSUNG=y impossible when EXYNOS_USI_V2=m
  i2c: Make I2C_EXYNOS5=y impossible when EXYNOS_USI_V2=m
  spi: Make SPI_S3C64XX=y impossible when EXYNOS_USI_V2=m

 .../bindings/soc/samsung/exynos-usi-v2.yaml   | 124 +++++++++
 drivers/i2c/busses/Kconfig                    |   1 +
 drivers/soc/samsung/Kconfig                   |  14 +
 drivers/soc/samsung/Makefile                  |   2 +
 drivers/soc/samsung/exynos-usi-v2.c           | 242 ++++++++++++++++++
 drivers/spi/Kconfig                           |   1 +
 drivers/tty/serial/Kconfig                    |   3 +-
 drivers/tty/serial/samsung_tty.c              |  57 ++---
 .../dt-bindings/soc/samsung,exynos-usi-v2.h   |  16 ++
 include/linux/serial_s3c.h                    |   9 -
 10 files changed, 425 insertions(+), 44 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/soc/samsung/exynos-usi-v2.yaml
 create mode 100644 drivers/soc/samsung/exynos-usi-v2.c
 create mode 100644 include/dt-bindings/soc/samsung,exynos-usi-v2.h

-- 
2.30.2


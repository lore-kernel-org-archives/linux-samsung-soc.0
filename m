Return-Path: <SRS0=N0pO=4B=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18E71C3B18B
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 13 Feb 2020 15:08:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E27E0218AC
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 13 Feb 2020 15:08:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JZeUUNWM"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726937AbgBMPIY (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 13 Feb 2020 10:08:24 -0500
Received: from mail-lj1-f178.google.com ([209.85.208.178]:39777 "EHLO
        mail-lj1-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727458AbgBMPIY (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 13 Feb 2020 10:08:24 -0500
Received: by mail-lj1-f178.google.com with SMTP id o15so6987463ljg.6
        for <linux-samsung-soc@vger.kernel.org>; Thu, 13 Feb 2020 07:08:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=ee3GiJH577lg4OY0wM/xXf9Ee0smp8wTuy1Kt6Kxyhw=;
        b=JZeUUNWM13eWdOmRSQp9k9sdhZx/TJEin/ByaULHziiBPHEmI9T9Zsvx8lwaVyoPO/
         VaSNqryIHsoUv0qdIVghhaHGZ5YE4Kn2ZXOPDTM7rGSH45GGa2TMRaQ0ki5CESdszK5v
         wUhBgb44im56N11L5k3kBh++rCK9jS7WF6Y8PcZXyhRHmJGxisA/JTxAxYFoOoRPNxh4
         tq5RCfRDdLpgwBfaHR/ERAJg+aaC2UPpVRNqUZGO6Ji36L95jzDNk8v2kH5dCan3Af/u
         ppUINnczbX/08gkNp9fdHeOeycatSjfOOSCmBz/X0Sg3Wgb/3j1LqVVH/C+Wid5Gpbh3
         +oVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=ee3GiJH577lg4OY0wM/xXf9Ee0smp8wTuy1Kt6Kxyhw=;
        b=RkjdtCOEbdr3FHbPYTN9h6y9GeriSwKsigxWGNyLzlrRMoKIsk8nIYTRAvyMKPfbFU
         o6rFxTvNpE7h2b0MgFUrETqZe9PoATV/IUGCWxrZefGDvGzqZcHiLZocxwY4WJ5cEQtD
         V6VjUukSxPpNy2Q3XrR9kOtGWtpCWJmTz1lPOt3kRtFbkrR5j6v4N3yLMmnzxu9nTeSd
         eVoEvlN7qSguqNF79hrD1YvUEp9ONGl2wJ+tRUtk1zECW7MNUeu3S9IJmnZuxxwdYYwc
         STMCF60p9A9MNNxLxxdV+oPuw6U9OO+98DP8jfFBYZ86WhsB0aIcei1byKPPFhONnAmW
         HY3g==
X-Gm-Message-State: APjAAAVVr1ace7hQrRzfiCwGslu2G5bJf8Gdb2UB1DvSIsErHDN35TXq
        mR5r+6XxB7wofYJ3BY0u24fSRNDL/IPsRD6V73AW9A==
X-Google-Smtp-Source: APXvYqwViHloSrWiho2QMtHCGc3xN17HyL+4UdJATCgdO7LA+fzGLegBLXjGlZU44h+dsmkp0buMYHBKj+IWlY4aVHo=
X-Received: by 2002:a2e:e12:: with SMTP id 18mr11682234ljo.123.1581606500827;
 Thu, 13 Feb 2020 07:08:20 -0800 (PST)
MIME-Version: 1.0
From:   Naresh Kamboju <naresh.kamboju@linaro.org>
Date:   Thu, 13 Feb 2020 20:38:07 +0530
Message-ID: <CA+G9fYsxGkwOQYhuxwOZMwJi=1v4qc+cZ8PZgV6MczFNjo84HQ@mail.gmail.com>
Subject: stable-rc 5.4: arm64 make dtbs failed
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Sasha Levin <sashal@kernel.org>
Cc:     Arnd Bergmann <arnd@arndb.de>,
        linux- stable <stable@vger.kernel.org>,
        lkft-triage@lists.linaro.org,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, linux-samsung-soc@vger.kernel.org,
        Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>, agross@kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

# make -sk KBUILD_BUILD_USER=TuxBuild -C/linux ARCH=arm64
CROSS_COMPILE=aarch64-linux-gnu- HOSTCC=gcc CC="sccache
aarch64-linux-gnu-gcc" O=build dtbs


../arch/arm64/boot/dts/exynos/exynos5433.dtsi:254.3-29: Warning
(reg_format): /gpu@14ac0000:reg: property has invalid length (8 bytes)
(#address-cells == 2, #size-cells == 2)
arch/arm64/boot/dts/exynos/exynos5433-tm2.dtb: Warning
(pci_device_bus_num): Failed prerequisite 'reg_format'
arch/arm64/boot/dts/exynos/exynos5433-tm2.dtb: Warning (i2c_bus_reg):
Failed prerequisite 'reg_format'
arch/arm64/boot/dts/exynos/exynos5433-tm2.dtb: Warning (spi_bus_reg):
Failed prerequisite 'reg_format'
../arch/arm64/boot/dts/exynos/exynos5433.dtsi:254.3-29: Warning
(reg_format): /gpu@14ac0000:reg: property has invalid length (8 bytes)
(#address-cells == 2, #size-cells == 2)
arch/arm64/boot/dts/exynos/exynos5433-tm2e.dtb: Warning
(pci_device_bus_num): Failed prerequisite 'reg_format'
arch/arm64/boot/dts/exynos/exynos5433-tm2e.dtb: Warning (i2c_bus_reg):
Failed prerequisite 'reg_format'
arch/arm64/boot/dts/exynos/exynos5433-tm2e.dtb: Warning (spi_bus_reg):
Failed prerequisite 'reg_format'
../arch/arm64/boot/dts/exynos/exynos7.dtsi:83.3-29: Warning
(reg_format): /gpu@14ac0000:reg: property has invalid length (8 bytes)
(#address-cells == 2, #size-cells == 2)
arch/arm64/boot/dts/exynos/exynos7-espresso.dtb: Warning
(pci_device_bus_num): Failed prerequisite 'reg_format'
arch/arm64/boot/dts/exynos/exynos7-espresso.dtb: Warning
(i2c_bus_reg): Failed prerequisite 'reg_format'
arch/arm64/boot/dts/exynos/exynos7-espresso.dtb: Warning
(spi_bus_reg): Failed prerequisite 'reg_format'
../arch/arm64/boot/dts/qcom/msm8998-mtp.dtsi:10.10-13.4: ERROR
(path_references): /aliases: Reference to non-existent node or label
"blsp1_uart3"

ERROR: Input tree has errors, aborting (use -f to force output)
make[3]: *** [scripts/Makefile.lib:299:
arch/arm64/boot/dts/qcom/msm8998-mtp.dtb] Error 2

ref:
https://gitlab.com/Linaro/lkft/kernel-runs/-/jobs/435619179

-- 
Linaro LKFT
https://lkft.linaro.org

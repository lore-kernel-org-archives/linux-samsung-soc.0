Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B764EE49B5
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 25 Aug 2023 21:55:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231492AbjHYVzB (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 25 Aug 2023 17:55:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36098 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231571AbjHYVyt (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 25 Aug 2023 17:54:49 -0400
Received: from mail-oi1-x232.google.com (mail-oi1-x232.google.com [IPv6:2607:f8b0:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 372D2EC
        for <linux-samsung-soc@vger.kernel.org>; Fri, 25 Aug 2023 14:54:47 -0700 (PDT)
Received: by mail-oi1-x232.google.com with SMTP id 5614622812f47-3a5a7e7cd61so783325b6e.0
        for <linux-samsung-soc@vger.kernel.org>; Fri, 25 Aug 2023 14:54:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693000486; x=1693605286;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ED3W7s12gubynwmMQJJ5mT7Z84AD3DiBoyeGrhqMwHs=;
        b=q+NdNGNUcySfhgoSgFumNTOS4wlUTngAqhcxwENzdMjVjwoEjkXDVt7d4Q9NcGZHZ0
         JwioqaoDWsbNQobKHqLJGUbU63inXej8lUUewxxQ0K2T57zAepCEiicq+GfBTySmbeXK
         gRrikx7nWnEygE7Iy7JaEW9sCGcUzpCNYHEkX/Up7el7E6BB7kHCOmQoJ7pJli3foc3L
         tSBU3gNTwtR/OGutFxtR/vavFCKkGJCNVuHcB0EEe0c+hDYSXtdp+DhFUjS+tG4MVLLB
         H3IMOOGJJLaC9c4LaDjrdDcrYP8NsLqkgLXNrjz1jWHpB9p/98c6WfY72ZbLp4nGoM2u
         qCKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693000486; x=1693605286;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ED3W7s12gubynwmMQJJ5mT7Z84AD3DiBoyeGrhqMwHs=;
        b=eQxyqtx5VUl0ED/7u+jsF3osQsMXiWSeN/vLvNd+qohnMK7VqFG3ecID66t+kFTMyC
         4afh4l0OL7+nPTA7H6Z67HpiWHY3GgBXjUgMXBpIt0ii7fvJwIClgaRN7f36b4PvhfTa
         uHJQB8iqfLuwJRiR25V7dB7cvH1Uu46qPNiiUWDGN0wcANG7xanBNcQi2P/sgxeEgemM
         jIxDaKfrvJmcZABCOouSjT+EcDIJ1baTXfyU/FnAUZrEpFgoeSUlTPVu6/pFCY1oBWUW
         LwJPX0sYKWAvwce81xDZ1iCQXU1esgOe70ik0dprBP7Uyj6qcV2H3yXktJzxwtjIsXKQ
         6U7Q==
X-Gm-Message-State: AOJu0YylyEDQh7xpkrxVBAW6NlyrhACoCFiWYSzRxeVKPOKzK/iH0LuG
        Nj88fUnVj/2qu3COxJwRfwg6CA==
X-Google-Smtp-Source: AGHT+IHoZV3JvOhzhTqu5b0Kb+MjoNzOTBJvjrpdzduCjg96IVE1UXtO5l3VDKX+pPUzxVDktV/5wA==
X-Received: by 2002:a05:6808:198f:b0:3a7:e779:7fc1 with SMTP id bj15-20020a056808198f00b003a7e7797fc1mr2708077oib.7.1693000486561;
        Fri, 25 Aug 2023 14:54:46 -0700 (PDT)
Received: from localhost ([136.49.140.41])
        by smtp.gmail.com with ESMTPSA id r185-20020a4a4ec2000000b00570cb3e8a6dsm1405191ooa.7.2023.08.25.14.54.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Aug 2023 14:54:46 -0700 (PDT)
From:   Sam Protsenko <semen.protsenko@linaro.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Conor Dooley <conor+dt@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        JaeHun Jung <jh0801.jung@samsung.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] arm64: dts: exynos: Enable USB for E850-96 board
Date:   Fri, 25 Aug 2023 16:54:43 -0500
Message-Id: <20230825215445.28309-1-semen.protsenko@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

This patch series enables USB gadget, USB host and Ethernet support for
E850-96 board. The most major change was done in USB PHY driver, as the
register layout of PHY block in Exynos850 is very different from
Exynos5 one.

Changes in v2:
  - Removed already applied patches from the patch series
  - Rebased on top of latest linux-next
  - Put ranges after compatible in usbdrd node (patch #1)

Sam Protsenko (8):
  dt-bindings: usb: samsung,exynos-dwc3: Add Exynos850 support
  dt-bindings: phy: samsung,usb3-drd-phy: Add Exynos850 support
  usb: dwc3: exynos: Add support for Exynos850 variant
  phy: exynos5-usbdrd: Make it possible to pass custom phy ops
  phy: exynos5-usbdrd: Add 26MHz ref clk support
  phy: exynos5-usbdrd: Add Exynos850 support
  arm64: dts: exynos: Enable USB in Exynos850
  arm64: dts: exynos: Enable USB support on E850-96 board

 .../bindings/phy/samsung,usb3-drd-phy.yaml    |   1 +
 .../bindings/usb/samsung,exynos-dwc3.yaml     |  16 ++
 .../boot/dts/exynos/exynos850-e850-96.dts     |  58 ++++++
 arch/arm64/boot/dts/exynos/exynos850.dtsi     |  30 +++
 drivers/phy/samsung/phy-exynos5-usbdrd.c      | 182 +++++++++++++++++-
 drivers/usb/dwc3/dwc3-exynos.c                |   9 +
 6 files changed, 294 insertions(+), 2 deletions(-)

-- 
2.39.2


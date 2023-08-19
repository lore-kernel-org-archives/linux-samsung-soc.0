Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 981C0EE49A2
	for <linux-samsung-soc@archiver.kernel.org>; Sat, 19 Aug 2023 03:18:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244880AbjHSDR4 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 18 Aug 2023 23:17:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60938 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244648AbjHSDRe (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 18 Aug 2023 23:17:34 -0400
Received: from mail-oo1-xc36.google.com (mail-oo1-xc36.google.com [IPv6:2607:f8b0:4864:20::c36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4D503421A
        for <linux-samsung-soc@vger.kernel.org>; Fri, 18 Aug 2023 20:17:33 -0700 (PDT)
Received: by mail-oo1-xc36.google.com with SMTP id 006d021491bc7-56cb1e602e7so1023605eaf.1
        for <linux-samsung-soc@vger.kernel.org>; Fri, 18 Aug 2023 20:17:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692415052; x=1693019852;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2Q7Mi/sRAGm8lhYDAZVLrk5zgyos5NQEy7qr6AIL6DU=;
        b=UbhUG+mLPhnobKlykd6gqCDeeDq8gYEW1q5+RAqlhFXRpBNUiy//H6n0gEWJqpVrcH
         28aRiT4idt5ZYLJBqPU5B2RE2A4MdKUbCIxdO4K/hrpuGv1rzWLUtNJL7dpeflV4nmTN
         r3ofwS0Wmef5p09OdV++XIPPcuWVLFnxW8LWpQUU8zuQ1+d8SOn43mO9XUJCEw2UtP9L
         Z1clpoHaYrlluHt6sKzRuUU3MjQymbq7PUdqzd61X0Ps3CYbs4I7YMHgenuCsv6BXnbe
         YQeYciSH3dB2FnzHwE+5apWRLTKzYLELeJ66GSe1rSbaeQOhKNHA0dkmDWhHgd0XdABW
         z96g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692415052; x=1693019852;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2Q7Mi/sRAGm8lhYDAZVLrk5zgyos5NQEy7qr6AIL6DU=;
        b=gzDgpdPMtM1PJ7KHV8Jo5wmF0ORfD1XvOjuqCJLi4CCeQUkEB9Tmvrpr9/ZLp++yFi
         PNkc4ZheCjrjl7fttk5Tl+QZ5WjH8D8o1mInUrghM/aEEgsJCUEpoaKokVtCXjibsByu
         OgJge36nNOrZF0r9sw1OrbvqclADTjPyAyOtcdhyWxY77I09BtQGSIW8xX3gtM/Qr11q
         ChaBkM6Fp5/K0cphEr865U2QCMocS/k+sPUTgU+xHMPkH8GjphR4+S/5QEdDMkOqPFSm
         a7MbX1PdkaJcJx5mEjbIameOFTAlPdKxsca8WC7uGtediPS0/o8hfAJdXve6bEICDYLQ
         TT7A==
X-Gm-Message-State: AOJu0Yz9A+ILgjx8Ho1ilV0/lNTtW/0aeDjb9QD7uA6C0acRLeEW5w3L
        WgFiwbpH9DB/1cgMD43Gkjq6Kg==
X-Google-Smtp-Source: AGHT+IFVUmkUoC3QURVVvQmtTQIMGCKsvM2bNgWNvvFiOc8n9HKAZXjCVFIJolRC3nL5ZZHZ4ysstQ==
X-Received: by 2002:a4a:654e:0:b0:56e:4ee2:9189 with SMTP id z14-20020a4a654e000000b0056e4ee29189mr1647457oog.5.1692415052465;
        Fri, 18 Aug 2023 20:17:32 -0700 (PDT)
Received: from localhost ([136.49.140.41])
        by smtp.gmail.com with ESMTPSA id v7-20020a4a8c47000000b0054fba751207sm1494141ooj.47.2023.08.18.20.17.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Aug 2023 20:17:31 -0700 (PDT)
From:   Sam Protsenko <semen.protsenko@linaro.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc:     JaeHun Jung <jh0801.jung@samsung.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Conor Dooley <conor+dt@kernel.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Marc Kleine-Budde <mkl@pengutronix.de>,
        Heiko Stuebner <heiko@sntech.de>,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
Subject: [PATCH 0/8] arm64: exynos: Enable USB for E850-96 board
Date:   Fri, 18 Aug 2023 22:17:23 -0500
Message-Id: <20230819031731.22618-1-semen.protsenko@linaro.org>
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


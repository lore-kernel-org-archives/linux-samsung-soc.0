Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C85DC433EF
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 20 Dec 2021 11:55:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232135AbhLTLzh (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 20 Dec 2021 06:55:37 -0500
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:34724
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232114AbhLTLzg (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 20 Dec 2021 06:55:36 -0500
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com [209.85.167.71])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id A92C63F207
        for <linux-samsung-soc@vger.kernel.org>; Mon, 20 Dec 2021 11:55:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1640001335;
        bh=Cu4+11DOXZRrdhilEoPCVYJODFzNISiCGs5MUOme0+k=;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version;
        b=gWbccULEuHjPvE0f3+Ss/T97vrALZs+Aj3U08m9RRdVT1MtLsWX6ZpqrqIoyLtf3V
         c1uYVR7iSX4jPV8c2lFnAmj0bpYw6H0rnw8liRkyxkN+z+xLLz6I+9Bfsg8VWNd7aJ
         TEHI7RZYw5nu5wB7PZMbOo9bsgyo6VdqD5BkLtw7t9fxvVRHRluW1ZcYj8AAZ4m661
         0kFglbx9AwBDk7v9NM+oKzBI+kkQcTLJImzvBDj5o5QpKW2byE5pLDxQkYtb4OlqGM
         z9lDwsq+Ji5F0v5diDP3GCxByDCaJk4o8uftm79COg1W9c++sWFxi0ZE1mDbXBcqEC
         v5vD/CP3i+TNA==
Received: by mail-lf1-f71.google.com with SMTP id w21-20020a197b15000000b00422b0797fa3so4419400lfc.4
        for <linux-samsung-soc@vger.kernel.org>; Mon, 20 Dec 2021 03:55:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Cu4+11DOXZRrdhilEoPCVYJODFzNISiCGs5MUOme0+k=;
        b=VWFYp/azQX/wj1B1Pg6e+3seiP8iLYtsihWq7Tj9FSo5yb47K3o9ff8LMV5J8hb0ex
         Y8e/jo0ziepu+wJ4B++2VSxJF5gGqif+WG1HftnA1znTlm7GlBBrXWTPP9iO6dHASJtL
         jWp8uwFrpToYPilKi6aEj56S24auRhn8bPMIH+iN2pLmVsZvwFgvCw9B1oTCu8W7SDrG
         iq4EAnExreCe7A92JSsaSLYC0cK+7dwJKn9YbGKuGTEDuX8x/BRejAhWoTclu6LSFHoj
         45Ke23Dv+yuyr18Ytf7Ca/+QYn4ffVVtkrdgVpaYGx1y0EbfUyJo+AtSkABySYWgC26F
         7R2g==
X-Gm-Message-State: AOAM53105bB4j0ElrQmoRxxDpGCA42AfAweFBw7+pgh/JkC1d4XfgUiK
        +/g8j6IfVU6qEelXuAUJjJaNHQylt5Vo2iT/9+hWy1w/i2e7sikIFZzmULvY5l7NK5fDU+OXCpE
        NPWSh/sCCV4zx87rciuLyKx8XMy5M8GcjqnyxZ6Z+XStEYq6X
X-Received: by 2002:a2e:97cb:: with SMTP id m11mr14450442ljj.324.1640001335171;
        Mon, 20 Dec 2021 03:55:35 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyGhcJV5zeGlTyPSC5Du9hpwQvZ9l7m0zQ8PCOvgtcgSgSX7pPLOaZ60p72RxVXeQ9BYz4bew==
X-Received: by 2002:a2e:97cb:: with SMTP id m11mr14450429ljj.324.1640001334960;
        Mon, 20 Dec 2021 03:55:34 -0800 (PST)
Received: from krzk-bin.lan (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
        by smtp.gmail.com with ESMTPSA id n2sm2523746ljq.30.2021.12.20.03.55.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Dec 2021 03:55:34 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>,
        arm@kernel.org, soc@kernel.org
Cc:     Sam Protsenko <semen.protsenko@linaro.org>,
        Chanho Park <chanho61.park@samsung.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>
Subject: [GIT PULL 3/6] arm64: dts: samsung: for v5.17
Date:   Mon, 20 Dec 2021 12:55:27 +0100
Message-Id: <20211220115530.30961-2-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211220115405.30434-1-krzysztof.kozlowski@canonical.com>
References: <20211220115405.30434-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

The following changes since commit fa55b7dcdc43c1aa1ba12bca9d2dd4318c2a0dbf:

  Linux 5.16-rc1 (2021-11-14 13:56:52 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-dt64-5.17

for you to fetch changes up to 51b1a5729469cef57a3c97aa014aa6e1d2b8d864:

  dt-bindings: pinctrl: samsung: Add pin drive definitions for Exynos850 (2021-12-20 10:35:32 +0100)

----------------------------------------------------------------
Samsung DTS ARM64 changes for v5.17

1. Add bindings for: Exynos USI, Samsung Galaxy A8 (2018) board, WinLink
   E850-96 board and WinLink vendor prefix.
2. Add pinctrl definitions used for Exynos850.
3. Minor fixes and improvements.
4. Convert serial on ExynosAutov9 to new hierarchy where serial is part
   of USI node.

----------------------------------------------------------------
Chanho Park (1):
      arm64: dts: exynos: convert serial_0 to USI on ExynosAutov9

David Virag (1):
      dt-bindings: arm: samsung: document jackpotlte board binding

Krzysztof Kozlowski (1):
      Merge branch 'for-v5.17/dt-usi' into next/dt64

Sam Protsenko (6):
      arm64: dts: exynos: Rename hsi2c nodes to i2c for Exynos5433 and Exynos7
      dt-bindings: soc: samsung: Add Exynos USI bindings
      dt-bindings: soc: samsung: Fix I2C clocks order in USI binding example
      dt-bindings: Add vendor prefix for WinLink
      dt-bindings: arm: samsung: Document E850-96 board binding
      dt-bindings: pinctrl: samsung: Add pin drive definitions for Exynos850

 .../bindings/arm/samsung/samsung-boards.yaml       |  12 ++
 .../bindings/soc/samsung/exynos-usi.yaml           | 159 +++++++++++++++++++++
 .../devicetree/bindings/vendor-prefixes.yaml       |   2 +
 arch/arm64/boot/dts/exynos/exynos5433.dtsi         |  24 ++--
 arch/arm64/boot/dts/exynos/exynos7.dtsi            |  24 ++--
 arch/arm64/boot/dts/exynos/exynosautov9-sadk.dts   |   4 +
 arch/arm64/boot/dts/exynos/exynosautov9.dtsi       |  36 +++--
 include/dt-bindings/pinctrl/samsung.h              |  13 +-
 include/dt-bindings/soc/samsung,exynos-usi.h       |  17 +++
 9 files changed, 258 insertions(+), 33 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/soc/samsung/exynos-usi.yaml
 create mode 100644 include/dt-bindings/soc/samsung,exynos-usi.h

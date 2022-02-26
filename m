Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 431A5C433F5
	for <linux-samsung-soc@archiver.kernel.org>; Sat, 26 Feb 2022 22:01:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229806AbiBZWCJ (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sat, 26 Feb 2022 17:02:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36040 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229831AbiBZWCF (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sat, 26 Feb 2022 17:02:05 -0500
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6FB8A271883
        for <linux-samsung-soc@vger.kernel.org>; Sat, 26 Feb 2022 14:01:30 -0800 (PST)
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com [209.85.208.69])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 49E8B407AA
        for <linux-samsung-soc@vger.kernel.org>; Sat, 26 Feb 2022 22:01:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1645912889;
        bh=xV/5bMwc5qAM+A4IvuW3pBdozLYDEc1r9Q3hw04Dixk=;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version;
        b=XcZSIDDdRFLQAYDTOUIGIeXPIGad7h89sZw+y8epixxsCWd1dNRviJMU4Y+IO0J10
         0ruz9u7qElG7a+yZHnmS9B9b2BxN14vqSVrw8jZfw4Do310PG/igykqj+PeoAsd5+f
         TzPKVWXj4FTnr7WceRMwQlyYCJTscd0MbA8Mtp5c3R7JWiBbHCG6fusDy68WEYmsNw
         O8Zno2MjwqhTvLXB/O9E5+JzaDbMALKxibr3zZ5IhuH/wWuD40CTS5Qa7iF45HR89t
         SqCh3R+j9sZxpSNikNNhTs5qM8+F+ovNwrdUexkCXjZatoi/jRHEDV+diXNnSXBF2l
         hnxc3iFGIO8CA==
Received: by mail-ed1-f69.google.com with SMTP id j10-20020a05640211ca00b004090fd8a936so3395226edw.23
        for <linux-samsung-soc@vger.kernel.org>; Sat, 26 Feb 2022 14:01:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=xV/5bMwc5qAM+A4IvuW3pBdozLYDEc1r9Q3hw04Dixk=;
        b=DDvMlnlqOKb1lcg4f2RoekTLsvDP+xsNJrpfpgzrOTeNpwsCIHmcomXYmZlYDDScYw
         QGIQfMphMLypLikIvfJhXQNLGarpRHFhaGX6gpGD5s9CZDDmyuVMjeEIUhfQv6vuQZ7e
         qIbFk/GRqw7uWwaABIf8gZWMUtH4fjbaFO9T1Ea5XsmuzWvUMdjPIshKVGImvJyHVLtk
         AiF+UdEwr9UTarUwcoSXJkgDXtCfyYiyKjAKn6zTX7+hFdA48/6SmVdPJjlyL+TYjpv7
         dj25Rd50+v+9+nTeY7LEo4l9iqJMMKGCd5QQ6cHfNhVDRs/JiZ0ycLts17dYaVsShxg4
         nHUQ==
X-Gm-Message-State: AOAM533528/MI+GYGAK4tM3mTIjHhITON3qQhyV2gmY8B8z33hFZdW6n
        CI7JuyX76cLmORJvGUWZc18tCggv1cf+Sb0HzFMpSIffcDz9fJMNt1NhBPUv2jI9qOz1T64kxOW
        3+YnVfxY3EE+37hJAnNHLa9B9IkQ8Md8h/tU3S154zfzVY+XY
X-Received: by 2002:a17:906:1be1:b0:6ce:b0a8:17d with SMTP id t1-20020a1709061be100b006ceb0a8017dmr10407909ejg.413.1645912883812;
        Sat, 26 Feb 2022 14:01:23 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxs93C93YzMJrP3OiKQ/sgLNFsaAgYmkcNTN7UpTw7SIF6jbShVHGKqvZnBavwKBdlkJ/mhZw==
X-Received: by 2002:a17:906:1be1:b0:6ce:b0a8:17d with SMTP id t1-20020a1709061be100b006ceb0a8017dmr10407892ejg.413.1645912883577;
        Sat, 26 Feb 2022 14:01:23 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-181-108.adslplus.ch. [188.155.181.108])
        by smtp.gmail.com with ESMTPSA id s2-20020a056402014200b0041285556b7csm3497424edu.72.2022.02.26.14.01.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Feb 2022 14:01:22 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>,
        arm@kernel.org, soc@kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
Subject: [GIT PULL 2/3] arm64: dts: samsung: Second round for v5.18
Date:   Sat, 26 Feb 2022 23:01:15 +0100
Message-Id: <20220226220116.13452-2-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220226220116.13452-1-krzysztof.kozlowski@canonical.com>
References: <20220226220116.13452-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi,

On top of previous pull request.

Best regards,
Krzysztof


The following changes since commit a0d5455330ece6f50ddf9e71d530f91c302803e9:

  arm64: dts: exynos: adjust USB DRD clocks with dtschema in Exynos7 (2022-02-01 09:17:16 +0100)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-dt64-5.18-2

for you to fetch changes up to 06874015327ba7bf6aae49ca825a492a2679237f:

  arm64: dts: exynos: Add initial device tree support for Exynos7885 SoC (2022-02-23 14:08:04 +0100)

----------------------------------------------------------------
Samsung DTS ARM64 changes for v5.18, part two

1. Minor fixes and cleanups in newly introduced support for Exynos850.
2. Add basic support for Exynos7885 and  Samsung Galaxy A8 (2018):
   SM-A530F.

----------------------------------------------------------------
David Virag (1):
      arm64: dts: exynos: Add initial device tree support for Exynos7885 SoC

Krzysztof Kozlowski (3):
      arm64: dts: exynos: drop incorrectly placed wakeup interrupts in Exynos850
      arm64: dts: exynos: align pinctrl with dtschema in Exynos850
      arm64: dts: exynos: use dedicated wake-up pinctrl compatible in Exynos850

 arch/arm64/boot/dts/exynos/Makefile                |   9 +-
 .../boot/dts/exynos/exynos7885-jackpotlte.dts      |  92 +++
 arch/arm64/boot/dts/exynos/exynos7885-pinctrl.dtsi | 855 +++++++++++++++++++++
 arch/arm64/boot/dts/exynos/exynos7885.dtsi         | 423 ++++++++++
 arch/arm64/boot/dts/exynos/exynos850-pinctrl.dtsi  |  56 +-
 arch/arm64/boot/dts/exynos/exynos850.dtsi          |  44 +-
 6 files changed, 1405 insertions(+), 74 deletions(-)
 create mode 100644 arch/arm64/boot/dts/exynos/exynos7885-jackpotlte.dts
 create mode 100644 arch/arm64/boot/dts/exynos/exynos7885-pinctrl.dtsi
 create mode 100644 arch/arm64/boot/dts/exynos/exynos7885.dtsi

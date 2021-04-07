Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-21.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E1BBC43460
	for <linux-samsung-soc@archiver.kernel.org>; Wed,  7 Apr 2021 06:58:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 04C36613B3
	for <linux-samsung-soc@archiver.kernel.org>; Wed,  7 Apr 2021 06:58:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345991AbhDGG6t (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 7 Apr 2021 02:58:49 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:59000 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345990AbhDGG6t (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 7 Apr 2021 02:58:49 -0400
Received: from mail-wr1-f69.google.com ([209.85.221.69])
        by youngberry.canonical.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <krzysztof.kozlowski@canonical.com>)
        id 1lU298-0000e9-Tc
        for linux-samsung-soc@vger.kernel.org; Wed, 07 Apr 2021 06:58:39 +0000
Received: by mail-wr1-f69.google.com with SMTP id r11so6502042wrp.8
        for <linux-samsung-soc@vger.kernel.org>; Tue, 06 Apr 2021 23:58:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Zf/0xmgkd8JXssWxjuLFbhP71v2tVuYVuW0VdB/t3GU=;
        b=N3kvaAcVdsrmo4gkk2CV4gMKTOqtJZTHh7oyoYVA7VIAU2sFxemx7BM/EfOWD4tfwU
         u3a7G48as6SVuBT2PvxQEU4Gb9inaH5+ygmocXgBsh6GvlbPqeyT/XtRSnIqWJnoPIFS
         i99InnjkLPx5St9Ty8yvH8YO1JsvpEXrkeOaWVroREoSyhX2a6HUfmr3vg7UbrB9dlUn
         qUm1bj3aOwVhn1UvStwTd8KUmjykmfITkysMRoFKhg8JoaijLKb4m3G7XZqD7PCeNGB/
         HEXJ9dGZzWN8fQq3qV1uS+F+ezg7IwSgx24FWdUNOh+Yj/xmkt3pcs4jcgAjeHR/Vlwb
         Vy2Q==
X-Gm-Message-State: AOAM531t3OHDFrM5rsGKXg91Hy9n30eSzXewADmqhOeGl0eyD3M3MB6q
        fO9rmfpNFaYVTQ8YRUEJSKekAm+w/VcQpqVHYUiJSu3WKXXE6gGDB3e+bDK4E+h9aEEiBGaiDJO
        vBqTvBpfSHsTPVJLV/CrHEYlyfO+VSbDHXyLaMJJ6LD8/e7LG
X-Received: by 2002:adf:ee0f:: with SMTP id y15mr2377220wrn.43.1617778718585;
        Tue, 06 Apr 2021 23:58:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy9IcdaSKcj+GrigVRg0Helk2YtTBPvlNhfhdALWQNwbMWOwjMQ3kKaSPfk/Wup3uyGbo1/Gg==
X-Received: by 2002:adf:ee0f:: with SMTP id y15mr2377204wrn.43.1617778718408;
        Tue, 06 Apr 2021 23:58:38 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-192-147.adslplus.ch. [188.155.192.147])
        by smtp.gmail.com with ESMTPSA id c16sm2410506wrx.46.2021.04.06.23.58.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Apr 2021 23:58:37 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
List-Id: <soc.lore.kernel.org>
To:     Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>,
        arm@kernel.org, soc@kernel.org
Cc:     Krzysztof Kozlowski <krzk@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [GIT PULL 1/3] ARM: dts: samsung: Pull for v5.13
Date:   Wed,  7 Apr 2021 08:58:26 +0200
Message-Id: <20210407065828.7213-1-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

From: Krzysztof Kozlowski <krzk@kernel.org>

The following changes since commit a38fd8748464831584a19438cbb3082b5a2dab15:

  Linux 5.12-rc2 (2021-03-05 17:33:41 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-dt-5.13

for you to fetch changes up to 7f4ebf3e4ce10a1ed8ff2aee5d75568dc3522b2f:

  ARM: dts: exynos: Add front camera support to I9100 (2021-03-28 20:10:09 +0200)

----------------------------------------------------------------
Samsung DTS ARM changes for v5.13

1. Configure battery charger and front camera on GT-I9100 phone.
2. Fix in several boards the Maxim PMIC/MUIC/fuel gauge interrupt flags
   to match real type of interrupt coming from the device.
3. Correct DTS with dtschema.  This brings back the commit adding input
   clock to CMU in Exynos4412 Odroid which was reverted some time ago
   due to unsupported deferred probes (now supported and tested).

----------------------------------------------------------------
Krzysztof Kozlowski (13):
      ARM: dts: exynos: correct fuel gauge interrupt trigger level on GT-I9100
      ARM: dts: exynos: correct fuel gauge interrupt trigger level on P4 Note family
      ARM: dts: exynos: correct fuel gauge interrupt trigger level on Midas family
      ARM: dts: exynos: correct MUIC interrupt trigger level on Midas family
      ARM: dts: exynos: correct PMIC interrupt trigger level on Midas family
      ARM: dts: exynos: correct PMIC interrupt trigger level on Odroid X/U3 family
      ARM: dts: exynos: correct PMIC interrupt trigger level on P4 Note family
      ARM: dts: exynos: correct PMIC interrupt trigger level on SMDK5250
      ARM: dts: exynos: correct PMIC interrupt trigger level on Snow
      ARM: dts: s5pv210: correct fuel gauge interrupt trigger level on Fascinate family
      ARM: dts: exynos: add input clock to CMU in Exynos4412 Odroid
      ARM: dts: exynos: replace deprecated NTC/Murata compatibles
      ARM: dts: exynos: white-space cleanups

Timon Baetz (2):
      ARM: dts: exynos: add charger supply for I9100
      ARM: dts: exynos: Add front camera support to I9100

 arch/arm/boot/dts/exynos3250-monk.dts           |  4 +-
 arch/arm/boot/dts/exynos3250-rinato.dts         |  4 +-
 arch/arm/boot/dts/exynos4210-i9100.dts          | 56 ++++++++++++++++++++++++-
 arch/arm/boot/dts/exynos4412-midas.dtsi         |  6 +--
 arch/arm/boot/dts/exynos4412-odroid-common.dtsi |  5 ++-
 arch/arm/boot/dts/exynos4412-odroidx.dts        |  3 +-
 arch/arm/boot/dts/exynos4412-p4note.dtsi        |  4 +-
 arch/arm/boot/dts/exynos4412-ppmu-common.dtsi   | 48 ++++++++++-----------
 arch/arm/boot/dts/exynos5250-smdk5250.dts       |  2 +-
 arch/arm/boot/dts/exynos5250-snow-common.dtsi   |  2 +-
 arch/arm/boot/dts/exynos5410-pinctrl.dtsi       | 28 ++++++-------
 arch/arm/boot/dts/s5pv210-fascinate4g.dts       |  2 +-
 12 files changed, 110 insertions(+), 54 deletions(-)

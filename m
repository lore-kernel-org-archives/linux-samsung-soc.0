Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-23.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48748C4320A
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 11 Aug 2021 08:56:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2F6C760FC4
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 11 Aug 2021 08:56:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236336AbhHKI47 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 11 Aug 2021 04:56:59 -0400
Received: from smtp-relay-canonical-1.canonical.com ([185.125.188.121]:46778
        "EHLO smtp-relay-canonical-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S235282AbhHKI47 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 11 Aug 2021 04:56:59 -0400
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com [209.85.218.70])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPS id 332AC4062C
        for <linux-samsung-soc@vger.kernel.org>; Wed, 11 Aug 2021 08:56:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1628672195;
        bh=AkfNVRo7hHf9V8Un9aQjkE6FARkV1KO6bGOPkL8pwsg=;
        h=From:To:Cc:Subject:Date:Message-Id:MIME-Version;
        b=q1FAD+n3o+R5MMYGff3djxPG5MDndd/aUrK7ADQoDmUcf2QNqv4TYSczFZ0694DN8
         1Tcx/n3Fgsqdq5SfwFVBnJEhqcbORS+Sg33YgZqMmgHp2m7R9WptTiTDBltzA5j3Rc
         PNKu8oGsjXH+Z+2iTncbZANR4dReIs2wnycdq7sTrrGArTdMmvWfFCqPgCpDM+lshd
         xCyVkIdDkp3PYQlzwT95w1K06P5tIiaEx2WrzWIbO+oRJYktZezP4C/AgnEOnBMK3z
         Ybebpix/l/JwMALY/G1JAPPiKhcOM57TtgltAubO/AUeW1x8YBUGX4wWnizOVHHE7+
         PF2gO3zKOATUw==
Received: by mail-ej1-f70.google.com with SMTP id ne21-20020a1709077b95b029057eb61c6fdfso402012ejc.22
        for <linux-samsung-soc@vger.kernel.org>; Wed, 11 Aug 2021 01:56:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=AkfNVRo7hHf9V8Un9aQjkE6FARkV1KO6bGOPkL8pwsg=;
        b=RnBQ0MsJrGLmpDtl2pna86DxrTlAkhCmb37dN3g/5U/usR+BkRXySI3A3ftBG7o3Ll
         O4QaOsHzOFXgyTI9FpePrdSCAxwzipqtMFI6h4UT2haJjvJJ9RFsW0oGkcXOfV+Tt+0S
         Qx05Uo0viRQ4JUaN0lEDDPsycGId2QRdu+j4WZUe6BiPTP8Cp9J6SZMU/UYqLvDvtT+m
         yhHPWqhMufUY783M6yat6e+5mqJcv6kaZ85hX/NBi8g4mur3zDGCYr26r+fhUySGXetj
         7WKgMVc97EkOukd4xi4DsqEJ37SfyXbmq0XjeOZbva8zwvSLkRbBVG5pwciTnmvo8NE0
         g++w==
X-Gm-Message-State: AOAM532xu+fffQnoN/uFtBRA9POixtZUYbIjBLZV1BTivTKsFhylbTuS
        jr1hL9o69BPEn6pjZAmetT4dvO9fP5WNuAtXQ1b0DKX4/y+1OqjSUNAhf++fJL7oQuccdbe99+0
        d8JIyoVXJQa3V1D+yJd6fJMooniUiyYa4VLKeZThebtSLOmRc
X-Received: by 2002:a05:6402:d49:: with SMTP id ec9mr10099879edb.333.1628672194555;
        Wed, 11 Aug 2021 01:56:34 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwLaINYImBffGAxkeivDUKOJNEzYPQrtsNvBTAbFcoUG0Xlm7TBEfwmQhiR9WGSnXf07gHdDg==
X-Received: by 2002:a05:6402:d49:: with SMTP id ec9mr10099869edb.333.1628672194408;
        Wed, 11 Aug 2021 01:56:34 -0700 (PDT)
Received: from localhost.localdomain ([86.32.42.198])
        by smtp.gmail.com with ESMTPSA id x4sm7834003ejb.106.2021.08.11.01.56.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Aug 2021 01:56:34 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
List-Id: <soc.lore.kernel.org>
To:     Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>,
        arm@kernel.org, soc@kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>
Subject: [GIT PULL 1/2] ARM: dts: samsung: DT for v5.15
Date:   Wed, 11 Aug 2021 10:51:27 +0200
Message-Id: <20210811085128.30103-1-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

The following changes since commit e73f0f0ee7541171d89f2e2491130c7771ba58d3:

  Linux 5.14-rc1 (2021-07-11 15:07:40 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-dt-5.15

for you to fetch changes up to 6cad6db75231a18f25dc7d610d5a0683160ac545:

  ARM: dts: exynos: add CPU topology to Exynos5422 (2021-08-05 09:24:04 +0200)

----------------------------------------------------------------
Samsung DTS ARM changes for v5.15

Add CPU topology to all Exynos DTSI files.

----------------------------------------------------------------
Krzysztof Kozlowski (7):
      ARM: dts: exynos: add CPU topology to Exynos3250
      ARM: dts: exynos: add CPU topology to Exynos4210
      ARM: dts: exynos: add CPU topology to Exynos4412
      ARM: dts: exynos: add CPU topology to Exynos5250
      ARM: dts: exynos: add CPU topology to Exynos5260
      ARM: dts: exynos: add CPU topology to Exynos5420
      ARM: dts: exynos: add CPU topology to Exynos5422

 arch/arm/boot/dts/exynos3250.dtsi      | 11 ++++++++++
 arch/arm/boot/dts/exynos4210.dtsi      | 11 ++++++++++
 arch/arm/boot/dts/exynos4412.dtsi      | 17 +++++++++++++++
 arch/arm/boot/dts/exynos5250.dtsi      | 11 ++++++++++
 arch/arm/boot/dts/exynos5260.dtsi      | 38 ++++++++++++++++++++++++++++------
 arch/arm/boot/dts/exynos5420-cpus.dtsi | 32 ++++++++++++++++++++++++++++
 arch/arm/boot/dts/exynos5422-cpus.dtsi | 32 ++++++++++++++++++++++++++++
 7 files changed, 146 insertions(+), 6 deletions(-)

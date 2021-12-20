Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6ABC6C433EF
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 20 Dec 2021 11:55:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232146AbhLTLzk (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 20 Dec 2021 06:55:40 -0500
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:59440
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231644AbhLTLzi (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 20 Dec 2021 06:55:38 -0500
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com [209.85.167.71])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id E1C023F32C
        for <linux-samsung-soc@vger.kernel.org>; Mon, 20 Dec 2021 11:55:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1640001336;
        bh=toOeqdy9uQSYnwOmuCCMP7VCCN8CJiS3LeSVrO9Suis=;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version;
        b=wER4aBeAydVTJdAGk4emSBf1/bVeu7jBKe3n7J9o3IemU4y4x5b2B266Llp8faxn7
         VBnX4BsGBQUmwbQx8DlvSHwevks5i4s+DMGUdNbqzYXetL7VrvEA27PUFJYX3De3AU
         4Dzx+boGeo8eTQ0R3YPQ0m1r3CWEuyALuTZBgDzlJhrYLClp2Y4GUbpqzAXYoiq553
         AVuPlgP20PuG5eaEHfRqCdjeoVcE281LNxxLAaP3VCRQoKOT1sNE+GLFSY309yrfG0
         P9TJdaJOQIzo2FSRXCEK6LV0ASehOoE1CXDNn90WeA6YcyTIkQEtqI11/wO3BcJCo0
         XNHxmlh30i33w==
Received: by mail-lf1-f71.google.com with SMTP id 28-20020ac24d5c000000b00425c507cfc0so1585504lfp.20
        for <linux-samsung-soc@vger.kernel.org>; Mon, 20 Dec 2021 03:55:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=toOeqdy9uQSYnwOmuCCMP7VCCN8CJiS3LeSVrO9Suis=;
        b=tUgBZIDo3ZOBpJf8ITAYGqk/mjIUMZvT0iRnr3V4My3s7VZHgQgk2hsISUXlA3dCxa
         bAAnsak4WSOQgMizWq3gCbuTHkF+ojp+/K6l7vk5K5PNLedmkFTW5lY4FEDfRXyu5vtG
         yc9qdswkQqwQY01cG8GI7K5cYooJS4QvXD77FjJIuhV5hk3PeZpVM1ZG5IkBNrEfQQlH
         0dPMHiAZkk2AADksaXKrmsrVgk8iZNCiNgO1Eu6K7LOQse0RoeCg1MiSmQlb9HnmG08I
         5oi4/4kGJxfEa5X9B7tKrFBaISCFlO60AoBHaJy5/YWX26lvr/dyliISjcJbws0xdr/5
         DXrQ==
X-Gm-Message-State: AOAM533ZVyIic/MVuXnjmdmEkA0O5dw4HQ/sAw8gDAFolXZhN6yId+Ji
        vTXozqzs7HQWwVC2hjYStOheEtuNVGZs1q2oeHuhzQhGj0QBo7PpKDHuKkgYgEG5/hpghnd255H
        wwtoF8vO1rVrtGJYtlibssMqfd3i6Aq+rWgQ9Qx6ZHtzM7L+A
X-Received: by 2002:a2e:860e:: with SMTP id a14mr14714119lji.67.1640001336428;
        Mon, 20 Dec 2021 03:55:36 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzqcyC9yQY5wCTjgw0YN2+mTfZbYV2uSnGv31jQVsI4zyIsitWLPMpFJTQFiX7+xP/fh9EnqQ==
X-Received: by 2002:a2e:860e:: with SMTP id a14mr14714102lji.67.1640001336271;
        Mon, 20 Dec 2021 03:55:36 -0800 (PST)
Received: from krzk-bin.lan (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
        by smtp.gmail.com with ESMTPSA id n2sm2523746ljq.30.2021.12.20.03.55.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Dec 2021 03:55:35 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>,
        arm@kernel.org, soc@kernel.org
Cc:     Sam Protsenko <semen.protsenko@linaro.org>,
        Chanho Park <chanho61.park@samsung.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>
Subject: [GIT PULL 4/6] ARM: samsung: for v5.17
Date:   Mon, 20 Dec 2021 12:55:28 +0100
Message-Id: <20211220115530.30961-3-krzysztof.kozlowski@canonical.com>
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

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-soc-5.17

for you to fetch changes up to 3ac5f9db26bb7a227ccbf160c36a5567b5394299:

  ARM: samsung: Remove HAVE_S3C2410_I2C and use direct dependencies (2021-11-21 17:46:18 +0100)

----------------------------------------------------------------
Samsung mach/soc changes for v5.17

1. Minor fixes for S3C platforms.
2. Remove HAVE_S3C2410_I2C Kconfig symbol - not really useful.

----------------------------------------------------------------
Arnd Bergmann (1):
      ARM: s3c: add one more "fallthrough" statement in Jive

Krzysztof Kozlowski (1):
      ARM: s3c: include header for prototype of s3c2410_modify_misccr

Sam Protsenko (1):
      ARM: samsung: Remove HAVE_S3C2410_I2C and use direct dependencies

 arch/arm/Kconfig                  |  1 -
 arch/arm/mach-exynos/Kconfig      |  1 -
 arch/arm/mach-s3c/Kconfig.s3c64xx |  1 -
 arch/arm/mach-s3c/gpio-samsung.c  |  1 +
 arch/arm/mach-s3c/mach-jive.c     |  1 +
 arch/arm/mach-s5pv210/Kconfig     |  1 -
 drivers/i2c/busses/Kconfig        | 10 ++--------
 7 files changed, 4 insertions(+), 12 deletions(-)

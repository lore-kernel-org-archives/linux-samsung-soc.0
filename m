Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5FDA1C433EF
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 20 Dec 2021 11:55:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232126AbhLTLzg (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 20 Dec 2021 06:55:36 -0500
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:59376
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231644AbhLTLzg (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 20 Dec 2021 06:55:36 -0500
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com [209.85.167.70])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 1FA823F32C
        for <linux-samsung-soc@vger.kernel.org>; Mon, 20 Dec 2021 11:55:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1640001335;
        bh=wmQkxgphrK4eSzvvYZb7picZLOO5tZUm1QhLP98g8vw=;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version;
        b=pWv3sdcmcZY24xV83545NmPQP0PrMja33LfTDDhAS/I09ER68a5iQeZXxvbo3vzos
         r7FnoCy+stO8UN5nm0LFvGA/SWvBa96wfdXFtdH2EbMvqAzNxLP4hT0yszRk0Ies0g
         G3g/RovbExxPPsc6O2wMlSBWhA3cbX0SjZxq2osXkBw4CDA70Ytt0Q9x3j485YGOO6
         9z0UbsrpHEjtNFgTzyB5rkLVzK7xjptbDXbED0l85hIJ1mABWCtgFsnMJmwOgl+DIZ
         B7UJHn4kSQNN8s7V4EfYMLyVxEc3+Q3ae7doUeKJsBLsuLHUcW/a10NVIQqpWG77DJ
         Wcd7m2xg3iLgw==
Received: by mail-lf1-f70.google.com with SMTP id i16-20020a056512319000b00425efb1c65eso765872lfe.5
        for <linux-samsung-soc@vger.kernel.org>; Mon, 20 Dec 2021 03:55:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=wmQkxgphrK4eSzvvYZb7picZLOO5tZUm1QhLP98g8vw=;
        b=f9PC+7IixaV34oLl9bKoY+Agcamjz8cn8/jUd4u+iD1K17kNnucFKEND7ulCTFvNoa
         hQmNqYOml7Cc9Lnq7VN4PFIgmwhkJZSMR1Wbxa7+RkCOi0VRYvbrZm5G80i3PpR1oDNo
         CvI4bCtnMMMPgety6ZZg0sApM/iobvsXurPAezo0G4snnLtffdD54w1LSx0rYt8qDo5c
         FLPjkAfsPZKSeztMgJK2Gj5URjZhQww7suClJzlLyqeu58UcKnLBMEqNeqQ8qkntBngQ
         9nTTaOdhG1xGNRB3s9FSwadM7moMBIKUCRoPkzCbqlIw5XLkNFpOgKMhWXXbVGSNNqMr
         TgOw==
X-Gm-Message-State: AOAM533G5RbWYuPWw2r9rGffLKZ7Zv77qt2v5Op4z3hmn/lyfOfUJ9Og
        /cixcdcZGW8WTjNotGrslRhgfQsYTolIuOg1W7LUzPZvvM0x0WeQnYpWkI57OqZjUUf7Ul5ilzR
        1EYh3lMaUUCBdzWei9MGDL07xWHnDOGZvfjQCmabrvrD5bPza
X-Received: by 2002:a2e:94d7:: with SMTP id r23mr13742779ljh.11.1640001333921;
        Mon, 20 Dec 2021 03:55:33 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx4pOCUOSS32zHR96WEP/TLPmxEy9A2PeWFDvgVU+Jy9Y/NtOqa5tk0sidYan4xX0D45X6FMw==
X-Received: by 2002:a2e:94d7:: with SMTP id r23mr13742763ljh.11.1640001333766;
        Mon, 20 Dec 2021 03:55:33 -0800 (PST)
Received: from krzk-bin.lan (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
        by smtp.gmail.com with ESMTPSA id n2sm2523746ljq.30.2021.12.20.03.55.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Dec 2021 03:55:33 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>,
        arm@kernel.org, soc@kernel.org
Cc:     Sam Protsenko <semen.protsenko@linaro.org>,
        Chanho Park <chanho61.park@samsung.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>
Subject: [GIT PULL 2/6] ARM: dts: samsung: for v5.17
Date:   Mon, 20 Dec 2021 12:55:26 +0100
Message-Id: <20211220115530.30961-1-krzysztof.kozlowski@canonical.com>
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

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-dt-5.17

for you to fetch changes up to 29bf0ff5ae18ad1a6dd183569cc097e578052c57:

  ARM: dts: exynos: Rename hsi2c nodes to i2c for Exynos5260 (2021-12-06 09:29:01 +0100)

----------------------------------------------------------------
Samsung DTS ARM changes for v5.17

1. Fix Bluetooth GPIO on GT-I9100.
2. Minor improvements and dtschema fixes.

----------------------------------------------------------------
Paul Cercueil (2):
      ARM: dts: exynos: Fix BCM4330 Bluetooth reset polarity in I9100
      ARM: dts: exynos: Use interrupt for BCM4330 host wakeup in I9100

Sam Protsenko (1):
      ARM: dts: exynos: Rename hsi2c nodes to i2c for Exynos5260

 arch/arm/boot/dts/exynos4210-i9100.dts | 7 +++++--
 arch/arm/boot/dts/exynos5260.dtsi      | 8 ++++----
 2 files changed, 9 insertions(+), 6 deletions(-)

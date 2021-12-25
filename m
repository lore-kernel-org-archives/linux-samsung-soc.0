Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98A76C433EF
	for <linux-samsung-soc@archiver.kernel.org>; Sat, 25 Dec 2021 10:41:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231443AbhLYKlh (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sat, 25 Dec 2021 05:41:37 -0500
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:52790
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229728AbhLYKlg (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sat, 25 Dec 2021 05:41:36 -0500
Received: from mail-lj1-f199.google.com (mail-lj1-f199.google.com [209.85.208.199])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id B8F263F163
        for <linux-samsung-soc@vger.kernel.org>; Sat, 25 Dec 2021 10:41:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1640428895;
        bh=QauqV2pTGxSKDYX2CC7YbyGe29QyyH/cOCLamRKi74c=;
        h=From:To:Cc:Subject:Date:Message-Id:MIME-Version;
        b=k6RSmyukQKrar1hdhfhDJ5N6bWvPhaQAna8hnJgPSfvuiLG61Z8b7a4VMYSMxn+CL
         mbymK63MwA6w4fdgWU1WlQrS0IQ33wNL52TQvi+nhqzD4b1UFLOIyW6l7HSEexVCeE
         Ow/MHvnglv+SRqUnUfRWpm2V3nRnxwMxOPmPFjtHZ712e4ABMqvufjXI6c4Nuix/KG
         +kQMycqGba24nFXySx+fhr8T6EtXzrxzDNASTwn5NlNL5fpIUC6tjGn3pa+wby15GP
         FlyWsH/LkOJWKyMPsDFou4N+E38Kn3kqapvJSe9ZcdRgu0xtPe1RbyMtSKb99HjSnw
         y5GCzAFEfiLGg==
Received: by mail-lj1-f199.google.com with SMTP id w16-20020a05651c103000b00218c9d46faeso2889466ljm.2
        for <linux-samsung-soc@vger.kernel.org>; Sat, 25 Dec 2021 02:41:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=QauqV2pTGxSKDYX2CC7YbyGe29QyyH/cOCLamRKi74c=;
        b=KtfGlThlwmCnO+WXwjib+hxRyJR5lS+jOTzX87tWpE5EOpkrqTTDx6K5Ox+VwNgaYm
         0F29FXpOeUG4P6+62aO09U9IDDHi2TgTvpNSDruglNOXfbXTtH9eCw0P47yhIks6hOaY
         8TwcGiqP7roJe/jM8VXhBAHetRtf+NojRZx+2xQzjGGOmAOPJUGEez5Wb7KdDO386KQi
         RNIh34L2VQIkjCi0eKEaVgk8QABwDJPpS+FELPu9wxRMHBu3lKfCz1135j8IqWKBApIt
         H2mMm9OdMK5uInldhYIWWzewB/GB6gLRry53x+lMkEEl5kodDPzROBONn1TEEdVCbRVL
         w6xQ==
X-Gm-Message-State: AOAM532ON4Ji79lbrbSqp/ZhqErrIhIQCJA7wpbu3Zcsy7zmtoKM0jEI
        C+OwWEoEV6AWPYTAW9lmzlB7V+S53QIgGvt7eX9WcCYXatpZ8K3bCMNlPYETCppSB5YkeiEIhx2
        I0x0wPvXHa0Bl6rtOhaI/c29JQ7Tp9CV+ZffqZR2+N9BBL5tk
X-Received: by 2002:a2e:9d4:: with SMTP id 203mr3998872ljj.437.1640428895150;
        Sat, 25 Dec 2021 02:41:35 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw+fdyArzWCtOfCrFbRkFIfMjOff+PenYaeghN2vyX7RnRFogTvS0/Oy2lypvtzNtOU6hdlYA==
X-Received: by 2002:a2e:9d4:: with SMTP id 203mr3998847ljj.437.1640428894858;
        Sat, 25 Dec 2021 02:41:34 -0800 (PST)
Received: from krzk-bin.lan (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
        by smtp.gmail.com with ESMTPSA id e12sm1077330lfr.179.2021.12.25.02.41.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Dec 2021 02:41:34 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Sylwester Nawrocki <snawrocki@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>
Subject: [GIT PULL] pinctrl: samsung: drivers for v5.17
Date:   Sat, 25 Dec 2021 11:41:29 +0100
Message-Id: <20211225104129.56077-1-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi Linus,

Samsung stuff for v5.17.

Best regards,
Krzysztof


The following changes since commit fa55b7dcdc43c1aa1ba12bca9d2dd4318c2a0dbf:

  Linux 5.16-rc1 (2021-11-14 13:56:52 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/pinctrl/samsung.git tags/samsung-pinctrl-5.17

for you to fetch changes up to a382d568f144b9e533ad210117c6c50d8dbdcaf1:

  pinctrl: samsung: Use platform_get_irq_optional() to get the interrupt (2021-12-25 11:18:06 +0100)

----------------------------------------------------------------
Samsung pinctrl drivers changes for v5.17

1. Add support for Exynos7885.
2. Drop usage of platform_get_resource().

----------------------------------------------------------------
David Virag (2):
      dt-bindings: pinctrl: samsung: Document Exynos7885
      pinctrl: samsung: Add Exynos7885 SoC specific data

Lad Prabhakar (1):
      pinctrl: samsung: Use platform_get_irq_optional() to get the interrupt

Wei Yongjun (1):
      pinctrl: samsung: Make symbol 'exynos7885_pin_ctrl' static

 .../bindings/pinctrl/samsung-pinctrl.txt           |  1 +
 drivers/pinctrl/samsung/pinctrl-exynos-arm64.c     | 81 ++++++++++++++++++++++
 drivers/pinctrl/samsung/pinctrl-samsung.c          | 11 +--
 drivers/pinctrl/samsung/pinctrl-samsung.h          |  1 +
 4 files changed, 90 insertions(+), 4 deletions(-)

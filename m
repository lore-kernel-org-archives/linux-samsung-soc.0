Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F072C433FE
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 26 Oct 2021 09:47:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6297D610C8
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 26 Oct 2021 09:47:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234461AbhJZJtp (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 26 Oct 2021 05:49:45 -0400
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:40090
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233765AbhJZJto (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 26 Oct 2021 05:49:44 -0400
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com [209.85.167.70])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id DC9973F17C
        for <linux-samsung-soc@vger.kernel.org>; Tue, 26 Oct 2021 09:47:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1635241638;
        bh=OvY8h6gQ2XLx4TLJDVhHrNnjSYAKrKTXm/TLCkBAtZY=;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version;
        b=wI1nCkVman52HH2v1+0Emxk/6vzLjKGPxoeFUcVc0QAidcsoWq86SQmRO2nSFPMoC
         UUgnubYsL8fKfJSD3Tni59Dt9HdtlfX/W1vbeARDPo/EAX2zoO/BsWbmcGhUOkdayZ
         6drcbjdnnYSOZNRKzTV2RzN5awIjkk3rRQ21v5VADvWEHkiTQgAh/patX0POoz6MDb
         6ZGdfnj5ZVpVp/Q3TBsNO/HvLxFaEyfLsZPVGxxVACmLcddmfw/14nbmoWtG3mLXwY
         DRHyuQatrWhNTrF4LpgVKRFNdIkjaZj+zq5PLBHf7hA87Z4Ikr662TTPWTZlPtK27f
         Kqubm05c9ifYA==
Received: by mail-lf1-f70.google.com with SMTP id m16-20020a056512115000b003fdb79f743fso6050672lfg.16
        for <linux-samsung-soc@vger.kernel.org>; Tue, 26 Oct 2021 02:47:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=OvY8h6gQ2XLx4TLJDVhHrNnjSYAKrKTXm/TLCkBAtZY=;
        b=iGgdEiS8rxCBVo0vcnkRopFV3/pqGGmSjIi90AbvxRpW/bPKAdhlOPNEwpIwi/3mV9
         /onuPH+bW4/UtiXcrFgOVXnJ5E1+axt9f4Nhjk97NZ5U2UcRs66Kv6wM/Nrn71LNZNSy
         Ze09hgTPs97WpM9dgBGOgWAcjeHJUCpvsAHBzSbuIx920B+40uy7FxpD0v/x6ZTT7NJE
         ShvwqmGAkVyZ2Ha987uvGAjgA8TTDbzo2b0o17XkHSyy5gBqvuXxhmfmH7be+pPoZjlB
         xvbgEQxL5QdPWZI2j3SdXdHcQaVBe3ayfGtZ/3Igbk5dHw83uYMnrF7ksrT5mMhFRgxM
         OV+Q==
X-Gm-Message-State: AOAM530JyqodpH52k3OF2sV+vGGpI8pGT32TRX37vhP77LYh1PZDIOTQ
        DU2ujb5GbKpKKUhKy3n6NsnYoYtrtYzt0gzJL9c9rhwmsiYe6yo0VUvBdBaweMCjCOMkt/IFaqA
        l0lSnwCHN3GK5UMijmsC1S03Ohx4Q1/SadnRMV7wRYeW4AP0l
X-Received: by 2002:a05:6512:15a9:: with SMTP id bp41mr10418010lfb.552.1635241637423;
        Tue, 26 Oct 2021 02:47:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyW5YMz5Q07ZGmdN2Jxfc2u5ScIopNPNG6mpx68Wmg7E4kYJBAnPU+zL0heH2Y7f+IctqKkog==
X-Received: by 2002:a05:6512:15a9:: with SMTP id bp41mr10417987lfb.552.1635241637269;
        Tue, 26 Oct 2021 02:47:17 -0700 (PDT)
Received: from kozik-lap.lan (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
        by smtp.gmail.com with ESMTPSA id v17sm113794lfo.167.2021.10.26.02.47.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Oct 2021 02:47:16 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
List-Id: <soc.lore.kernel.org>
To:     Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>,
        arm@kernel.org, soc@kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>
Subject: [GIT PULL] ARM: samsung: s3c for v5.16
Date:   Tue, 26 Oct 2021 11:47:09 +0200
Message-Id: <20211026094709.75692-5-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211026094709.75692-1-krzysztof.kozlowski@canonical.com>
References: <20211026094709.75692-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

The following changes since commit 6880fa6c56601bb8ed59df6c30fd390cc5f6dd8f:

  Linux 5.15-rc1 (2021-09-12 16:28:37 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-soc-5.16

for you to fetch changes up to aa519471715ce73034ffaa52fc85681de31c1acf:

  ARM: s3c: Use strscpy to replace strlcpy (2021-09-20 10:13:47 +0200)

----------------------------------------------------------------
Samsung mach/soc changes for v5.16

A minor fix for theoretical issue when handling IRQ setup code errors in
S3C24xx and a cleanup for S3C64xx.

----------------------------------------------------------------
Jackie Liu (1):
      ARM: s3c: irq-s3c24xx: Fix return value check for s3c24xx_init_intc()

Jason Wang (1):
      ARM: s3c: Use strscpy to replace strlcpy

 arch/arm/mach-s3c/irq-s3c24xx.c   | 22 ++++++++++++++++++----
 arch/arm/mach-s3c/mach-mini6410.c |  2 +-
 2 files changed, 19 insertions(+), 5 deletions(-)

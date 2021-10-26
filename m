Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1743BC433FE
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 26 Oct 2021 09:47:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 009B461040
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 26 Oct 2021 09:47:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234508AbhJZJuL (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 26 Oct 2021 05:50:11 -0400
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:53924
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234985AbhJZJtv (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 26 Oct 2021 05:49:51 -0400
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com [209.85.167.70])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id A602A3FFF9
        for <linux-samsung-soc@vger.kernel.org>; Tue, 26 Oct 2021 09:47:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1635241646;
        bh=rL7wDI9BhVHC252CW+CxxpCQUhhfA8amv8WUbteCqVg=;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version;
        b=I4xrG7cFUuVFPxYscuJIyVVTvzcg0w2TXZ9iPpO1GTdWPBi9rtTUoy8oYpIWWCsQH
         al9tn1CRei6UYnZZZYyCnvtfI7LU89IeyjwYPnMSQe9jYpXS6HIXmFZGPgjTBQN9Fe
         L+aqHa97Ng7yqoLRgGJTO9coGrIBSMIugDb7evk8CzKleZ2L19OyJkKT4WE4mjqZSz
         ko/jARznL0pUyf1CgMEL/5beHYg9bgNbzBdVNzl9wv8U1rdhLJjxOaAtMK7hzecsWR
         BJHDeanz+VYP791IUyaz4FngRu0UJLq/mL8dCvviCtbyyuDfPPLyVv1Qj7f8Oi8cvI
         LboW2PRxKNOTg==
Received: by mail-lf1-f70.google.com with SMTP id z1-20020a056512308100b003ff78e6402bso5252282lfd.4
        for <linux-samsung-soc@vger.kernel.org>; Tue, 26 Oct 2021 02:47:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=rL7wDI9BhVHC252CW+CxxpCQUhhfA8amv8WUbteCqVg=;
        b=PEYO2ODw/TL8rhhtUI7bjZ07g6xsgKKHrYfh0hJtIW9IcSfAkEYqNAa7wOBXajUVN6
         +GLbLNI3MYhVZyI60tTA0f3q1+1p7Og3RjY9gUnIX6Hfue3go02xzc71wci0PaLgM2j2
         j5QnEOieT2C2JyYjYfJ3CiXYcRAHpI1vwKxDXssKWPokIFiDlAQr0zI2jMphyHbcQgPF
         wwBLqGuKuKTDOJMeSBG0HUZx3yGVp8eJdKEaUgH3A0YsZHOiGeDt1E5Sk97EkbI3npWZ
         S8yjNymZRuTJ2FfM0QMLIfA9Fn4EgelUTJWZcD8WkxoI9lc1vdEEKZ4U99rZB+BUQg0n
         Z+Yg==
X-Gm-Message-State: AOAM532bDTE+Pdqw4bG/uK7+1jzo/McZyVwjnI6Xu/CYfQ4DnOgJd7XR
        NMvmX+ZbLztA4SoZmLexPOB0Jm7zHKS+FHIepr0Pq/msh6bBPF7lnVNdQv4TuINKjXrIqOnZwgy
        I9D3O7UwT71jcRpe++c5WpKVbw7W4ek7DsvngVGeZqFEXw1o4
X-Received: by 2002:a2e:a451:: with SMTP id v17mr25454350ljn.407.1635241645484;
        Tue, 26 Oct 2021 02:47:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyj15dtEVfN26R0cv7huGEYK/rYbVAl8R0+VUld7zFjW27HL1TfRHGuG6Mr78Cler2U3kJh2A==
X-Received: by 2002:a05:6512:1190:: with SMTP id g16mr21983643lfr.609.1635241635178;
        Tue, 26 Oct 2021 02:47:15 -0700 (PDT)
Received: from kozik-lap.lan (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
        by smtp.gmail.com with ESMTPSA id v17sm113794lfo.167.2021.10.26.02.47.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Oct 2021 02:47:14 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
List-Id: <soc.lore.kernel.org>
To:     Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>,
        arm@kernel.org, soc@kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>
Subject: [GIT PULL] ARM: dts: samsung: dts for v5.16
Date:   Tue, 26 Oct 2021 11:47:07 +0200
Message-Id: <20211026094709.75692-3-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211026094709.75692-1-krzysztof.kozlowski@canonical.com>
References: <20211026094709.75692-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi,

On top of previous pull.

Best regards,
Krzysztof


The following changes since commit 7ec804d6025c952e3122ad7fe768178efca3300e:

  ARM: dts: exynos: use spaces instead of tabs around '=' (2021-09-30 13:45:55 +0200)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-dt-5.16-2

for you to fetch changes up to 7b06c1ad884ee80e43604ba2a0bbc5f8ef3524e1:

  ARM: dts: s5pv210: add 'chassis-type' property (2021-10-19 10:57:40 +0200)

----------------------------------------------------------------
Samsung DTS ARM changes for v5.16, part two

Add chassis-type property.

----------------------------------------------------------------
Krzysztof Kozlowski (2):
      ARM: dts: exynos: add 'chassis-type' property
      ARM: dts: s5pv210: add 'chassis-type' property

 arch/arm/boot/dts/exynos3250-rinato.dts         | 1 +
 arch/arm/boot/dts/exynos4210-i9100.dts          | 1 +
 arch/arm/boot/dts/exynos4210-trats.dts          | 1 +
 arch/arm/boot/dts/exynos4210-universal_c210.dts | 1 +
 arch/arm/boot/dts/exynos4412-i9300.dts          | 1 +
 arch/arm/boot/dts/exynos4412-i9305.dts          | 1 +
 arch/arm/boot/dts/exynos4412-n710x.dts          | 1 +
 arch/arm/boot/dts/exynos4412-p4note-n8010.dts   | 1 +
 arch/arm/boot/dts/exynos4412-trats2.dts         | 1 +
 arch/arm/boot/dts/exynos5250-snow-rev5.dts      | 1 +
 arch/arm/boot/dts/exynos5250-snow.dts           | 1 +
 arch/arm/boot/dts/exynos5250-spring.dts         | 1 +
 arch/arm/boot/dts/exynos5420-peach-pit.dts      | 1 +
 arch/arm/boot/dts/exynos5800-peach-pi.dts       | 1 +
 arch/arm/boot/dts/s5pv210-fascinate4g.dts       | 1 +
 arch/arm/boot/dts/s5pv210-galaxys.dts           | 1 +
 16 files changed, 16 insertions(+)

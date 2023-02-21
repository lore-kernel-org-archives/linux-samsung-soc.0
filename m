Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 467B5C6379F
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 21 Feb 2023 09:54:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234010AbjBUJy3 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 21 Feb 2023 04:54:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34846 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233998AbjBUJy2 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 21 Feb 2023 04:54:28 -0500
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6E6263A96
        for <linux-samsung-soc@vger.kernel.org>; Tue, 21 Feb 2023 01:53:51 -0800 (PST)
Received: by mail-ed1-x52e.google.com with SMTP id o12so15148986edb.9
        for <linux-samsung-soc@vger.kernel.org>; Tue, 21 Feb 2023 01:53:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nLkpu34r64N6jTLmLzho5Nqw5btLUj/JsxhXvl09Gow=;
        b=iIs+osXHST4BSB1VRkciVNfR2QxsLxB22NvNRR4LCA89NAJaCCbT7PMh5Rg0aLNEn1
         YpOeN5hELT024Q6stpE44PP6NIZBhxTgdYiXAju7e0aXYV7l7kBontbTlG4t5Zc7RGFt
         jlZ9E/qLjHaVTHvoY7DorKkAN9TZzpLQZqaEykmmj9yMpz77nQpjm+PL9FTLOwlPavA7
         JBCDAIdSbvc6rGx4AfCEpTHpv1NztVp/gT9XXj5R3KpjXoSOJtbfsdYCLiJtfXu/mh80
         oa6HeP0G6XMIbJmxfrm7JZUsL7xYXs/OpVHjxI5C9h9YUSEZcfeR3714bflhRJZYfKm0
         1dpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nLkpu34r64N6jTLmLzho5Nqw5btLUj/JsxhXvl09Gow=;
        b=WRpr4fLTCM44STRW7Bcwe8PhGXrgwbbh8NEeEwnCDBP8o9prn+OGxYer4WxQ9cgKJL
         h11uDjqKFLRJV1iNJcevzGBtC5JNj+vLdsAro4ZH6mYHmAyhWLGcLlOBmMJ18JG5ik7a
         D1wAgULmul6OH+fKQI7SY+LlQsDXRSFXNHOtoRCYOPaTNnge4dD7Y3KeHv3U6G5RlgGu
         pJFI0Es1yi2XmH2wg+qU9GIl77KDbfxXcD/jHNKBOAGW4996giS6Yq+VIB1mHl2cPDb5
         so0ye4mMekGIndLS7izFPDXgUubwfBsCOYjJXtZ4xeydD3naKfsvnLmBtACdVCvdNHGe
         6llA==
X-Gm-Message-State: AO0yUKWU14qIu7Xzxig+VztmA65MFT5qYjgVyaiHv7N99AyX/n5eQtyI
        V34bUqVF7hTG2B21tzJqM3KWtQ==
X-Google-Smtp-Source: AK7set/xuAnKadPghcifDKVyD2HY7jmzCcqJBp4Wcvun7a7JGIOi97uDS7Yos61WL+UHeRgVTRUciw==
X-Received: by 2002:a17:906:518:b0:8b1:3554:25 with SMTP id j24-20020a170906051800b008b135540025mr11134918eja.61.1676973221885;
        Tue, 21 Feb 2023 01:53:41 -0800 (PST)
Received: from krzk-bin.. ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id 10-20020a170906328a00b008b147e4204dsm6912388ejw.32.2023.02.21.01.53.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Feb 2023 01:53:41 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>,
        arm@kernel.org, soc@kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
Subject: [GIT PULL] fixes: ARM: dts: samsung: Fixes for v6.3
Date:   Tue, 21 Feb 2023 10:53:37 +0100
Message-Id: <20230221095337.9453-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi,

Fixes for ciritical issue broken around v6.1-rc1.  Actually the issue (DTS
mistake) existed before, but in v6.1-rc1 it started to be visible and affect
thermal zones.

Best regards,
Krzysztof


The following changes since commit ceaa837f96adb69c0df0397937cd74991d5d821a:

  Linux 6.2-rc8 (2023-02-12 14:10:17 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-dt-fixes-6.3

for you to fetch changes up to a3583e92d188ec6c58c7f603ac5e72dd8a11c21a:

  ARM: dts: exynos: correct TMU phandle in Odroid XU3 family (2023-02-17 10:27:28 +0100)

----------------------------------------------------------------
Fixes for Samsung DTS ARM for v6.3

Thermal framework commit 3fd6d6e2b4e8 ("thermal/of: Rework the thermal
device tree initialization") merged in v6.1-rc1, exposed
misconfiguration of Exynos Thermal Monitoring Unit (TMU) thermal-sensors
property in DTS.  This misconfiguration in DTS was working fine before
that Thermal commit, but now all thermal zones fail to register except
the first one (CPU).  This can lead to missing cooling of a board and
eventually either emergency shutdown or damaged board.

----------------------------------------------------------------
Krzysztof Kozlowski (6):
      ARM: dts: exynos: correct TMU phandle in Exynos4
      ARM: dts: exynos: correct TMU phandle in Exynos4210
      ARM: dts: exynos: correct TMU phandle in Exynos5250
      ARM: dts: exynos: correct TMU phandle in Odroid XU
      ARM: dts: exynos: correct TMU phandle in Odroid HC1
      ARM: dts: exynos: correct TMU phandle in Odroid XU3 family

 arch/arm/boot/dts/exynos4-cpu-thermal.dtsi         |  2 +-
 arch/arm/boot/dts/exynos4210.dtsi                  |  1 -
 arch/arm/boot/dts/exynos5250.dtsi                  |  2 +-
 arch/arm/boot/dts/exynos5410-odroidxu.dts          |  1 -
 arch/arm/boot/dts/exynos5422-odroidhc1.dts         | 10 +++++-----
 arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi | 10 +++++-----
 6 files changed, 12 insertions(+), 14 deletions(-)

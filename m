Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2EFBCCA47E
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 24 Jun 2022 08:08:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230412AbiFXIIz (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 24 Jun 2022 04:08:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55042 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229522AbiFXIIf (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 24 Jun 2022 04:08:35 -0400
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1291539A
        for <linux-samsung-soc@vger.kernel.org>; Fri, 24 Jun 2022 01:07:53 -0700 (PDT)
Received: by mail-ej1-x632.google.com with SMTP id g26so3107459ejb.5
        for <linux-samsung-soc@vger.kernel.org>; Fri, 24 Jun 2022 01:07:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=X1v3jnVlP/mkMDeaBNnd4ZrW67KDgsY+NuxPosiszbo=;
        b=PG3saZzZvFqQS5YG62Jct39n09PPGFpKK4rg8yhHjZlcr58Eb688Atv5oZA8CrbMIa
         /uNLGTz1xQJYwfTfpXgQMuFWKvYwGFHQSp8/MJGYoEVhKSVTI9IrNBojSDMfI3k8wv30
         ShanHh/VUfLmncyLyecPV/uI+z65arfIS5YypW+GQMCS4uFw4w7T18Ypfx7gTzsXCF17
         wr+VH50DiCC5A+7GeXI5btP7X3TV0n+kNgZnPSbLnfPkDCQeKKbqljDLnJNCNQRZ7ulD
         rn/s65Qxdp3o87EM0q3tc1ALdI4eqEKku7fruZS4gcbXKm344QOUoaXjreRkJ8U/whjR
         tcog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=X1v3jnVlP/mkMDeaBNnd4ZrW67KDgsY+NuxPosiszbo=;
        b=4B0DjyoTbNv9Y5XTb1EntyIzxEkOdGpGWcFz2pDUq99BwRBpdo4pT3ohH+glwZ6EAl
         XxRIpiHXXmXxlZRGeANYw/ZXWaofhBCf2VUyhnLTO0uKRntnn6HGJ6pohC6sU3HekXnV
         x4NljsbEx33YOKkeyNwzDjRX9pz1T830CyNptILtDsUyXSIE8h4qIwPiu8oqUQ5PZ0h9
         ZugjFbsd+feLTewSCH1wPnJLnBXQkq/7baOiTqWGkBXhrYmy3IwHnUok/Soj1AfnQIej
         7ice8NlVbouuIQ31qdxTrpsLwt1M1nxtTD8EnJcZ1XFGcVHtIJAyg4XwPsHC0y3MA1SQ
         xNYQ==
X-Gm-Message-State: AJIora94pPSoWIOW5BhZaTBE8YIAN6rJ1Vp8sQhDjN0GKWd015hm1RX2
        Tg8axgZnHeLPqaXo0tyXNPWQ7w==
X-Google-Smtp-Source: AGRyM1s63JpgKSSIp1pY2f2HsukfHxKxAzSpCfc9LDVmJdRLcfncSWs7ufV7VmZYc5bKtYzYSCBE7g==
X-Received: by 2002:a17:907:1c0b:b0:711:cc52:2920 with SMTP id nc11-20020a1709071c0b00b00711cc522920mr12372748ejc.301.1656058071669;
        Fri, 24 Jun 2022 01:07:51 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id j15-20020aa7ca4f000000b0043559d9e8b9sm1363573edt.53.2022.06.24.01.07.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jun 2022 01:07:51 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>,
        arm@kernel.org, soc@kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
Subject: [GIT PULL 3/3] ARM: samsung: mach for v5.20
Date:   Fri, 24 Jun 2022 10:07:46 +0200
Message-Id: <20220624080746.31947-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220624080746.31947-1-krzysztof.kozlowski@linaro.org>
References: <20220624080746.31947-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

The following changes since commit f2906aa863381afb0015a9eb7fefad885d4e5a56:

  Linux 5.19-rc1 (2022-06-05 17:18:54 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-soc-5.20

for you to fetch changes up to d1065293010a010261f0b1478daff40d5a3dc241:

  ARM: s3c: Kconfig.s3c64xx: Fix indentation (2022-06-09 16:10:09 +0200)

----------------------------------------------------------------
Samsung mach/soc changes for v5.20

1. Use preferred strscpy() over strlcpy().
2. Kconfig indentation cleanup.

----------------------------------------------------------------
Juerg Haefliger (3):
      ARM: s3c: Kconfig: Fix indentation
      ARM: s3c: Kconfig.s3c24xx: Fix indentation and replace some tabs
      ARM: s3c: Kconfig.s3c64xx: Fix indentation

XueBing Chen (1):
      ARM: s3c: Use strscpy to replace strlcpy

 arch/arm/mach-s3c/Kconfig         | 14 +++++++-------
 arch/arm/mach-s3c/Kconfig.s3c24xx | 26 ++++++++++++--------------
 arch/arm/mach-s3c/Kconfig.s3c64xx | 16 ++++++++--------
 arch/arm/mach-s3c/mach-mini2440.c |  2 +-
 4 files changed, 28 insertions(+), 30 deletions(-)

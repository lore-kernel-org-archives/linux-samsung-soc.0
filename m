Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1552C47082
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 26 May 2021 12:49:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 83C6E613F4
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 26 May 2021 12:49:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230366AbhEZMuR (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 26 May 2021 08:50:17 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:56840 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234853AbhEZMsx (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 26 May 2021 08:48:53 -0400
Received: from mail-ua1-f71.google.com ([209.85.222.71])
        by youngberry.canonical.com with esmtps  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.93)
        (envelope-from <krzysztof.kozlowski@canonical.com>)
        id 1llswT-0000u1-LI
        for linux-samsung-soc@vger.kernel.org; Wed, 26 May 2021 12:47:21 +0000
Received: by mail-ua1-f71.google.com with SMTP id k17-20020ab071510000b02902351d1972d8so696048uao.19
        for <linux-samsung-soc@vger.kernel.org>; Wed, 26 May 2021 05:47:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=O/UCsmH3hl4IpqKUJA4a+70Zw+Sf6AD7w/Z6UKUd60g=;
        b=r4PTVP/I7CxfVsTPSVhsFAp3yQt9/mTHd9PyqCJHqX+ixluFy6P9xzkqYf/01zx/k5
         4i+qX5t4CDojNr7KwUZVRpycEneLuQChLmvoMo1u+Ie9McEhrB3yPFgTZbflof8hkEdy
         WCjxHthJaQftulvBP817oBSuBxda+7EVZ690+FBK6kELZaL5io51vNHpDJVkvDuZcv4A
         vsz6xK536BYAVj6gglo/7d6Db4+KJotpJghQBRj8BGMsLJeIb/fhrYXxamee1mMhxFJm
         Oj6lQ/ZbNDC3ho9tGXRAtxS4kzjhFmpCS64gZoIX42dGh/Vb1d6rBTlsJpJdEKvL5m6h
         ehiw==
X-Gm-Message-State: AOAM531yylKMOmhEY31Bb3xh+ByIOvNkORwPUu4WkwWbvz6RzEx33CKn
        StmBFI4rXTEBJLAY/eNQLAj6/Uo4eLGfMDCXaWLWW4T8uRfeT1D8SMVviNSs4Y9Je6J509VA/Sy
        OqZAzyFbHCB3kNWMVe4bJqR+K8i3OJL77jS9fDFiq6FdlL5UH
X-Received: by 2002:a67:ea98:: with SMTP id f24mr32326332vso.58.1622033240417;
        Wed, 26 May 2021 05:47:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzncV7KUF7nlI+xDOZ2Hh0jrvt9tlTaxUB/9/ZQ88phvVB/gpuC8OhttWrjIE2/mvfwYc6tAw==
X-Received: by 2002:a67:ea98:: with SMTP id f24mr32326315vso.58.1622033240219;
        Wed, 26 May 2021 05:47:20 -0700 (PDT)
Received: from localhost.localdomain ([45.237.48.3])
        by smtp.gmail.com with ESMTPSA id c126sm875817vkh.47.2021.05.26.05.47.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 May 2021 05:47:19 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Lee Jones <lee.jones@linaro.org>,
        Support Opensource <support.opensource@diasemi.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Tony Lindgren <tony@atomide.com>, linux-kernel@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org, linux-omap@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [RESEND PATCH v2 00/13] Simplify + drop board file support for Samsung PMIC
Date:   Wed, 26 May 2021 08:46:58 -0400
Message-Id: <20210526124711.33223-1-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi Lee,

This is the resend of two previous series, combined together as the
latter depends on the first:
https://lore.kernel.org/lkml/20210420113929.278082-1-krzysztof.kozlowski@canonical.com/
https://lore.kernel.org/lkml/20210420170118.12788-1-krzysztof.kozlowski@canonical.com/

Everything rebased on latest next.

This also includes two MFD "Correct kerneldoc" patches which seems to be
still valid, even though you mentioned they were fixed.


The Samsung PMIC drivers since long time are used only on devicetree
platforms (Samsung Exynos) and there are no users with board files.

Drop the support for board files entirely and depend on OF for matching.
This makes the code smaller and simpler.

Best regards,
Krzysztof

Krzysztof Kozlowski (13):
  mfd: max8997: Simplify getting of_device_id match data
  mfd: max8998: Simplify getting of_device_id match data
  mfd: da9052: Simplify getting of_device_id match data
  mfd: da9062: Simplify getting of_device_id match data
  mfd: sec: Simplify getting of_device_id match data
  mfd: wm831x: Correct kerneldoc
  mfd: twl: Correct kerneldoc
  mfd: sec: Drop support for board files and require devicetree
  mfd: sec: Remove unused cfg_pmic_irq in platform data
  mfd: sec: Remove unused device_type in platform data
  mfd: sec: Remove unused irq_base in platform data
  mfd: sec: Enable wakeup from suspend via devicetree property
  mfd: sec: Remove unused platform data members

 drivers/mfd/Kconfig              |  1 +
 drivers/mfd/da9052-i2c.c         |  9 +---
 drivers/mfd/da9062-core.c        | 13 ++----
 drivers/mfd/max8997.c            |  9 ++--
 drivers/mfd/max8998.c            |  8 ++--
 drivers/mfd/sec-core.c           | 70 +++++---------------------------
 drivers/mfd/sec-irq.c            |  4 +-
 drivers/mfd/twl-core.c           |  4 +-
 drivers/mfd/wm831x-core.c        |  2 +-
 include/linux/mfd/samsung/core.h | 33 ---------------
 10 files changed, 29 insertions(+), 124 deletions(-)

-- 
2.27.0


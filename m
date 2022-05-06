Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F748C433EF
	for <linux-samsung-soc@archiver.kernel.org>; Fri,  6 May 2022 08:14:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1383700AbiEFISb (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 6 May 2022 04:18:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34416 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1389830AbiEFISa (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 6 May 2022 04:18:30 -0400
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F08068313
        for <linux-samsung-soc@vger.kernel.org>; Fri,  6 May 2022 01:14:47 -0700 (PDT)
Received: by mail-wm1-x32a.google.com with SMTP id l62-20020a1c2541000000b0038e4570af2fso3904409wml.5
        for <linux-samsung-soc@vger.kernel.org>; Fri, 06 May 2022 01:14:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=xpOcDZG3VsHKMRkqd+A+g34iqZmhtRfpCGSjJhC44/I=;
        b=mylpU264xNwSuqHcl7TSS/pfgkflTa4CM+C1PTNplNI4s8FdOsBhLpH14M/HeTEbhi
         DK83CbrTfTd84dHPWLP7m+ZkI/IX3g/XGZkSMECMEsjXZW3xj9qFbJ8dBICPxhAoneJM
         7Rz9F5552e5TRXaOhNuQ+JtNTNtPJFZ/1P0rnW7N+L2JMeQo7EIhEDYM+63BHcPbhR5C
         uzW/u9Xabsn55Z2X850E7RdPqfdQzDpjWlMLkHCl7jyZkdAK8Vb6Z2HjoyEz+1mxj+KU
         Op4mLdD0dbOY0lK6BufdUL9I6sYj1cJ0wwp78BOPHW0+eAviXrsoNnv2m5EDF5ksMuNs
         hfBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=xpOcDZG3VsHKMRkqd+A+g34iqZmhtRfpCGSjJhC44/I=;
        b=CB36jWdsUyxVEF92Rpo3HG4UfrBDt0cCSGrJdxbQr9X3VR4DirwD6Cjii/RZYpo4ja
         7d8k5jA4cQaqXz0fqID1fNh4bieTk86CzGRvRUnUHe+EFic8meGwYfFG8Ve2mOIzp/AM
         LPSHC97vWNkic8t+Jg5iQ4+tgc/jDnos9+6iR9G5dVr1Rc4xlXxVoXvnv8EC0N80G3hg
         0kAVZNrqlI5tQppB8Ryr+gUEEzlim9njUJacxzYDI6OeH0RG7QZeVR0SkfyLXiUBJ1fW
         ztimUnjIzLaV4F3nzT7UpRE7gK4quhSj6Yh4gEZJbU1H7HigCYXgKaqFCxW8usYNL7hT
         TpOw==
X-Gm-Message-State: AOAM5302zvkOclpBhtTRXPlPDcWZzVkI//k4iyMa0/O9aNDvt5pjhPIC
        t9FuhEbD87Jzwtp7ontxsjaafQ==
X-Google-Smtp-Source: ABdhPJwMarLKCW6zCDyx+rdB95U5y3SehGvBMfkYKv6TJHd5tJPqliYy21laG2ZaVGuCUNYuWEsNRA==
X-Received: by 2002:a05:600c:3393:b0:394:160a:18aa with SMTP id o19-20020a05600c339300b00394160a18aamr8762137wmp.58.1651824886077;
        Fri, 06 May 2022 01:14:46 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id c14-20020adffb0e000000b0020c6fa5a797sm3059657wrr.91.2022.05.06.01.14.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 May 2022 01:14:45 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>,
        arm@kernel.org, soc@kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
Subject: [GIT PULL 3/6] ARM: drivers: samsung: for v5.19
Date:   Fri,  6 May 2022 10:14:35 +0200
Message-Id: <20220506081438.149192-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220506081438.149192-1-krzysztof.kozlowski@linaro.org>
References: <20220506081438.149192-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi,

Actually only binding changes.

Best regards,
Krzysztof


The following changes since commit 3123109284176b1532874591f7c81f3837bbdc17:

  Linux 5.18-rc1 (2022-04-03 14:08:21 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-drivers-5.19

for you to fetch changes up to 5fe580196dd9b7d8eb2a99629055bb4ffa00f262:

  dt-bindings: timer: exynos4210-mct: describe known hardware and its interrupts (2022-04-24 16:53:46 +0200)

----------------------------------------------------------------
Samsung SoC drivers changes for v5.19

Make MCT and USI bindings stricter by describing expected interrupts
per variant and expected child node.

----------------------------------------------------------------
Krzysztof Kozlowski (2):
      dt-bindings: soc: samsung: usi: refer to dtschema for SPI
      dt-bindings: timer: exynos4210-mct: describe known hardware and its interrupts

 .../bindings/soc/samsung/exynos-usi.yaml           |  2 +-
 .../bindings/timer/samsung,exynos4210-mct.yaml     | 67 +++++++++++++++++++++-
 2 files changed, 65 insertions(+), 4 deletions(-)

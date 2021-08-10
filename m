Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 260E8C4338F
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 10 Aug 2021 09:32:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 090A660EBD
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 10 Aug 2021 09:32:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239058AbhHJJcv (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 10 Aug 2021 05:32:51 -0400
Received: from smtp-relay-canonical-0.canonical.com ([185.125.188.120]:42572
        "EHLO smtp-relay-canonical-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S236507AbhHJJcu (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 10 Aug 2021 05:32:50 -0400
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com [209.85.218.72])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPS id D6CCA40C84
        for <linux-samsung-soc@vger.kernel.org>; Tue, 10 Aug 2021 09:32:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1628587947;
        bh=/TjUAhhwvSRFuslwguP2QiddIzNChxvR3o7MxjSQJ14=;
        h=From:To:Cc:Subject:Date:Message-Id:MIME-Version;
        b=P3dMRhJ94z4SbEeqHGR2UwlFLPPStVsQmsleniCRwWm7MjWbX0yganjB3ITo7VugD
         svZy0IpdGcGFLD2Ld4820VkvvU3PnXDXmT++JhmVnzNpfQ0EU6x8fvXR2gLby5mpKE
         EuwcKSEL2+Id6neDf7wh71ETtu7mIVHlJ5zUyLszTllL8aUVHMOOgdMzdcDJJ1VE3J
         C7d6/vmLEev1U0szgcRSUSfxMcbIrTDjV62rK03VkbFSxj2rrg0PyLUpJCyKL/80AS
         OETUN1G81mGKUcyvpqUyi+Us3g+t6iOlKcvvXX9SLWbgzd9qclTj+a9OmYQuoJJ5Me
         8rg+/XTH1wvcg==
Received: by mail-ej1-f72.google.com with SMTP id k21-20020a1709062a55b0290590e181cc34so5381657eje.3
        for <linux-samsung-soc@vger.kernel.org>; Tue, 10 Aug 2021 02:32:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/TjUAhhwvSRFuslwguP2QiddIzNChxvR3o7MxjSQJ14=;
        b=gVOYsV+A8eGrue1r7gbqYlJ+MYaRN+ETMgEfvsvh7YRVWfwbhxF/UzfJn6ncN6REHf
         3xK9Zmh3e59htfCdqpZtTSIH+QFd6HBCd1qLmL6++m3x7g8kqUZldzOKGOZiKBdEEoVa
         bsVMpuzNMl1IXcJDtjh3pcdcatDQgpRk+WrdJwnr1KGGn2xPAk7Nv9OOY1VWIfdqOr1e
         gm922TNbcfnTmYDxXfQ7zj5PMAYIQXgaQAc+INSg4hAxjGoEb0+Maw6Ctf9CLOwfwXWv
         xclTlTqGUAEt6hJe64p8NTqWoMB5oPJe3UPkpWWaFWC/uoja4yv16lOaUmz5BDNWdLG2
         6uZg==
X-Gm-Message-State: AOAM533VNabqSAwYPxfUk0Qwdn3aQUmfWkOvb9/Yg6F+vpEx2CfDCYkB
        U0YRXajHUFXojRG4+EYwn+CdgFbSmpvkGSyQDHZy0vUlsjd1iV//JAHyy0BevFpBQHcBj4MsQe2
        fCU5/73gUnmdULaUw5z5mE/wHbFQv+zuTHXGTXpx498LBqLQb
X-Received: by 2002:a05:6402:796:: with SMTP id d22mr3886395edy.57.1628587946811;
        Tue, 10 Aug 2021 02:32:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxTDejpsnySJ5hI4EiBZYSmNUdOwiCDaSglUDL7QJIhM3zKW5UGTy4wbFQDlfcb7RdEzzFCRA==
X-Received: by 2002:a05:6402:796:: with SMTP id d22mr3886364edy.57.1628587946598;
        Tue, 10 Aug 2021 02:32:26 -0700 (PDT)
Received: from localhost.localdomain ([86.32.42.198])
        by smtp.gmail.com with ESMTPSA id q21sm5117606ejs.43.2021.08.10.02.32.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Aug 2021 02:32:26 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Sam Protsenko <semen.protsenko@linaro.org>
Subject: [PATCH v2 0/8] dt-bindings: clock: samsung: convert to dtschema
Date:   Tue, 10 Aug 2021 11:31:37 +0200
Message-Id: <20210810093145.26153-1-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi,

Combined patchset of separate v1 sets:

https://lore.kernel.org/linux-samsung-soc/20210809120544.56596-1-krzysztof.kozlowski@canonical.com/T/#t
https://lore.kernel.org/linux-samsung-soc/20210809130935.80565-1-krzysztof.kozlowski@canonical.com/T/#t
https://lore.kernel.org/linux-samsung-soc/20210809135942.100744-1-krzysztof.kozlowski@canonical.com/T/#t

Changes since v1:
1. Patch 7/8: include header to fix clock IDs error in example.

Best regards,
Krzysztof


Krzysztof Kozlowski (8):
  dt-bindings: clock: samsung: convert Exynos5250 to dtschema
  dt-bindings: clock: samsung: add bindings for Exynos external clock
  dt-bindings: clock: samsung: convert Exynos542x to dtschema
  dt-bindings: clock: samsung: convert Exynos3250 to dtschema
  dt-bindings: clock: samsung: convert Exynos4 to dtschema
  dt-bindings: clock: samsung: convert Exynos AudSS to dtschema
  dt-bindings: clock: samsung: convert S5Pv210 AudSS to dtschema
  MAINTAINERS: clock: include S3C and S5P in Samsung SoC clock entry

 .../bindings/clock/clk-exynos-audss.txt       | 103 ------------------
 .../bindings/clock/clk-s5pv210-audss.txt      |  53 ---------
 .../bindings/clock/exynos3250-clock.txt       |  57 ----------
 .../bindings/clock/exynos4-clock.txt          |  86 ---------------
 .../bindings/clock/exynos5250-clock.txt       |  41 -------
 .../bindings/clock/exynos5420-clock.txt       |  42 -------
 .../clock/samsung,exynos-audss-clock.yaml     |  79 ++++++++++++++
 .../bindings/clock/samsung,exynos-clock.yaml  |  87 +++++++++++++++
 .../clock/samsung,exynos-ext-clock.yaml       |  46 ++++++++
 .../clock/samsung,s5pv210-audss-clock.yaml    |  77 +++++++++++++
 MAINTAINERS                                   |   4 +
 11 files changed, 293 insertions(+), 382 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/clock/clk-exynos-audss.txt
 delete mode 100644 Documentation/devicetree/bindings/clock/clk-s5pv210-audss.txt
 delete mode 100644 Documentation/devicetree/bindings/clock/exynos3250-clock.txt
 delete mode 100644 Documentation/devicetree/bindings/clock/exynos4-clock.txt
 delete mode 100644 Documentation/devicetree/bindings/clock/exynos5250-clock.txt
 delete mode 100644 Documentation/devicetree/bindings/clock/exynos5420-clock.txt
 create mode 100644 Documentation/devicetree/bindings/clock/samsung,exynos-audss-clock.yaml
 create mode 100644 Documentation/devicetree/bindings/clock/samsung,exynos-clock.yaml
 create mode 100644 Documentation/devicetree/bindings/clock/samsung,exynos-ext-clock.yaml
 create mode 100644 Documentation/devicetree/bindings/clock/samsung,s5pv210-audss-clock.yaml

-- 
2.30.2


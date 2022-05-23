Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90B57C433F5
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 23 May 2022 07:40:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229716AbiEWHkW (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 23 May 2022 03:40:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42122 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230143AbiEWHkT (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 23 May 2022 03:40:19 -0400
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BB5301D328
        for <linux-samsung-soc@vger.kernel.org>; Mon, 23 May 2022 00:40:17 -0700 (PDT)
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com [209.85.218.70])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 303703F1D3
        for <linux-samsung-soc@vger.kernel.org>; Mon, 23 May 2022 06:42:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1653288177;
        bh=ElcnKNUngg8XsyxDb1irNReBJTeKSXIKHCZV8bfpqcM=;
        h=From:To:Cc:Subject:Date:Message-Id:MIME-Version;
        b=IdN9ij9KhQXTvjru0ZoAxBjP95dggo2tqLm3ORh0ytDKKCzdiZoFFCwvy0DCjKPhL
         MgYPIu7nVc0n3F/TPTZZd2UozF3MZKXH+q1Pp1e1zAK0teWZCs986NpxhfhRt01WMR
         52EXXmcKJJ/jJ3enknqkCHUIRtNvDeGeX/kujL+YcZTmB9CSxUyzgC0STzvhIugf+n
         /aQFQG/HyL4ZLnTdfrL08VCzs/o/hHvqVh2nQcGf7m9q92Vkb7NOadDxKpOcX5NOzK
         QQDExWINMDCmSy6jblAByF3lePru7NfFRbO4KfZrjRepyI2gloS5Ht14sSMCVshP4o
         0b+Du3nhOl3TQ==
Received: by mail-ej1-f70.google.com with SMTP id v13-20020a170906b00d00b006f51e289f7cso5399597ejy.19
        for <linux-samsung-soc@vger.kernel.org>; Sun, 22 May 2022 23:42:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ElcnKNUngg8XsyxDb1irNReBJTeKSXIKHCZV8bfpqcM=;
        b=tLUb0T+cAJvOxLdsc2WJ+XXdwgOiErZ+fHSc/91VFqhYwtA4WVxT5FwQA1ljroCZDV
         rQnKwnv0n/iJTOgYv1Rh8mR1eD9DWFtJiBIrGNPn7fRT0uUbQ9fMkxlbXoqHcZlfDsWQ
         /VHDBUPDBmWhVLAfhFLQyt/eKCqEqapWbLWQTjuMPmas1G5oZw1xrWRIiKt9yPw9FUXc
         KZwMd/gAuz45Iw8DpZFl52kqHXcVpK//7dQfgZbhE8FZAzTzO8GgrQz/3daxOvcAvyy9
         yLfZlqanQd8S2s53HVPuT1TEdmIPajAjHr4O7+ZkJpKEWUBRnxBW6Uuoa90Qh8biDYjD
         qsHw==
X-Gm-Message-State: AOAM533nhp4E6IhcHj+QGORCGgY0z5onzY0TTOhLlEGqinhURIjgN+Kl
        OWti6tb1BuaXg4qYSez3vdo6jjkz3LGVgfuDyuGUDQ0iLSz05XQlCYRrVuQ+yBD7nqdFkf93QVN
        z2RWgCrzVx7/JTPhbjnyVg16OQtuv50PPpHpQQ1v+k3+pcvdN
X-Received: by 2002:a17:907:3f1f:b0:6fe:b40a:21f0 with SMTP id hq31-20020a1709073f1f00b006feb40a21f0mr11298522ejc.744.1653288176922;
        Sun, 22 May 2022 23:42:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJybibqjJfbfowQwaW7O5HhenR3cdlBBXdit+jG7WP/mL+1F6AIWKRTXROJ5W9mpz1+M1cLFTg==
X-Received: by 2002:a17:907:3f1f:b0:6fe:b40a:21f0 with SMTP id hq31-20020a1709073f1f00b006feb40a21f0mr11298514ejc.744.1653288176736;
        Sun, 22 May 2022 23:42:56 -0700 (PDT)
Received: from gollum.fritz.box ([194.191.244.86])
        by smtp.gmail.com with ESMTPSA id p3-20020a056402074300b0042617ba63a5sm7792416edy.47.2022.05.22.23.42.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 May 2022 23:42:56 -0700 (PDT)
From:   Juerg Haefliger <juerg.haefliger@canonical.com>
X-Google-Original-From: Juerg Haefliger <juergh@canonical.com>
To:     krzysztof.kozlowski@linaro.org, alim.akhtar@samsung.com,
        linux@armlinux.org.uk, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Juerg Haefliger <juergh@canonical.com>
Subject: [PATCH 0/3] ARM: s3c: Kconfig: Style cleanups
Date:   Mon, 23 May 2022 08:42:49 +0200
Message-Id: <20220523064252.11938-1-juergh@canonical.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

The majority of the Kconfig files use a single tab for basic indentation
and a single tab followed by two whitespaces for help text indentation.
Fix the lines that don't follow this convention.

While at it, add missing trailing comments to endif statements and replace
tabs before comments with whitespaces (which seems to be more common).

Juerg Haefliger (3):
  ARM: s3c: Kconfig: Fix indentation
  ARM: s3c: Kconfig.s3c24xx: Fix indentation and replace some tabs
  ARM: s3c: Kconfig.s3c64xx: Fix indentation

 arch/arm/mach-s3c/Kconfig         | 14 +++++++-------
 arch/arm/mach-s3c/Kconfig.s3c24xx | 26 ++++++++++++--------------
 arch/arm/mach-s3c/Kconfig.s3c64xx | 16 ++++++++--------
 3 files changed, 27 insertions(+), 29 deletions(-)

-- 
2.32.0


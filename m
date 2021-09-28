Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A7C3C433F5
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 28 Sep 2021 07:42:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6021760F4A
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 28 Sep 2021 07:42:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239295AbhI1Hnn (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 28 Sep 2021 03:43:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40720 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239099AbhI1Hnm (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 28 Sep 2021 03:43:42 -0400
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D2134C061575
        for <linux-samsung-soc@vger.kernel.org>; Tue, 28 Sep 2021 00:42:03 -0700 (PDT)
Received: by mail-pj1-x102a.google.com with SMTP id h12so3977694pjj.1
        for <linux-samsung-soc@vger.kernel.org>; Tue, 28 Sep 2021 00:42:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:from:to:cc:subject:date:message-id;
        bh=IsyJwynNv9ch1Auj0dl613hO+cW2WdGqFZdpoxNZiWY=;
        b=B3XvJzJDus2vAqGISVUzohmySABNF2fd+F06Y35x3v/6lGsCh5MoBlV4gkPppodhZY
         /kvlxJSSUnQYsheFhUTLEuuQZZX0SvuucKLJFz7RtEJXhU1hF1FaAzoVCtI6fajPNnqZ
         YGZnfu2nHAD5AqXTpx92ZQHK9YIkIq97d4pqErCB1JsEytI7c7Vy6xoVPGQ5tZkFFhhO
         1tSDDr423lTxvrXWgYKzJxTPYlOTUWMQGgujNRm4WbGnBtHf2OiFyiIqx7dBltBszn5y
         IsQnjS5BKQ9x0jonHYAPyb6HPuJUAkJsnXWmtkwTI9MxNYrdyLXUZQa/LJjO1CBzN8SK
         jySQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
        bh=IsyJwynNv9ch1Auj0dl613hO+cW2WdGqFZdpoxNZiWY=;
        b=iroq7w6eFuVdBzgp84rmbQ4q7dd6h6kmPIp2/2CbsuMTCqgTl8vA9EcXJ3HjMRrHlA
         C473HN8V6BV84mii1Wrj7MEZBbZNDHFyQ4GuU0ss3plh42tH1bUCdZ7tZmqu0gmyu2By
         UsIvQq8U7mqAKi5alpg3UFTsNBRBriy2DnGrDMjscFOB7yr7+5uFcFyoHcP+jnGZ9Msa
         1G9tPhtY4DwdrE/nJC6X6BJiHgXyigu3tOyifunq3gK5Y6HcX/Xu1jBh0cJs7UFECklr
         9tOtp+Gj7yJ5IyX+9GVVVghVFVgfi4VtLRdsZtP0rFmWke2nfRqyj5supobtPsbPpR28
         Xhng==
X-Gm-Message-State: AOAM532wVkHWciDoWfsQasweBPJAycidx2oUcvgRxatHfnbj3/ExBgzW
        FyOzZZ/+FKK8Tknb9HdE8oY+DuMSVuU=
X-Google-Smtp-Source: ABdhPJzFyeluqmsWzB4csMFXPKwe7IoeAP8YxULsyegqnNqLjUzmqQotaMAEwmTjk/H7JjxbmsTMug==
X-Received: by 2002:a17:902:bf07:b0:138:e32d:9f2e with SMTP id bi7-20020a170902bf0700b00138e32d9f2emr3746955plb.59.1632814923330;
        Tue, 28 Sep 2021 00:42:03 -0700 (PDT)
Received: from daeinki-virtual-machine.localdomain ([58.124.60.88])
        by smtp.gmail.com with ESMTPSA id a10sm19015557pfn.48.2021.09.28.00.42.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Sep 2021 00:42:02 -0700 (PDT)
Sender: Inki Dae <daeinki@gmail.com>
From:   Inki Dae <inki.dae@samsung.com>
To:     airlied@linux.ie
Cc:     dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org
Subject: [GIT PULL] exynos-drm-fixes
Date:   Tue, 28 Sep 2021 16:41:58 +0900
Message-Id: <20210928074158.2942-1-inki.dae@samsung.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi Dave,

   Just one clean up to use helper function.

Please kindly let me know if there is any problem.

Thanks,
Inki Dae

The following changes since commit 6880fa6c56601bb8ed59df6c30fd390cc5f6dd8f:

  Linux 5.15-rc1 (2021-09-12 16:28:37 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos tags/exynos-drm-fixes-for-v5.15-rc4

for you to fetch changes up to 17ac76e050c51497e75871a43aa3328ba54cdafd:

  drm/exynos: Make use of the helper function devm_platform_ioremap_resource() (2021-09-16 14:05:07 +0900)

----------------------------------------------------------------
One cleanup
- Use devm_platform_ioremap_resource() helper function instead of old
  one.

----------------------------------------------------------------
Cai Huoqing (1):
      drm/exynos: Make use of the helper function devm_platform_ioremap_resource()

 drivers/gpu/drm/exynos/exynos5433_drm_decon.c | 4 +---
 drivers/gpu/drm/exynos/exynos_drm_dsi.c       | 4 +---
 drivers/gpu/drm/exynos/exynos_drm_fimc.c      | 5 +----
 drivers/gpu/drm/exynos/exynos_drm_fimd.c      | 4 +---
 drivers/gpu/drm/exynos/exynos_drm_g2d.c       | 5 +----
 drivers/gpu/drm/exynos/exynos_drm_gsc.c       | 6 +-----
 drivers/gpu/drm/exynos/exynos_drm_rotator.c   | 4 +---
 drivers/gpu/drm/exynos/exynos_drm_scaler.c    | 4 +---
 drivers/gpu/drm/exynos/exynos_hdmi.c          | 4 +---
 9 files changed, 9 insertions(+), 31 deletions(-)

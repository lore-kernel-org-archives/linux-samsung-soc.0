Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0A7BC7EE25
	for <linux-samsung-soc@archiver.kernel.org>; Wed,  7 Jun 2023 04:34:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234009AbjFGEea (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 7 Jun 2023 00:34:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49636 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234006AbjFGEdw (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 7 Jun 2023 00:33:52 -0400
Received: from mail-yw1-x1130.google.com (mail-yw1-x1130.google.com [IPv6:2607:f8b0:4864:20::1130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 910781715
        for <linux-samsung-soc@vger.kernel.org>; Tue,  6 Jun 2023 21:31:54 -0700 (PDT)
Received: by mail-yw1-x1130.google.com with SMTP id 00721157ae682-565e6beb7aaso89242237b3.2
        for <linux-samsung-soc@vger.kernel.org>; Tue, 06 Jun 2023 21:31:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686112314; x=1688704314;
        h=message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a0XEsmkTiRF7T/aRsUjJi5Wnk1cEUWrKyChE6k+45qQ=;
        b=WWzorukRvZslY64PBtaiQHvDqs4c4C2vZAFCNzrcbzPjLDmiRHYod/gSLV5SyMWHOv
         b5rYyFy42rag5Z3hoAXz2Y926cblXpWzwoHl912koEpZ2vhkyjIAtawEQ3osASwEsGj0
         vKkFM0CB2/RAtFa6F3P4JSxn+piQKX0MQTOo6DqCHi46nVWpmNYKqEUr9r8x//szq/SM
         COd1tK8qhgr9dorDNkYmdk9OdT4QDUTyNsLT+aGEjlot0ciIlXAlfH+7oFIDJANHHzVy
         yMD/agxWUhfYM0zJTNRlk6D7Sv9Y4ckAS6hwikdgE36CvZEcg6MFRBgP53sh45kXjQ7Y
         HMpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686112314; x=1688704314;
        h=message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=a0XEsmkTiRF7T/aRsUjJi5Wnk1cEUWrKyChE6k+45qQ=;
        b=AE/wi2RdMU7d2aUL7bkLsLnu7bd9/7DX84AFM4qntlCgYtPGLnlYbFvoyPclUSkloR
         vw735fFhZ6eyZPGAS9tHl4NrS9Z9O4kZZZHP46zdYkoHW4jCysmBtRvkqfxpCmzlTBlX
         UseUV+5BMzNVzpUOf7FeMYbRO2oNU2X8AKOVDg+kQwNJSWFJVW/XgUWwgkQGpQCjzUZt
         HDfi+oZyxJi/OYJj9PWwiW+7g/x9wobYDhrqI9YV8OtEymDlsfW4LFZanGf0TWwKK2wY
         AywLbhazZZZV3/HDlIZJ43gO5TahcIcnjrd/mOpY8TlS0lcXSaeP8pnzleLVOjHmjxgW
         +BxQ==
X-Gm-Message-State: AC+VfDxnrz1g1Lt1mBeyQHB2sZ8n9PE7FYqejyZYAnRTiuN4gS2cOmqT
        ScZS0M99FSx416l01IXNTfM=
X-Google-Smtp-Source: ACHHUZ4Di2rkIBnQHjt0et0CqQeEbFrSiBddY78nKVUbp6oclEBxaPexo3Apzjo/sFZy4pmDwe8Uug==
X-Received: by 2002:a81:7156:0:b0:568:d586:77bd with SMTP id m83-20020a817156000000b00568d58677bdmr6003543ywc.1.1686112313739;
        Tue, 06 Jun 2023 21:31:53 -0700 (PDT)
Received: from daeinki-virtual-machine.localdomain ([58.124.60.88])
        by smtp.gmail.com with ESMTPSA id e4-20020aa78244000000b0064f76992905sm7508646pfn.202.2023.06.06.21.31.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jun 2023 21:31:53 -0700 (PDT)
Sender: Inki Dae <daeinki@gmail.com>
From:   Inki Dae <inki.dae@samsung.com>
To:     airlied@linux.ie, daniel@ffwll.ch
Cc:     dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org
Subject: [GIT PULL] exynos-drm-fixes
Date:   Wed,  7 Jun 2023 13:31:48 +0900
Message-Id: <20230607043148.43303-1-inki.dae@samsung.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi Dave and Daniel,

   Just two fixups to Exynos vidi and g2d drivers.

   Please kindly let me know if there is any problem.

Thanks,
Inki Dae

The following changes since commit 9561de3a55bed6bdd44a12820ba81ec416e705a7:

  Linux 6.4-rc5 (2023-06-04 14:04:27 -0400)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos tags/exynos-drm-fixes-for-v6.4-rc6

for you to fetch changes up to 48bfd02569f5db49cc033f259e66d57aa6efc9a3:

  drm/exynos: fix race condition UAF in exynos_g2d_exec_ioctl (2023-06-07 13:03:16 +0900)

----------------------------------------------------------------
Two fixups
- Fix wrong return in Exynos vidi driver.
- Fix use-after-free issue to Exynos g2d driver.

----------------------------------------------------------------
Inki Dae (1):
      drm/exynos: vidi: fix a wrong error return

Min Li (1):
      drm/exynos: fix race condition UAF in exynos_g2d_exec_ioctl

 drivers/gpu/drm/exynos/exynos_drm_g2d.c  | 2 +-
 drivers/gpu/drm/exynos/exynos_drm_vidi.c | 2 --
 2 files changed, 1 insertion(+), 3 deletions(-)

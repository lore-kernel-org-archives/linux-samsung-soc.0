Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 690FFC433FE
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 25 Feb 2022 01:40:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231247AbiBYBlY (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 24 Feb 2022 20:41:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32814 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236035AbiBYBlX (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 24 Feb 2022 20:41:23 -0500
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E0A0328B622
        for <linux-samsung-soc@vger.kernel.org>; Thu, 24 Feb 2022 17:40:48 -0800 (PST)
Received: by mail-pl1-x630.google.com with SMTP id bd1so3443214plb.13
        for <linux-samsung-soc@vger.kernel.org>; Thu, 24 Feb 2022 17:40:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:from:to:cc:subject:date:message-id;
        bh=phQZiyLejGYMxTHbFa3xsON6Zgny1a16s0pfLEAdZkM=;
        b=oiVW6KNbjFFYE1lzVrrYqB+7sjJYxbDIY5N+0p3bpHroJqMRUSvmzBBGpHVNCaxkbz
         sMYbtiQpVo+KtmjX0yT77R0lQgu7PCZapKgmgdDJ6Goo4t0o1E5N48nGi02RZUDbKIzi
         xXd0oUn6u4M4d0bBcYKYraMnYqNPCEtKrqHPuX2fVhCOQrqCZ6ZLjEoxFCihCE9adTwL
         pwpgSkUrekagtHQTYIB4/nH2WgqkEC3mrTHvUClYMj31NxXpu/DYfoeSIm/dh34HhvJ5
         5C1BSRvoL3yL+BJG4hYItge4L/3A8rl2IbrGOSoVha9fKTVkjP2su1vg0ubgh/XBFFMS
         EAjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
        bh=phQZiyLejGYMxTHbFa3xsON6Zgny1a16s0pfLEAdZkM=;
        b=z4JLzgMRm0z9c++bw6HUNPgvMX4O3HQcErkS3yOX2z585Br/n+5fy5+m7CByiuZlxh
         SKVy5LsDHa6w9GzZoUPGSIrg7icTdOveb0yVObCSs8pR3n3ujStbEobhTc/GjUW2bQTi
         pELi0mX+UZ4pkNzb1kDso8CB6qddzmeX4nVSHAg3oTmQYVJpSmqNVHXN+c2sJW2tOkdx
         uj47fy/pvdsaX2GRWGh/panh3yW+UVhF9a6emDgWPB4+MIGciU3NGIQwW9Fs3yTwXtrP
         C5/sKN61W+0Im/LmBcny9SnNUgDmhHulvEA3eKNPsA/eGfsaTBHQ1wIIelW2UUbcqU/G
         ANgQ==
X-Gm-Message-State: AOAM533FBRFa2Wyrv8jLdR7Gfu4PqH02V3QWbLroo3NnLicka/uM1N2W
        ivDNQ0yXfU0KXOqWIIB+BW0O2fmvecw=
X-Google-Smtp-Source: ABdhPJx5zYpoEwJCNB8v96rzpLBDXunQhLDTbX2ldAtWjEf32VrmXXu+ORb0mQQ6ro7onrDOFgegAw==
X-Received: by 2002:a17:90a:5213:b0:1b9:c042:3b35 with SMTP id v19-20020a17090a521300b001b9c0423b35mr867972pjh.160.1645753248286;
        Thu, 24 Feb 2022 17:40:48 -0800 (PST)
Received: from daeinki-virtual-machine.localdomain ([58.124.60.88])
        by smtp.gmail.com with ESMTPSA id ng5-20020a17090b1a8500b001b8d841f252sm515606pjb.13.2022.02.24.17.40.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Feb 2022 17:40:47 -0800 (PST)
Sender: Inki Dae <daeinki@gmail.com>
From:   Inki Dae <inki.dae@samsung.com>
To:     airlied@linux.ie, daniel.vetter@ffwll.ch
Cc:     dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org
Subject: [GIT PULL] exynos-drm-fixes for rc6
Date:   Fri, 25 Feb 2022 10:40:42 +0900
Message-Id: <20220225014042.17637-1-inki.dae@samsung.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi Dave and Daniel,

   Just fixups series.

   Ps. my previous git-pull request[1] isn't merged so I'm sending it again
       after rebasing on top of drm-fixes.

   Please kindly let me know if there is any problem.

Thanks,
Inki Dae

[1] https://www.spinics.net/lists/dri-devel/msg333237.html

The following changes since commit ecf8a99f4807c17fa310a83067a95964cedd9ac1:

  Merge tag 'drm-intel-fixes-2022-02-24' of git://anongit.freedesktop.org/drm/drm-intel into drm-fixes (2022-02-25 05:51:04 +1000)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos tags/exynos-drm-fixes-v5.17-rc6

for you to fetch changes up to 4188db23285e28d9e9b9096f856cdcd7868005ee:

  drm/exynos: Search for TE-gpio in DSI panel's node (2022-02-25 09:50:48 +0900)

----------------------------------------------------------------
Fixups
- Make display controller drivers for Exynos series to use
  platform_get_irq and platform_get_irq_byname functions
  to get the interrupt, which prevents irq chaning from messed up
  when using hierarchical interrupt domains which use "interrupts"
  property in the node.
- Fix two regressions to TE-gpio handling.

----------------------------------------------------------------
Lad Prabhakar (5):
      drm/exynos/exynos7_drm_decon: Use platform_get_irq_byname() to get the interrupt
      drm/exynos: mixer: Use platform_get_irq() to get the interrupt
      drm/exynos/exynos_drm_fimd: Use platform_get_irq_byname() to get the interrupt
      drm/exynos/fimc: Use platform_get_irq() to get the interrupt
      drm/exynos: gsc: Use platform_get_irq() to get the interrupt

Marek Szyprowski (2):
      drm/exynos: Don't fail if no TE-gpio is defined for DSI driver
      drm/exynos: Search for TE-gpio in DSI panel's node

 drivers/gpu/drm/exynos/exynos7_drm_decon.c | 12 +++---------
 drivers/gpu/drm/exynos/exynos_drm_dsi.c    |  6 ++++--
 drivers/gpu/drm/exynos/exynos_drm_fimc.c   | 13 +++++--------
 drivers/gpu/drm/exynos/exynos_drm_fimd.c   | 13 ++++---------
 drivers/gpu/drm/exynos/exynos_drm_gsc.c    | 10 +++-------
 drivers/gpu/drm/exynos/exynos_mixer.c      | 14 ++++++--------
 6 files changed, 25 insertions(+), 43 deletions(-)

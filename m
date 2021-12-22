Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE9D1C433F5
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 22 Dec 2021 03:53:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232553AbhLVDxu (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 21 Dec 2021 22:53:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59836 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232444AbhLVDxu (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 21 Dec 2021 22:53:50 -0500
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com [IPv6:2607:f8b0:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 157CDC061574
        for <linux-samsung-soc@vger.kernel.org>; Tue, 21 Dec 2021 19:53:50 -0800 (PST)
Received: by mail-pf1-x42d.google.com with SMTP id s15so1125263pfk.6
        for <linux-samsung-soc@vger.kernel.org>; Tue, 21 Dec 2021 19:53:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9+ILluygVf09oo0/ytFG0XaIKzjqiECjOUqJvlR//O8=;
        b=niCGrvMli4Kq1cYMkwRNJ96Mt4j9E0O91ceJnWmHM2Y9V+kpZl3Pznlp9rosRKYHsp
         59vhTPh9bvH3TbPhaSbXbFzAPB8TZ/Ih9ZX+NDfbTwcJS4sZkEcBYDH3HajhvcDrfzFN
         ioAt5R6q/pOsS7np+F7fWGwsViHeOHbc+SHwz26ApzsBOjZhrWt6kwn52sRAvAhYvfVS
         TrarxLcJyrfEsAK0XYu2sjqh943QQVk/0gv5y+gzTxa2SIz1Al7drRkN4/TQIUYANIbg
         014haQM4DJG9KIrRPHGAigXkbVljj1S/ACj0eC/eY0xerkPYvw9+E1XM5fVyzLnzSu/m
         WmPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :mime-version:content-transfer-encoding;
        bh=9+ILluygVf09oo0/ytFG0XaIKzjqiECjOUqJvlR//O8=;
        b=v8Jv7MRvL3LgyctycIuyl6KqD2J1FfYw3Ul0oeO/4N0LwEU8euv5H5CyUeWwaB8S4Q
         qSJzLw25krYg8aQF/sCY3rUevNtKjspHNsX0Gp407pZRaCmMe8IPQ42dKzQotyY53Wh3
         uOY4o9IdiYzEy6tmSw6HTtClaT4VePB+c6NHnErCDaKR/XUcaS87Kzw/8PM3QeXxvMXK
         ei/vxtIFYZDVG41BNvmbqw7wyaywVzC5+y5gL488JBPOB9Tur0wvrbi4ZwDhUUpIPWsO
         Dr///jHAfI9jRWDytq6DmT5HbAsajuALu+iwdFSPQokNBbBu4BftF0jLtTwIulN2WZPu
         o/Sw==
X-Gm-Message-State: AOAM530X60l0qm9wdux7SIpxx2oT29Ld6OU4EXCECPCFEzFp2uSR9Cbf
        534FwcBuGwrlV/UNxzTLs4LRZt5raZw=
X-Google-Smtp-Source: ABdhPJwk2yejgoUrXXjC4TJ7R2fFVhDaeMWhvItOkiihrqRrLTpWGdZ0LnLCRXngku5C5OAIOgrHkQ==
X-Received: by 2002:a63:1f5b:: with SMTP id q27mr1255936pgm.608.1640145229393;
        Tue, 21 Dec 2021 19:53:49 -0800 (PST)
Received: from daeinki-virtual-machine.localdomain ([58.124.60.88])
        by smtp.gmail.com with ESMTPSA id np17sm438165pjb.8.2021.12.21.19.53.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Dec 2021 19:53:48 -0800 (PST)
Sender: Inki Dae <daeinki@gmail.com>
From:   Inki Dae <inki.dae@samsung.com>
To:     airlied@linux.ie, daniel.vetter@ffwll.ch
Cc:     dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org
Subject: [GIT PULL] exynos-drm-next
Date:   Wed, 22 Dec 2021 12:53:45 +0900
Message-Id: <20211222035345.26595-1-inki.dae@samsung.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi Dave and Daniel,

   Just four cleanups such as replacing the use of legacy interface, implementing generic gem mmap,
   fixing a build warning and dropping unnecessary code.

Please let me know if there is any problem.

Thanks,
Inki Dae

The following changes since commit 1c405ca11bf563de1725e5ecfb4a74ee289d2ee9:

  Merge tag 'mediatek-drm-next-5.17' of https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux into drm-next (2021-12-17 16:16:16 +1000)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos tags/exynos-drm-next-for-v5.17

for you to fetch changes up to 760cceff996135fd4830f3d339446a04bd37ca0c:

  drm/exynos: drop the use of label from exynos_dsi_register_te_irq (2021-12-22 11:39:39 +0900)

----------------------------------------------------------------
Four cleanups
- Replacing lagacy gpio interface of dsi driver with gpiod one.
- Implementing a generic GEM object mmap and use it instead of
  exynos specific one.
- Dropping the use of label from dsi driver. Which also fixes
  a build warning.
- Just trivial cleanup by dropping unnecessay code.

----------------------------------------------------------------
Bernard Zhao (1):
      drm/exynos: remove useless type conversion

Inki Dae (1):
      drm/exynos: drop the use of label from exynos_dsi_register_te_irq

Maíra Canal (1):
      drm/exynos: Replace legacy gpio interface for gpiod interface

Thomas Zimmermann (1):
      drm/exynos: Implement mmap as GEM object function

 drivers/gpu/drm/exynos/exynos_drm_drv.c   | 13 ++------
 drivers/gpu/drm/exynos/exynos_drm_dsi.c   | 49 +++++++++++--------------------
 drivers/gpu/drm/exynos/exynos_drm_fbdev.c | 20 ++-----------
 drivers/gpu/drm/exynos/exynos_drm_fimc.c  |  4 +--
 drivers/gpu/drm/exynos/exynos_drm_gem.c   | 43 ++++++---------------------
 drivers/gpu/drm/exynos/exynos_drm_gem.h   |  5 ----
 6 files changed, 32 insertions(+), 102 deletions(-)

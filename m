Return-Path: <SRS0=q3lv=DQ=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20D56C4363A
	for <linux-samsung-soc@archiver.kernel.org>; Fri,  9 Oct 2020 08:00:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CFA5C222B8
	for <linux-samsung-soc@archiver.kernel.org>; Fri,  9 Oct 2020 08:00:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b="DEazGm3/"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732677AbgJIIAD (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 9 Oct 2020 04:00:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49446 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732643AbgJIH7x (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 9 Oct 2020 03:59:53 -0400
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 131D6C0613D5
        for <linux-samsung-soc@vger.kernel.org>; Fri,  9 Oct 2020 00:59:53 -0700 (PDT)
Received: by mail-wm1-x341.google.com with SMTP id d3so8894825wma.4
        for <linux-samsung-soc@vger.kernel.org>; Fri, 09 Oct 2020 00:59:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=immTPDdSm8V7ezbOteojXYm/j7WkY1f3P9Y0YpK7onQ=;
        b=DEazGm3//HS7eifrtPTNpv9gPNwxpuxjM7cgzXbcLG0mO5e39cJ73eX9iQKQEkxr4Y
         FwEAxZ/eknqujf87zOGqp6tESSOeL2I6VSIobgrZsNnXiWlr9VWW7WhVnV0GrVhO4vMj
         1v4YtSGCDuC7IGf+ELUEOwyj9sMdI3c9bq3Xg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=immTPDdSm8V7ezbOteojXYm/j7WkY1f3P9Y0YpK7onQ=;
        b=XbzEBuYylKQCnSbOi0Bw7Pzd5mCoQscDZZFemHa8KzIh+PX2NFmXJwNP8jk9CDfesD
         obrAcb35KVELebsiJy1pirHrIX4pmrpZ27YZc+6+h4CHviYMP2Jij6RuXzB44p5IMRFU
         GLIAXHML+lEI7Y2Yu0urWKtUlyXhMdYFx+q9Koqvn/oboyVJsEibV8Nnmr8PWOQHIjqx
         y2FiDClGVEUNFsLKWJb2Bn33t9duDY1nm6bXFLIkqaw4/LENKxh23KqnABaVGtQy0lq7
         WF10TT7M07/hMo6DXpAhSAFYcBq4QkyHCufUCWgJsspTlNlW17BuW2oUoRmVlWFQJAZK
         7S1w==
X-Gm-Message-State: AOAM530GEDx1y573FR3T1xX56Tvw/nbhAFL6K8+gU/LQWf471obDlYWU
        RSupD+Cn9x/G5ZKE8H/MswXsxg==
X-Google-Smtp-Source: ABdhPJzyDJpFjA/Q+sv1RhX5gsGPQpkP/4WlxxT8RLqjQWQaBWIid1inU3iHz1dJQWF+W7VpBZ1zIA==
X-Received: by 2002:a1c:f311:: with SMTP id q17mr13703008wmq.168.1602230391713;
        Fri, 09 Oct 2020 00:59:51 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id u17sm11634118wri.45.2020.10.09.00.59.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2020 00:59:50 -0700 (PDT)
From:   Daniel Vetter <daniel.vetter@ffwll.ch>
To:     DRI Development <dri-devel@lists.freedesktop.org>,
        LKML <linux-kernel@vger.kernel.org>
Cc:     kvm@vger.kernel.org, linux-mm@kvack.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-media@vger.kernel.org,
        linux-s390@vger.kernel.org, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PATCH v2 00/17] follow_pfn and other iomap races
Date:   Fri,  9 Oct 2020 09:59:17 +0200
Message-Id: <20201009075934.3509076-1-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi all,

Round two of my patch series to clamp down a bunch of races and gaps
around follow_pfn and other access to iomem mmaps. Previous version:

v1: https://lore.kernel.org/dri-devel/20201007164426.1812530-1-daniel.vetter@ffwll.ch/

And the discussion that sparked this journey:

https://lore.kernel.org/dri-devel/20201007164426.1812530-1-daniel.vetter@ffwll.ch/

Changes in v2:
- tons of small polish&fixes all over, thanks to all the reviewers who
  spotted issues
- I managed to test at least the generic_access_phys and pci mmap revoke
  stuff with a few gdb sessions using our i915 debug tools (hence now also
  the drm/i915 patch to properly request all the pci bar regions)
- reworked approach for the pci mmap revoke: Infrastructure moved into
  kernel/resource.c, address_space mapping is now set up at open time for
  everyone (which required some sysfs changes). Does indeed look a lot
  cleaner and a lot less invasive than I feared at first.

The big thing I can't test are all the frame_vector changes in habanalbas,
exynos and media. Gerald has given the s390 patch a spin already.

Review, testing, feedback all very much welcome.

Cheers, Daniel

Daniel Vetter (17):
  drm/exynos: Stop using frame_vector helpers
  drm/exynos: Use FOLL_LONGTERM for g2d cmdlists
  misc/habana: Stop using frame_vector helpers
  misc/habana: Use FOLL_LONGTERM for userptr
  mm/frame-vector: Use FOLL_LONGTERM
  media: videobuf2: Move frame_vector into media subsystem
  mm: Close race in generic_access_phys
  s390/pci: Remove races against pte updates
  mm: Add unsafe_follow_pfn
  media/videbuf1|2: Mark follow_pfn usage as unsafe
  vfio/type1: Mark follow_pfn as unsafe
  PCI: Obey iomem restrictions for procfs mmap
  /dev/mem: Only set filp->f_mapping
  resource: Move devmem revoke code to resource framework
  sysfs: Support zapping of binary attr mmaps
  PCI: Revoke mappings like devmem
  drm/i915: Properly request PCI BARs

 arch/s390/pci/pci_mmio.c                      | 98 +++++++++++--------
 drivers/char/mem.c                            | 86 +---------------
 drivers/gpu/drm/exynos/Kconfig                |  1 -
 drivers/gpu/drm/exynos/exynos_drm_g2d.c       | 48 ++++-----
 drivers/gpu/drm/i915/intel_uncore.c           | 25 ++++-
 drivers/media/common/videobuf2/Kconfig        |  1 -
 drivers/media/common/videobuf2/Makefile       |  1 +
 .../media/common/videobuf2}/frame_vector.c    | 54 ++++------
 drivers/media/platform/omap/Kconfig           |  1 -
 drivers/media/v4l2-core/videobuf-dma-contig.c |  2 +-
 drivers/misc/habanalabs/Kconfig               |  1 -
 drivers/misc/habanalabs/common/habanalabs.h   |  3 +-
 drivers/misc/habanalabs/common/memory.c       | 50 ++++------
 drivers/pci/pci-sysfs.c                       |  4 +
 drivers/pci/proc.c                            |  6 ++
 drivers/vfio/vfio_iommu_type1.c               |  4 +-
 fs/sysfs/file.c                               | 11 +++
 include/linux/ioport.h                        |  6 +-
 include/linux/mm.h                            | 47 +--------
 include/linux/sysfs.h                         |  2 +
 include/media/videobuf2-core.h                | 42 ++++++++
 kernel/resource.c                             | 95 +++++++++++++++++-
 mm/Kconfig                                    |  3 -
 mm/Makefile                                   |  1 -
 mm/memory.c                                   | 76 +++++++++++++-
 mm/nommu.c                                    | 17 ++++
 security/Kconfig                              | 13 +++
 27 files changed, 412 insertions(+), 286 deletions(-)
 rename {mm => drivers/media/common/videobuf2}/frame_vector.c (85%)

-- 
2.28.0


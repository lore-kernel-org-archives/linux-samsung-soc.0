Return-Path: <SRS0=5lYo=CE=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6967C433E1
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 26 Aug 2020 07:15:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7C11E2071E
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 26 Aug 2020 07:15:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="uETILQoS"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726700AbgHZHP3 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 26 Aug 2020 03:15:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47784 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726698AbgHZHP1 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 26 Aug 2020 03:15:27 -0400
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D8908C061574
        for <linux-samsung-soc@vger.kernel.org>; Wed, 26 Aug 2020 00:15:26 -0700 (PDT)
Received: by mail-pj1-x1043.google.com with SMTP id ls14so457656pjb.3
        for <linux-samsung-soc@vger.kernel.org>; Wed, 26 Aug 2020 00:15:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=0Q6scoxL+d70qkSwAGY56y4zy3DvXODuXPU5bPQHzOc=;
        b=uETILQoS7qsMgRSI6GsDvBM0d4XFagE1Ud4CXHsIbqBM7fWQPUakOYAe20BEtnXfpE
         sz8XY6mSozCGdDR2UjWBgRh2dLp5fZZM+fY7jKUPNn4RFEGFdKpnIvR4tFeAVLYelnjF
         qaIqDllUg+SeEq0B/tSUKxRMvg6CS42i2VIjiqmyF/M2laAIkaC02cb8nTjVhopYlMZt
         gMTOBsfSglY/oYHP453fO1xpS2Q3Dbuki69Z1H9FCh9AjvNKGOz9PtJ1CjyjgLztru7a
         8ZpO6uVtbE6a+Vpx3CxMLfJRvq1X+sq9PEe60+GuwC4ptFBaUmGT6WayKR9VhLBImQNO
         +4sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=0Q6scoxL+d70qkSwAGY56y4zy3DvXODuXPU5bPQHzOc=;
        b=IrOTjP1xoIYXTD+Yc15Uu6ooRUXkm1ny9l7ndC9FDkWG2DUO4ZIRqFjU1BOLe0gslj
         /hU3fnns+pJtGb3v4hiaSDHLhKiIKlRgUvJO+J7Tg8oAKkc68+mTd0BCT7dgFXWTfp3l
         M9+khtv+5P4IJ7Ma19XRcsvksMLQtT7R3MnMXdLkhy2aV1CQLmzRadVxFpAont0rgupJ
         g8qo8CwP1AZ+5LuRL6OiC2gfsCCLERJeE0ET7HdefcaNIjDcHy9Vjb+viCSktOcBFCuW
         qHjVm4GJmqFx0FMuGVUiEclDHVGfoa2iXemDxoUrUjYdUxHFPcQWcWVG5ARLwSItAHyc
         loww==
X-Gm-Message-State: AOAM530B76aoKj8f4tG+i39ivNQdJy92XaWL59S+uFvoiOkQXdyn8+WL
        rLnimG9ejj7fPf0jdGf7iAblshi09GczWQ==
X-Google-Smtp-Source: ABdhPJwymBjSQnCvHIlxla4xQpv5y4P/j/BjFN9Q2DRcXwBn1G5emfkIEo6gGTh2k+SYpeRGmxhrtQ==
X-Received: by 2002:a17:902:8546:: with SMTP id d6mr10970772plo.218.1598426125191;
        Wed, 26 Aug 2020 00:15:25 -0700 (PDT)
Received: from daeinki-virtual-machine.localdomain ([58.124.60.88])
        by smtp.gmail.com with ESMTPSA id m7sm1571520pfm.31.2020.08.26.00.15.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2020 00:15:24 -0700 (PDT)
From:   Inki Dae <daeinki@gmail.com>
To:     airlied@linux.ie
Cc:     dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org
Subject: [GIT PULL] exynos-drm-fixes
Date:   Wed, 26 Aug 2020 16:15:20 +0900
Message-Id: <20200826071520.3140-1-daeinki@gmail.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi Dave,

   Just one fixup to fix sparse warning reported.

   Please kindly let me know if there is any problem.

Thanks,
Inki Dae

The following changes since commit d012a7190fc1fd72ed48911e77ca97ba4521bccd:

  Linux 5.9-rc2 (2020-08-23 14:08:43 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos tags/exynos-drm-fixes-v5.9-rc3

for you to fetch changes up to d4035d104313cc43b34381b585a7407f069a5132:

  drm/exynos: gem: Fix sparse warning (2020-08-26 16:03:05 +0900)

----------------------------------------------------------------
One fixup
- Just drop __iommu annotation to fix sparse warning.

----------------------------------------------------------------
Marek Szyprowski (1):
      drm/exynos: gem: Fix sparse warning

 drivers/gpu/drm/exynos/exynos_drm_fbdev.c | 2 +-
 drivers/gpu/drm/exynos/exynos_drm_gem.h   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-21.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55922C4338F
	for <linux-samsung-soc@archiver.kernel.org>; Sat, 21 Aug 2021 17:28:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 37D4861242
	for <linux-samsung-soc@archiver.kernel.org>; Sat, 21 Aug 2021 17:28:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230234AbhHUR3K (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sat, 21 Aug 2021 13:29:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56168 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230002AbhHUR3J (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sat, 21 Aug 2021 13:29:09 -0400
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com [IPv6:2607:f8b0:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 56197C061575
        for <linux-samsung-soc@vger.kernel.org>; Sat, 21 Aug 2021 10:28:30 -0700 (PDT)
Received: by mail-pf1-x431.google.com with SMTP id t42so8956780pfg.12
        for <linux-samsung-soc@vger.kernel.org>; Sat, 21 Aug 2021 10:28:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id;
        bh=C5bdnNLXW/3a03Da92T1tNYI9jbJ+iBX8hk1AZBK69k=;
        b=lPCT56fvdHhbMeaNM/ljtItbgIsd+ynybDNkESbxyq1PY0QqgViI70CKj1boq8zjY5
         uIqHxKPuCDg0V+tfidN7qCTm0PwSTU//6eP1ObGfJyn02TkffSs7P/LGGUZoin+41A+8
         6gatgzAL8py1LAIWZOF3aMpAXiYVxXy8aIHom4DXozXcNc1uTIYGmxBrIZXq6CuaBOiQ
         nV4SD/JCOaktp/kMvjsGuJeigTa81aPYBdeSB87mdP+sTyZebhfDFwlqEjvosG4rNdA8
         aH4RV8FvcG/Pk6IpGOgUIYWvBrGnAzTABwliQ3mgckt4/W8cpf/gtNYqBCpVGaDcClY2
         EMXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
        bh=C5bdnNLXW/3a03Da92T1tNYI9jbJ+iBX8hk1AZBK69k=;
        b=VhTPLX8kMpSOzCLqtmvjqURBR8ECodONR1x9v5QVDZ8JBq8afcV13ZsROtPDiQmb5e
         EwZEaCF3lr3uEvp/kXeBm3nZHJWoI+bqj/93WKnbqhfnAIaK/s2HdsTvjpj+YwUVPnnG
         e2xw7yJae4Q5v4y7/HTC0GBURnZPJkRyQb677AmrT4vnvRrBDWxBSUB8RgMA2CRdV2tq
         6N0uEMkgDaDOUD39dwjM6aZdv0Elod0ZQnpv5ldyI8OQiRPWCl1tjRubFVI4ssPY39j+
         KLuNpONUvRADVlMKnn05w+qKY0dVp+QI+FuANMKuY4nNXmEvdNto9ceivohkquvit0VA
         9gQw==
X-Gm-Message-State: AOAM5334rIXC5wy9Lkx7f8/5caHsFnAqZHJBHryMkFAo552uOfHhb8in
        Rdv/nw2BqmC+1bZhsZAo0X+CQ8R16Jg=
X-Google-Smtp-Source: ABdhPJyM3QDjqE31vQvc4MhN+5picZL2CRZaxyUGcHqIF7f1Qcc1p5NVmD9nuZ3AOLmw0mzgfhIjhQ==
X-Received: by 2002:a05:6a00:1989:b0:3e2:a387:e1d9 with SMTP id d9-20020a056a00198900b003e2a387e1d9mr23648446pfl.64.1629566909900;
        Sat, 21 Aug 2021 10:28:29 -0700 (PDT)
Received: from daeinki-virtual-machine.localdomain ([58.124.60.88])
        by smtp.gmail.com with ESMTPSA id n22sm10938169pff.57.2021.08.21.10.28.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Aug 2021 10:28:28 -0700 (PDT)
Sender: Inki Dae <daeinki@gmail.com>
From:   Inki Dae <inki.dae@samsung.com>
To:     airlied@linux.ie
Cc:     dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org
Subject: [GIT PULL] exynos-drm-next
Date:   Sun, 22 Aug 2021 02:28:25 +0900
Message-Id: <20210821172825.54720-1-inki.dae@samsung.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi Dave,

   Just two fixups - fixing one build warning and missing unlock,
   and one cleanup - replaceing atomic_t with refcount_t.

   Please kindly let me know if there is any problem.

Thanks,
Inki Dae

The following changes since commit 397ab98e2d69cede84444a28eab77a171983d14e:

  Merge tag 'drm-msm-next-2021-08-12' of https://gitlab.freedesktop.org/drm/msm into drm-next (2021-08-17 10:53:52 +1000)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos tags/exynos-drm-next-for-v5.15

for you to fetch changes up to c626f3864bbbb28bbe06476b0b497c1330aa4463:

  drm/exynos: Always initialize mapping in exynos_drm_register_dma() (2021-08-22 01:56:39 +0900)

----------------------------------------------------------------
Two fixups
- Fix missing unlock issue in exynos_drm_g2d.c
- Fix a build warning in exynos_drm_dma.c

One cleanup
- Replace atomic_t with refcount_t in exynos_drm_g2d.c

----------------------------------------------------------------
Nathan Chancellor (1):
      drm/exynos: Always initialize mapping in exynos_drm_register_dma()

Wei Yongjun (1):
      drm/exynos: g2d: fix missing unlock on error in g2d_runqueue_worker()

Xiyu Yang (1):
      drm/exynos: Convert from atomic_t to refcount_t on g2d_cmdlist_userptr->refcount

 drivers/gpu/drm/exynos/exynos_drm_dma.c |  2 ++
 drivers/gpu/drm/exynos/exynos_drm_g2d.c | 14 ++++++++------
 2 files changed, 10 insertions(+), 6 deletions(-)

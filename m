Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1071C433EF
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 14 Jun 2022 14:13:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234990AbiFNONs (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 14 Jun 2022 10:13:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57632 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244578AbiFNONr (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 14 Jun 2022 10:13:47 -0400
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4AFC22A735
        for <linux-samsung-soc@vger.kernel.org>; Tue, 14 Jun 2022 07:13:43 -0700 (PDT)
Received: by mail-pl1-x62c.google.com with SMTP id o6so7874772plg.2
        for <linux-samsung-soc@vger.kernel.org>; Tue, 14 Jun 2022 07:13:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:from:to:cc:subject:date:message-id;
        bh=ANOowJ5ARtAcljDH6UUEi0ItbiiRCNHVn+O1+7Vhyfw=;
        b=K6VAErCInuHbNCxmIHVTflFX7zxN8ilYfUa2exM1M+cyx7rBvDKyhW8j4OqZwmzSZk
         gcx6nnLTVIPnpOB6xKwnVhf/aEdnzwLf+dCde737elSVBJhvlUdx/PBdwxS6YeRKCaq4
         cw4RefBfytSwXD7sBmK8h2KQcBqLGKzq8eKrKELszYnSJ49uT53rClKH6jZxHgftj97w
         qrcAXTOGSyD9pCMLxGPVIdygX8mPcTcef0v2J4ZUJFvhkj2/+W5ESr/SfCIk7G798oiH
         1We4sO4ghE7nLGOwuAlK4pAn7zgvmaA/faf7LvWRN3ZvLKlj7j75cTAvGaDpKPrGZUUF
         iuag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
        bh=ANOowJ5ARtAcljDH6UUEi0ItbiiRCNHVn+O1+7Vhyfw=;
        b=cYlOCXFFzVA0mOiLcM7VqBazU52CC7xegk0vwQ1S+HIB/4wwoPzf0JGXCz9GLSlFuG
         n0O0UrxDLt2pjHsIgCO0guQuEAkaYOvyFMYR9uAODcDeKFXF1pAvT1mqYkjUEyIYvNJh
         tv7OOtWCwn2t87uQp+dm8k+NMpuOG9pofSx/XpKx/TLVQnzgw7WAR+sTlvDwg9tZEg+8
         pkKjqCR4R8WhEN4QmE75XvgWZhWn1CLKsbi2DpnJDEDO5HdggHcrppV2t0mkvZ935atn
         0ki7InqXHiY5wZkfcN8jY2Loxq9mvAgQ4vPhoo65ooXK4Osk0aalNIe8H1YX57UP5tPd
         Feqw==
X-Gm-Message-State: AJIora+yop93umOQcJ1E93WBpfUOrlye7jBT57DNIHqKQoQ3va7LeJg8
        G+fV1L1x5fYmnZVoVCUcn3zPhOSsQz8=
X-Google-Smtp-Source: AGRyM1tjIvfmuMHaS07fxgbOS276UaMZCjk0+Johh6lVHiVKpXd1OLucB2eHGdLNFeJgF9JW6ZinKw==
X-Received: by 2002:a17:902:d547:b0:168:ec21:2e5a with SMTP id z7-20020a170902d54700b00168ec212e5amr3727491plf.58.1655216022708;
        Tue, 14 Jun 2022 07:13:42 -0700 (PDT)
Received: from daeinki-virtual-machine.localdomain ([58.124.60.88])
        by smtp.gmail.com with ESMTPSA id v21-20020a170902e8d500b00163d8d9aefcsm7294762plg.80.2022.06.14.07.13.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jun 2022 07:13:41 -0700 (PDT)
Sender: Inki Dae <daeinki@gmail.com>
From:   Inki Dae <inki.dae@samsung.com>
To:     airlied@linux.ie, daniel.vetter@ffwll.ch
Cc:     dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org
Subject: [GIT PULL] exynos-drm-fixes
Date:   Tue, 14 Jun 2022 23:13:36 +0900
Message-Id: <20220614141336.88614-1-inki.dae@samsung.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi Dave and Daniel,

   Just two regression fixups.

   Please kindly let me know if there is any problem.

Thanks,
Inki Dae

The following changes since commit b13baccc3850ca8b8cccbf8ed9912dbaa0fdf7f3:

  Linux 5.19-rc2 (2022-06-12 16:11:37 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos tags/exynos-drm-fixes-v5.19-rc3

for you to fetch changes up to 7d787184a18f0f84e996de8ff007e4395c1978ea:

  drm/exynos: mic: Rework initialization (2022-06-14 22:32:16 +0900)

----------------------------------------------------------------
two regression fixups
- Check a null pointer instead of IS_ERR().
- Rework initialization code of Exynos MIC driver.

----------------------------------------------------------------
Dan Carpenter (1):
      drm/exynos: fix IS_ERR() vs NULL check in probe

Marek Szyprowski (1):
      drm/exynos: mic: Rework initialization

 drivers/gpu/drm/exynos/exynos_drm_drv.c |  6 ++---
 drivers/gpu/drm/exynos/exynos_drm_mic.c | 42 ++++++++++-----------------------
 2 files changed, 15 insertions(+), 33 deletions(-)

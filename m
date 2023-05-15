Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E378AC77B7D
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 15 May 2023 08:39:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229566AbjEOIjz (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 15 May 2023 04:39:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56262 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236794AbjEOIjt (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 15 May 2023 04:39:49 -0400
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com [IPv6:2607:f8b0:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E28ACE1
        for <linux-samsung-soc@vger.kernel.org>; Mon, 15 May 2023 01:39:48 -0700 (PDT)
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-1adc913094aso42269555ad.0
        for <linux-samsung-soc@vger.kernel.org>; Mon, 15 May 2023 01:39:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684139988; x=1686731988;
        h=message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0Amoq70hJo95bJKTUhw34c70+hMrAHPIR1QAD0MEHOU=;
        b=hxPK0WxB9Vd205mAXPeYmUI/v5OdIhm6ike/rZ/FOd5XHroZvrUz7SUk8H4oIOuU0n
         ITpLBotnnJI5qcIQir1QD6rONPLnGvqGjZf1Dk9luB108f4MWAVJTUFNNiZJHwRjBtjm
         69fok9g2sPW2WfxIyLHMeKWeWvxLblDj+5EsynX1RMQGVpoWbR6FmIA8OcVPNT5J6t0H
         T1cxYZqvCFIuoisA6odhiOvx2N2x9l7hckeHOt+1gKHc+e0H9J1URXwP8V+GFMlokBpo
         nSAYpl1iCbxonWINcrkEMeWrXfMU77+mkGXe+uoGbT62dJd1pCpsaByqZvNhBVJxo2RY
         Jbjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684139988; x=1686731988;
        h=message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0Amoq70hJo95bJKTUhw34c70+hMrAHPIR1QAD0MEHOU=;
        b=MCPMMmwQC0b4KCmm8PuOdTWGxyEV0bYMk/frfk2HO+OWXy4dek941oue0/RoIPN2mS
         WZNzOyBuzh3k0HZO9CjvKF7n3UM40mSrZ2GowNnt/f7Tf83fPQZ0lQKg53O2BXNXcwJD
         IZeqBF11oWU/j5r1lZ/1tv8uQSFBB9Jqj39QuIv5FlD+M4tcVq8Jf+1tYWUxEEkc3a1g
         hBV81koXCxNNj1kFoqk0ENCICbaLsnfK3QjW2G41FSlf8NHpxSoNA9gCRswxB+MPGUCO
         JRGkkEbsHSF8xnMccFhbtsuPFWnm9JwbUlT/MEwY90zZRji887amq8+OpWQcUj1cp0ke
         cIFg==
X-Gm-Message-State: AC+VfDwNkIsEtbjsKKoT3r/5gT0sc/uLmCwvxr6k3ckelm7i0bHouQa8
        cynl4Q3cudY8t2xWkNM9NSs=
X-Google-Smtp-Source: ACHHUZ6ILvv6weLQnLUsBdUVXWZNoEu/AENG0wlalTDEiXqqNISRfL8AcnnhPToRo1R3hvqbV8//8w==
X-Received: by 2002:a17:902:efc5:b0:19c:f096:bbef with SMTP id ja5-20020a170902efc500b0019cf096bbefmr30750375plb.49.1684139988247;
        Mon, 15 May 2023 01:39:48 -0700 (PDT)
Received: from daeinki-virtual-machine.localdomain ([58.124.60.88])
        by smtp.gmail.com with ESMTPSA id r21-20020a170902be1500b001a80ad9c599sm1325267pls.294.2023.05.15.01.39.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 May 2023 01:39:47 -0700 (PDT)
Sender: Inki Dae <daeinki@gmail.com>
From:   Inki Dae <inki.dae@samsung.com>
To:     airlied@linux.ie, daniel@ffwll.ch
Cc:     dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org
Subject: [GIT PULL] exynos-drm-fixes
Date:   Mon, 15 May 2023 17:39:43 +0900
Message-Id: <20230515083943.43933-1-inki.dae@samsung.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi Dave and Daniel,

   Just one fixup to graphics 2d module for exynos.

   Please kindly let me know if there is any problem.

Thanks,
Inki Dae

The following changes since commit d8843eebbbd15b78c6a7745717b3705eca923b0f:

  Merge tag 'amd-drm-fixes-6.4-2023-05-11' of https://gitlab.freedesktop.org/agd5f/linux into drm-fixes (2023-05-12 06:46:34 +1000)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos tags/exynos-drm-fixes-for-v6.4-rc3

for you to fetch changes up to 2ef0785b30bd6549ddbc124979f1b6596e065ae2:

  drm/exynos: fix g2d_open/close helper function definitions (2023-05-15 14:10:34 +0900)

----------------------------------------------------------------
Just one fixup to exynos_drm_g2d module.
- Fix below build warning by marking them as 'static inline'
    drivers/gpu/drm/exynos/exynos_drm_g2d.h:37:5: error: no previous prototype for 'g2d_open'
    drivers/gpu/drm/exynos/exynos_drm_g2d.h:42:5: error: no previous prototype for 'g2d_close'

----------------------------------------------------------------
Arnd Bergmann (1):
      drm/exynos: fix g2d_open/close helper function definitions

 drivers/gpu/drm/exynos/exynos_drm_g2d.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

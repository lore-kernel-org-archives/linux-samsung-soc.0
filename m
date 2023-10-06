Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A17AEE92FDD
	for <linux-samsung-soc@archiver.kernel.org>; Fri,  6 Oct 2023 04:10:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229815AbjJFEKA (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 6 Oct 2023 00:10:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50178 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229454AbjJFEJ7 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 6 Oct 2023 00:09:59 -0400
Received: from mail-oa1-x2c.google.com (mail-oa1-x2c.google.com [IPv6:2001:4860:4864:20::2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 26AFDDB
        for <linux-samsung-soc@vger.kernel.org>; Thu,  5 Oct 2023 21:09:56 -0700 (PDT)
Received: by mail-oa1-x2c.google.com with SMTP id 586e51a60fabf-1e19cb7829bso1042492fac.1
        for <linux-samsung-soc@vger.kernel.org>; Thu, 05 Oct 2023 21:09:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696565395; x=1697170195; darn=vger.kernel.org;
        h=message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3WsyJr/JfGO9ZomYRC8lC2LpPAdcpUdaon1QvBmnp74=;
        b=jYxe/IksxSaKlMhlF61Wo7EronJIsCTSJ3JEW6HXGASIS/r03lufsiNTkH2Xdfat+X
         gpf4tIkqUN1ID8fHLuUbN5vCmqvcHB0aiZbLQfj5yM8l6qpAcckGwwNm04aVI2amDxVW
         1QhxY0aTRZcDuxd5PM565zbiRw8I9BDQ1AlhuT6aiSuO6ak1Cu+pRCjtJ+0ez8W3WUdC
         A7vM6VrI1BE9u7k5MD6n2BtRpjcbyRF05TMarRtUwyln5kN8nHELq7X+afEU/KqZI9E5
         x8OAWYYuferTjvJu4CpHxHRX6gLrvuzmI+iItUPeFbLYE0c4r0V9qpCD9/SjKNqtr4Ae
         Jqlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696565395; x=1697170195;
        h=message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3WsyJr/JfGO9ZomYRC8lC2LpPAdcpUdaon1QvBmnp74=;
        b=TXz6b6BzsCS9g5KGSVr5gOXTGb7sMBSfHN79t/+npvuDgONfFDGj7XmRJnzkVI1BCP
         E6sA31iBrrIe0gqzDHt6j+9RwMvfxtKPmwSl9bTmdQ6NridanczcNh2TthjwTMI5T1lW
         Jc70JMjvyXMvBN0MhVHKBzOBzkZawFyA2psPbGciStDDhHU8Z5hR5AvIB5knWclzmbL9
         Ny1z/+zjJGD49usgPHAPPtlNiCqaJ4sEwnkAtJwi2l8Y6KBpMhjIlVL4oS4v3iSCFlvZ
         IEGcpMAjHuAr9b8FTonz0CRbIah5/VgQFN9GjNpjY6/bRYgTfB1lMLSnGZWmZcquEUWd
         afPQ==
X-Gm-Message-State: AOJu0YwNOgKFtD1tAqEjAe3yf6zf4Gqh3lLG6cgg3iw3LOB8ByYbe+Qk
        GZsgxBaxlejgwsIZeJCp7+Y=
X-Google-Smtp-Source: AGHT+IFCd0i4QvBKYK+f8dhJ5cI0/kA3DGkHoagfKKeFHK1BPBs24cJNRsGhsisXeu/pFhEPdsv3Fg==
X-Received: by 2002:a05:6870:ac26:b0:1b3:9e41:de07 with SMTP id kw38-20020a056870ac2600b001b39e41de07mr8591032oab.36.1696565395120;
        Thu, 05 Oct 2023 21:09:55 -0700 (PDT)
Received: from daeinki-virtual-machine.localdomain ([58.124.60.88])
        by smtp.gmail.com with ESMTPSA id h19-20020aa786d3000000b0068ff267f092sm391590pfo.216.2023.10.05.21.09.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Oct 2023 21:09:53 -0700 (PDT)
Sender: Inki Dae <daeinki@gmail.com>
From:   Inki Dae <inki.dae@samsung.com>
To:     airlied@linux.ie, daniel@ffwll.ch
Cc:     dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org
Subject: [GIT PULL] exynos-drm-fixes
Date:   Fri,  6 Oct 2023 13:09:50 +0900
Message-Id: <20231006040950.4397-1-inki.dae@samsung.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi Dave and Daniel,

   Just one fixup to a potential error pointer dereference.

   Please kindly let me know if there is any problem.

Thanks,
Inki Dae


The following changes since commit 8a749fd1a8720d4619c91c8b6e7528c0a355c0aa:

  Linux 6.6-rc4 (2023-10-01 14:15:13 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos tags/exynos-drm-fixes-for-v6.6-rc5

for you to fetch changes up to e49c384dc1c62fb5bf57c7bf6598957197e57919:

  drm/exynos: fix a potential error pointer dereference (2023-10-06 12:30:23 +0900)

----------------------------------------------------------------
One fixup
- Fix a potential error pointer dereference by checking the return value
  of exynos_drm_crtc_get_by_type() function before accessing to crtc
  object.

----------------------------------------------------------------
Xiang Yang (1):
      drm/exynos: fix a potential error pointer dereference

 drivers/gpu/drm/exynos/exynos_hdmi.c | 2 ++
 1 file changed, 2 insertions(+)

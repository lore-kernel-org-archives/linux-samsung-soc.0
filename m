Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2C52C433DB
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 16 Mar 2021 15:33:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 88B0D60200
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 16 Mar 2021 15:33:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237049AbhCPPdU (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 16 Mar 2021 11:33:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36864 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238089AbhCPPdO (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 16 Mar 2021 11:33:14 -0400
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BB246C061762
        for <linux-samsung-soc@vger.kernel.org>; Tue, 16 Mar 2021 08:33:13 -0700 (PDT)
Received: by mail-wm1-x32e.google.com with SMTP id f22-20020a7bc8d60000b029010c024a1407so1709248wml.2
        for <linux-samsung-soc@vger.kernel.org>; Tue, 16 Mar 2021 08:33:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4MtyicSEo1IFZBpiFoiow7kzS1Jr8w9+zJmQTxAoVfE=;
        b=aOBu4s4YBTkov1on28kzZszJKza9hsa6v9IjY9CZuG1RXgyJINqB2YR9wqD8mrJsG5
         oW9CNdk48E00tfQFFqf7eabOXr4V6g1rSZIOZUrY2E9p4jZhOHsIqTc/Zrr2iIrrLpRW
         UO0d+H76OkhNjzww3mqsdcDytyEk8Lp3GsJCc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4MtyicSEo1IFZBpiFoiow7kzS1Jr8w9+zJmQTxAoVfE=;
        b=jDksPZ4nTDPw0D4DJ1L2x1lKqcKoN0xMbVd4ktquDl46IyZbLuXjUQehn+MiMHw2DL
         a7LXyiMt+0VVpakKe4xx+DzD1z7f43LpVfARGNQV0mStNWT/tk+/yZRrm0xXPabIWO7U
         yiIwmdVDkAyuDaHNgrl7v8qp08cIZb92aEdZ4MkbaHCxPLDgdQ3+blMB/hEnywfx0YBU
         uCl6wS1sPVUiy14Efkf5OP/ViGN3k7Eic3pZovlDqf+SgkOjB1i/GkJyXk+p042A1KJG
         rSHkmlP3kmxfUM7pNFMJ63Tzg/dt47SnGG+M8uid9OP+FLOvKUoQmhp6sODuDQPQGJF+
         yxLg==
X-Gm-Message-State: AOAM531xR7a7NsRimR9UypUZ029tZ5pPf2QB619zVzmLPc6AdwbfiatV
        S50cM8Hz2s9g1i7ht8yc6DMJhw==
X-Google-Smtp-Source: ABdhPJwLcv8LIcwpJj11nT7CjeCYw+rPcm7MmzmWjcj9F/IESEfr8FtSUIk9PgYxtf0usoMMx2lQNw==
X-Received: by 2002:a05:600c:2301:: with SMTP id 1mr258796wmo.36.1615908792340;
        Tue, 16 Mar 2021 08:33:12 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id h22sm3985078wmb.36.2021.03.16.08.33.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Mar 2021 08:33:11 -0700 (PDT)
From:   Daniel Vetter <daniel.vetter@ffwll.ch>
To:     DRI Development <dri-devel@lists.freedesktop.org>,
        LKML <linux-kernel@vger.kernel.org>
Cc:     kvm@vger.kernel.org, linux-mm@kvack.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-media@vger.kernel.org,
        Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PATCH 0/3] switch to unsafe_follow_pfn
Date:   Tue, 16 Mar 2021 16:33:00 +0100
Message-Id: <20210316153303.3216674-1-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi all,

This are the leftovers from my pull that landed in 5.12:

https://lore.kernel.org/dri-devel/CAKMK7uHQ=6OJcRguCUtiB456RWdCfwSNEXV8pQsfsPodTJ6uxw@mail.gmail.com/

Only changes compared to the old submission are:
- dropped vfio and kvm patch
- add patch to just remove follow_pfn at the end

Assuming no objections I'd like to lande these three patches in my topic
branch for 5.13, for sufficient amounts of testing in linux-next before
the merge window.

Ack/review especially on the two mm patches very much thought after.

Cheers, Daniel

Daniel Vetter (3):
  mm: Add unsafe_follow_pfn
  media/videobuf1|2: Mark follow_pfn usage as unsafe
  mm: unexport follow_pfn

 drivers/media/common/videobuf2/frame_vector.c |  2 +-
 drivers/media/v4l2-core/videobuf-dma-contig.c |  2 +-
 include/linux/mm.h                            |  4 +-
 mm/memory.c                                   | 46 ++++++++++++-------
 mm/nommu.c                                    | 28 ++++++++---
 security/Kconfig                              | 13 ++++++
 6 files changed, 68 insertions(+), 27 deletions(-)

-- 
2.30.0


Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 607C7C433ED
	for <linux-samsung-soc@archiver.kernel.org>; Mon,  3 May 2021 19:15:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 34918613B3
	for <linux-samsung-soc@archiver.kernel.org>; Mon,  3 May 2021 19:15:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229660AbhECTQK (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 3 May 2021 15:16:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57838 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229657AbhECTQK (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 3 May 2021 15:16:10 -0400
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5233BC06138C
        for <linux-samsung-soc@vger.kernel.org>; Mon,  3 May 2021 12:15:16 -0700 (PDT)
Received: by mail-ed1-x52b.google.com with SMTP id g14so7605181edy.6
        for <linux-samsung-soc@vger.kernel.org>; Mon, 03 May 2021 12:15:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:mail-followup-to:mime-version
         :content-disposition;
        bh=fyFJP735XQXj4LkTnGwzm4qSEE25PUlvsZ5m+5XoeTg=;
        b=R5TKedJKe8jFlf9lMHC2G4AqVWRJE0dTCT/4m3gzvsre1icWgKAlqnQ/n8OCP5qBu6
         OD201KjlWSPNGB7YCWZ0BEgT0iiYzJnMY8R9kBq7QxnWO5Ec69yWP5imZDzfjfI87Icq
         Vu9mz6P83IjWi+hHed0zvq1mo7iSp7BFBiuFo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id
         :mail-followup-to:mime-version:content-disposition;
        bh=fyFJP735XQXj4LkTnGwzm4qSEE25PUlvsZ5m+5XoeTg=;
        b=J8x0qSlCN3ejQUOWW9DJEvNi334jhywJnoI4svvxZX8faGFxQEGOohCqj6RUD+BkaR
         2b61LQaRw8gKmrminP7ySh/3plhApRFShnoUVmD1mQ9M48tDOV8+F8RHLgXb6q1O0U3w
         IDrSzY4VuAJIKRHWAH2Q3bNyQHDpFNBqDaGjGWEU0IlPqG1hZK8Wu8kfDDuFb6NppGa8
         BaO8DrXpASb4v8CL4gy4xDqhXCjX2O4YOO2D0H+9KuHNJU+KWtKINZHKg2r81sRd9MZN
         7t9vQVCmEEmBp8D96HUU/x8RwublOL+7ioIY5N+SAGN0lu3+J0Q9LQBeUIduAmwejyAC
         kLYQ==
X-Gm-Message-State: AOAM530OFiVxEwG8N549jm2IigOXVaIg+tlyhxvDUJ4R527kqup4GnUP
        q6CeTh2YDqxUthxz78RrA3p3NxcSTB/a6Q==
X-Google-Smtp-Source: ABdhPJwHjMUFJwM40ARD1fhW9cBMZs1N9ixtJyT4oagDjJlQdPziQznBELdraes2Gu2qzngLQrV4Pw==
X-Received: by 2002:a05:6402:c8:: with SMTP id i8mr22275371edu.57.1620069315093;
        Mon, 03 May 2021 12:15:15 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id sb20sm255703ejb.100.2021.05.03.12.15.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 May 2021 12:15:14 -0700 (PDT)
Date:   Mon, 3 May 2021 21:15:08 +0200
From:   Daniel Vetter <daniel.vetter@ffwll.ch>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     DRI Development <dri-devel@lists.freedesktop.org>,
        LKML <linux-kernel@vger.kernel.org>, linux-mm@kvack.org,
        linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org
Subject: [PULL] topic/iomem-mmap-vs-gup
Message-ID: <YJBHiRiCGzojk25U@phenom.ffwll.local>
Mail-Followup-To: Linus Torvalds <torvalds@linux-foundation.org>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        LKML <linux-kernel@vger.kernel.org>, linux-mm@kvack.org,
        linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Operating-System: Linux phenom 5.10.32scarlett+ 
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi Linus,

It's still the same topic branch as last merge window, but the name isn't
fitting all that well anymore :-)

Anyway here's a small pull for you to ponder, now that the big ones are
all through. It's been in -next almost the entire cycle, I've only done
some non-code rebases due to the -rc1 fumble and to fix some commit
message typos.

Christoph Hellwig also looked at these and aside from wanting to outright
remove it all didn't have objections.

topic/iomem-mmap-vs-gup-2021-05-03:
unexport follow_pfn

Follow-up to my pull from last merge window: kvm and vfio lost their
very unsafe use of follow_pfn, this appropriately marks up the very
last user for some userptr-as-buffer use-cases in media. There was
some resistance to outright removing it, maybe we can do this in a few
releases.

Cheers, Daniel

The following changes since commit 0d02ec6b3136c73c09e7859f0d0e4e2c4c07b49b:

  Linux 5.12-rc4 (2021-03-21 14:56:43 -0700)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm tags/topic/iomem-mmap-vs-gup-2021-05-03

for you to fetch changes up to ac8b8400620a4b0d9ca903ee9ad440bec736f5fa:

  mm: unexport follow_pfn (2021-04-08 16:54:38 +0200)

----------------------------------------------------------------
unexport follow_pfn

Follow-up to my pull from last merge window: kvm and vfio lost their
very unsafe use of follow_pfn, this appropriately marks up the very
last user for some userptr-as-buffer use-cases in media. There was
some resistance to outright removing it, maybe we can do this in a few
releases.

----------------------------------------------------------------
Daniel Vetter (3):
      mm: Add unsafe_follow_pfn
      media/videobuf1|2: Mark follow_pfn usage as unsafe
      mm: unexport follow_pfn

 drivers/media/common/videobuf2/frame_vector.c |  2 +-
 drivers/media/v4l2-core/videobuf-dma-contig.c |  2 +-
 include/linux/mm.h                            |  4 +--
 mm/memory.c                                   | 46 +++++++++++++++++----------
 mm/nommu.c                                    | 28 ++++++++++++----
 security/Kconfig                              | 13 ++++++++
 6 files changed, 68 insertions(+), 27 deletions(-)

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch

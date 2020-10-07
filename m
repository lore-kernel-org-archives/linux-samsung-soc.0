Return-Path: <SRS0=c76P=DO=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA222C47423
	for <linux-samsung-soc@archiver.kernel.org>; Wed,  7 Oct 2020 16:46:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 72F2A21582
	for <linux-samsung-soc@archiver.kernel.org>; Wed,  7 Oct 2020 16:46:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b="M9/9cFkL"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728292AbgJGQqF (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 7 Oct 2020 12:46:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52696 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727981AbgJGQol (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 7 Oct 2020 12:44:41 -0400
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E4F10C0613D3
        for <linux-samsung-soc@vger.kernel.org>; Wed,  7 Oct 2020 09:44:39 -0700 (PDT)
Received: by mail-wm1-x343.google.com with SMTP id l11so3060198wmh.2
        for <linux-samsung-soc@vger.kernel.org>; Wed, 07 Oct 2020 09:44:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=CXmXX9/hQfgNA2sDFICXZ2LHoeIrjelysU1qQvq0pLo=;
        b=M9/9cFkLYvtsV+XSvB3EIEIsseQMf3Ht42LRs7L3X5P1WwWl9Oi2KvxQBCacCcF14m
         fJV8CQS9LPrjIIfBd4aiNt1OxGBmDjd9OCGq8SR0MHNMsO52kAQKbH++f9zP6zkYkuCb
         ir3n+83k7vXH52uffeOAdQ1DpKcQF6dl1WTl4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=CXmXX9/hQfgNA2sDFICXZ2LHoeIrjelysU1qQvq0pLo=;
        b=DPEonONhZcx9+7qgBDryyRGnQr1IAT4c21B1K8EGmVP5dx7jkE+xvDkdiIDNSOAjl9
         rrpWMyHK54NvFKpy/FIEe+B6m3FcqQawVYxrbrotNg7oxAr1Eqk9MjNIBVNeYHNJV8yB
         bYSQBfmSNEL9G3p5UOIYZOvxVNX9slZvHQ+HcIHwpDPrA4k4cwrXLYSftWYTzf0E4UIs
         v77mXYukij6XkUkUwwB/vnzD6O0dwUfCDGMU6Z4BwlINIASMpurmmOhyvKcmcl0yp3fL
         rSlyMwr7DiP6N0hTIRhIjHmumIsAremlpomdksOgVBrPnxN6V90TSwdJ9Y8jhnqyW11I
         DUWg==
X-Gm-Message-State: AOAM530PAYPuCZzRw51XDkU5hTUvUIHFmL/u4Rvv6lPqmmoFbQIDotZ0
        pkwSFomQ6AbktygUxNtieAujktAzuDoY9vSH
X-Google-Smtp-Source: ABdhPJxC/lomxhrpmJUvYBJInJM6vUgAB59jFw18I6b4BWoKkPAiJCuoXppD6fu/bxyn6KUpfhv2Zw==
X-Received: by 2002:a05:600c:1149:: with SMTP id z9mr1651741wmz.180.1602089078573;
        Wed, 07 Oct 2020 09:44:38 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id z191sm3332280wme.40.2020.10.07.09.44.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2020 09:44:37 -0700 (PDT)
From:   Daniel Vetter <daniel.vetter@ffwll.ch>
To:     DRI Development <dri-devel@lists.freedesktop.org>,
        LKML <linux-kernel@vger.kernel.org>
Cc:     kvm@vger.kernel.org, linux-mm@kvack.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-media@vger.kernel.org,
        linux-s390@vger.kernel.org, Daniel Vetter <daniel.vetter@ffwll.ch>,
        Daniel Vetter <daniel.vetter@intel.com>,
        Jason Gunthorpe <jgg@ziepe.ca>,
        Andrew Morton <akpm@linux-foundation.org>,
        John Hubbard <jhubbard@nvidia.com>,
        =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
        Jan Kara <jack@suse.cz>,
        Dan Williams <dan.j.williams@intel.com>,
        Oded Gabbay <oded.gabbay@gmail.com>,
        Omer Shpigelman <oshpigelman@habana.ai>,
        Ofir Bitton <obitton@habana.ai>,
        Tomer Tayar <ttayar@habana.ai>,
        Moti Haimovski <mhaimovski@habana.ai>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Pawel Piskorski <ppiskorski@habana.ai>
Subject: [PATCH 04/13] misc/habana: Use FOLL_LONGTERM for userptr
Date:   Wed,  7 Oct 2020 18:44:17 +0200
Message-Id: <20201007164426.1812530-5-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201007164426.1812530-1-daniel.vetter@ffwll.ch>
References: <20201007164426.1812530-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

These are persistent, not just for the duration of a dma operation.

Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: John Hubbard <jhubbard@nvidia.com>
Cc: Jérôme Glisse <jglisse@redhat.com>
Cc: Jan Kara <jack@suse.cz>
Cc: Dan Williams <dan.j.williams@intel.com>
Cc: linux-mm@kvack.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-samsung-soc@vger.kernel.org
Cc: linux-media@vger.kernel.org
Cc: Oded Gabbay <oded.gabbay@gmail.com>
Cc: Omer Shpigelman <oshpigelman@habana.ai>
Cc: Ofir Bitton <obitton@habana.ai>
Cc: Tomer Tayar <ttayar@habana.ai>
Cc: Moti Haimovski <mhaimovski@habana.ai>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Pawel Piskorski <ppiskorski@habana.ai>
---
 drivers/misc/habanalabs/common/memory.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/misc/habanalabs/common/memory.c b/drivers/misc/habanalabs/common/memory.c
index ef89cfa2f95a..94bef8faa82a 100644
--- a/drivers/misc/habanalabs/common/memory.c
+++ b/drivers/misc/habanalabs/common/memory.c
@@ -1288,7 +1288,8 @@ static int get_user_memory(struct hl_device *hdev, u64 addr, u64 size,
 		return -ENOMEM;
 	}
 
-	rc = pin_user_pages_fast(start, npages, FOLL_FORCE | FOLL_WRITE,
+	rc = pin_user_pages_fast(start, npages,
+				 FOLL_FORCE | FOLL_WRITE | FOLL_LONGTERM,
 				 userptr->pages);
 
 	if (rc != npages) {
-- 
2.28.0


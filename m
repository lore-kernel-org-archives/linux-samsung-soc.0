Return-Path: <SRS0=q3lv=DQ=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF8EFC4363A
	for <linux-samsung-soc@archiver.kernel.org>; Fri,  9 Oct 2020 08:01:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 809E822276
	for <linux-samsung-soc@archiver.kernel.org>; Fri,  9 Oct 2020 08:01:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b="iRqcoi2J"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732833AbgJIIBG (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 9 Oct 2020 04:01:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49472 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732741AbgJIIAN (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 9 Oct 2020 04:00:13 -0400
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 27030C05BD0D
        for <linux-samsung-soc@vger.kernel.org>; Fri,  9 Oct 2020 01:00:12 -0700 (PDT)
Received: by mail-wm1-x344.google.com with SMTP id l15so8391292wmh.1
        for <linux-samsung-soc@vger.kernel.org>; Fri, 09 Oct 2020 01:00:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ybAifwX7tm2P00t2K95NUlLTVV/59iglzyZOopNSY4g=;
        b=iRqcoi2J+8TbvYv/OI6gZry2qWJjsQLn24G4kqdeeRuUA+0H9YClu5xZhMUQNcmsMG
         JPS6JPnqs6Bk/zroCRZ/wHG6IvC2ZDGDlX/Z457NYm+VvK3sD2Y2DmyMs0uQyILuAN0N
         24HSnEGcXQk//4F2Y2Z5Ww4FDBcpxX8FuiubM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ybAifwX7tm2P00t2K95NUlLTVV/59iglzyZOopNSY4g=;
        b=Va0j17fYBFz5LmJaiMPUeOpfPzi05hVeugt8qkkV+WfIb0NO7rMNC3W3LE5bmFfkaI
         hLfgyD1MywAC4ECh8ux6QDp4F3RJ0ui0t1F6rjQ6J+R6T5ond/KjAQt6NYAwO/pwpWNv
         7H2k0rgtsDIqwoI9vQlaLKXLTw04fXUmx6OCdTbqMRVdUJdQ7HjK+b1WpdmqNxEHiwJH
         58Xc+xSzAmWILJMHyOwH1gmtvd0kxfKg7oTcSK9NG1yXsmSrw21buR+YD8PnCori7H7Z
         bDr+zltOHvhZRJLl0FDyKD+rFeh1SPYKpMsFCpEWDSEyEfdkJFNnW7Ajdc1UMUzt74+R
         y9YQ==
X-Gm-Message-State: AOAM53183eCqHg/2rzrCXg8kudXA9+GFWyDh9zu5J1BL51Xg7psJvhm6
        tyVIUrtE8dVCwU5KwAdnwsXq5w==
X-Google-Smtp-Source: ABdhPJz/a+ItIs4nZkG5GhoSduiU6qGLoEKHXdDdLg7sXZkEX3DpeqBcVWskPvNGNUhuSuQAqMr6Cg==
X-Received: by 2002:a7b:c01a:: with SMTP id c26mr11729750wmb.35.1602230410816;
        Fri, 09 Oct 2020 01:00:10 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id u17sm11634118wri.45.2020.10.09.01.00.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2020 01:00:10 -0700 (PDT)
From:   Daniel Vetter <daniel.vetter@ffwll.ch>
To:     DRI Development <dri-devel@lists.freedesktop.org>,
        LKML <linux-kernel@vger.kernel.org>
Cc:     kvm@vger.kernel.org, linux-mm@kvack.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-media@vger.kernel.org,
        linux-s390@vger.kernel.org, Daniel Vetter <daniel.vetter@ffwll.ch>,
        Daniel Vetter <daniel.vetter@intel.com>,
        Jason Gunthorpe <jgg@ziepe.ca>,
        Kees Cook <keescook@chromium.org>,
        Dan Williams <dan.j.williams@intel.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        John Hubbard <jhubbard@nvidia.com>,
        =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
        Jan Kara <jack@suse.cz>
Subject: [PATCH v2 13/17] /dev/mem: Only set filp->f_mapping
Date:   Fri,  9 Oct 2020 09:59:30 +0200
Message-Id: <20201009075934.3509076-14-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201009075934.3509076-1-daniel.vetter@ffwll.ch>
References: <20201009075934.3509076-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

When we care about pagecache maintenance, we need to make sure that
both f_mapping and i_mapping point at the right mapping.

But for iomem mappings we only care about the virtual/pte side of
things, so f_mapping is enough. Also setting inode->i_mapping was
confusing me as a driver maintainer, since in e.g. drivers/gpu we
don't do that. Per Dan this seems to be copypasta from places which do
care about pagecache consistency, but not needed. Hence remove it for
slightly less confusion.

Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Kees Cook <keescook@chromium.org>
Cc: Dan Williams <dan.j.williams@intel.com>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: John Hubbard <jhubbard@nvidia.com>
Cc: Jérôme Glisse <jglisse@redhat.com>
Cc: Jan Kara <jack@suse.cz>
Cc: Dan Williams <dan.j.williams@intel.com>
Cc: linux-mm@kvack.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-samsung-soc@vger.kernel.org
Cc: linux-media@vger.kernel.org
---
 drivers/char/mem.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/char/mem.c b/drivers/char/mem.c
index abd4ffdc8cde..5502f56f3655 100644
--- a/drivers/char/mem.c
+++ b/drivers/char/mem.c
@@ -864,7 +864,6 @@ static int open_port(struct inode *inode, struct file *filp)
 	 * revocations when drivers want to take over a /dev/mem mapped
 	 * range.
 	 */
-	inode->i_mapping = devmem_inode->i_mapping;
 	filp->f_mapping = inode->i_mapping;
 
 	return 0;
-- 
2.28.0


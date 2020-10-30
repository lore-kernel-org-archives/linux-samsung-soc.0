Return-Path: <SRS0=Y9I5=EF=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E6BCC6369E
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 30 Oct 2020 10:10:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DA59021734
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 30 Oct 2020 10:10:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b="Am/XHbgB"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726353AbgJ3KIr (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 30 Oct 2020 06:08:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50312 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726334AbgJ3KIo (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 30 Oct 2020 06:08:44 -0400
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 329DFC0613D9
        for <linux-samsung-soc@vger.kernel.org>; Fri, 30 Oct 2020 03:08:44 -0700 (PDT)
Received: by mail-wr1-x444.google.com with SMTP id g12so5768924wrp.10
        for <linux-samsung-soc@vger.kernel.org>; Fri, 30 Oct 2020 03:08:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/xcbsqH/weHsrxzIda3dt5bupXDON4brOfEy0okYN4I=;
        b=Am/XHbgBGpMLJawb2JqmvzSTsl5Idglr/zrV0R2WIYVvQFNUw/J4oTVvZTPbUkLKhM
         lisg+s8yzsUhGfWVPLerJpr5tTqFaD/XZZvYfTg7i69wyEACAvIYaBdn6yq9Md88eZbz
         D9f7nozAItBqr8ql/UrBHwNAhXwzMj19GyTGg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/xcbsqH/weHsrxzIda3dt5bupXDON4brOfEy0okYN4I=;
        b=CVONcMe8ghyalvQ4fLpNf2vJtnIn/3137COiwUBx6D9SPGe8IAXFeKkv3Vwhs7DRbH
         76Sv5oftJBg381dfWKnL3cxDrmJhkjs8r1SR4WNsxgpqxNjPEdyiaorjKT9eAoL8yAuA
         LpbKD5KBqMEu8t3OAu1Q99PKdGQYTglAeRfUUcrW5ZqzNWF+CgcQsWLwGLBbBHpqSS3O
         Pxt3BBqvPkn2EKo5qosGGwrT5Afen/Ktgmvmak5p8sMjlvvW3+pn/Mkw1m4yGqy79XOL
         9F+1iPK/FkB7ZCna5sKu7GzlISrOLTUFFl7FYhuK/S/Z4fdGG4PzpHNZC5p2Zl97Z8HO
         jPMg==
X-Gm-Message-State: AOAM532DioV8NdIjKvLuVOfZnOklFOqI0r0u9uoMUQ5G0TqxZ/crz6T9
        kqAtSOmc+ipdpuN1sO9Bm1WUuw==
X-Google-Smtp-Source: ABdhPJw6XcDIp8KNlI20GqgC0ipGTSD1GbDnlhPI2pNQlmWj+LBBUtNHkeVn2IS0e8mSgO+Qt9vVtA==
X-Received: by 2002:a5d:420b:: with SMTP id n11mr2059715wrq.218.1604052522912;
        Fri, 30 Oct 2020 03:08:42 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id v189sm4430947wmg.14.2020.10.30.03.08.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2020 03:08:42 -0700 (PDT)
From:   Daniel Vetter <daniel.vetter@ffwll.ch>
To:     DRI Development <dri-devel@lists.freedesktop.org>,
        LKML <linux-kernel@vger.kernel.org>
Cc:     kvm@vger.kernel.org, linux-mm@kvack.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-media@vger.kernel.org,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
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
Subject: [PATCH v5 04/15] misc/habana: Use FOLL_LONGTERM for userptr
Date:   Fri, 30 Oct 2020 11:08:04 +0100
Message-Id: <20201030100815.2269-5-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201030100815.2269-1-daniel.vetter@ffwll.ch>
References: <20201030100815.2269-1-daniel.vetter@ffwll.ch>
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
Signed-off-by: Daniel Vetter <daniel.vetter@ffwll.ch>
---
 drivers/misc/habanalabs/common/memory.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/misc/habanalabs/common/memory.c b/drivers/misc/habanalabs/common/memory.c
index 0b220221873d..d08c41b90fec 100644
--- a/drivers/misc/habanalabs/common/memory.c
+++ b/drivers/misc/habanalabs/common/memory.c
@@ -1298,7 +1298,8 @@ static int get_user_memory(struct hl_device *hdev, u64 addr, u64 size,
 		return -ENOMEM;
 	}
 
-	rc = pin_user_pages_fast(start, npages, FOLL_FORCE | FOLL_WRITE,
+	rc = pin_user_pages_fast(start, npages,
+				 FOLL_FORCE | FOLL_WRITE | FOLL_LONGTERM,
 				 userptr->pages);
 
 	if (rc != npages) {
-- 
2.28.0


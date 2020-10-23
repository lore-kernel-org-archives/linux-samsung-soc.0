Return-Path: <SRS0=uz1o=D6=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8A1AC8300E
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 23 Oct 2020 12:23:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7393A24248
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 23 Oct 2020 12:23:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b="I4RFwd2e"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S463664AbgJWMXD (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 23 Oct 2020 08:23:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38012 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S463655AbgJWMXC (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 23 Oct 2020 08:23:02 -0400
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 902A2C0613CE
        for <linux-samsung-soc@vger.kernel.org>; Fri, 23 Oct 2020 05:23:01 -0700 (PDT)
Received: by mail-wm1-x342.google.com with SMTP id d3so1294656wma.4
        for <linux-samsung-soc@vger.kernel.org>; Fri, 23 Oct 2020 05:23:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=fm+L1OZ5vnKeOGH1XwjpH65CAXQE2qGCwQHeV0BfCbo=;
        b=I4RFwd2eW9iNL5qH7GC2GN+bOEbVbW0io2ha60AXzDjB/0yYw4W1JK6yrbHeRAL0iY
         ISW+gqIaC+vP2a2lhS4YPj3Em5r0tFkHvuJ7lEUT60inNY0XgrlVSxFy5WXKshps7csM
         du6jwmFk8hHJwEqDf96AP/6FrBQrEHzL9do1E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=fm+L1OZ5vnKeOGH1XwjpH65CAXQE2qGCwQHeV0BfCbo=;
        b=ZieuftL3hUf+72GgcNwkH3DDkH5tpcZmKiujXsTuwQyWKoP+b8Olu/y9e0xjbIT8JW
         BRX6XIfAtxvlOS/o+oqex2rmM/rJBZ6qriL5MWlzncLReKZMakrsgGbvcJchhvsBzhJN
         9ZZJwVccO06ySUCgTqHWaPR3zBq9eO0GoJ+P8Q1GZO58aUC1A0gw4Jyr94Mi2FcBe5SJ
         tQvhmhMk5Ii1q25z4PyS7wQoV2HbHb/UTGNetJKhbQeofA0jhBIGjLXkBXYD4Qx7Oucl
         oi3ecIZGaZe7aILTDASZaNiRDVz3cUR4cubmnTlXWW0tHE/AiK1s7Q06OlPZoGwC5Xnl
         lcjQ==
X-Gm-Message-State: AOAM533qbfmhxPVOGWPNjqg9n55mNBI0Rblk70/n7lcSHCWrUoKavvEK
        l1+yD7BkNqzRxnNra7hqMU37cg==
X-Google-Smtp-Source: ABdhPJyGjziGYIZ7LCrUaPvnmjitFLFb8BHzU6RIkZE3cezG0NmOKu92ESUHVoVpHKIYbtJBpxbBNA==
X-Received: by 2002:a1c:7409:: with SMTP id p9mr1939536wmc.167.1603455780340;
        Fri, 23 Oct 2020 05:23:00 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id y4sm3056484wrp.74.2020.10.23.05.22.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2020 05:22:59 -0700 (PDT)
From:   Daniel Vetter <daniel.vetter@ffwll.ch>
To:     DRI Development <dri-devel@lists.freedesktop.org>
Cc:     Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        Daniel Vetter <daniel.vetter@intel.com>,
        Jason Gunthorpe <jgg@ziepe.ca>,
        Andrew Morton <akpm@linux-foundation.org>,
        John Hubbard <jhubbard@nvidia.com>,
        =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
        Jan Kara <jack@suse.cz>,
        Dan Williams <dan.j.williams@intel.com>, linux-mm@kvack.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-media@vger.kernel.org,
        Oded Gabbay <oded.gabbay@gmail.com>,
        Omer Shpigelman <oshpigelman@habana.ai>,
        Ofir Bitton <obitton@habana.ai>,
        Tomer Tayar <ttayar@habana.ai>,
        Moti Haimovski <mhaimovski@habana.ai>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Pawel Piskorski <ppiskorski@habana.ai>
Subject: [PATCH 33/65] misc/habana: Use FOLL_LONGTERM for userptr
Date:   Fri, 23 Oct 2020 14:21:44 +0200
Message-Id: <20201023122216.2373294-33-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201023122216.2373294-1-daniel.vetter@ffwll.ch>
References: <20201021163242.1458885-1-daniel.vetter@ffwll.ch>
 <20201023122216.2373294-1-daniel.vetter@ffwll.ch>
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
index 327b64479f97..767d3644c033 100644
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


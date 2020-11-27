Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D079C82480
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 27 Nov 2020 16:43:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4E139221F7
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 27 Nov 2020 16:43:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b="UsmTBv70"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732139AbgK0QnM (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 27 Nov 2020 11:43:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54008 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731594AbgK0QmF (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 27 Nov 2020 11:42:05 -0500
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 17A5AC0613D2
        for <linux-samsung-soc@vger.kernel.org>; Fri, 27 Nov 2020 08:42:04 -0800 (PST)
Received: by mail-wr1-x443.google.com with SMTP id 64so6184232wra.11
        for <linux-samsung-soc@vger.kernel.org>; Fri, 27 Nov 2020 08:42:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=WIwM+CgtjulX00So/rnZs3CK8iFlbmt4b5FI8jtD7Z0=;
        b=UsmTBv70+0yVDRoJJ7S15WMQxg6E1LErgv9pqqIkQadtiUgYBrporCiAo60oAloUR0
         hypKZlv6JVJHYO7NbUucNAxekNi/+UcXEeC0lL9RNeCmL4gLXd2f1Uvy8w0ttja7AT3u
         fXbx7NQgScpue4f5z44auD2zsQqryDSerpCHY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=WIwM+CgtjulX00So/rnZs3CK8iFlbmt4b5FI8jtD7Z0=;
        b=itqaMBCU6n6OxopZOMIKfKjjNsQB635ckOx4Nd9yC2usepuPQIbSvgFWebJdUcjqi8
         Z+5HCmiSbHaV0aVd83g5rLb5+uGkds7OIktcm29EfST4Uafnt+Ybd7LOdJ4R3lTc7wx7
         Nrkt3tQLGpbb9LsWFJGeJToXhNe5E7tTBMlZ7+INPwOLBk8oDvBUIUfjW9x8OqqntnNQ
         2BN3+XN3pl9CxZTuRKsU+VuQF/l2Vz/Lg4BbdQdGYSnKH3LevCxSgnaU2PHmsF4I0ATr
         3w4V9c+tYhKqy4Wx1Q5JxyUJPKN/+UIUKF9WCY7XVNLwr1PgHuGT7mX8VgNCEKKnNUjb
         oeZQ==
X-Gm-Message-State: AOAM5329MfeiJ3kY104bGCGtsGKbao8cq31OWttyNZXsQrzPvSWXoJeZ
        QSK+MOxJJw9cc8A3fobFRuTr2Q==
X-Google-Smtp-Source: ABdhPJyAXEAYiKOSNg8sjsJugGFFuhRB8ve58iZQChHUSl54iRJGMo2vJlzEY8x9JKPdy66sWXRf8w==
X-Received: by 2002:adf:8284:: with SMTP id 4mr11448134wrc.386.1606495322891;
        Fri, 27 Nov 2020 08:42:02 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id q12sm14859078wrx.86.2020.11.27.08.42.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2020 08:42:02 -0800 (PST)
From:   Daniel Vetter <daniel.vetter@ffwll.ch>
To:     DRI Development <dri-devel@lists.freedesktop.org>,
        LKML <linux-kernel@vger.kernel.org>
Cc:     kvm@vger.kernel.org, linux-mm@kvack.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-media@vger.kernel.org,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        Oded Gabbay <ogabbay@kernel.org>,
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
Subject: [PATCH v7 04/17] misc/habana: Use FOLL_LONGTERM for userptr
Date:   Fri, 27 Nov 2020 17:41:18 +0100
Message-Id: <20201127164131.2244124-5-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201127164131.2244124-1-daniel.vetter@ffwll.ch>
References: <20201127164131.2244124-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

These are persistent, not just for the duration of a dma operation.

Reviewed-by: Oded Gabbay <ogabbay@kernel.org>
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
index 2c59fa869684..0d25ae1d5f3e 100644
--- a/drivers/misc/habanalabs/common/memory.c
+++ b/drivers/misc/habanalabs/common/memory.c
@@ -1296,7 +1296,8 @@ static int get_user_memory(struct hl_device *hdev, u64 addr, u64 size,
 	if (!userptr->pages)
 		return -ENOMEM;
 
-	rc = pin_user_pages_fast(start, npages, FOLL_FORCE | FOLL_WRITE,
+	rc = pin_user_pages_fast(start, npages,
+				 FOLL_FORCE | FOLL_WRITE | FOLL_LONGTERM,
 				 userptr->pages);
 
 	if (rc != npages) {
-- 
2.29.2


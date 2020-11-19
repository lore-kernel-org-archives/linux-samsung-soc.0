Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E92A6C63697
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 19 Nov 2020 14:43:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9371C2085B
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 19 Nov 2020 14:43:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b="CIIgMEJ/"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728398AbgKSOnB (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 19 Nov 2020 09:43:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37480 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728298AbgKSOmM (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 19 Nov 2020 09:42:12 -0500
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DD838C061A51
        for <linux-samsung-soc@vger.kernel.org>; Thu, 19 Nov 2020 06:42:10 -0800 (PST)
Received: by mail-wr1-x444.google.com with SMTP id r17so6749614wrw.1
        for <linux-samsung-soc@vger.kernel.org>; Thu, 19 Nov 2020 06:42:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=lUo9ncFU/nKq3MG4mWQrX8BX1Csq/yukMRd1xs72MQA=;
        b=CIIgMEJ/YZCJYqrr/Qtw//Z/EuYS19MxKYSZBAuaNm2O4riC4ia7lWBoP9fdOxE899
         lfrakfIMVKfanEOJTQM/T9AeH3p6C/ndGvDvgquoWvteonENyQO4m2trca3rvVUBYdrV
         pqSf5p+4Iw5KW2ru9wTswKE3C26aax9R920gc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=lUo9ncFU/nKq3MG4mWQrX8BX1Csq/yukMRd1xs72MQA=;
        b=ijrI1pSviSzhX7uIlE6RQBjIKnQVFgwgBDhffZRe3IzKWAxOOJ0ZfxPjLvUYbnPMEn
         gWZHFK34twDvlTQGUFH6IzCfTC+1Me9Lu80v3jRKaPHJ2+dR6Lb0BcIfDZMNyK2uMOp7
         4FhlUx8+PsyLFSRphGtPRqRZhKkIRmwnjrW/LtZ7aq/EC+kwOCe922OkRh9CQNBbrv6G
         zuKkgPzBvNnTEGOGY/f1m694ml05PhCBXerdLexLA00VpgVVSpFierfCbZbWAO6npTgs
         xc9WjCPZI72KEoUx226KLK3J2v0UJx6AxYar5ZbbfQfFDr7QisnnnxCqEkloAzEOS2r7
         +DFg==
X-Gm-Message-State: AOAM532ogfoiIK2XN0tx82hK9iLeL68RSTgMjavu3oUMrSV+wcrXJPDM
        uA2LYV06sn9hDRBuRDA9vtEFAg==
X-Google-Smtp-Source: ABdhPJwk5Y7yKnIhKFhsy0JLp99xQ3IuhlAonQX0yhhkN3nOXvFaqvGXi/lZAmUY0jINVS3Y2iOPTg==
X-Received: by 2002:adf:f7c7:: with SMTP id a7mr11488760wrq.347.1605796929676;
        Thu, 19 Nov 2020 06:42:09 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id x63sm51292wmb.48.2020.11.19.06.42.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2020 06:42:08 -0800 (PST)
From:   Daniel Vetter <daniel.vetter@ffwll.ch>
To:     DRI Development <dri-devel@lists.freedesktop.org>,
        LKML <linux-kernel@vger.kernel.org>
Cc:     kvm@vger.kernel.org, linux-mm@kvack.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-media@vger.kernel.org,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        Daniel Vetter <daniel.vetter@intel.com>,
        Jason Gunthorpe <jgg@ziepe.ca>,
        Kees Cook <keescook@chromium.org>,
        Dan Williams <dan.j.williams@intel.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        John Hubbard <jhubbard@nvidia.com>,
        =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
        Jan Kara <jack@suse.cz>
Subject: [PATCH v6 12/17] /dev/mem: Only set filp->f_mapping
Date:   Thu, 19 Nov 2020 15:41:41 +0100
Message-Id: <20201119144146.1045202-13-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201119144146.1045202-1-daniel.vetter@ffwll.ch>
References: <20201119144146.1045202-1-daniel.vetter@ffwll.ch>
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
Reviewed-by: Dan Williams <dan.j.williams@intel.com>
Signed-off-by: Daniel Vetter <daniel.vetter@ffwll.ch>
---
 drivers/char/mem.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/char/mem.c b/drivers/char/mem.c
index 94c2b556cf97..7dcf9e4ea79d 100644
--- a/drivers/char/mem.c
+++ b/drivers/char/mem.c
@@ -891,7 +891,6 @@ static int open_port(struct inode *inode, struct file *filp)
 	 * revocations when drivers want to take over a /dev/mem mapped
 	 * range.
 	 */
-	inode->i_mapping = devmem_inode->i_mapping;
 	filp->f_mapping = inode->i_mapping;
 
 	return 0;
-- 
2.29.2


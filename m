Return-Path: <SRS0=6p2y=DJ=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 936A9C4727F
	for <linux-samsung-soc@archiver.kernel.org>; Fri,  2 Oct 2020 17:53:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5CE4620795
	for <linux-samsung-soc@archiver.kernel.org>; Fri,  2 Oct 2020 17:53:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b="FeyUVdPt"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388265AbgJBRxq (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 2 Oct 2020 13:53:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58212 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388369AbgJBRxo (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 2 Oct 2020 13:53:44 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 48155C0613E2
        for <linux-samsung-soc@vger.kernel.org>; Fri,  2 Oct 2020 10:53:44 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id c18so2703944wrm.9
        for <linux-samsung-soc@vger.kernel.org>; Fri, 02 Oct 2020 10:53:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=mCTncko5YOfdd1hOhILVAexx/vlJaiXxqeCzAQ94in0=;
        b=FeyUVdPtM4srxB1+dn7I4h3H7Wfi8/fg99I+ABCtisEx3wHtPquZTvZ16RuGWwmZzE
         vz2bLh2sThVwHVg4NCZu/QZBQT8Z+HfU/9rp+qgb6Lzuk41uNLg5YV0/kZAopqb77csM
         ge7J8s4JsvsrgpI2ThI5QqsYkQlmjW4Kii0Bw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=mCTncko5YOfdd1hOhILVAexx/vlJaiXxqeCzAQ94in0=;
        b=JyAwg0v5ZErCDj+DYkiY0RESiMyMouow+AM1SWELPu8rE5W68m1YpxKycE3+YjXzcx
         L6oEGEz1MVfFZQxPCF9Rt9EjRkx8dCUhxCunOuKlgOqGz+eh/gVkAjyd7qLKbSnLD2wI
         jNqLC8UdE7mR0EDeZXqM9HSi5zq1OArpECtvlazOiYdykYSUSrQ9rnvI6dYhJKILKlbG
         qgtISmcAcFixHzriaSHQyvj6wSxRgebrMdsl2peX21DVW6SQLq8cODcEZF52XMISj1Mz
         G0CIm4I6ZKSTA3PRiw7GVKPGYy3Bc4zJRAuAOfavfIhqpQJx3hnVbjvp5Xyqwa1hYHar
         5E8A==
X-Gm-Message-State: AOAM530lAUML3Fj4KS53hKrWSGLtSLbZ80av1q96xYnRLeN9kevuu+Jw
        4G2MlThdYYC0ZxofZHf2VsB4/g==
X-Google-Smtp-Source: ABdhPJxqlu8ijgg5+4avDVYjjircN8ixFnEQp9RW1tMzahfcEDBuGAuy7tAthp9rZCHLP+C5s3jDnQ==
X-Received: by 2002:a5d:4603:: with SMTP id t3mr4212688wrq.424.1601661223009;
        Fri, 02 Oct 2020 10:53:43 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id m10sm2585429wmc.9.2020.10.02.10.53.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2020 10:53:42 -0700 (PDT)
From:   Daniel Vetter <daniel.vetter@ffwll.ch>
To:     DRI Development <dri-devel@lists.freedesktop.org>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        Daniel Vetter <daniel.vetter@intel.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        John Hubbard <jhubbard@nvidia.com>,
        =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
        Jan Kara <jack@suse.cz>,
        Dan Williams <dan.j.williams@intel.com>, linux-mm@kvack.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-media@vger.kernel.org
Subject: [PATCH 2/2] mm/frame-vec: use FOLL_LONGTERM
Date:   Fri,  2 Oct 2020 19:53:03 +0200
Message-Id: <20201002175303.390363-2-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201002175303.390363-1-daniel.vetter@ffwll.ch>
References: <20201002175303.390363-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

For $reasons I've stumbled over this code and I'm not sure the change
to the new gup functions in 55a650c35fea ("mm/gup: frame_vector:
convert get_user_pages() --> pin_user_pages()") was entirely correct.

This here is used for long term buffers (not just quick I/O) like
RDMA, and John notes this in his patch. But I thought the rule for
these is that they need to add FOLL_LONGTERM, which John's patch
didn't do.

There is already a dax specific check (added in b7f0554a56f2 ("mm:
fail get_vaddr_frames() for filesystem-dax mappings")), so this seems
like the prudent thing to do.

Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
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
Hi all,

I stumbled over this and figured typing this patch can't hurt. Really
just to maybe learn a few things about how gup/pup is supposed to be
used (we have a bit of that in drivers/gpu), this here isn't really
ralated to anything I'm doing.

I'm also wondering whether the explicit dax check should be removed,
since FOLL_LONGTERM should take care of that already.
-Daniel
---
 mm/frame_vector.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/mm/frame_vector.c b/mm/frame_vector.c
index 5d34c9047e9c..3507e09cb3ff 100644
--- a/mm/frame_vector.c
+++ b/mm/frame_vector.c
@@ -35,7 +35,7 @@ int get_vaddr_frames(unsigned long start, unsigned int nr_frames,
 {
 	struct mm_struct *mm = current->mm;
 	struct vm_area_struct *vma;
-	unsigned int gup_flags = FOLL_WRITE | FOLL_FORCE;
+	unsigned int gup_flags = FOLL_WRITE | FOLL_FORCE | FOLL_LONGTERM;
 	int ret = 0;
 	int err;
 	int locked;
-- 
2.28.0


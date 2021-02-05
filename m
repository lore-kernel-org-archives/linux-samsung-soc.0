Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD68BC433E6
	for <linux-samsung-soc@archiver.kernel.org>; Fri,  5 Feb 2021 22:44:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7589E65023
	for <linux-samsung-soc@archiver.kernel.org>; Fri,  5 Feb 2021 22:44:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230330AbhBEWoX (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 5 Feb 2021 17:44:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42036 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229917AbhBENhT (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 5 Feb 2021 08:37:19 -0500
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 41A7BC0613D6
        for <linux-samsung-soc@vger.kernel.org>; Fri,  5 Feb 2021 05:36:39 -0800 (PST)
Received: by mail-wr1-x42c.google.com with SMTP id u14so7743937wri.3
        for <linux-samsung-soc@vger.kernel.org>; Fri, 05 Feb 2021 05:36:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=1gQoFS6ud405970AWgVagisJdKuspo0iHcNG3yO+v+Y=;
        b=ZFx74dwXRN8XJoI8vReT6nG84gTmG6QDsKTETcJ06jTJw70JqS2qOLWzaeIPJLa2+q
         i3A1Tex+NtYld5e4GVoxTw0izBPXMnjweumu4hA9cypntxtKgmAi+PLJzkGHZ1RqPeVy
         tW/D5qIVWDn/14kg51lcnIhmcjtyQwf70EOXU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1gQoFS6ud405970AWgVagisJdKuspo0iHcNG3yO+v+Y=;
        b=qEQVHsZCDS1HgRbdxJljk11f0t9cGQXejb826I/oTpVADPZQS3oWhVu1NnIEzxh4E3
         C6ijIRnkIhF3hXur8kVYiQvkDxycbxYd66uyN5+mMDdtEphy4vN9rXcraUn5senwbrLo
         hEXboKatZ52P/ehV+K7XUou2oIFNsVhU7YTqc3o7o6vc5JZZA7Onb66N7LGmqcDalfj+
         zqKRLQ0MFaXFWCyfMwcg3c0HMKOGGNjcmZfcqOiXnKaY3TAC9VpVY5iT3YRAu/UjnFz7
         UusXpq2KtW1NF2mNzjZ7IoDTUq1uWMnJX5eVDTgZmKo6PzJ1mIKKtV4Q4LqvIamOSdI/
         D/jA==
X-Gm-Message-State: AOAM531XwKbEFXxjKxLNdwNZ3CYh/xgZIGSccLcvm4CGXvVlw+HNZo7w
        PFRs/Xm4qd8Qawe44A4oT693kg==
X-Google-Smtp-Source: ABdhPJzWE2gxGEZn4lzZcDo3tutehy5qX/E9j/4aIeZc6b9+p2my5zf6hrvCeUW2K6Drt8e7TSvqBw==
X-Received: by 2002:a5d:5283:: with SMTP id c3mr4938476wrv.319.1612532197971;
        Fri, 05 Feb 2021 05:36:37 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id z8sm11944234wrh.83.2021.02.05.05.36.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Feb 2021 05:36:37 -0800 (PST)
From:   Daniel Vetter <daniel.vetter@ffwll.ch>
To:     LKML <linux-kernel@vger.kernel.org>
Cc:     DRI Development <dri-devel@lists.freedesktop.org>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        Daniel Vetter <daniel.vetter@intel.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Jason Gunthorpe <jgg@ziepe.ca>,
        Kees Cook <keescook@chromium.org>,
        Dan Williams <dan.j.williams@intel.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        John Hubbard <jhubbard@nvidia.com>,
        =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
        Jan Kara <jack@suse.cz>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-mm@kvack.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-media@vger.kernel.org,
        Bjorn Helgaas <bhelgaas@google.com>, linux-pci@vger.kernel.org
Subject: [PATCH] PCI: Also set up legacy files only after sysfs init
Date:   Fri,  5 Feb 2021 14:36:32 +0100
Message-Id: <20210205133632.2827730-1-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <d958eb8e32d5dd6ffd981b92cd54fe7b3fcebab9>
References: <d958eb8e32d5dd6ffd981b92cd54fe7b3fcebab9>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

We are already doing this for all the regular sysfs files on PCI
devices, but not yet on the legacy io files on the PCI buses. Thus far
no problem, but in the next patch I want to wire up iomem revoke
support. That needs the vfs up and running already to make sure that
iomem_get_mapping() works.

Wire it up exactly like the existing code in
pci_create_sysfs_dev_files(). Note that pci_remove_legacy_files()
doesn't need a check since the one for pci_bus->legacy_io is
sufficient.

An alternative solution would be to implement a callback in sysfs to
set up the address space from iomem_get_mapping() when userspace calls
mmap(). This also works, but Greg didn't really like that just to work
around an ordering issue when the kernel loads initially.

v2: Improve commit message (Bjorn)

Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Kees Cook <keescook@chromium.org>
Cc: Dan Williams <dan.j.williams@intel.com>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: John Hubbard <jhubbard@nvidia.com>
Cc: Jérôme Glisse <jglisse@redhat.com>
Cc: Jan Kara <jack@suse.cz>
Cc: Dan Williams <dan.j.williams@intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-mm@kvack.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-samsung-soc@vger.kernel.org
Cc: linux-media@vger.kernel.org
Cc: Bjorn Helgaas <bhelgaas@google.com>
Cc: linux-pci@vger.kernel.org
---
 drivers/pci/pci-sysfs.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/pci/pci-sysfs.c b/drivers/pci/pci-sysfs.c
index fb072f4b3176..0c45b4f7b214 100644
--- a/drivers/pci/pci-sysfs.c
+++ b/drivers/pci/pci-sysfs.c
@@ -927,6 +927,9 @@ void pci_create_legacy_files(struct pci_bus *b)
 {
 	int error;
 
+	if (!sysfs_initialized)
+		return;
+
 	b->legacy_io = kcalloc(2, sizeof(struct bin_attribute),
 			       GFP_ATOMIC);
 	if (!b->legacy_io)
@@ -1448,6 +1451,7 @@ void pci_remove_sysfs_dev_files(struct pci_dev *pdev)
 static int __init pci_sysfs_init(void)
 {
 	struct pci_dev *pdev = NULL;
+	struct pci_bus *pbus = NULL;
 	int retval;
 
 	sysfs_initialized = 1;
@@ -1459,6 +1463,9 @@ static int __init pci_sysfs_init(void)
 		}
 	}
 
+	while ((pbus = pci_find_next_bus(pbus)))
+		pci_create_legacy_files(pbus);
+
 	return 0;
 }
 late_initcall(pci_sysfs_init);
-- 
2.30.0


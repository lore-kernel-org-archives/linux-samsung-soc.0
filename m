Return-Path: <SRS0=uz1o=D6=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79158C63777
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 23 Oct 2020 12:23:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2ABF92465B
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 23 Oct 2020 12:23:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b="C2WlQm6Y"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S463699AbgJWMXO (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 23 Oct 2020 08:23:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38068 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S463681AbgJWMXL (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 23 Oct 2020 08:23:11 -0400
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 29740C0613D2
        for <linux-samsung-soc@vger.kernel.org>; Fri, 23 Oct 2020 05:23:11 -0700 (PDT)
Received: by mail-wr1-x442.google.com with SMTP id h5so1575697wrv.7
        for <linux-samsung-soc@vger.kernel.org>; Fri, 23 Oct 2020 05:23:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=5W4UqFTJMoDRzu7XpmV7m/mIx7tbXZK4TFNNVek8jNg=;
        b=C2WlQm6Y7/BLr8qzfIPZbRoqOaxbXAT3hL2x0db/Vq7QIa9HiiDV68fCYfgycZtA+x
         GcQT5YHcVe38UBZQ7KU9yFXVhUTzN+GFKBdcS0mcPQCEf6Uxqwp+fW97FHKul4o73JoP
         PYYcx5UtzedMnl7YfV4Rz5BNzjRWhqXORNHQA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5W4UqFTJMoDRzu7XpmV7m/mIx7tbXZK4TFNNVek8jNg=;
        b=O6cXQsjP0hOuijlgu9p/0+MAlQgSf5aXUtR5y99K3HBmk0KbNnd2EodkllUBLahLWD
         fTK1m8x9D59TXlX7BfqKmE61h55N2Ogp08xRUB4ih6K/EWEMBLD5oMilWEU8WjfVIDON
         JZHBdg+iMRGghklZ02IRXA9DyQMYWIGjr4RTfSrJgIqGKDIKpeuC2hCOlumXD3cv+SFS
         6o/CQQCL2CC6wSLduOpqMFxpMqHvHv6LGj4TEdTmxqoiwrjX4lTU+huA89N2HBrxl2kY
         gtH0l6m3T8pX113FvxC8lO/AWeSWi/s57DEuPQqgL4oa/l3Lmg0DXIu0YoV6BFHwgMaF
         +iug==
X-Gm-Message-State: AOAM532vA1bq3hg4RSxS/ys1/nZEVF/UY43+ftK0XbHIewLlraUiupdw
        3S4AAG454CJkepa1/HDBmUnE5w==
X-Google-Smtp-Source: ABdhPJw3Pb3vhwtwwYNFMVzcx8Z/llu6fU2csM/RXOrVwDY9ekmNXTKA2S1lYyLiAIKDJCOf9S0bYg==
X-Received: by 2002:a5d:6cae:: with SMTP id a14mr2454800wra.187.1603455789882;
        Fri, 23 Oct 2020 05:23:09 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id y4sm3056484wrp.74.2020.10.23.05.23.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2020 05:23:09 -0700 (PDT)
From:   Daniel Vetter <daniel.vetter@ffwll.ch>
To:     DRI Development <dri-devel@lists.freedesktop.org>
Cc:     Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        Daniel Vetter <daniel.vetter@intel.com>,
        Jason Gunthorpe <jgg@ziepe.ca>,
        Kees Cook <keescook@chromium.org>,
        Dan Williams <dan.j.williams@intel.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        John Hubbard <jhubbard@nvidia.com>,
        =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
        Jan Kara <jack@suse.cz>, linux-mm@kvack.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-media@vger.kernel.org,
        Bjorn Helgaas <bhelgaas@google.com>, linux-pci@vger.kernel.org
Subject: [PATCH 40/65] PCI: Obey iomem restrictions for procfs mmap
Date:   Fri, 23 Oct 2020 14:21:51 +0200
Message-Id: <20201023122216.2373294-40-daniel.vetter@ffwll.ch>
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

There's three ways to access PCI BARs from userspace: /dev/mem, sysfs
files, and the old proc interface. Two check against
iomem_is_exclusive, proc never did. And with CONFIG_IO_STRICT_DEVMEM,
this starts to matter, since we don't want random userspace having
access to PCI BARs while a driver is loaded and using it.

Fix this by adding the same iomem_is_exclusive() check we already have
on the sysfs side in pci_mmap_resource().

References: 90a545e98126 ("restrict /dev/mem to idle io memory ranges")
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
Cc: Bjorn Helgaas <bhelgaas@google.com>
Cc: linux-pci@vger.kernel.org
Signed-off-by: Daniel Vetter <daniel.vetter@ffwll.ch>
--
v2: Improve commit message (Bjorn)
---
 drivers/pci/proc.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/pci/proc.c b/drivers/pci/proc.c
index d35186b01d98..3a2f90beb4cb 100644
--- a/drivers/pci/proc.c
+++ b/drivers/pci/proc.c
@@ -274,6 +274,11 @@ static int proc_bus_pci_mmap(struct file *file, struct vm_area_struct *vma)
 		else
 			return -EINVAL;
 	}
+
+	if (dev->resource[i].flags & IORESOURCE_MEM &&
+	    iomem_is_exclusive(dev->resource[i].start))
+		return -EINVAL;
+
 	ret = pci_mmap_page_range(dev, i, vma,
 				  fpriv->mmap_state, write_combine);
 	if (ret < 0)
-- 
2.28.0


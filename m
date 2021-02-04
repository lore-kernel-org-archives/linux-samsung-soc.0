Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC449C433E0
	for <linux-samsung-soc@archiver.kernel.org>; Thu,  4 Feb 2021 19:25:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B43B464F10
	for <linux-samsung-soc@archiver.kernel.org>; Thu,  4 Feb 2021 19:25:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238017AbhBDTZq (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 4 Feb 2021 14:25:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58064 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238271AbhBDQ7U (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 4 Feb 2021 11:59:20 -0500
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2BEDAC06178A
        for <linux-samsung-soc@vger.kernel.org>; Thu,  4 Feb 2021 08:58:40 -0800 (PST)
Received: by mail-wr1-x42a.google.com with SMTP id c4so4320536wru.9
        for <linux-samsung-soc@vger.kernel.org>; Thu, 04 Feb 2021 08:58:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=CSXClwte+EBaSfb73OT9a258Z0fuumQByG0sZ3xvY0o=;
        b=kF3mIgExZ6yqH4eVMQt6WD7DEfAMygEvJlEbz5Xto3mUv0YDv1L49BGJIm43dk9bU1
         iXTPifKJP86J0pow9upJIpWRGPhVO1f2EMyxp18Untk7OSKOV1noZ4nOqj1K5+vZn89G
         y8rpqE5p8fJ2NUkDxK1tbqWLU3qx+6Ux/u9co=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=CSXClwte+EBaSfb73OT9a258Z0fuumQByG0sZ3xvY0o=;
        b=DA4JkWh86gyB5ne3N9FJ8N4NtSkrbwRIVOu76wekvq5sOhhapZ/Jjd3RRefeUgofCF
         feKoNL7XokHmqKTZXU2jk5R3++zEHlTSypV/7Jt8/kyg4LSyeqqxYiiaauVmsQJ2EFlZ
         e7ru/Q+5VS/6lThCF4Y89OaVjJnek6Q4P9BY28UuFSGph0cxFhJCkrHBPM8nkeljY30z
         WayAbuKpk4OEUsawnyKuZ5Jnf2I7r18o/nT10PTzz4pkmVjCG5MwdkvF8AhIND2ABub/
         DcWOnfN283LNdBYZmWaEpApzMNXVwBTkYwdRx/GEVwgCj3tEF3Po/E7umqOoEhIiT+9x
         vnCQ==
X-Gm-Message-State: AOAM531Q/+KYxf66ItEwtwZf+fSgdd1Xg00ex2Je6ENeDSpB0HAcBGHG
        kRF9WqVOB8ozdnn3SaYCx9ZwBw==
X-Google-Smtp-Source: ABdhPJzQxOtjiSlI6HeHAkG205a5zhJRcBC5cKGPxy6h1VeNvxXZzxclR5CwPfNihVa2lXiEvFOWdA==
X-Received: by 2002:adf:decb:: with SMTP id i11mr313945wrn.78.1612457918861;
        Thu, 04 Feb 2021 08:58:38 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id i64sm6700187wmi.19.2021.02.04.08.58.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Feb 2021 08:58:38 -0800 (PST)
From:   Daniel Vetter <daniel.vetter@ffwll.ch>
To:     LKML <linux-kernel@vger.kernel.org>
Cc:     DRI Development <dri-devel@lists.freedesktop.org>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
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
Subject: [PATCH 0/2] pci sysfs file iomem revoke support
Date:   Thu,  4 Feb 2021 17:58:29 +0100
Message-Id: <20210204165831.2703772-1-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi all,

This is a revised version of patch 12 from my series to lock down some
follow_pfn vs VM_SPECIAL races:

https://lore.kernel.org/dri-devel/CAKwvOdnSrsnTgPEuQJyaOTSkTP2dR9208Y66HQG_h1e2LKfqtw@mail.gmail.com/

Stephen reported an issue on HAVE_PCI_LEGACY platforms which this patch
set tries to address. Previous patches are all still in linux-next.

Stephen, would be awesome if you can give this a spin.

Björn/Greg, review on the first patch is needed, I think that's the
cleanest approach from all the options I discussed with Greg in this
thread:

https://lore.kernel.org/dri-devel/CAKMK7uGrdDrbtj0OyzqQc0CGrQwc2F3tFJU9vLfm2jjufAZ5YQ@mail.gmail.com/

Cheers, Daniel

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

Daniel Vetter (2):
  PCI: also set up legacy files only after sysfs init
  PCI: Revoke mappings like devmem

 drivers/pci/pci-sysfs.c | 11 +++++++++++
 drivers/pci/proc.c      |  1 +
 2 files changed, 12 insertions(+)

-- 
2.30.0


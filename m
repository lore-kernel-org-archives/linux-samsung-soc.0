Return-Path: <SRS0=q3lv=DQ=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0801DC4363A
	for <linux-samsung-soc@archiver.kernel.org>; Fri,  9 Oct 2020 12:48:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 99116222B9
	for <linux-samsung-soc@archiver.kernel.org>; Fri,  9 Oct 2020 12:48:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="HLVf/9fs"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732612AbgJIMsx (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 9 Oct 2020 08:48:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37816 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732451AbgJIMsx (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 9 Oct 2020 08:48:53 -0400
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com [IPv6:2607:f8b0:4864:20::742])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A6B0C0613D8
        for <linux-samsung-soc@vger.kernel.org>; Fri,  9 Oct 2020 05:48:52 -0700 (PDT)
Received: by mail-qk1-x742.google.com with SMTP id w12so10378404qki.6
        for <linux-samsung-soc@vger.kernel.org>; Fri, 09 Oct 2020 05:48:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=bKAda/rTW4nq6+j1jXEBgS/13SJBQ2WY2j5bHQ+ISAM=;
        b=HLVf/9fs3er+0kSwyJTggMLNde7v6twDJX2OORdUgNP4K/LTsJAusSj3xZhnK/9iEP
         2MiDVI/gcY40GDzZOHFy1D1gUeZmYvK+y8q3WrgO2wIZyqUCgxZmIrGytraz5FbwrvVk
         FIWoQQ/EYzOwBXKaVfiWwe8sni4FQhNRH93rHGzY9G+WQBuX2toU0JYl3qUK8vxILogk
         CO/+6WIVejt98w1VEtO30gtBiu4FzGnjZIpjkg9+CRC8VLCjso0cqZThY5uICmC4Leel
         mG8PVTlyewS4MOqVzGOqsDKY0BxrcNvf/7YuapUiGj3wEjRkZ+Rv/IezCJ6KD+Oa9Tui
         5i5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=bKAda/rTW4nq6+j1jXEBgS/13SJBQ2WY2j5bHQ+ISAM=;
        b=TLlIyFIP8gxNi4UNnXhozkay/Sg63o+pssFVnBjN7tTJeQ4upivnVt6FqdSvC5rWWR
         /yvAQ9JLQ/N4t9lMe8704wCSg/GlqVkdof3ql3IiNySmRfGVfHBTt8kdw20JxCmVNC+C
         i3+upMYRO4LlanBQ7CzXWAQJ33EH/LZL7bagwXbyI8Rwh67rgFBPpqwj0i8wCS0AwRBV
         yN1+xVu4ssw/y02rR+iHzZ/+UvyodrqqfLIu6JUghx7IZIAaaKG+/xMuA8Nf5G81sJwT
         Cp/gc+5cvGVTbB6gMbGAjscesK/giFPVHKCo97C97KxCZJ1Cu5oAk3Y5rbWTPTauOYHx
         oPGQ==
X-Gm-Message-State: AOAM533kac8QE5ps/A+TGuu3Uoy/0ROw94gRnsAmrn9mkZs3A1lXl2FC
        vRnEDpiiNgd2BPoPRTc706rBbw==
X-Google-Smtp-Source: ABdhPJxKkkXOIA4i8TbRkwc7dtfamUS7+upXdOHf9JVMgQW+IXdzrhalpqUKvvNnrEeFMFZ6pHcyaQ==
X-Received: by 2002:ae9:e702:: with SMTP id m2mr6280147qka.387.1602247731583;
        Fri, 09 Oct 2020 05:48:51 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-156-34-48-30.dhcp-dynamic.fibreop.ns.bellaliant.net. [156.34.48.30])
        by smtp.gmail.com with ESMTPSA id m18sm4248636qkk.102.2020.10.09.05.48.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2020 05:48:50 -0700 (PDT)
Received: from jgg by mlx with local (Exim 4.94)
        (envelope-from <jgg@ziepe.ca>)
        id 1kQrpK-001y6e-9J; Fri, 09 Oct 2020 09:48:50 -0300
Date:   Fri, 9 Oct 2020 09:48:50 -0300
From:   Jason Gunthorpe <jgg@ziepe.ca>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Daniel Vetter <daniel.vetter@ffwll.ch>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        LKML <linux-kernel@vger.kernel.org>, kvm@vger.kernel.org,
        linux-mm@kvack.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-media@vger.kernel.org,
        linux-s390@vger.kernel.org,
        Daniel Vetter <daniel.vetter@intel.com>,
        Kees Cook <keescook@chromium.org>,
        Dan Williams <dan.j.williams@intel.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        John Hubbard <jhubbard@nvidia.com>,
        =?utf-8?B?SsOpcsO0bWU=?= Glisse <jglisse@redhat.com>,
        Jan Kara <jack@suse.cz>,
        Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [PATCH v2 09/17] mm: Add unsafe_follow_pfn
Message-ID: <20201009124850.GP5177@ziepe.ca>
References: <20201009075934.3509076-1-daniel.vetter@ffwll.ch>
 <20201009075934.3509076-10-daniel.vetter@ffwll.ch>
 <20201009123421.67a80d72@coco.lan>
 <20201009122111.GN5177@ziepe.ca>
 <20201009143723.45609bfb@coco.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201009143723.45609bfb@coco.lan>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Fri, Oct 09, 2020 at 02:37:23PM +0200, Mauro Carvalho Chehab wrote:

> I'm not a mm/ expert, but, from what I understood from Daniel's patch
> description is that this is unsafe *only if*  __GFP_MOVABLE is used.

No, it is unconditionally unsafe. The CMA movable mappings are
specific VMAs that will have bad issues here, but there are other
types too.

The only way to do something at a VMA level is to have a list of OK
VMAs, eg because they were creatd via a special mmap helper from the
media subsystem.

> Well, no drivers inside the media subsystem uses such flag, although
> they may rely on some infrastructure that could be using it behind
> the bars.

It doesn't matter, nothing prevents the user from calling media APIs
on mmaps it gets from other subsystems.

> If this is the case, the proper fix seems to have a GFP_NOT_MOVABLE
> flag that it would be denying the core mm code to set __GFP_MOVABLE.

We can't tell from the VMA these kinds of details..

It has to go the other direction, evey mmap that might be used as a
userptr here has to be found and the VMA specially created to allow
its use. At least that is a kernel only change, but will need people
with the HW to do this work.

> Please let address the issue on this way, instead of broken an
> userspace API that it is there since 1991.

It has happened before :( It took 4 years for RDMA to undo the uAPI
breakage caused by a security fix for something that was a 15 years
old bug. 

Jason

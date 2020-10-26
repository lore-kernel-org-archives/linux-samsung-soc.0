Return-Path: <SRS0=YeST=EB=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D583C5DF9D
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 26 Oct 2020 22:15:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D3BC720878
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 26 Oct 2020 22:15:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="kkBWmOfR"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392576AbgJZWP0 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 26 Oct 2020 18:15:26 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:54050 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2392607AbgJZWPZ (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 26 Oct 2020 18:15:25 -0400
Received: by mail-wm1-f68.google.com with SMTP id d78so13185145wmd.3
        for <linux-samsung-soc@vger.kernel.org>; Mon, 26 Oct 2020 15:15:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=wSFQl5tEZJlMW2FF6sx0fmEDfKkZOvTzLyUG7GjevAQ=;
        b=kkBWmOfRGiGfynKFUUsY6Bg1cuklrhT3VBOwm/J9YiPw9z4cVdpY9sATV1o7Idrq4y
         00hLvWtKsiLWja7bX9HLg4TGqnRGU4YCOAVHW3FIdKeAgKvYbKa00UPb9+F6C9BiFdwx
         tqpkyBwyQ5Oqzusk6GTT3vSRGHf/YxvJsuWk8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=wSFQl5tEZJlMW2FF6sx0fmEDfKkZOvTzLyUG7GjevAQ=;
        b=TOWuK3fvH5Rz1s8+WIf+qbsjnLU18mi2zlMQr9STrZ7/063MOkcEiBNX5cxYmCQTFu
         mbThBfbviYiV6pcWAzmSt2DKr/TULGR/IG1NHajzWAARinJelWv9bAJfl6iEW9rPlV7Y
         4TQdDTxTq/O1vLJe4JqKesgx3pCes5HN/LPbx2MzEIdrSywKYDPTVed3ko4uGfjst42U
         BglF6UcR3QgpeH5l0JRXLS1PpOmo9r4CerPw+hW7cHdFXK7tfHf4KChXQE/Z++RgVu1j
         UbORa55B9GmMPQwTb8albnucbkBKV9ACoRY68424Wjxy4xh1GkodfuENlM6yyHXmLQQj
         iBmA==
X-Gm-Message-State: AOAM533hCjZ8XwSld0I49FN0eO3OsHw+/77Bbdzrvf1y8kMmf80e6MfO
        cBwMtXAdCtmp1TJYAWZNgWh6Iw==
X-Google-Smtp-Source: ABdhPJyCNb7QwTcRnF+7btKQht31eA1jnpozPoni78IGAJc6AIIgtmLd2KT94mvBmswfJX1TK6OixA==
X-Received: by 2002:a1c:3243:: with SMTP id y64mr18039466wmy.175.1603750522164;
        Mon, 26 Oct 2020 15:15:22 -0700 (PDT)
Received: from chromium.org (216.131.76.34.bc.googleusercontent.com. [34.76.131.216])
        by smtp.gmail.com with ESMTPSA id f17sm23103391wme.22.2020.10.26.15.15.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2020 15:15:21 -0700 (PDT)
Date:   Mon, 26 Oct 2020 22:15:20 +0000
From:   Tomasz Figa <tfiga@chromium.org>
To:     Daniel Vetter <daniel.vetter@ffwll.ch>
Cc:     DRI Development <dri-devel@lists.freedesktop.org>,
        LKML <linux-kernel@vger.kernel.org>, kvm@vger.kernel.org,
        linux-mm@kvack.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-media@vger.kernel.org,
        linux-s390@vger.kernel.org,
        Daniel Vetter <daniel.vetter@intel.com>,
        Jason Gunthorpe <jgg@ziepe.ca>,
        Pawel Osciak <pawel@osciak.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        John Hubbard <jhubbard@nvidia.com>,
        =?iso-8859-1?B?Suly9G1l?= Glisse <jglisse@redhat.com>,
        Jan Kara <jack@suse.cz>,
        Dan Williams <dan.j.williams@intel.com>
Subject: Re: [PATCH v4 05/15] mm/frame-vector: Use FOLL_LONGTERM
Message-ID: <20201026221520.GC2802004@chromium.org>
References: <20201026105818.2585306-1-daniel.vetter@ffwll.ch>
 <20201026105818.2585306-6-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20201026105818.2585306-6-daniel.vetter@ffwll.ch>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi Daniel,

On Mon, Oct 26, 2020 at 11:58:08AM +0100, Daniel Vetter wrote:
> This is used by media/videbuf2 for persistent dma mappings, not just
> for a single dma operation and then freed again, so needs
> FOLL_LONGTERM.
> 
> Unfortunately current pup_locked doesn't support FOLL_LONGTERM due to
> locking issues. Rework the code to pull the pup path out from the
> mmap_sem critical section as suggested by Jason.
> 
> By relying entirely on the vma checks in pin_user_pages and follow_pfn
> (for vm_flags and vma_is_fsdax) we can also streamline the code a lot.
> 
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> Cc: Jason Gunthorpe <jgg@ziepe.ca>
> Cc: Pawel Osciak <pawel@osciak.com>
> Cc: Marek Szyprowski <m.szyprowski@samsung.com>
> Cc: Kyungmin Park <kyungmin.park@samsung.com>
> Cc: Tomasz Figa <tfiga@chromium.org>
> Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: John Hubbard <jhubbard@nvidia.com>
> Cc: Jérôme Glisse <jglisse@redhat.com>
> Cc: Jan Kara <jack@suse.cz>
> Cc: Dan Williams <dan.j.williams@intel.com>
> Cc: linux-mm@kvack.org
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-samsung-soc@vger.kernel.org
> Cc: linux-media@vger.kernel.org
> Signed-off-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> --
> v2: Streamline the code and further simplify the loop checks (Jason)
> ---
>  mm/frame_vector.c | 50 ++++++++++++++---------------------------------
>  1 file changed, 15 insertions(+), 35 deletions(-)
> 

Thank you for the patch. Please see my comments inline.

> diff --git a/mm/frame_vector.c b/mm/frame_vector.c
> index 10f82d5643b6..d44779e56313 100644
> --- a/mm/frame_vector.c
> +++ b/mm/frame_vector.c
> @@ -38,7 +38,6 @@ int get_vaddr_frames(unsigned long start, unsigned int nr_frames,
>  	struct vm_area_struct *vma;
>  	int ret = 0;
>  	int err;
> -	int locked;
>  
>  	if (nr_frames == 0)
>  		return 0;
> @@ -48,40 +47,25 @@ int get_vaddr_frames(unsigned long start, unsigned int nr_frames,
>  
>  	start = untagged_addr(start);
>  
> -	mmap_read_lock(mm);
> -	locked = 1;
> -	vma = find_vma_intersection(mm, start, start + 1);
> -	if (!vma) {
> -		ret = -EFAULT;
> -		goto out;
> -	}
> -
> -	/*
> -	 * While get_vaddr_frames() could be used for transient (kernel
> -	 * controlled lifetime) pinning of memory pages all current
> -	 * users establish long term (userspace controlled lifetime)
> -	 * page pinning. Treat get_vaddr_frames() like
> -	 * get_user_pages_longterm() and disallow it for filesystem-dax
> -	 * mappings.
> -	 */
> -	if (vma_is_fsdax(vma)) {
> -		ret = -EOPNOTSUPP;
> -		goto out;
> -	}
> -
> -	if (!(vma->vm_flags & (VM_IO | VM_PFNMAP))) {
> +	ret = pin_user_pages_fast(start, nr_frames,
> +				  FOLL_FORCE | FOLL_WRITE | FOLL_LONGTERM,
> +				  (struct page **)(vec->ptrs));
> +	if (ret > 0) {
>  		vec->got_ref = true;
>  		vec->is_pfns = false;
> -		ret = pin_user_pages_locked(start, nr_frames,
> -			gup_flags, (struct page **)(vec->ptrs), &locked);

Should we drop the gup_flags argument, since it's ignored now?

> -		goto out;
> +		goto out_unlocked;
>  	}
>  

Should we initialize ret with 0 here, since pin_user_pages_fast() can
return a negative error code, but below we use it as a counter for the
looked up frames?

Best regards,
Tomasz

> +	mmap_read_lock(mm);
>  	vec->got_ref = false;
>  	vec->is_pfns = true;
>  	do {
>  		unsigned long *nums = frame_vector_pfns(vec);
>  
> +		vma = find_vma_intersection(mm, start, start + 1);
> +		if (!vma)
> +			break;
> +
>  		while (ret < nr_frames && start + PAGE_SIZE <= vma->vm_end) {
>  			err = follow_pfn(vma, start, &nums[ret]);
>  			if (err) {
> @@ -92,17 +76,13 @@ int get_vaddr_frames(unsigned long start, unsigned int nr_frames,
>  			start += PAGE_SIZE;
>  			ret++;
>  		}
> -		/*
> -		 * We stop if we have enough pages or if VMA doesn't completely
> -		 * cover the tail page.
> -		 */
> -		if (ret >= nr_frames || start < vma->vm_end)
> +		/* Bail out if VMA doesn't completely cover the tail page. */
> +		if (start < vma->vm_end)
>  			break;
> -		vma = find_vma_intersection(mm, start, start + 1);
> -	} while (vma && vma->vm_flags & (VM_IO | VM_PFNMAP));
> +	} while (ret < nr_frames);
>  out:
> -	if (locked)
> -		mmap_read_unlock(mm);
> +	mmap_read_unlock(mm);
> +out_unlocked:
>  	if (!ret)
>  		ret = -EFAULT;
>  	if (ret > 0)
> -- 
> 2.28.0
> 

Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2480FBE9
	for <linux-samsung-soc@vger.kernel.org>; Fri, 16 Feb 2024 01:06:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708045594; cv=none; b=kCcTAVvgp7gvShSCUTS+/qqOZ8M6X4HQtvQ6AjRG9p0GdS4HHOWkN77nzAyX69a5aJYhzd9LT/6RIPuTWTEE16Hq2NggkHtlfE2gFCNP9QKkACAzJVA8gH5mrtTMeQnyjrWidGpR7ekCOUagCJSPwt8auTpmckYLpcbMOtt43mM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708045594; c=relaxed/simple;
	bh=pdX4YFmXvkCYJozarbc5NuAljGq2QKgP22r5bHoyo6M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PKMXOO8JsG/2JaxSvebfCvGUJ/hY8Y5gyYf2xd6HWV94gQ7UBX6AjV5+pA+p78RpVy44Sz00u+7k7HqC9+UK+2mvlUiKWrL3U9kFYHewVVWxU70nMmYcM+rjdtbj5u4PTwbfLO4FIUjYLN6V+mISSpVhKRFXxgslZ/DoPdgdMxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen-com.20230601.gappssmtp.com header.i=@soleen-com.20230601.gappssmtp.com header.b=fMkLOjyd; arc=none smtp.client-ip=209.85.160.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen-com.20230601.gappssmtp.com header.i=@soleen-com.20230601.gappssmtp.com header.b="fMkLOjyd"
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-42dd5c6c774so3758501cf.2
        for <linux-samsung-soc@vger.kernel.org>; Thu, 15 Feb 2024 17:06:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen-com.20230601.gappssmtp.com; s=20230601; t=1708045592; x=1708650392; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=SJOk5GBoNGjtYX6UP2FD6x8pshcgNrZex6zZ50AbGYM=;
        b=fMkLOjydWFzyo3tHChBuLpbIRXKs2SDBgSpHot0H0eZk+Mn7aohqz4yAeUXkcGbukN
         tCIyuhwdsqBRQMkUJXoPVDVF1XEmf3gseQlQC4LZsyeSgnD5/KuSxFf45nfB3baDvU0i
         C3vubDKbbYUj4B/0Kk0lhrHTVw6Pu9dI7ta4oTFx3U/1bPUWwN5LLwGjBvNM82vY5qDq
         zGuZ5kAmJ3+rohu93m7E5zvDGTt0jy6rL1mV1jk8Ue7zRP4fK0U7ZsbSgVGTk7M4StmG
         /L6CKRwJHr8psQ+pYeuWTvk0XGY/cPu5VBSKAEtGccMgdzH09vKaNVqiLW1lRTbzrLY9
         y9Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708045592; x=1708650392;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SJOk5GBoNGjtYX6UP2FD6x8pshcgNrZex6zZ50AbGYM=;
        b=U6h8JnCN3M5QYDNqIq7T6cv4gPCIzSjbsHf6h6rKXfSYDoV+xdt4WlEczh33MmH8LQ
         lRzvfEJ/jyq4EeAcUIQug+K73mtKfH5Sppl8sVvsZdzp3ZvQvJ4HhZ1Yfua97sV/gLRN
         ihIovXMN6Rnn6nH7P8lDUBKe/uy7aJ+Ry0BCxuW0YwX1xn7DceOCC17MZmDK2f4c1TmR
         2jilwQn85x0h2wA6te9nPg14k9BznK1tiAJOY0AoqNEuQ8E2jq3t7LlhhbJorRLFsCI4
         dfyEDIG1Lti0HdR8Y4QxpFfhGVH0HORwIFOG58gIF7BYTPySEMxUotu1AWMdOU7FVUa+
         KDhw==
X-Forwarded-Encrypted: i=1; AJvYcCUk6P+FzBk+jKcz8G+8SBHKNPUjUf9955bEx0dZP4m3Ocp1pW7gUvntE+kCLs1FalZyY0XbaYkmia1ifp50SgLaEVNjC5Wh0i7idgZsF3/6E1U=
X-Gm-Message-State: AOJu0YzC6dv0/SYRV9WAclfhXN873NRQ2h5+LeDN67WYcNnd47UxaiBD
	LJmBRka+j3/c2wuJCjHNu7vQ8mKRT8zEWWXjarY5E+CwoHKcJAQxxY83ZPJTQp9tcIidFLAWzKv
	LAmvJWBBKWTZfcn2knuBrR8R5t3A7E9q9f/SvFA==
X-Google-Smtp-Source: AGHT+IFn+h3r/AaoF4MfmIEWnQLUDUmnx1Kec57gXxwxEXHIeMLPIowE5fZkN66KK2rAD8UQkIaND2e8M33sIsMCnhQ=
X-Received: by 2002:a05:622a:1048:b0:42c:798a:a053 with SMTP id
 f8-20020a05622a104800b0042c798aa053mr4373943qte.55.1708045591818; Thu, 15 Feb
 2024 17:06:31 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240207174102.1486130-1-pasha.tatashin@soleen.com>
 <20240207174102.1486130-2-pasha.tatashin@soleen.com> <8ce2cd7b-7702-45aa-b4c8-25a01c27ed83@arm.com>
 <CA+CK2bC=XyUhoSP9f0XBqEnQ-P5mMT2U=5dfzRSc9C=2b+bstQ@mail.gmail.com> <b008bd2d-a189-481f-917d-bb045c43cb07@arm.com>
In-Reply-To: <b008bd2d-a189-481f-917d-bb045c43cb07@arm.com>
From: Pasha Tatashin <pasha.tatashin@soleen.com>
Date: Thu, 15 Feb 2024 20:05:55 -0500
Message-ID: <CA+CK2bBTe93nXzY3Qhty+821LrkjBVnQDxro3m7Y-GVihSP18A@mail.gmail.com>
Subject: Re: [PATCH v4 01/10] iommu/vt-d: add wrapper functions for page allocations
To: Robin Murphy <robin.murphy@arm.com>
Cc: akpm@linux-foundation.org, alim.akhtar@samsung.com, alyssa@rosenzweig.io, 
	asahi@lists.linux.dev, baolu.lu@linux.intel.com, bhelgaas@google.com, 
	cgroups@vger.kernel.org, corbet@lwn.net, david@redhat.com, 
	dwmw2@infradead.org, hannes@cmpxchg.org, heiko@sntech.de, 
	iommu@lists.linux.dev, jernej.skrabec@gmail.com, jonathanh@nvidia.com, 
	joro@8bytes.org, krzysztof.kozlowski@linaro.org, linux-doc@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, linux-rockchip@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-sunxi@lists.linux.dev, 
	linux-tegra@vger.kernel.org, lizefan.x@bytedance.com, marcan@marcan.st, 
	mhiramat@kernel.org, m.szyprowski@samsung.com, paulmck@kernel.org, 
	rdunlap@infradead.org, samuel@sholland.org, suravee.suthikulpanit@amd.com, 
	sven@svenpeter.dev, thierry.reding@gmail.com, tj@kernel.org, 
	tomas.mudrunka@gmail.com, vdumpa@nvidia.com, wens@csie.org, will@kernel.org, 
	yu-cheng.yu@intel.com, rientjes@google.com, bagasdotme@gmail.com, 
	mkoutny@suse.com
Content-Type: text/plain; charset="UTF-8"

> >>> + */
> >>> +static inline void *iommu_alloc_page_node(int nid, gfp_t gfp)
> >>> +{
> >>> +     return iommu_alloc_pages_node(nid, gfp, 0);
> >>> +}
> >>
> >> TBH I'm not entirely convinced that saving 4 characters per invocation
> >> times 11 invocations makes this wrapper worthwhile :/
> >
> > Let's keep them. After the clean-up that you suggested, there are
> > fewer functions left in this file, but I think that it is cleaner to
> > keep these remaining, as it is beneficial to easily distinguish when
> > exactly one page is allocated vs when multiple are allocated via code
> > search.
>
> But is it, really? It's not at all obvious to me *why* it would be
> significantly interesting to distinguish fixed order-0 allocations from
> higher-order or variable-order (which may still be 0) ones. After all,
> there's no regular alloc_page_node() wrapper, yet plenty more callers of
> alloc_pages_node(..., 0) :/

The pages that are allocated with order > 0 cannot be freed using
iommu_put_pages_list(), without messing up refcounts in the tail
pages. I think having a dedicated function that guarantees order = 0
pages allocation makes it easier for the reviewer to follow the code,
and ensures that only these pages are put on the freelist.

Even in the existing code, the order=0 allocation is wrapped in the
*alloc_pgtable_page() function.

Pasha


>
> Thanks,
> Robin.

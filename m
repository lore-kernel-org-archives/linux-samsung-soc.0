Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEFFE24419B
	for <linux-samsung-soc@vger.kernel.org>; Wed, 12 Mar 2025 12:45:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741783548; cv=none; b=FkudGm6xnNv6m0oHI/yDTNYC2pafDTp+eVtJEpMdYLUT3nxwbCdwt0wfkhtkZHq+ivLmbxiZVlglPkCb1TkphVpI0bDYznXhXJiVQrka8lPtw3yDkAwDCzo/NsFLlEQpjeVpzictLiQUZXClJmBWS4zd8vO0tuhQ3f2yH6ZX7cs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741783548; c=relaxed/simple;
	bh=w7qxWcK6Y+lr9flaT5izlqxkohZLAMbvmvIVsbTBCwo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Lalo6pMsiQ2WJen/GMEVVh8cI3/siQEEYTUchLNebQlarVV538iBz2C/NKCmUiHDRyJPfwbjqxvSaopasaWUSLRHW4doCiQB5iVk2XdlOoW1uMNuGXpqWFJ3btCxwpGhSluLkMYBLfalS0bqlJLMTeI8d46niZ2d88iB58/nYp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Ywe7fQuL; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Ywe7fQuL"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-438d9c391fcso44155e9.0
        for <linux-samsung-soc@vger.kernel.org>; Wed, 12 Mar 2025 05:45:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1741783545; x=1742388345; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=O7nXrf8enrrb8z3uABVuZMTlrSLNofRDk6iKufuqXac=;
        b=Ywe7fQuLhRoN2XSCceaZXzeIZbcdIXj1wOnXDBPxOkHZrgOblbnv3U04HQQh6srIsB
         caOSb8a7nwCJbLkVKUBuKCt4h9nKxHc/QpVBQSoxifq+iOEE1JN0YFFRaJVJBxbxnvXs
         I73XiZ3QkK7YgO9fc5tLiGYIu46Yop/8EgFDRBpPN+mbR/+DbSGP5yIzd+qv9KlU0C1/
         ixqgSTtk2TavArOPSiMPB4vlrewijDM2wkx9MkfHZ/S825fdKGYwv/xYWwOS+c8B3ND3
         UAoh5QzGh81Dh468uoDMfDNz7tJnvdZ5hhoaOZ8QSKxtKeJqWuwth6CILdNwpph2wXf3
         nEtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741783545; x=1742388345;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O7nXrf8enrrb8z3uABVuZMTlrSLNofRDk6iKufuqXac=;
        b=YTHa42wSjcms9EJg2b+HsQvdThLrP49EJnuDTrA/heNB/vggpW2WqmS43ecciKAkfA
         RtxD9Ayv52J+PuYyrtvL0YnAcW5J1aq3V+00rOlT0FGxPd59OeNDeuGQOgpN9G8HDhlP
         FLK1W+zSh0+A3eeSF5DHp/6haJDT7BNGkDB5/ViBs7rO6AUEXbuj/VZuRnHLsrWC3VAy
         aoc+OVfMu/4bwRMmSaXaF4GR4ZvucwQHSDa7pEO3mWE6XGhVXmjU7WSz7wWfccVkj2ks
         2JYWzAIksiulQ5sqUdU/Gn8hBRheCTxgoyOWN0wq7S7iP232UFnUbkOjDCJR0mcx9cwF
         /tHw==
X-Forwarded-Encrypted: i=1; AJvYcCVCChwP4myS1Yq5153ov9iaqT0N84atnUptYzjG4ovvEx+CrDTL3QjihEoJRKbJ2yggiOPaQIgGmwQKjY/3MAXttw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzraMSjmMttUVIKS1M9Dn35hD6cFiuT4FjFyYbPnz84x4V98ZTz
	wG4ikejErHyzrlbhag1ENxstGZzK9raBgou3J9Kl8RM8EoazWtwBtAB4TIs+XQ==
X-Gm-Gg: ASbGnctUtdjV11DUmft8iEPsqP6Jdbw+0xe/VVsTucUztnL3/bMUBhuzGCPQ5sE9WkE
	eHzRmIUX/yxHYz1olw/7iCj9V8FNNptRKOkLEa0DWsUANcddYxvBPV1T/AXFHEXBW3wY3w9e7Rn
	Sk8RuUxNvWyMKTjqcgSmbDbTfPwHzNI3jkV/8eGVkYwNdsT0YEOnAMkXd6IjuEWZYtb0AX7lp6w
	jfFTfRVEMoHQ40hv6R4+qwlgd/3PNXLE9hqd5d5x0qAtb2qjE41HI1LDQkfyTgq840WO6w8/wHx
	jtGD2SeNQnoQOwQgqCmprhlI36TT2u4IdCcmgpb6z3YoLsLTikKGFv5hk82cFwhZKex0d8/HfIt
	8YkryCZwJlWtFopY=
X-Google-Smtp-Source: AGHT+IGl6ij5XGs/qN6P6iUkVVrm0h4AAzKswiqP0QsBVlB9onr8dRHcRoIgJqJfm8N1ML/DsO9qAQ==
X-Received: by 2002:a05:600c:5801:b0:43b:bfe9:8b43 with SMTP id 5b1f17b1804b1-43d09ea3748mr1245205e9.4.1741783544916;
        Wed, 12 Mar 2025 05:45:44 -0700 (PDT)
Received: from google.com (88.140.78.34.bc.googleusercontent.com. [34.78.140.88])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d0a8c5d0fsm20697625e9.32.2025.03.12.05.45.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Mar 2025 05:45:44 -0700 (PDT)
Date: Wed, 12 Mar 2025 12:45:39 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Alim Akhtar <alim.akhtar@samsung.com>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Albert Ou <aou@eecs.berkeley.edu>, asahi@lists.linux.dev,
	Lu Baolu <baolu.lu@linux.intel.com>,
	David Woodhouse <dwmw2@infradead.org>,
	Heiko Stuebner <heiko@sntech.de>, iommu@lists.linux.dev,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Joerg Roedel <joro@8bytes.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org, linux-rockchip@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-sunxi@lists.linux.dev,
	linux-tegra@vger.kernel.org,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Hector Martin <marcan@marcan.st>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Samuel Holland <samuel@sholland.org>,
	Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
	Sven Peter <sven@svenpeter.dev>,
	Thierry Reding <thierry.reding@gmail.com>,
	Tomasz Jeznach <tjeznach@rivosinc.com>,
	Krishna Reddy <vdumpa@nvidia.com>, Chen-Yu Tsai <wens@csie.org>,
	Will Deacon <will@kernel.org>, Bagas Sanjaya <bagasdotme@gmail.com>,
	Joerg Roedel <jroedel@suse.de>,
	Pasha Tatashin <pasha.tatashin@soleen.com>, patches@lists.linux.dev,
	David Rientjes <rientjes@google.com>,
	Matthew Wilcox <willy@infradead.org>
Subject: Re: [PATCH v3 15/23] iommu/pages: Move the __GFP_HIGHMEM checks into
 the common code
Message-ID: <Z9GB8_j_8a4xCTsT@google.com>
References: <0-v3-e797f4dc6918+93057-iommu_pages_jgg@nvidia.com>
 <15-v3-e797f4dc6918+93057-iommu_pages_jgg@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <15-v3-e797f4dc6918+93057-iommu_pages_jgg@nvidia.com>

On Tue, Feb 25, 2025 at 03:39:32PM -0400, Jason Gunthorpe wrote:
> The entire allocator API is built around using the kernel virtual address,
> it is illegal to pass GFP_HIGHMEM in as a GFP flag. Block it in the common
> code. Remove the duplicated checks from drivers.
> 
> Reviewed-by: Lu Baolu <baolu.lu@linux.intel.com>
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
Reviewed-by: Mostafa Saleh <smostafa@google.com>
> ---
>  drivers/iommu/io-pgtable-arm.c  | 2 --
>  drivers/iommu/io-pgtable-dart.c | 1 -
>  drivers/iommu/iommu-pages.c     | 4 ++++
>  3 files changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/iommu/io-pgtable-arm.c b/drivers/iommu/io-pgtable-arm.c
> index 62df2528d020b2..08d0f62abe8a09 100644
> --- a/drivers/iommu/io-pgtable-arm.c
> +++ b/drivers/iommu/io-pgtable-arm.c
> @@ -267,8 +267,6 @@ static void *__arm_lpae_alloc_pages(size_t size, gfp_t gfp,
>  	dma_addr_t dma;
>  	void *pages;
>  
> -	VM_BUG_ON((gfp & __GFP_HIGHMEM));
> -
>  	if (cfg->alloc)
>  		pages = cfg->alloc(cookie, size, gfp);
>  	else
> diff --git a/drivers/iommu/io-pgtable-dart.c b/drivers/iommu/io-pgtable-dart.c
> index 7efcaea0bd5c86..ebf330e67bfa30 100644
> --- a/drivers/iommu/io-pgtable-dart.c
> +++ b/drivers/iommu/io-pgtable-dart.c
> @@ -111,7 +111,6 @@ static void *__dart_alloc_pages(size_t size, gfp_t gfp)
>  {
>  	int order = get_order(size);
>  
> -	VM_BUG_ON((gfp & __GFP_HIGHMEM));
>  	return iommu_alloc_pages(gfp, order);
>  }
>  
> diff --git a/drivers/iommu/iommu-pages.c b/drivers/iommu/iommu-pages.c
> index 3077df642adb1f..a7eed09420a231 100644
> --- a/drivers/iommu/iommu-pages.c
> +++ b/drivers/iommu/iommu-pages.c
> @@ -37,6 +37,10 @@ void *iommu_alloc_pages_node(int nid, gfp_t gfp, unsigned int order)
>  	const unsigned long pgcnt = 1UL << order;
>  	struct folio *folio;
>  
> +	/* This uses page_address() on the memory. */
> +	if (WARN_ON(gfp & __GFP_HIGHMEM))
> +		return NULL;
> +
>  	/*
>  	 * __folio_alloc_node() does not handle NUMA_NO_NODE like
>  	 * alloc_pages_node() did.
> -- 
> 2.43.0
> 

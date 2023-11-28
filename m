Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="L2M2Qprf"
Received: from mail-qt1-x833.google.com (mail-qt1-x833.google.com [IPv6:2607:f8b0:4864:20::833])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 50C5F197
	for <linux-samsung-soc@vger.kernel.org>; Tue, 28 Nov 2023 15:08:49 -0800 (PST)
Received: by mail-qt1-x833.google.com with SMTP id d75a77b69052e-423a459d616so20797091cf.1
        for <linux-samsung-soc@vger.kernel.org>; Tue, 28 Nov 2023 15:08:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1701212928; x=1701817728; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ZwfH1boRaqUSm7vYG/zdQBuuZhpN21nmfcJNTWlLUDE=;
        b=L2M2Qprf4E13EmuQfMCiF96aDL6KRUKn30A8AJ9b64X816aPXJAY9oxw7B1ln8iZHi
         48FDR+YptH8ftAV2+eOX/vl7Oe5bDpdaafnB96VWxqu5tkeNY7SunuexF2cs/fzyj/PF
         52SOZGEcxMRPEPkYoIZQOTGi2wnFe8v/w1oF10w6RQwekK+EzxkxlYt0qcfzwiJQts+H
         2tMU1YUY+TjpQSYKZH1l+OlSp3m7dzueKnbvTL7NXjfpV4JEEkxClWrtUUf4jcXVj6jt
         e7sejvPKLZx1EPf+lDFFwqdwpKQonrOaiVG5Lue0KJdEEO6Oz2qRGuU1t6eH92/gwk6X
         Cj3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701212928; x=1701817728;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZwfH1boRaqUSm7vYG/zdQBuuZhpN21nmfcJNTWlLUDE=;
        b=OE7LBB01i0O75lYnul9qBFQxNIC9ujMhMScitrRUbwaRGB9s1rFOg63V7mbRq1+QzL
         Q79Fx24CENGeMYybfSxvHgHPsfXGXOk4gTbV1Yo/8XP18QWKWYHphfez+uPNl1zuKfpO
         Bfwz2tfnrPfdNxYiKG4l3xxcZpMHrRszZ6Ud24+nWkzhFIEutpDaA0GjwaVydTz9m6L1
         h13AHDg34853W/4h6UdG3/a+Cai8RBrGyhQIBQczh8Wx2PsJMBOAYhh1AAF7kYwx/vEe
         IpPfG4tjFMtqLs7F4jrbqffx0hnGivQ7UKxVo8ji5YaOVFsGG9lG0sA2W4tCsmAh6pF+
         BZcw==
X-Gm-Message-State: AOJu0Yyaay3jObKiL11PmmVWGE+NpPgkTFXR78jzs2cmrwc3V2ne6UBK
	1J6QHUkN2kPoiDMygm+Y0BY/FRBl2F5HXwrDs8UlIA==
X-Google-Smtp-Source: AGHT+IH+DSzeg4H32kbSmeDdX42LwmFTBbiExz1cQ9Spo9pVMTh9OFSxf1oX9/Sr0tuUo1qYELK4l02okd8aqJLSMys=
X-Received: by 2002:a05:622a:d2:b0:423:7f91:3a17 with SMTP id
 p18-20020a05622a00d200b004237f913a17mr22124861qtw.21.1701212928489; Tue, 28
 Nov 2023 15:08:48 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231128204938.1453583-1-pasha.tatashin@soleen.com>
 <20231128204938.1453583-7-pasha.tatashin@soleen.com> <d99e0d4a-94a9-482b-b5b5-833cba518b86@arm.com>
 <CA+CK2bDswtrqiOMt3+0LBb0+7nJY9aBpzZdsmrWRzy9WxBqKEg@mail.gmail.com> <79c397ee-b71b-470e-9184-401b4b96a0d2@arm.com>
In-Reply-To: <79c397ee-b71b-470e-9184-401b4b96a0d2@arm.com>
From: Pasha Tatashin <pasha.tatashin@soleen.com>
Date: Tue, 28 Nov 2023 18:08:11 -0500
Message-ID: <CA+CK2bDZUHSLWB=ec6Jdjbi+y6fD8=j96bK-kPHYKc1uiVLZWw@mail.gmail.com>
Subject: Re: [PATCH 06/16] iommu/dma: use page allocation function provided by iommu-pages.h
To: Robin Murphy <robin.murphy@arm.com>
Cc: akpm@linux-foundation.org, alex.williamson@redhat.com, 
	alim.akhtar@samsung.com, alyssa@rosenzweig.io, asahi@lists.linux.dev, 
	baolu.lu@linux.intel.com, bhelgaas@google.com, cgroups@vger.kernel.org, 
	corbet@lwn.net, david@redhat.com, dwmw2@infradead.org, hannes@cmpxchg.org, 
	heiko@sntech.de, iommu@lists.linux.dev, jasowang@redhat.com, 
	jernej.skrabec@gmail.com, jgg@ziepe.ca, jonathanh@nvidia.com, joro@8bytes.org, 
	kevin.tian@intel.com, krzysztof.kozlowski@linaro.org, kvm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, linux-rockchip@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-sunxi@lists.linux.dev, 
	linux-tegra@vger.kernel.org, lizefan.x@bytedance.com, marcan@marcan.st, 
	mhiramat@kernel.org, mst@redhat.com, m.szyprowski@samsung.com, 
	netdev@vger.kernel.org, paulmck@kernel.org, rdunlap@infradead.org, 
	samuel@sholland.org, suravee.suthikulpanit@amd.com, sven@svenpeter.dev, 
	thierry.reding@gmail.com, tj@kernel.org, tomas.mudrunka@gmail.com, 
	vdumpa@nvidia.com, virtualization@lists.linux.dev, wens@csie.org, 
	will@kernel.org, yu-cheng.yu@intel.com
Content-Type: text/plain; charset="UTF-8"

> > This is true, however, we want to account and observe the pages
> > allocated by IOMMU subsystem for DMA buffers, as they are essentially
> > unmovable locked pages. Should we separate IOMMU memory from KVM
> > memory all together and add another field to /proc/meminfo, something
> > like "iommu -> iommu pagetable and dma memory", or do we want to
> > export DMA memory separately from IOMMU page tables?
>
> These are not allocated by "the IOMMU subsystem", they are allocated by
> the DMA API. Even if you want to claim that a driver pinning memory via
> iommu_dma_ops is somehow different from the same driver pinning the same
> amount of memory via dma-direct when iommu.passthrough=1, it's still
> nonsense because you're failing to account the pages which iommu_dma_ops
> gets from CMA, dma_common_alloc_pages(), dynamic SWIOTLB, the various
> pools, and so on.

I see, IOMMU variants are used only for discontiguous allocations, and
the common ones are defined outside of driver/iommu. Alright, I can
remove all the changes for all no-page table related IOMMU
allocations.

Pasha

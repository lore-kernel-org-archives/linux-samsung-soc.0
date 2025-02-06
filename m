Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3086419E99E
	for <linux-samsung-soc@vger.kernel.org>; Thu,  6 Feb 2025 17:54:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738864470; cv=none; b=EIoMq+1C6acfNzR4x5U9pP7yBwz40nZUwx/YC3Za1KXYd4qCT2W3xcjCnv4WEZUlHn1hi6HwIgwfoMU/l1sSSw++oCQKamQCp3jFy4jVCzk5vrx8v75Eyzve3tgW2AtiX6QBSVenWELdFa+fxzhsUrLU0IYuSzi/ubMrqwEB8I8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738864470; c=relaxed/simple;
	bh=gn7XItJMDraPdPq3CjAT1TZZRZM0kE5JDG+uOzxZ/4M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IZUXqG3Oi+8x3EbdV/JQ+eJXmD3e5zC5m0GlDesN4EWYCyC4gp8ibeSEXzfzArE+uuIzg9yHSUd6uA/Qx3TogGVdXMO4SQ1bt4ov0jnWWkEzIuK8J6+MDCJxrtnHKlFQqMVAaE003+UHPX+1OtDFwwpjobaUb3Tze+4OuTU41B4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=xPvgFsCE; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="xPvgFsCE"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-21f16af1f71so19595395ad.3
        for <linux-samsung-soc@vger.kernel.org>; Thu, 06 Feb 2025 09:54:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1738864467; x=1739469267; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2Mn+sK8nChOIpeYLnv6IHwIsGNBT4gzyG/mIRD8yp0k=;
        b=xPvgFsCErUzGrm0ui3pvF/LOKPaor0iiPVkaD/DYXF0DEWUxoNoj/oGnPJu8W+TtlF
         qvR1QBA4dczpP8C7ZB6zKsIZWd0Twbf7vNOKiI1MjWcKVgbYAUaG5PodQWYK8+m8xV+W
         eAoiX0U7/6VZx59esrvcmJygvdbDDVERT8285DgebCq1cB2j4yyH7JxfCiQnK8I2VfJi
         FmcFjNN4qMvYENGXNvDwc8QkArOiH/OhXpLBc8Sk7mJTjmdTeTv2vo4fMpwiXoDhnolT
         ckUk+V/YEi+DVlNBfq3tRL4rQWGewm2o6xcGRzyl3zkII9wEeEZ/T3SsCs9rha22eF5e
         86UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738864467; x=1739469267;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2Mn+sK8nChOIpeYLnv6IHwIsGNBT4gzyG/mIRD8yp0k=;
        b=FjITJTNTObaz1MBaCyaEH45ZxUx9SIJUWGsRM3W0HQWAtnox3d/uKSpGxEAWHwDwE5
         QXS+bxhmYs9YIsyk2ukBSAtOx53ZZeSF/ZWCT0Dtp5KWAkIrQ0oBD7RFXqkR3Kqt6jER
         rlX1m1KiPMD40UYjYjSUbSDwt2ebM2xG9Vo10ZwJm0qmpJr1bxN2HMgJVP/KBIM8CKQT
         UZPhaG9yqwmTGgkqdRN4Ylu1mHPVcbeTZWrOnJtbWnILhrgWJZFMqnPVGQaAOGK6cgiu
         hZ3H1RFG8yl89/4eGvRFHyqtOwYqLY/Iz4jLCumdmtsiyIRiUsnQy3Q5Elmu0oK9N0KD
         /ZuQ==
X-Forwarded-Encrypted: i=1; AJvYcCVWRcaAa129YZ/KVr6N5y4I+KgFlHscUMaMkDrCxPwLQ+yMkK44UJE1HQnmEW3Y8U0Wed8RvvKRFBvZJaUB1iJ04Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YzDgnmcCeIrDGVVWpENEI28Gel6ddeNB4VDkiG/OrpkfJeD1geF
	375LUhfisDniTZLVboJD2R1LYmjFSVOHLn5a6MojZUYcf6bUCbur7HxVtY9xXYA=
X-Gm-Gg: ASbGncsIWIvbkjSFYekzHsSWaiwC/1vE7Etgzuq+NfnnUi8eQYTmpc8sWQnMJNKPHsV
	ioVEYLfNfOwv2LsTclsaqgQX+seglgS6I68c3JBFcXaA+luqjDCQy6hgZqGYOLA1S0kVodcOGyf
	zCAodEm23uPqmGAperxAe3p88PLHg7OdxWgrOkdKFUm0zp+79myirH9Uq2QxjLzYROGg7mXK9gf
	GEfFAb1KimzrnrXl7zSL1SwL4+U+oTvRmo4WALes2n8NFYx1ea1seMJivf1sfPoBcXErLWadh2N
	gJ0kO12AN7Nic9F2XDRQj9BAvsKfZwPfaw==
X-Google-Smtp-Source: AGHT+IEz4awpqkJi/c9nNKxcLNj0HJ/bkNdjww1eQVi1trMS3Hp0zWEssHNhp45gp9A4Jt7vw68l1Q==
X-Received: by 2002:a05:6a00:882:b0:725:c8ea:b320 with SMTP id d2e1a72fcca58-7305d498d3amr215704b3a.14.1738864467255;
        Thu, 06 Feb 2025 09:54:27 -0800 (PST)
Received: from tjeznach.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73048adb10csm1636427b3a.66.2025.02.06.09.54.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2025 09:54:26 -0800 (PST)
Date: Thu, 6 Feb 2025 09:54:24 -0800
From: Tomasz Jeznach <tjeznach@rivosinc.com>
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
	Krishna Reddy <vdumpa@nvidia.com>, Chen-Yu Tsai <wens@csie.org>,
	Will Deacon <will@kernel.org>, Bagas Sanjaya <bagasdotme@gmail.com>,
	Joerg Roedel <jroedel@suse.de>,
	Pasha Tatashin <pasha.tatashin@soleen.com>, patches@lists.linux.dev,
	David Rientjes <rientjes@google.com>,
	Matthew Wilcox <willy@infradead.org>
Subject: Re: [PATCH 17/19] iommu/riscv: Update to use
 iommu_alloc_pages_node_lg2()
Message-ID: <Z6T3UCK1FI44pg7z@tjeznach.ba.rivosinc.com>
References: <0-v1-416f64558c7c+2a5-iommu_pages_jgg@nvidia.com>
 <17-v1-416f64558c7c+2a5-iommu_pages_jgg@nvidia.com>
 <Z6RI3ftJTrm3UxoO@tjeznach.ba.rivosinc.com>
 <20250206131721.GF2960738@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250206131721.GF2960738@nvidia.com>

On Thu, Feb 06, 2025 at 09:17:21AM -0400, Jason Gunthorpe wrote:
> On Wed, Feb 05, 2025 at 09:30:05PM -0800, Tomasz Jeznach wrote:
> > > @@ -161,9 +163,8 @@ static int riscv_iommu_queue_alloc(struct riscv_iommu_device *iommu,
> > >  	} else {
> > >  		do {
> > >  			const size_t queue_size = entry_size << (logsz + 1);
> > > -			const int order = get_order(queue_size);
> > >  
> > > -			queue->base = riscv_iommu_get_pages(iommu, order);
> > > +			queue->base = riscv_iommu_get_pages(iommu, queue_size);
> > >  			queue->phys = __pa(queue->base);
> > 
> > All allocations must be 4k aligned, including sub-page allocs.
> 
> Oh weird, so it requires 4k alignment but the HW can refuse to support
> a 4k queue length?
> 

Spec allows that. Also, hardware accepts only physical page number (so far PAGE_SIZE == 4K
for riscv) of the base address, ignoring page offset.

> I changed it to this:
> 
> +                       queue->base = riscv_iommu_get_pages(
> +                               iommu, max(queue_size, SZ_4K));
> 

LGTM

> > >  		} while (!queue->base && logsz-- > 0);
> > >  	}
> > > @@ -618,7 +619,7 @@ static struct riscv_iommu_dc *riscv_iommu_get_dc(struct riscv_iommu_device *iomm
> > >  				break;
> > >  			}
> > >  
> > > -			ptr = riscv_iommu_get_pages(iommu, 0);
> > > +			ptr = riscv_iommu_get_pages(iommu, PAGE_SIZE);
> > >  			if (!ptr)
> > >  				return NULL;
> > >  
> > > @@ -698,7 +699,7 @@ static int riscv_iommu_iodir_alloc(struct riscv_iommu_device *iommu)
> > >  	}
> > >  
> > >  	if (!iommu->ddt_root) {
> > > -		iommu->ddt_root = riscv_iommu_get_pages(iommu, 0);
> > > +		iommu->ddt_root = riscv_iommu_get_pages(iommu, PAGE_SIZE);
> > >  		iommu->ddt_phys = __pa(iommu->ddt_root);
> > >  	}
> 
> Should these be SZ_4K as well or PAGE_SIZE?
> 

SZ_4K. For now iommu/risc-v hardware always assumes PAGE_SIZE == 4K.

> Thanks,
> Jason

Thanks,
- Tomasz

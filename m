Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C64952F64
	for <linux-samsung-soc@vger.kernel.org>; Mon, 25 Dec 2023 16:09:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="D9mqPlfT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1703520585;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=VqafsTsLWFL6NUacBRAsGtc9kpoOdr+j/kVqdz2KGps=;
	b=D9mqPlfTwYuNJi4B6KW9virIn25oAF6KJO1DPRjL3QgxGoYi/aZvQhQ6SxaAucfl1mfkTI
	2BhAsqnTfOgOxR+qFBkoEO02/lLWZdSG4DtRAMJ7mE1KRUKAFVGeLstdjJ6VVrBdaG+4BT
	HC6YfH4aB8ZfJIQTKQ076gm3A3IuBSk=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-641-atfhyIHNNV-y_EhzEoqqZA-1; Mon, 25 Dec 2023 11:09:44 -0500
X-MC-Unique: atfhyIHNNV-y_EhzEoqqZA-1
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-40d5970422cso16435e9.1
        for <linux-samsung-soc@vger.kernel.org>; Mon, 25 Dec 2023 08:09:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703520583; x=1704125383;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VqafsTsLWFL6NUacBRAsGtc9kpoOdr+j/kVqdz2KGps=;
        b=gHmGwMSUG68WduIUeHY5Oq4LT0usHTeefMHKGR7h/jQj9u/1NYKy7UASWS7rF9o9H7
         aGvHUkc8HAageioAQ5mU6Udr/4bfIN2spLqI1w5xDNu0DKrV/Y+BZB7RjqArCIeS2/1p
         sEsfD1fFZMBVewBhjUnq35YXjohrethV9/Sqvt9HWOqbX1/Hv9e/yvs2T2I2yEX9R7Dr
         YAvjR4kfe2Z2UdB0lrNgViZOVnvX4zUAL66WwyiLizwZw8PVZ9cApdX9rxiwrFHjs8sB
         vgUE+62n3n+AxO19Nzzc/euVjQzop4DYScy+rAVR7CDP5MLIFGSipQ2PH9d3bM5ulAYG
         YJfw==
X-Gm-Message-State: AOJu0YzI4lm8M5gVHUb0dNny31WEvxduhb/dKHVg6sD4uqndjnnf/BfM
	qzB+tpr9dtJEjRwhdbSvR38g7UGnqoKtGLKwvjhTX6+PHWm9r3Hjz2NHjKfGJUMe/Ne0+k9voJB
	LTdGfp55YqyPMhxkEvo42F6T05SO8hTvNkQmW+lw=
X-Received: by 2002:a05:600c:4587:b0:40c:33be:d193 with SMTP id r7-20020a05600c458700b0040c33bed193mr4060353wmo.78.1703520582990;
        Mon, 25 Dec 2023 08:09:42 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHfGGCax+SlWX/roShT1Wqm6zJg2zHkXbA4PNy8JwUTudzLUljk5TaAwhoH/7jZ8kvUv2pY7Q==
X-Received: by 2002:a05:600c:4587:b0:40c:33be:d193 with SMTP id r7-20020a05600c458700b0040c33bed193mr4060329wmo.78.1703520582646;
        Mon, 25 Dec 2023 08:09:42 -0800 (PST)
Received: from redhat.com ([2a06:c701:73ef:4100:2cf6:9475:f85:181e])
        by smtp.gmail.com with ESMTPSA id f12-20020a05600c4e8c00b0040d3db8186fsm16769282wmq.5.2023.12.25.08.09.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Dec 2023 08:09:41 -0800 (PST)
Date: Mon, 25 Dec 2023 11:09:37 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Pasha Tatashin <pasha.tatashin@soleen.com>
Cc: akpm@linux-foundation.org, alex.williamson@redhat.com,
	alim.akhtar@samsung.com, alyssa@rosenzweig.io,
	asahi@lists.linux.dev, baolu.lu@linux.intel.com,
	bhelgaas@google.com, cgroups@vger.kernel.org, corbet@lwn.net,
	david@redhat.com, dwmw2@infradead.org, hannes@cmpxchg.org,
	heiko@sntech.de, iommu@lists.linux.dev, jasowang@redhat.com,
	jernej.skrabec@gmail.com, jgg@ziepe.ca, jonathanh@nvidia.com,
	joro@8bytes.org, kevin.tian@intel.com,
	krzysztof.kozlowski@linaro.org, kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org, linux-rockchip@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-sunxi@lists.linux.dev,
	linux-tegra@vger.kernel.org, lizefan.x@bytedance.com,
	marcan@marcan.st, mhiramat@kernel.org, m.szyprowski@samsung.com,
	netdev@vger.kernel.org, paulmck@kernel.org, rdunlap@infradead.org,
	robin.murphy@arm.com, samuel@sholland.org,
	suravee.suthikulpanit@amd.com, sven@svenpeter.dev,
	thierry.reding@gmail.com, tj@kernel.org, tomas.mudrunka@gmail.com,
	vdumpa@nvidia.com, virtualization@lists.linux.dev, wens@csie.org,
	will@kernel.org, yu-cheng.yu@intel.com
Subject: Re: [PATCH 15/16] vhost-vdpa: account iommu allocations
Message-ID: <20231225110930-mutt-send-email-mst@kernel.org>
References: <20231128204938.1453583-1-pasha.tatashin@soleen.com>
 <20231128204938.1453583-16-pasha.tatashin@soleen.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231128204938.1453583-16-pasha.tatashin@soleen.com>

On Tue, Nov 28, 2023 at 08:49:37PM +0000, Pasha Tatashin wrote:
> iommu allocations should be accounted in order to allow admins to
> monitor and limit the amount of iommu memory.
> 
> Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>


Acked-by: Michael S. Tsirkin <mst@redhat.com>


> ---
>  drivers/vhost/vdpa.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/vhost/vdpa.c b/drivers/vhost/vdpa.c
> index da7ec77cdaff..a51c69c078d9 100644
> --- a/drivers/vhost/vdpa.c
> +++ b/drivers/vhost/vdpa.c
> @@ -968,7 +968,8 @@ static int vhost_vdpa_map(struct vhost_vdpa *v, struct vhost_iotlb *iotlb,
>  			r = ops->set_map(vdpa, asid, iotlb);
>  	} else {
>  		r = iommu_map(v->domain, iova, pa, size,
> -			      perm_to_iommu_flags(perm), GFP_KERNEL);
> +			      perm_to_iommu_flags(perm),
> +			      GFP_KERNEL_ACCOUNT);
>  	}
>  	if (r) {
>  		vhost_iotlb_del_range(iotlb, iova, iova + size - 1);
> -- 
> 2.43.0.rc2.451.g8631bc7472-goog


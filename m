Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794850961;
	b=3/1vQds5ncZw63MFMLtXp7UAFG9SDfwSLRK26R3CwN/Zda33+cZrDb0pigqb6eqq0n5V
	 /OhcQ5flzxD3s4vSK9TNLr1GeiGzZ2O6n+9ob+ROPWNSdguT050/8tBsoLtJkoUgpZTjf
	 LBF87WngEX5g5c8po84ES4YPdeciSi10wvYb7GVivutYhUlxtnaWE60gbCZHhbWG/P7ea
	 nUC/T50hXwnVWFQgrgwv9s6yES/fCosXdVKpkuJyLHEx88C7eGgHpwIV/yHWjBtc+VFhP
	 w5gkEHzCNUR8wqRNGq0kPMf8fS1ucz9+eV1YTFC9invKVmnr8F174lMx9U2alAPcWhg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794850961;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=VLeTN5f3dNjgq7/DFz77VAQIKydYxJnpCGV8qATJCLU=;
	b=jtxlilpUpI2T/bjR6o3okDsOSYFgJMa5ChlRaC69CqrDzUU5nC6ZGnLTDUkdOzRaYpBk
	 1sQAIQXajsKNNwbcgZGQJ8OlMESJ5VNS3OCOnBy3IviQQLgM+IinJd6SaKrxSzKA3d0Lm
	 8ql3KRq/QWayjSu7XIFmRjgisXfcxpre1ePMIMQX8v7nKQUWorWb3KFjCRitRSDN3HyqO
	 Hfi/BwI5sWHHmCpAwayC8tZsLXJagapVYGXyPvKZxFVuyHvujvAZz2n1+xPoTSrVkfsY4
	 DAIpeFNdPYNUycpR8++RrueyWQjFoFwTKPcWKW22JqIGuYrZ9IOitc96KwHIWcAgndA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	dkim=pass header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b="k7Z4B/rJ";
	arc=none smtp.remote-ip=209.85.219.53
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 455F0606A330
	for <linux-samsung-soc@vger.kernel.org>; Mon, 16 Nov 2026 17:42:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 455F0606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=k7Z4B/rJ
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-91f0274f88cso62019256d6.0
        for <linux-samsung-soc@vger.kernel.org>; Mon, 16 Nov 2026 09:42:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1794850960; x=1795455760; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VLeTN5f3dNjgq7/DFz77VAQIKydYxJnpCGV8qATJCLU=;
        b=k7Z4B/rJV4BYSUn5DoRoCZy1plPwC9x9ovWb+QgIDH90LhQdOFFxPVKW8y+1D9G9U1
         dNY8XVweGaarB2H+Mo7+Ljohv4m7UtEMEOmREkcVV7D8kB073e4yluVQ3yHRLhBQRnee
         4TqEgTAlDtU1ys9YubCtkkzdgVNxjSb/z0ZOeeMy+Dto3b55aymi8viQ9OFG1sW0DGih
         8D6jlFgrgUETHCS5Y/tuPfdN2LnKjoAPDH5mWH9pRi7ZNxryEEPrCdvQ8e7Jdo25dOiS
         e4eE2v/9+zfQbQDE11ZD8kbUMaw71HaObIFAeMHeeeBCI/kUSTVNlSkktEgKUO5axUxy
         0psQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794850960; x=1795455760;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VLeTN5f3dNjgq7/DFz77VAQIKydYxJnpCGV8qATJCLU=;
        b=WRC6HObSvXEcsKiGCoTRF9SEFD+U+0tSg7q8TwPLO5GYwmH0HFirF+Pi1dfFfXlmQF
         D2VJh4rQrIf6AQKFMH4RKyHvx50T2HqQr09FE0mEhIyQ7RJQgwdrmrBGhlBw7IcGF+fS
         7OgdLhx/kJ79UG9dc2yPCu7OLdgJCktKu7fxYVcBH9TOURbyio1a4Nwr5zrPhicFit0i
         rR3IzL10c0u2q+op5wef5WFT6cZSDLBjh2FmBDWooXk91xDXCrVC9mDKgrQEcVOBolMW
         aUD+jywhXaX+x815T31i0rDtMCOabxLphKVgtBfbZoYx/DTTUPzxHQPcSKxRviOfsVD5
         Nnjw==
X-Forwarded-Encrypted: i=1; AL+hErFW0MOyAMp0egUPzQjHclY7G7/kh/7WLNkYVkEx3Fjr6YSiluGPJanDTMcLxvoJVut5+6hnRCrBEi2xocU5JxGukg==@vger.kernel.org
X-Gm-Message-State: APuU4Z9B96DpEgD/5IPnUrT6esF/G4ycyQeHtGBKN6uGmoEGqHZoHs4W
	yillv/JPN4hlhPLmTIZuzpX9OarUohKclBdw7LOtcej5CDBJmI1NHPYDO6un6OOJOn8=
X-Gm-Gg: AZFdTZcXPy93+rClX3TNaL5Lp4iwUvSPZmoj3hxyJjdjDFfXiYNqxnvVCXQUNzgU0oR
	Z195Y3P5qNlViDZTkdaefKXF9GboTYUKaJcjON6mhXWRe8oOsm+EPhnQ1tBxzq+vUlivIJ60NTx
	mF+mtVU54B6gR2gdadOFOTOVezyyAzl7unu06UzM6brN5SFbGF6JMjORCMOOdsYVEkFWh8RZYgL
	MSO8Pv3WOhUJCA8TthR0pxdW21aYQ6ZIJu/KLZXWpRIcxd7rxnQiDdhVGDP2wo5WojJS+tasyLo
	NLaaiRRGGisk6EHRwrSqAjNmsciNIab9Nr27G8swa+pUt0ZnqWaHs412lfmDji80rpFKG+SMbo6
	AbqjrbZee1KPEch8hchbFrrsuIvLa0PtWuAPhcaU0Rj8tgEfGiNtIJthZQUCo1KSnXy3KYPXtP6
	dk60G0jsebFTPwyPApXL5nqgkIwL8Ffr4xMDW3AvVIzTP7PTSYACwF3RviDdBBx/Y1qyYLDiaEL
	9OSwNak2pV5oQ82wdMI+xDROjTzVAE/mv+prmaGFd04IG7tYBwjv+c/j4Mijh7CWklEeVh14+KF
	/m3ONw==
X-Received: by 2002:a05:6214:4698:b0:91f:1004:2ba4 with SMTP id 6a1803df08f44-91f2400b38fmr177678706d6.2.1794850960144;
        Mon, 16 Nov 2026 09:42:40 -0800 (PST)
Received: from ziepe.ca ([142.166.156.71])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91f23d73206sm91150276d6.25.2026.11.16.09.42.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 09:42:39 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xT0j0-0000000A2D3-2QWe;
	Mon, 16 Nov 2026 13:42:38 -0400
Date: Mon, 16 Nov 2026 13:42:38 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Peter Griffin <peter.griffin@linaro.org>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	"Joerg Roedel (AMD)" <joro@8bytes.org>,
	Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
	=?utf-8?B?QW5kcsOp?= Draszik <andre.draszik@linaro.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Mostafa Saleh <smostafa@google.com>,
	Daniel Mentz <danielmentz@google.com>,
	Juan Yescas <jyescas@google.com>, kernel-team@android.com,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH] iommu: Add iommu.passthrough_devs early command line
 parameter
Message-ID: <20261116174238.GC2299285@ziepe.ca>
References: <20261116-b4-iommu-passthrough-devs-v1-1-dc5b493f7551@linaro.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Post: <mailto:linux-samsung-soc@vger.kernel.org>
List-Help: <mailto:linux-samsung-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-samsung-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261116-b4-iommu-passthrough-devs-v1-1-dc5b493f7551@linaro.org>

On Mon, Nov 16, 2026 at 05:37:45PM +0000, Peter Griffin wrote:

> Instead, I propose handling this in the generic IOMMU core via a
> kernel command-line parameter. This makes it available uniformly
> across both Device Tree and ACPI systems and across all IOMMU drivers.

Something like this could be useful, but also Leon's series will allow
userspace to do it from the initrd too. IDK if that is more/less
interesting to Android.

>  static unsigned int iommu_def_domain_type __read_mostly;
>  static bool iommu_dma_strict __read_mostly = IS_ENABLED(CONFIG_IOMMU_DEFAULT_DMA_STRICT);
>  static u32 iommu_cmd_line __read_mostly;
> +static char iommu_passthrough_devs[IOMMU_PASSTHROUGH_DEVS_MAX_LEN] __read_mostly;

We can allocate memory at this point.. No need for a fixed array.

Jason

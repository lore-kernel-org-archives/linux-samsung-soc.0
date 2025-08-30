Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAD4825F7A5
	for <linux-samsung-soc@vger.kernel.org>; Sat, 30 Aug 2025 15:25:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756567520; cv=none; b=HQeigbpyBeFCjk0CRiP3+oD5h5IhQ7cDlwrVvAdJkj66I5Y0UbwT6KYzmF9d8nSXlqrEHMfBbxDrcm6EMko9koNFWxRD3Mh+5HObg2GlltysVa8MPH5MB0bv7s/KeRPmwdg927jisFov63NByuuwPJPwoW/NxK6aTM2UuJWsMsw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756567520; c=relaxed/simple;
	bh=4Pre2iPR3cFdQiZxON1rzrA8qHFbR9ocqwJAPI1d5E0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QANdZ72eejlxFDFf9rpboFyCtmTYN5Kf9k3CyY681s3/2OTDlDj307pEibyRvB6xv8p6arf8s5Tq8MC7CmBkmWBQbiPoUZ2csmvEyvQwCGv9cHqcVPI+s9qYUUOe8HbjEzwf7h+JAy7vaprl6KaPl2XNc+LHHpWN5VBXmUflzgo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=nlmx3XNV; arc=none smtp.client-ip=209.85.160.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="nlmx3XNV"
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-4b326b6c189so2143021cf.2
        for <linux-samsung-soc@vger.kernel.org>; Sat, 30 Aug 2025 08:25:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1756567515; x=1757172315; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+vQXLaG2kcpMi6zISzeFWytxG/6ZsxQ37Uw+pok3HOE=;
        b=nlmx3XNV8gcjLk7cgcyvWlI7yq3yuEgE+b7QciP/KTn5hq8S6pJxz6IP1n69Y50YZr
         GXbM9UHv1SZCDpUtSFQjwYAqMKE2ugBeAVcutmtFOLK1ziZnJwBVRUcVFWG1padFUqZ9
         XzKZy7Zn6xiLnZbGAzeqasn0S2bpM/ZALaKqgb2fevC31afEdm3fwdvpLPrEuwxZ9jDQ
         aG41oGq6Q/XOI4X5VeA9/qysMVK7KoE34DtcN0RL5o7YsCo0AHvaA5JtJYcq8ckmyUe4
         5jBFpLPk5qpwa/hG7Q8GktkFxLmhgSg8snZWrWw9MB2hlTxv5O+z4ZEBTJhB+XPBT05x
         4vVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756567515; x=1757172315;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+vQXLaG2kcpMi6zISzeFWytxG/6ZsxQ37Uw+pok3HOE=;
        b=CWY2+UnMUDfW3s4oa0j+cjQVi6WnL8lGRIssYDYGtWINTqKg+y+AXNlHRX9z37FD0o
         AiFYNYYK0//2BssabJMryxlidtVxA3i+eVG3cxfhjRdscNDifAd6WQgHYuG4JnIJKkwR
         AK0CDn6CJmi1eXWm5kNAT1HkZNv8Ve+sDKPBaf/lv2lLNcGmCXfG3iDNt+rve7t2sc6g
         N5ZpLAPC1rgcXnbSLUaDPyhupQt+yG0RaG+RAQKNm8GY9lANqiY0N9GhU88BilfDWkVj
         xF6Z1MrqnINSSKjV8wej5hrT95G2z9BSzUJ0H0ilSFf3F96dQAcrkNbVg9zI3bSNETHB
         RnPA==
X-Forwarded-Encrypted: i=1; AJvYcCU7U8lkMAGREEax1/IiCi8zXUYPdd5mhMuzgHbYC3K+whOIb8YdxD6SvhDQWx4sRm/TdVOj/+Tyc9Vl+ezBt1Jr7Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YzpAuRFq7I4VsMiC/Odv1FJmd6C7TghNYhkUZ6jenGlE6OP4BDc
	3jchbvgG+IuGsjOgBaAejnXjOaP+fx20Thzps3lizniQLWnLt00YHBg0+U7MUjgmEQ==
X-Gm-Gg: ASbGnct6B2FSnff8q4OaeLHKQASDuBUb/wgW+cO0vOn0hyLTXqIENnJYxIx2O0PmJ5I
	RP0gNSt3oNxrHexZAeroCgpwPoswkGVZ96/uWFBc8OWN+FFAenbofMePsRyhWvnGx3yrEEiggHf
	ArslR076sXsY+sVJvd63obes5CVx5FyuQ/vRhxyuO+ohr08wtoYXlzqJXpQ/LCHlseqRRS6r8X6
	WjJYfW67aHFviByVMbPx207vU8jgbSnaMiKZuCtuAvbBP+2nmmNwoKzc6ce5Hu1PItdhtsIIFwo
	62WPHK8KCmM7xNpyd+J1f/n37uVGUWd/B/D+M493zclk80gIEzSh4IrXWVTFsyJQYNlYyrnwn6N
	IcLp4Jy15J+TOdoIkQzV3iO3AOtJHL7djF6Iy3hdX
X-Google-Smtp-Source: AGHT+IFqTzpp+i1c8d9FlbmpErvbAswo/o1qSIXruitHS83JpeUiodcPTxO3zJSo4ZrC4TsBR6h8EA==
X-Received: by 2002:a05:622a:448:b0:4ae:f8bb:7c6a with SMTP id d75a77b69052e-4b31dcceb72mr20637521cf.54.1756567514656;
        Sat, 30 Aug 2025 08:25:14 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:681:fd10::fd35])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7fc1605fb27sm363814885a.62.2025.08.30.08.25.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Aug 2025 08:25:14 -0700 (PDT)
Date: Sat, 30 Aug 2025 11:25:10 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>, linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH 1/2] usb: ohci: s3c2410: Drop support for S3C2410
Message-ID: <fc4ec548-9a1a-44c3-9958-b6778e37d910@rowland.harvard.edu>
References: <20250830130101.142934-3-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250830130101.142934-3-krzysztof.kozlowski@linaro.org>

On Sat, Aug 30, 2025 at 03:01:02PM +0200, Krzysztof Kozlowski wrote:
> Samsung S3C24xx family of SoCs was removed the Linux kernel in the
> commit 61b7f8920b17 ("ARM: s3c: remove all s3c24xx support"), in January
> 2023.  There are no in-kernel users of remaining S3C24xx compatibles.
> 
> The driver is still being used via platform code for S3C64xx platforms.

This title and description are a bit confusing.  I gather that while the 
S3C24xx chipsets are not longer supported, the S3C24xx OHCI controller 
is still being used in S3C64xx systems.

So what the patch does is drop support for S3C2410 _systems_ while 
retaining support for S3C2410 _controllers_.  Is that right?  If so, can 
we change $SUBJECT to say "usb: ohci: Drop DT support for S3C2410 
systems"?

Alan Stern

> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  drivers/usb/host/ohci-s3c2410.c | 8 --------
>  1 file changed, 8 deletions(-)
> 
> diff --git a/drivers/usb/host/ohci-s3c2410.c b/drivers/usb/host/ohci-s3c2410.c
> index 66d970854357..e623e24d3f8e 100644
> --- a/drivers/usb/host/ohci-s3c2410.c
> +++ b/drivers/usb/host/ohci-s3c2410.c
> @@ -448,13 +448,6 @@ static const struct dev_pm_ops ohci_hcd_s3c2410_pm_ops = {
>  	.resume		= ohci_hcd_s3c2410_drv_resume,
>  };
>  
> -static const struct of_device_id ohci_hcd_s3c2410_dt_ids[] = {
> -	{ .compatible = "samsung,s3c2410-ohci" },
> -	{ /* sentinel */ }
> -};
> -
> -MODULE_DEVICE_TABLE(of, ohci_hcd_s3c2410_dt_ids);
> -
>  static struct platform_driver ohci_hcd_s3c2410_driver = {
>  	.probe		= ohci_hcd_s3c2410_probe,
>  	.remove		= ohci_hcd_s3c2410_remove,
> @@ -462,7 +455,6 @@ static struct platform_driver ohci_hcd_s3c2410_driver = {
>  	.driver		= {
>  		.name	= "s3c2410-ohci",
>  		.pm	= &ohci_hcd_s3c2410_pm_ops,
> -		.of_match_table	= ohci_hcd_s3c2410_dt_ids,
>  	},
>  };
>  
> -- 
> 2.48.1
> 

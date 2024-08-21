Received: from mail-oo1-f43.google.com (mail-oo1-f43.google.com [209.85.161.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED30F1AF4ED
	for <linux-samsung-soc@vger.kernel.org>; Wed, 21 Aug 2024 14:37:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724251077; cv=none; b=TbiR162ynY5vO+ABf7MlDa7XS0ax2PGdtTU/4ElXidPr8CFb98evjKgoFcSZDZsUb3DYwprQYY9AHdR9SVZOpI+hF+dkXDzibVXZRbiF5Wguz2LedmtDwvr29LXff7LmRS80sBOPdR4QAZgcsq7ZAERwhxsnmmN+YEuwSsq+Z7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724251077; c=relaxed/simple;
	bh=FVsYbPAvgMgCGwds8h/Wi00szbGFYrxetnC7hv6av3M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GyynZJr/AkqxfwV+ups5zWaKqTA3xTLg4+s1I73CmspcQ++QHwDv1VKrwDvAcnFvGFBo7Uv64PzYF8Bzk9dXBlOjWV4ZB1TuFNdBCuAiNbC14QzmD/w2kzT/8zJOh/0dhh30N2qRbsOCQ2qp5KgDc5mthhf5BJyyBVFYe8Z2HrQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=pass smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=NRoVT830; arc=none smtp.client-ip=209.85.161.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="NRoVT830"
Received: by mail-oo1-f43.google.com with SMTP id 006d021491bc7-5dcad91e64bso163896eaf.2
        for <linux-samsung-soc@vger.kernel.org>; Wed, 21 Aug 2024 07:37:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1724251075; x=1724855875; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=eeL7Rd+axk/Z65jpbD90HZ1f75grRQAJLvS6IO1HwSQ=;
        b=NRoVT830iciUuRsuW02ZFmmFWt9yGbe0e+uD7Bs4GmhHmF4WSlJfW4C6hZ9dmwyH4D
         nrcQtEL3no8kEGaXquxsRCgQYGxXjWcLlG8e2VBjGLGVYgHL9RYKnc6l27XQdx3t3yR6
         JaPvY8b6QKl82nYxje0IPFSV+zhNt5mx5tmwRNLa2pyyF37fKUfsGn2X5YOysBoxYpCE
         U6EcWCaI2JEx42wsaKop1Nnpmu6e8+R0qyEF1QME7HYDU2X9/nYuD9L+kRCUH86UT4io
         3Z22/UmLxrG3Q8cunF6ySq5eej3hrtvR5GUUGMPm4SqEzBBP9pee0DTiaj2IQnjPE2rO
         HVgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724251075; x=1724855875;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eeL7Rd+axk/Z65jpbD90HZ1f75grRQAJLvS6IO1HwSQ=;
        b=BSzIXNg1XOzF8s8ztm5n9ao1cuEaUXlIVDa/fJmjBlE6U/WHNfny+b0O8EkT5FdsKr
         3hy1hDT0JXsYT1s9T5qCDS7FOy+o0RnR82upW7n7+2C8hQQPObFppLCZzq6X+b/EiD/o
         PsRaQX3THrNH4Jr0ge8PHCQ5wu4SYOp9UUTC03awO0iV9BPJV6xZ/lsWKucv9kbH7VoW
         m1NXTsgYNWL3lfCTSXxUQFx0BusnWeOhSNoGRvM90Fi1Ak6n+pki6u8mhrE17LpeVmEY
         gy5PFzrlytJwqZDiBHxW3Q16us57Iy8Dd89gFIOOgWAFIzlAPEfedJHk76shJwLR8D2d
         Nhww==
X-Forwarded-Encrypted: i=1; AJvYcCWPddgPvNRWZEWZDa6/JkDIb6mRD3ma7XMce8baJW1h4wib2VNTn1JGaFshEhACltv+10y/E6q51ZE8U3gnFoNSLQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyInQoYH5ak7eCeye9nvdJapktIlRflkC+tm2VXOgkEV+4AF6gw
	1BB8FKqAxkmWK7dmHzfPSD2kX8k42aR5MdmEmcmRIG5u/V1qaVLIQ4394P4CyA==
X-Google-Smtp-Source: AGHT+IHKVXgXnNh7Vl7MHFbNLldyo3rr8hecTtlHKuooYloN/lFestiTEiQL1vaPhuibzDM+/2G0Ow==
X-Received: by 2002:a05:6820:1ac6:b0:5c9:d9db:6a51 with SMTP id 006d021491bc7-5dca34e2eb9mr2653269eaf.0.1724251075012;
        Wed, 21 Aug 2024 07:37:55 -0700 (PDT)
Received: from rowland.harvard.edu (wrls-249-137-8.wrls-client.fas.harvard.edu. [140.247.12.8])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6bf6fe25970sm61342326d6.60.2024.08.21.07.37.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Aug 2024 07:37:54 -0700 (PDT)
Date: Wed, 21 Aug 2024 10:37:52 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: gregkh@linuxfoundation.org, krzk@kernel.org, alim.akhtar@samsung.com,
	linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH -next v2] usb: ehci-exynos: Simplify with scoped for each
 OF child loop
Message-ID: <a3ec2bbd-9f0a-4378-a3fa-8e0a82c8b808@rowland.harvard.edu>
References: <20240821071856.2335529-1-ruanjinjie@huawei.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240821071856.2335529-1-ruanjinjie@huawei.com>

On Wed, Aug 21, 2024 at 03:18:56PM +0800, Jinjie Ruan wrote:
> Use scoped for_each_available_child_of_node_scoped() when iterating over
> device nodes to make code a bit simpler.
> 
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---

Acked-by: Alan Stern <stern@rowland.harvard.edu>

> v2:
> - Update the commit subject.
> - Spilit into 2 patches.
> - Add Reviewed-by.
> ---
>  drivers/usb/host/ehci-exynos.c | 9 ++-------
>  1 file changed, 2 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/usb/host/ehci-exynos.c b/drivers/usb/host/ehci-exynos.c
> index f40bc2a7a124..e3a961d3f5fc 100644
> --- a/drivers/usb/host/ehci-exynos.c
> +++ b/drivers/usb/host/ehci-exynos.c
> @@ -48,7 +48,6 @@ struct exynos_ehci_hcd {
>  static int exynos_ehci_get_phy(struct device *dev,
>  				struct exynos_ehci_hcd *exynos_ehci)
>  {
> -	struct device_node *child;
>  	struct phy *phy;
>  	int phy_number, num_phys;
>  	int ret;
> @@ -66,26 +65,22 @@ static int exynos_ehci_get_phy(struct device *dev,
>  		return 0;
>  
>  	/* Get PHYs using legacy bindings */
> -	for_each_available_child_of_node(dev->of_node, child) {
> +	for_each_available_child_of_node_scoped(dev->of_node, child) {
>  		ret = of_property_read_u32(child, "reg", &phy_number);
>  		if (ret) {
>  			dev_err(dev, "Failed to parse device tree\n");
> -			of_node_put(child);
>  			return ret;
>  		}
>  
>  		if (phy_number >= PHY_NUMBER) {
>  			dev_err(dev, "Invalid number of PHYs\n");
> -			of_node_put(child);
>  			return -EINVAL;
>  		}
>  
>  		phy = devm_of_phy_optional_get(dev, child, NULL);
>  		exynos_ehci->phy[phy_number] = phy;
> -		if (IS_ERR(phy)) {
> -			of_node_put(child);
> +		if (IS_ERR(phy))
>  			return PTR_ERR(phy);
> -		}
>  	}
>  
>  	exynos_ehci->legacy_phy = true;
> -- 
> 2.34.1
> 

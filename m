Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 165521917CB
	for <linux-samsung-soc@vger.kernel.org>; Tue, 20 Aug 2024 13:46:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724161618; cv=none; b=BMkVWv4YPl8Obem/sz02xmuG9kxC1X074lgpek0BvBARyhA9AowSZqIUJtnpilPtTLbfPIJ5Ny+aUbyUnWtS3u8BbrElk/FaHRuAPMmb8YmE01wQ8c1A7Z8xlR+p0EK8R4OcMGoTZuXfpNzps9wu2yVtUBahyuJW4psJ7J3JXEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724161618; c=relaxed/simple;
	bh=DGs+YQ/MemHzCI0cJ+pHenoa+Ft3gJVm3OGIx/wVAbo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BwNxbQpF6AJmO9dhFfQwM38rvIRSNW6Qj9b5X3pDarUesXIazhur87SnhrdqUR9JQ5IUyMHBwUi/6BFao6PZVGRw6oDre6In/oWlZhE0y52vve8RBrHyEOdAI2Zbm9TeYuRuMlowS0jgdv1AYugrafU+l3+isKRzerar0Vgeyp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=pass smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=PAMGYst3; arc=none smtp.client-ip=209.85.222.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="PAMGYst3"
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-7a35eff1d06so17047785a.0
        for <linux-samsung-soc@vger.kernel.org>; Tue, 20 Aug 2024 06:46:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1724161616; x=1724766416; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=I830akbhhKKwI8d91ZRK8IKM+grDVk/w+Lt2TLToceE=;
        b=PAMGYst3Nj/JhGJ71MXqkUV/SIynbVvumC+1lXIwIt2QPhKYPAol+A+gfYYfnuTK/I
         FAFFw/UIONRPTxfPbw1oGNS2HV0gdVljp7R13dgbBUtQvMTmckNPdp17iXzp7gG3WgN0
         ca45ayelOQKnKlf7l/+Kq+2qUjmv1oqwsxi0WLn+IpSOKl5X8yw+L+OS8ASnP47wIYIA
         fdTYkbj0Q6Eg7pV2DPXo/F7iYE9FkBy/C2jY5niDtmOvLtH3EgGlnxtQPXYHtMoDig96
         lKNR+ggoa0DerzY/ZV6jw4+IyGUj5q6HpJaRKtZYHHKhUqPoXstb+fSFMQQibYbxFylI
         kLmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724161616; x=1724766416;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I830akbhhKKwI8d91ZRK8IKM+grDVk/w+Lt2TLToceE=;
        b=OqqFP9+Z7xuJZk9ZCVhlA/3qlN3HCdqFKuvUFKjjEHxFrhV3uwkPJ5c0Sf+XHsqnzB
         rBlkhBw1ejcZgTQlTYzGAxkRMJZ08ioQqIsWO7an4v3WH8kCDixpRfOzxDSeIRqCKqsm
         2FKHO7hWv+ptrGR9L6rFgZR0sQoW1NNT9VF13eHmkSXrUxNMCwrTymmcHtl/5MYV1hxj
         MS/47FZp9b6ig3BHk/9gDQEhCyzIfxcEuyoFqsJgiVPubAv4aByS9U1a98msChx+KMBk
         1se60m26IUY3flfnAi/cEbnq9C/FuCwjbsoEuPYfQaxm4UZz7O7WsQaiXnmYwhW08jub
         hm2w==
X-Forwarded-Encrypted: i=1; AJvYcCWvM6XnMCoKKJ9XAoi4fopQsHM0eSPvckWsYJWLw0Yj7lRAZFtR5EHC0qdeM//jtf1Tvez3loqBHgtVg+BWylL93pV/5infW0mRpz10KWeCHOE=
X-Gm-Message-State: AOJu0YxFi92PE9WMc7teckznFtiZYyWlnZk5TmD/ngNY+Sa0wlpRZDr2
	cyGTnLOsqkwlp7q4mMyhRt6V5TbXGZGjKf3EU3uXFHTqeu0m0SNnXeMce6T1lQ==
X-Google-Smtp-Source: AGHT+IEI4p59YOvtEm63+a/jQKuInzhxdbxB8AjFcSMqvIayjz8ztlKu6vsDqXATlGHaKRjS/mRyUQ==
X-Received: by 2002:a05:620a:1a12:b0:7a6:6b98:8e36 with SMTP id af79cd13be357-7a66b988f33mr163494185a.16.1724161615865;
        Tue, 20 Aug 2024 06:46:55 -0700 (PDT)
Received: from rowland.harvard.edu (wrls-249-137-8.wrls-client.fas.harvard.edu. [140.247.12.8])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7a4ff112b45sm527883485a.125.2024.08.20.06.46.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Aug 2024 06:46:55 -0700 (PDT)
Date: Tue, 20 Aug 2024 09:46:53 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: gregkh@linuxfoundation.org, krzk@kernel.org, alim.akhtar@samsung.com,
	linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH -next RESEND] usb: xhci: Simplify with scoped for each OF
 child loop
Message-ID: <435bde54-aa08-47d1-8fe0-980bcc577803@rowland.harvard.edu>
References: <20240820065635.560427-1-ruanjinjie@huawei.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240820065635.560427-1-ruanjinjie@huawei.com>

On Tue, Aug 20, 2024 at 02:56:35PM +0800, Jinjie Ruan wrote:
> Use scoped for_each_available_child_of_node_scoped() when iterating over
> device nodes to make code a bit simpler.
> 
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> ---
>  drivers/usb/host/ehci-exynos.c | 9 ++-------
>  drivers/usb/host/ohci-exynos.c | 9 ++-------
>  2 files changed, 4 insertions(+), 14 deletions(-)

The patch changes ehci-exynos.c and ohci-exynos.c.  So then why does the 
Subject: line say "xhci"?

The contents of the patch look okay.

Alan Stern

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
> diff --git a/drivers/usb/host/ohci-exynos.c b/drivers/usb/host/ohci-exynos.c
> index bfa2eba4e3a7..1379e03644b2 100644
> --- a/drivers/usb/host/ohci-exynos.c
> +++ b/drivers/usb/host/ohci-exynos.c
> @@ -37,7 +37,6 @@ struct exynos_ohci_hcd {
>  static int exynos_ohci_get_phy(struct device *dev,
>  				struct exynos_ohci_hcd *exynos_ohci)
>  {
> -	struct device_node *child;
>  	struct phy *phy;
>  	int phy_number, num_phys;
>  	int ret;
> @@ -55,26 +54,22 @@ static int exynos_ohci_get_phy(struct device *dev,
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
>  		exynos_ohci->phy[phy_number] = phy;
> -		if (IS_ERR(phy)) {
> -			of_node_put(child);
> +		if (IS_ERR(phy))
>  			return PTR_ERR(phy);
> -		}
>  	}
>  
>  	exynos_ohci->legacy_phy = true;
> -- 
> 2.34.1
> 

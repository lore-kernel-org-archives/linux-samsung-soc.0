Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D3252D238A;
	Thu, 14 May 2026 15:49:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778773764; cv=none; b=oY+x3M+SMvmmWq1hVHCAfoeZCXLTP14Hd/JlQr0cayDEA8JHwlMB9eDo1liHm8M7OCn6q2oEgL+WjWoTo1DK1gHNMJOZ8US0mWN0g2GYqAbJXsdlbnVbUMus2eSuhNGPMzx4iX4MCXidZ1Hs1nZsZSvUr3wLNCsf91VBMi5vIBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778773764; c=relaxed/simple;
	bh=HvYYmbt7vIXkmuUhJ1bsT180d7aFwrKQEHP4FFnba90=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F1iTEPbF62fmnuez5TxjX3DWRAnhgIjUH2WmBnZm8LdpUP/zy5OrctYDOOxMwvZzLqsUzC6rE8lN7wGnCU8kCQYr27K++aCCj7qn3FjVrIk2vFQPP8HdJoHqPL1OWBx0NuZezEWbnf6IsHbUiVyOBIONkbcBs8H6nvvtgKdg2i0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Y7G/MlDx; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Y7G/MlDx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C77FDC2BCB3;
	Thu, 14 May 2026 15:49:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778773764;
	bh=HvYYmbt7vIXkmuUhJ1bsT180d7aFwrKQEHP4FFnba90=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Y7G/MlDxc7c+iftuGNVZEM9Kb7YR+s4gViNlXrJHQtlEzT36sylvsQ3qTpmLx4yxa
	 iVr3zOI8qWxKqej6V1ZFUwpdVgzYLLu57pO+QN+YOPPMobuaj89I9fUt6tmRenh7bT
	 uHZ5ryMuUrjba9tzsuaNTpvpzIhPL3U0vCbZTiw6E0iMQ5MhAOz3oXcGH2u/lGd/yj
	 nhd9wOvKsDZ+wYfwPzjDFqZklfutUCwFAwoIiOODxsJ+33fJA9fndK6qDIj5ymZXJ5
	 sB49VnvrdHeM+ZSsI/04qwecYL1isVJXSvS9eITmx2P6RW4FSWHLSE7H9iJ6gjP8BG
	 J2Kl2fWSncpWA==
Date: Thu, 14 May 2026 21:19:20 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Felix Gu <ustc.gu@gmail.com>
Cc: Peter Griffin <peter.griffin@linaro.org>,
	=?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Naveen Kumar <mnkumar@google.com>,
	Joy Chakraborty <joychakr@google.com>, Roy Luo <royluo@google.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] phy: google-usb: Fix runtime PM cleanup on probe failure
Message-ID: <agXvAB1AgXvywP2B@vaman>
References: <20260316-google-v1-1-30a034e87a2a@gmail.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260316-google-v1-1-30a034e87a2a@gmail.com>

On 16-03-26, 21:11, Felix Gu wrote:
> In google_usb_phy_probe(), if typec_switch_register() fails,
> pm_runtime_disable() is not called, leading to an unbalanced
> runtime PM state on probe failure.
> 
> Switch to devm_pm_runtime_enable() to ensure that runtime PM is
> automatically disabled both on probe failure and during driver
> removal.

PLease see https://sashiko.dev/#/patchset/20260316-google-v1-1-30a034e87a2a%40gmail.com

> 
> Fixes: cbce66669c82 ("phy: Add Google Tensor SoC USB PHY driver")
> Signed-off-by: Felix Gu <ustc.gu@gmail.com>
> ---
>  drivers/phy/phy-google-usb.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/phy/phy-google-usb.c b/drivers/phy/phy-google-usb.c
> index ab20bc20f19e..79480f8b110e 100644
> --- a/drivers/phy/phy-google-usb.c
> +++ b/drivers/phy/phy-google-usb.c
> @@ -251,7 +251,9 @@ static int google_usb_phy_probe(struct platform_device *pdev)
>  		return dev_err_probe(dev, PTR_ERR(phy_provider),
>  				     "failed to register phy provider\n");
>  
> -	pm_runtime_enable(dev);
> +	ret = devm_pm_runtime_enable(dev);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Failed to enable runtime PM\n");
>  
>  	sw_desc.fwnode = dev_fwnode(dev);
>  	sw_desc.drvdata = gphy;
> @@ -271,7 +273,6 @@ static void google_usb_phy_remove(struct platform_device *pdev)
>  	struct google_usb_phy *gphy = dev_get_drvdata(&pdev->dev);
>  
>  	typec_switch_unregister(gphy->sw);
> -	pm_runtime_disable(&pdev->dev);
>  }
>  
>  static const struct of_device_id google_usb_phy_of_match[] = {
> 
> ---
> base-commit: b84a0ebe421ca56995ff78b66307667b62b3a900
> change-id: 20260316-google-3acfa2f3de9d
> 
> Best regards,
> -- 
> Felix Gu <ustc.gu@gmail.com>

-- 
~Vinod

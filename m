Received: from out-185.mta0.migadu.com (out-185.mta0.migadu.com [91.218.175.185])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4D512D8DDA
	for <linux-samsung-soc@vger.kernel.org>; Wed,  3 Sep 2025 19:20:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.185
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756927260; cv=none; b=nV1r6/QW4DjlAhJT2iQJ4yH+FY7nB8a06A1+sHM3SQu64aSO0iUfFvxS4btWAIseW/WBb5w6MNs9nlflr1rYZxjIASoDnddFPjY9y4zFciVA/2Cac6KjAwzQMYL8qFSUVDJzEtao2UZ5dT54BIFwVxiOt9fj7WVAaQUv1LGh4DE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756927260; c=relaxed/simple;
	bh=hSkvSWyCj5TG+K6dDKbK2f7/2LUdXbAtJRmHN0LkS5s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=vGXv6o96Zjn2FOaqDRYxPK6O+8yEXHDe8eUF4X22omSpr1ksNzqF3tje19+maDDU+fzWNTeRCuV9dGemTBTZhc6f7+CycPjgCkgdhCLMZd2TA8zxjwmY9RGmo0AOTXfnEplw04P4sSEU015D2CuZQJJDRgWWTF9/IY93UWIlnho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=grimler.se; spf=pass smtp.mailfrom=grimler.se; dkim=pass (1024-bit key) header.d=grimler.se header.i=@grimler.se header.b=QVg0UfJL; arc=none smtp.client-ip=91.218.175.185
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=grimler.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=grimler.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=grimler.se header.i=@grimler.se header.b="QVg0UfJL"
Date: Wed, 3 Sep 2025 21:20:46 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=grimler.se; s=key1;
	t=1756927251;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=SMNUha3xD+Rt2dAgtb0zQ4SvE9n+JpMWof0kjfU/cXc=;
	b=QVg0UfJLMlv1In1mpr0Y++srvzXc85BR+8GHcS2uVNMyRe55/mbrA5+W6Y3uAm9rwXhnML
	G49K0tMJe3BizoEd51XH+pyu06fYzYVd+y1chcd431EM7kuEvpeeKdYH+sZzy4SBxfad5E
	55FjIDBYTfjxUTEmsC7HHp64ojgww0g=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Henrik Grimler <henrik@grimler.se>
To: Devang Tailor <dev.tailor@samsung.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	alim.akhtar@samsung.com, alexandre.belloni@bootlin.com,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-rtc@vger.kernel.org, faraz.ata@samsung.com
Subject: Re: [PATCH v2 2/3] rtc: s3c: support for exynosautov9 on-chip RTC
Message-ID: <20250903192046.GA4126@l14.localdomain>
References: <20250710083434.1821671-1-dev.tailor@samsung.com>
 <CGME20250710082536epcas5p4f9dcd50ff474066562b2cbd40199d2d9@epcas5p4.samsung.com>
 <20250710083434.1821671-3-dev.tailor@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250710083434.1821671-3-dev.tailor@samsung.com>
X-Migadu-Flow: FLOW_OUT

Hi Devang,

On Thu, Jul 10, 2025 at 02:04:33PM +0530, Devang Tailor wrote:
> The on-chip RTC of this SoC is almost similar to the previous
> versions of SoC. Hence re-use the existing driver with platform specific
> change to enable RTC.

Could you please describe what the differences are to previous SoCs?
You write almost similar, please elaborate in what way in commit
message.

> This has been tested with 'hwclock' & 'date' utilities
> 
> Signed-off-by: Devang Tailor <dev.tailor@samsung.com>
> ---
> 
>  drivers/rtc/rtc-s3c.c | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
> 
> diff --git a/drivers/rtc/rtc-s3c.c b/drivers/rtc/rtc-s3c.c
> index 5dd575865adf..8db24b6360b8 100644
> --- a/drivers/rtc/rtc-s3c.c
> +++ b/drivers/rtc/rtc-s3c.c
> @@ -384,6 +384,15 @@ static void s3c6410_rtc_disable(struct s3c_rtc *info)
>  	writew(con, info->base + S3C2410_RTCCON);
>  }
>  
> +static void exynosautov9_rtc_disable(struct s3c_rtc *info)
> +{
> +	unsigned int con;
> +
> +	con = readb(info->base + S3C2410_RTCCON);
> +	con &= ~S3C2410_RTCCON_RTCEN;
> +	writeb(con, info->base + S3C2410_RTCCON);
> +}

Rather than adding a new rtc_disable variant I think this could be
handled in existing s3c24xx_rtc_disable (and I think that is what
Krzysztof meant). How about adding a new bool to rtc_data that
describes if S3C2410_TICNT reg is supported or not, and checking it in
s3c24xx_rtc_disable?

Best regards,
Henrik Grimler

>  static void s3c_rtc_remove(struct platform_device *pdev)
>  {
>  	struct s3c_rtc *info = platform_get_drvdata(pdev);
> @@ -574,6 +583,12 @@ static struct s3c_rtc_data const s3c6410_rtc_data = {
>  	.disable		= s3c6410_rtc_disable,
>  };
>  
> +static const struct s3c_rtc_data exynosautov9_rtc_data = {
> +	.irq_handler		= s3c6410_rtc_irq,
> +	.enable			= s3c24xx_rtc_enable,
> +	.disable		= exynosautov9_rtc_disable,
> +};
> +
>  static const __maybe_unused struct of_device_id s3c_rtc_dt_match[] = {
>  	{
>  		.compatible = "samsung,s3c2410-rtc",
> @@ -590,6 +605,9 @@ static const __maybe_unused struct of_device_id s3c_rtc_dt_match[] = {
>  	}, {
>  		.compatible = "samsung,exynos3250-rtc",
>  		.data = &s3c6410_rtc_data,
> +	}, {
> +		.compatible = "samsung,exynosautov9-rtc",
> +		.data = &exynosautov9_rtc_data,
>  	},
>  	{ /* sentinel */ },
>  };
> -- 
> 2.34.1
> 
> 

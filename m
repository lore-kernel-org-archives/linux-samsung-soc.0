Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com [210.118.77.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB4E73EA959
	for <linux-samsung-soc@vger.kernel.org>; Mon, 19 Oct 2026 06:54:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.118.77.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792392897; cv=none; b=IfVSL+tTpcEPwtpJGrOVpL7nP66PiQIeV9lsUMevI5zpNM9RhKkrg7tEEJLFdrKgXAz91iiXn6Wfa09fGJpqFUXE9WgvNxzsYkDo2la5mRsaK4Sn9fMSAKp9kYBIDMtf97Nge6z23jS18xG2S3cLVf3dlMumwv92/hnDE17j3O4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792392897; c=relaxed/simple;
	bh=QReKZ8e5KNyKhGiZ/LM63xfIDlObB0PMTVvDcDsqJXA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:From:In-Reply-To:
	 Content-Type:References; b=HgxHBMiEG+RmNb1iJ8LaRROvsH+fOQADhIoqmI6nt0+SKab9pNHqeAB2YfecZjgx/Jm8tay8/aciUwR/D8krlaLULHFVNO2R2/rjZUoqQefSshljrjhclPRXHDJWKFS3TAYl66Mty4s0+wRtWKuaPsQFXFnCW2woMA16gP++siM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=NxXciU8u; arc=none smtp.client-ip=210.118.77.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="NxXciU8u"
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20261019065445euoutp02f3f1a7770c721bf3eae16ad4cc4b03e3~f29VELt9i3134731347euoutp02B
	for <linux-samsung-soc@vger.kernel.org>; Mon, 19 Oct 2026 06:54:45 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20261019065445euoutp02f3f1a7770c721bf3eae16ad4cc4b03e3~f29VELt9i3134731347euoutp02B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1792392885;
	bh=FhpaG9Vx59Vq4T4QWx8bk+E01NrR9IE2FS4HpRDXhFk=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=NxXciU8uMADYAkpk7fv9mlHGv1mat9rU7RS78vM7+D5byr4P8/q5tRy3kToduMe41
	 efnb4AZ9zHYOBPaPXgeX2ss+hYcpYB2htCVqx9k8HpzoQdPj0rsig5dMj4Q4V+0wcb
	 nb4Sgsy/qnvMsPeKzhS02TwmIuywAr7e07Rsw8+g=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20261019065445eucas1p14ee963364b89f77ba3178fae382a1014~f29Uws2Vt2730627306eucas1p1e;
	Mon, 19 Oct 2026 06:54:45 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20261019065444eusmtip2ea7efda198c5f5be5a45eb7aeeea48fe~f29UXNOG81585015850eusmtip2B;
	Mon, 19 Oct 2026 06:54:44 +0000 (GMT)
Message-ID: <6c07141b-e2d7-49b2-8493-394d727c3a15@samsung.com>
Date: Mon, 19 Oct 2026 08:54:44 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Subject: Re: [PATCH] media: s5p_cec: release IRQ before deleting the adapter
To: Myeonghun Pak <mhun512@gmail.com>, Hans Verkuil <hverkuil@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, Ijae Kim <ae878000@gmail.com>
Content-Language: en-US
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <179229547105.3971562.9800339494753406560.s5p-cec@gmail.com>
Content-Transfer-Encoding: 7bit
X-CMS-MailID: 20261019065445eucas1p14ee963364b89f77ba3178fae382a1014
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20261018035132eucas1p2ccd8f0233fd196fd8801506c1c213b39
X-EPHeader: CA
X-CMS-RootMailID: 20261018035132eucas1p2ccd8f0233fd196fd8801506c1c213b39
References: <CGME20261018035132eucas1p2ccd8f0233fd196fd8801506c1c213b39@eucas1p2.samsung.com>
	<179229547105.3971562.9800339494753406560.s5p-cec@gmail.com>

On 18.10.2026 05:51, Myeonghun Pak wrote:
> The threaded IRQ handler reports transmit and receive events through
> cec->adap. Adapter unregistration masks the hardware interrupts but does
> not wait for this handler. With no open device-node references, it can
> free the adapter while an already queued IRQ thread still uses it.
> Devres also unmaps the registers before releasing the IRQ, since the
> mapping was acquired after the IRQ.
>
> Free the managed IRQ before unregistering the adapter and disabling
> runtime PM. Request it only after the register mapping and adapter have
> been initialized, and free it on adapter registration failure before
> deleting the adapter. This also makes IRQ release precede MMIO release
> on probe unwind.
>
> This issue was identified as part of our ongoing research while
> reviewing kernel code.
>
> Fixes: 1bcbf6f4b6b0 ("[media] cec: s5p-cec: Add s5p-cec driver")
> Co-developed-by: Ijae Kim <ae878000@gmail.com>
> Signed-off-by: Ijae Kim <ae878000@gmail.com>
> Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
>
> ---
> Compile-tested with Clang, W=1. No hardware runtime testing.
>
> Based on mainline 0fcb05b72344f40806cbe810de8872f1698bf053.
>
> diff --git a/drivers/media/cec/platform/s5p/s5p_cec.c b/drivers/media/cec/platform/s5p/s5p_cec.c
> index 4a92d32..e83705f 100644
> --- a/drivers/media/cec/platform/s5p/s5p_cec.c
> +++ b/drivers/media/cec/platform/s5p/s5p_cec.c
> @@ -199,11 +199,6 @@ static int s5p_cec_probe(struct platform_device *pdev)
>  	if (cec->irq < 0)
>  		return cec->irq;
>  
> -	ret = devm_request_threaded_irq(dev, cec->irq, s5p_cec_irq_handler,
> -		s5p_cec_irq_handler_thread, 0, pdev->name, cec);
> -	if (ret)
> -		return ret;
> -
>  	cec->clk = devm_clk_get(dev, "hdmicec");
>  	if (IS_ERR(cec->clk))
>  		return PTR_ERR(cec->clk);
> @@ -231,16 +226,24 @@ static int s5p_cec_probe(struct platform_device *pdev)
>  		goto err_delete_adapter;
>  	}
>  
> -	ret = cec_register_adapter(cec->adap, &pdev->dev);
> +	ret = devm_request_threaded_irq(dev, cec->irq, s5p_cec_irq_handler,
> +					s5p_cec_irq_handler_thread, 0, pdev->name, cec);
>  	if (ret)
>  		goto err_notifier;
>  
> +	ret = cec_register_adapter(cec->adap, &pdev->dev);
> +	if (ret)
> +		goto err_free_irq;
> +
>  	platform_set_drvdata(pdev, cec);
>  	pm_runtime_enable(dev);
>  
>  	dev_dbg(dev, "successfully probed\n");
>  	return 0;
>  
> +err_free_irq:
> +	devm_free_irq(dev, cec->irq, cec);
There is no point in using devm_* API if one needs to manually free the
resource for whatever reason.


> +
>  err_notifier:
>  	cec_notifier_cec_adap_unregister(cec->notifier, cec->adap);
>  
> @@ -253,6 +256,7 @@ static void s5p_cec_remove(struct platform_device *pdev)
>  {
>  	struct s5p_cec_dev *cec = platform_get_drvdata(pdev);
>  
> +	devm_free_irq(&pdev->dev, cec->irq, cec);
>  	cec_notifier_cec_adap_unregister(cec->notifier, cec->adap);
>  	cec_unregister_adapter(cec->adap);
>  	pm_runtime_disable(&pdev->dev);
>
Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland


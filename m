Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F5E2242907;
	Thu, 31 Jul 2025 09:06:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753952773; cv=none; b=j16kWwWkEV9czH0I2b6CVf4mMsBKVxVwksOxVVdQK2Xba0/ZbVax//u5142wmsh0h85no7YBFIn9GytUvzOrLpYkwX7ugNKJN6GkrKXQS4YRkFdulka6rdrGHJSWYmYy6AGau1V0S0dKyQhMOtBsOavyUe3FrI0tYFmHLvqhrXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753952773; c=relaxed/simple;
	bh=oSMKei0qcQQgEgMV1zyUo1IrYdKO89Yq7Tm0/TNmFXg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=epMzOCtlUW5NlA7kLWrFacYMuOsT6YlmI2NOywFduQ3FXKlvPxVTXC3BLCwD1gFn6cbqtzQjSDcVglFTtO/6RrI+BclqVccUXcrPPlD/P45fURSW1Is7a7Ku0nJLBcMbD46L6oVG/jbrCbEWYErZHuLwuNytic8fYy35L3SBa5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=f/4YKdSq; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="f/4YKdSq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6FB98C4CEEF;
	Thu, 31 Jul 2025 09:06:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753952772;
	bh=oSMKei0qcQQgEgMV1zyUo1IrYdKO89Yq7Tm0/TNmFXg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=f/4YKdSqLENAXDynYM/jt1AeTEaJ1yN5/Y4+ny2jqUH48YHlnTWdpMznnDtMoJMAZ
	 4U6iuyBEB1GhdqkuklBMFvcUWSc2X5RE4nNW1rvKAPiEl99/Mo4JKvALE1LXTTYY/e
	 ZNitFaBeqkKxGBu+vvpbaTPYjb0zyrQ2fP2n+zcz7q4bpmw0PNWJvMjJEgumjL2lCH
	 MA6bE0nn/ezx8pO9+kCNyh16hJKbqMPCZXzxwmbx1Z9FAjRxyDgjbXV9bMNNZMemlm
	 b5Y1hj2VpJskxwt/ibowYUnzsj62pqZ5dID0HT+SC7sn8DGwsChJf7vEpZkYWH1lHv
	 WhxI2EoV+tKSQ==
Message-ID: <aa6ad382-dc2a-4f63-be11-7d331027af66@kernel.org>
Date: Thu, 31 Jul 2025 11:06:09 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] memory: samsung: exynos-srom: Fix of_iomap leak in
 exynos_srom_probe
To: Zhen Ni <zhen.ni@easystack.cn>, alim.akhtar@samsung.com
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org
References: <20250731083340.1057564-1-zhen.ni@easystack.cn>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <20250731083340.1057564-1-zhen.ni@easystack.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 31/07/2025 10:33, Zhen Ni wrote:
> The current error handling in exynos_srom_probe() has a resource leak
> in the of_platform_populate() failure path. When this function fails
> after successful resource allocation, srom->reg_base is not released.
> 
> To fix this issue, replace of_iomap() with
> devm_platform_ioremap_resource(). devm_platform_ioremap_resource()
> is a specialized function for platform devices.

Don't explain us kernel code. Drop sentence.

> It allows 'srom->reg_base' to be automatically released whether the
> probe function succeeds or fails.

It's obvious.

> 
> Besides, use IS_ERR() instead of !srom->reg_base

I don't understand this. You keep explaining the code and this suggests
you made change here not related to original case. Can you return
srom->reg_base here? No?


> as the return value of devm_platform_ioremap_resource()
> can either be a pointer to the remapped memory or
> an ERR_PTR() encoded error code if the operation fails.
> 

Missing fixes and cc-stable.

> Signed-off-by: Zhen Ni <zhen.ni@easystack.cn>
> ---
>  drivers/memory/samsung/exynos-srom.c | 10 ++++------
>  1 file changed, 4 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/memory/samsung/exynos-srom.c b/drivers/memory/samsung/exynos-srom.c
> index e73dd330af47..d913fb901973 100644
> --- a/drivers/memory/samsung/exynos-srom.c
> +++ b/drivers/memory/samsung/exynos-srom.c
> @@ -121,20 +121,18 @@ static int exynos_srom_probe(struct platform_device *pdev)
>  		return -ENOMEM;
>  
>  	srom->dev = dev;
> -	srom->reg_base = of_iomap(np, 0);
> -	if (!srom->reg_base) {
> +	srom->reg_base = devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(srom->reg_base)) {
>  		dev_err(&pdev->dev, "iomap of exynos srom controller failed\n");
> -		return -ENOMEM;
> +		return PTR_ERR(srom->reg_base);

How did you test it?

Best regards,
Krzysztof

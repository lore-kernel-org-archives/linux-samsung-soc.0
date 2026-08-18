Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7008C30DD10;
	Tue, 18 Aug 2026 14:52:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787064771; cv=none; b=VFj1YkXNvgLEA2O4oIYg4ETI/kSFLVKJ5Wydkr1Ae0lgbZgLKzlLmGwfMtaqZY/hzUUsVU0qOLsAU4oBX72sdQGbShIYG+c1dCmfDNaKcyVi8VaOOT9GHGiAJAS0yHzqzeL2LIRkA0e0f89i7aj9fXCEpMNJ38UjdoJtdhiimGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787064771; c=relaxed/simple;
	bh=eu+QOVzA3GWwnasseZPGMU5ztMjisaoYYZisaqfYf2A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EWsPaRhT3DtQR6HStYvT1kjCC0NN2Eh/x83bLL6th28qv7ajIORID0KBQf+9ezE07CGjmA2QZrqoowZLzxT1SMEZryqNOW/+nu9FxdGKBD4Wo0IhAtv5m4ttG+i2squOU3QQiZJ2eOADUl3dReESwXHdTjrE5SYlklweX2OtLvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=b0SfcLM6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="b0SfcLM6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26AD11F000E9;
	Tue, 18 Aug 2026 14:52:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787064770;
	bh=rfOry45ulwe7v6KhpB1GY36EGtm0Agssnch6yIRMUe4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=b0SfcLM6JEf6E/47tSLKjlfUE6vghA2jIi0YE4aBIWmYEOi+XJaKj2Gy5zITLhDNl
	 bwOY3xmAj2j7iE1R/U3RGb0anQjroUiL6EO2F8srtMum4HmUhbOpfVpHV1+A1bvjSQ
	 FsRfhRcC282dWj7xyp2nPI5S1UEhWtl6rm9nSm2ROmsh+WMRHyiwtrHhUQ/GJ0M/Xz
	 BiJhu++JLTWJv2I+Xx1SHX/XzvtFLbMb7tMBvUEmp68nZfcjrRHc+T/H83VyzT6qeS
	 lMGPO8MkEHeW6IQ5VN24qLkgqu44YjuY8hPXP8QwgUxfjShQGGxFE+BEQWjlacLejK
	 9Ez04mzrj+/OA==
Date: Tue, 18 Aug 2026 16:52:46 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Jiawen Liu <1298662399@qq.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, 
	Peter Griffin <peter.griffin@linaro.org>, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Alim Akhtar <alim.akhtar@samsung.com>
Subject: Re: [PATCH] i2c: i2c-s3c2410: fix runtime PM cleanup
Message-ID: <aoRq_1DgSUrmR_i_@zenone.zhora.eu>
References: <tencent_692077742B9CE600137EC92B0FEA258A8C09@qq.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <tencent_692077742B9CE600137EC92B0FEA258A8C09@qq.com>

Hi Jiawen,

On Tue, Aug 18, 2026 at 05:11:57PM +0400, Jiawen Liu wrote:
> Keep clock enabled until adapter teardown.
> 
> The remove path disables the controller clock before unregistering the
> I2C adapter, so adapter teardown can run after the hardware clock has
> already been turned off.
> 
> Move I2C teardown before clock release (pm_runtime_disable,
> clk_unprepare) in s3c24xx_i2c_remove.

This last paragraph is actually useless. Perhaps you can write:

"
The remove path disables the controller clock before
unregistering the I2C adapter, so adapter teardown can run after
the hardware clock has been turned off.

Fix the ordering in s3c24xx_i2c_remove() by calling
i2c_del_adapter() before pm_runtime_disable(), keeping the clock
enabled until adapter teardown is complete.
"

This way we also mention that the ordering between PM runtime and
i2c_del_adapter() has also changed.

Does it work for you?

> Signed-off-by: jiawen <1298662399@qq.com>

Please, next time write your full name, not "jiawen", but "Jiawen
Liu".

Besides this can also be considered as a fix and needs to add:

Fixes: 34e81ad5f0b6 ("i2c: s3c2410: fix ABBA deadlock by keeping clock prepared")
Cc: <stable@vger.kernel.org> # v3.19+

No need to resend, unless there are other reviews. Please just
let me know whether the changs I am suggesting work for you.

Thanks,
Andi

> ---
> diff --git a/drivers/i2c/busses/i2c-s3c2410.c b/drivers/i2c/busses/i2c-s3c2410.c
> --- a/drivers/i2c/busses/i2c-s3c2410.c
> +++ b/drivers/i2c/busses/i2c-s3c2410.c
> @@ -1136,11 +1136,9 @@
>  {
>  	struct s3c24xx_i2c *i2c = platform_get_drvdata(pdev);
>  
> +	i2c_del_adapter(&i2c->adap);
> +	pm_runtime_disable(&pdev->dev);
>  	clk_unprepare(i2c->clk);
> -
> -	pm_runtime_disable(&pdev->dev);
> -
> -	i2c_del_adapter(&i2c->adap);
>  }
>  
>  static int s3c24xx_i2c_suspend_noirq(struct device *dev)
> 

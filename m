Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8982469850;
	Fri,  7 Aug 2026 07:52:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786089156; cv=none; b=jYbKepwT2zNACncqHfek41SkoQfUqUrcCO0FKlKOFm0t4Crhqp+skZ2Lbho+Na9MIcYwItYUmN9BQO+6rqZLuz77Zl4U/1fgDxqYhc6ZdruMd34yu1v3zMxP4E1Fyj34Qj+o29YSCKuAlVb3UXImZ6oUfwjaO6opN1nk0/aMkcw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786089156; c=relaxed/simple;
	bh=7YpJjSbdNTPbV+ppRNF+1sB3n1c0aJopWbX5CabLZ+I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DUKzMihBfR2wkyuII6Ql+ymJJmDIhgOX5GFIh5GDL2CfeHfoBE0AZYWUWja4IEzB5/la/iynY1di2vGBfWEbesCszypA9DxtnKrddE3TxgbAiGFm8S1cMZ64IQ8v+MDvP++dxsZW30v7nFWwzerYNVIraZMHylz8EsJvnNF8hvg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mqZaDjWi; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mqZaDjWi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 529391F000E9;
	Fri,  7 Aug 2026 07:52:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786089153;
	bh=ZDOdXiVF/xf41VWsCiqG4/1i+sm5JmjMqfQEkuoApZs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=mqZaDjWieyB7BDMXelmyJRvbRl5Y3Q82hzQqnL05M0hOg4wlUvvOwt/THUtTzbmX5
	 LP9L0I/rz7PGSMX7rJDLiHLoOgqQ+Mq6yiMHZLfghRq+NbyKZgK0lbsap/j5w2ATdB
	 A1/H5rFRv8sJj5+kaR3gNJ/9O9NzAgd1MOD2gyqeQCeq2Nu5S0YSD8LDMFFpab610n
	 fDWrm4oJMXCX2s+lhNVgK/VxMMGqS0gwJWbBDwepJs1DvidLBVkLY732q3T6LgYSUK
	 wmkxirfykgdUBLZ0WvRGyfUid+mC0hNgf8I2soBkAdxIOWJFJrQqRr4m/lEybeplE4
	 0EuyfSpQ/7NXw==
Message-ID: <2284aa9b-9299-4c43-8af9-d5cfd84452d6@kernel.org>
Date: Fri, 7 Aug 2026 10:52:26 +0300
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 12/36] media: remove conditional return with no effect
To: Sang-Heon Jeon <ekffu200098@gmail.com>, Julia.Lawall@inria.fr,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
 Bryan O'Donoghue <bod@kernel.org>,
 =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>,
 Sylwester Nawrocki <sylvester.nawrocki@gmail.com>,
 Michael Krufky <mkrufky@linuxtv.org>, Hans Verkuil <hverkuil@kernel.org>
Cc: cocci@inria.fr, Abhinav Kumar <abhinav.kumar@linux.dev>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org
References: <20260723184538.3888637-1-ekffu200098@gmail.com>
 <20260723184538.3888637-13-ekffu200098@gmail.com>
From: Eugen Hristev <ehristev@kernel.org>
Content-Language: en-US
In-Reply-To: <20260723184538.3888637-13-ekffu200098@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 7/23/26 21:45, Sang-Heon Jeon wrote:
> Both branches of the check return the same value, so the check has
> no effect. Remove it and return the value directly.
> 
> This is the result of running the Coccinelle script from
> scripts/coccinelle/misc/cond_return_no_effect.cocci.
> 
> Signed-off-by: Sang-Heon Jeon <ekffu200098@gmail.com>
> ---
>  drivers/media/i2c/mt9p031.c                          |  6 +-----
>  .../media/platform/microchip/microchip-sama7g5-isc.c |  7 +------
>  drivers/media/platform/qcom/iris/iris_resources.c    |  6 +-----
>  drivers/media/platform/qcom/venus/pm_helpers.c       |  7 +------
>  drivers/media/platform/renesas/rcar-csi2.c           |  6 +-----
>  .../media/platform/samsung/s3c-camif/camif-core.c    |  7 +------
>  drivers/media/usb/dvb-usb-v2/mxl111sf.c              | 12 ++----------
>  drivers/media/usb/gspca/jl2005bcd.c                  |  7 +------
>  8 files changed, 9 insertions(+), 49 deletions(-)
> 
> diff --git a/drivers/media/i2c/mt9p031.c b/drivers/media/i2c/mt9p031.c
> index d21510caf45a..2b09e8315c8e 100644
> --- a/drivers/media/i2c/mt9p031.c
> +++ b/drivers/media/i2c/mt9p031.c
> @@ -452,11 +452,7 @@ static int mt9p031_set_params(struct mt9p031 *mt9p031)
>  	ret = mt9p031_write(client, MT9P031_HORIZONTAL_BLANK, hblank - 1);
>  	if (ret < 0)
>  		return ret;
> -	ret = mt9p031_write(client, MT9P031_VERTICAL_BLANK, vblank - 1);
> -	if (ret < 0)
> -		return ret;
> -
> -	return ret;
> +	return mt9p031_write(client, MT9P031_VERTICAL_BLANK, vblank - 1);
>  }
>  
>  static int mt9p031_s_stream(struct v4l2_subdev *subdev, int enable)
> diff --git a/drivers/media/platform/microchip/microchip-sama7g5-isc.c b/drivers/media/platform/microchip/microchip-sama7g5-isc.c
> index b0302dfc3278..7383341ec51d 100644
> --- a/drivers/media/platform/microchip/microchip-sama7g5-isc.c
> +++ b/drivers/media/platform/microchip/microchip-sama7g5-isc.c
> @@ -598,13 +598,8 @@ static int __maybe_unused xisc_runtime_suspend(struct device *dev)
>  static int __maybe_unused xisc_runtime_resume(struct device *dev)
>  {
>  	struct isc_device *isc = dev_get_drvdata(dev);
> -	int ret;
> -
> -	ret = clk_prepare_enable(isc->hclock);
> -	if (ret)
> -		return ret;
>  
> -	return ret;
> +	return clk_prepare_enable(isc->hclock);
>  }
>  

For microchip isc,

Reviewed-by: Eugen Hristev <ehristev@kernel.org>



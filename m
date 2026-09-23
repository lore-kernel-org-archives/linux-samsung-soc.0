Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0655A357D1A;
	Wed, 23 Sep 2026 10:19:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790158776; cv=none; b=YrfF1YWt6SDvuUxQFHCi82se1m5TOIvjnIFhOk/7P1Xn78StusaMs5cj13GB4sdRvVSv2ZSEYY0bDmci1dCiSo9W7Bohc6hVk2lFPGt2XKy83g9eBbnEodLO9aTglhza9bxMgPATEuNuunKdWUZ3Lk/8cDORNL5kyCislvmJPmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790158776; c=relaxed/simple;
	bh=EM24E4sO7sV9a07DKnzcEJnvWBCdD2dnZrt+skAvdQY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iYo5GXCMuCMav4n2KheXtehH5W1ZY4I+T9Gw2m0zwuQ3HUwUPBpcK+b5hV0YVuEJBPKu5wRTuE3t2qEm7OwJ3CCRBaWbtKDZIZ6HcCPT2KEjlgXZPTuGqLIudmX9swK0ht4fvdQnZJMDV1UVBWCaEvuN1H0EhIhXGbomsN8dUd8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kPYelFyF; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kPYelFyF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08E4C1F000FF;
	Wed, 23 Sep 2026 10:19:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790158772;
	bh=4yZu5k7G2mvUqwrOPUIO/yinZuuQ7b17GcD28NPiS80=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=kPYelFyFxfUtCbV2k9Wv6r2Bbl++2NQDwXrUaey1bJouX2XbhQSkcaY7UuDnd+Uc+
	 pXgil+aij4Y/iAlt0ADBFxPuXY5yDowtVo+edi3OlpuuaWeDpglke9s7I2FOABl+q5
	 Pd1lF0zEf/7HZoj/oOf/bWC4kqdo/tVEGO7g5JeDtPCL7RpqAdwbjGLXRsiwB4aaVv
	 B50+3SrzoTxhYFMRBuCwmVNixyNG+ZCMV9GYc2G7chnCi/QqlU3vkm+vKczo3LogeR
	 PpXA7lCQPoi3BzuDcFivVSqA/aDpTpxLN5I8UalvdClWhmxxrMQABbHICsLqLRT6JA
	 Rgh3Ya0H2HIXA==
Date: Wed, 23 Sep 2026 11:19:27 +0100
From: Lee Jones <lee@kernel.org>
To: Hemanth Selam <hemanth.selam@gmail.com>
Cc: Support Opensource <support.opensource@diasemi.com>,
	Matti Vaittinen <mazziesaccount@gmail.com>,
	=?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Botsz HUANG <huang.botsz@gmail.com>, Nick Huang <sef1548@gmail.com>,
	mfd@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH v5] mfd: Fix typos in comments
Message-ID: <20260923101927.GC3864833@google.com>
References: <20260917054045.15805-1-hemanth.selam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260917054045.15805-1-hemanth.selam@gmail.com>

On Thu, 17 Sep 2026, Hemanth Selam wrote:

> Fix misspellings in comments across the MFD drivers and headers, found
> with scripts/checkpatch.pl using the list in scripts/spelling.txt.
> 
> Only touches comments, no code changes.
> 
> Reviewed-by: Matti Vaittinen <mazziesaccount@gmail.com>
> Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
> ---
> v5: no change to the diff; moved the version notes below the --- where
>     they belong rather than leaving them in the commit log.
> 
> v4: dropped the two Acked-by tags that v3 added, keeping only Matti's
>     Reviewed-by, and dropped the Assisted-by trailer.
> 
> v2: also corrects "wainting" and "comapletion" in
>     include/linux/mfd/si476x-core.h, which checkpatch did not flag;
>     "comapletion" sits on the same line as the "wainting" Matti asked
>     about.  Subject capitalised to match the MFD convention.
> 
>  drivers/mfd/88pm800.c                |  2 +-
>  drivers/mfd/kempld-core.c            |  2 +-
>  drivers/mfd/max8998.c                |  2 +-
>  drivers/mfd/rave-sp.c                |  6 +++---
>  drivers/mfd/si476x-i2c.c             |  2 +-
>  include/linux/mfd/da9063/registers.h |  2 +-
>  include/linux/mfd/db8500-prcmu.h     | 32 ++++++++++++++--------------
>  include/linux/mfd/lp8788.h           |  2 +-
>  include/linux/mfd/max8998.h          |  2 +-
>  include/linux/mfd/palmas.h           |  2 +-
>  include/linux/mfd/rohm-bd71828.h     |  2 +-
>  include/linux/mfd/samsung/core.h     |  2 +-
>  include/linux/mfd/si476x-core.h      |  4 ++--
>  include/linux/mfd/twl.h              |  2 +-
>  14 files changed, 32 insertions(+), 32 deletions(-)
> 
> diff --git a/drivers/mfd/88pm800.c b/drivers/mfd/88pm800.c
> index e9941da58b18..aac630322b3c 100644
> --- a/drivers/mfd/88pm800.c
> +++ b/drivers/mfd/88pm800.c
> @@ -275,7 +275,7 @@ static int device_gpadc_init(struct pm80x_chip *chip,
>  		goto out;
>  
>  	/*
> -	 * the defult of PM800 is GPADC operates at 100Ks/s rate
> +	 * the default of PM800 is GPADC operates at 100Ks/s rate
>  	 * and Number of GPADC slots with active current bias prior
>  	 * to GPADC sampling = 1 slot for all GPADCs set for
>  	 * Temprature mesurmants

While you are here, could we also fix 'Temprature mesurmants' on this line?

-- 
Lee Jones

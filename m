Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C7181946C3
	for <linux-samsung-soc@vger.kernel.org>; Wed, 26 Jun 2024 23:39:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719445147; cv=none; b=mNZgYNSPyv16f0/+NqNB9ChHKT2jNhbOqEwVD16S4IdiB1pXSeDTjigMOONaJHaYy4oVCVRJ+1kB9pl3hHfpjfu+VTXuAHKofF9DijqE6V1Z6TzUd2V0aBylzsHxiAf9DQi47GVCPrv3s/tr5XOQcdtHI633D1L1sDaFqOV9fPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719445147; c=relaxed/simple;
	bh=b6WYlfkbjmi7vg40d8+F6oKkGWP0eLaqM1jbxdGWZRo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=odtF1H8Jo8UjpQZVyaj7LxxWSBTTnLFdvcHUPd2pq7zlQxxAG8eDrF9pmXQQ11+ev0griWWzWEv5lT11tNMqRL6a2Yr8pLFoSL5bzwZD3dDp0+D/wlBk9yGll8zmMiqEtjxI+Z+gkyjux9J1maREDuYphg7YaJ6o1EnQY4hPsUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=QhdYsgFp; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="QhdYsgFp"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-1fa901ad6f3so39305ad.0
        for <linux-samsung-soc@vger.kernel.org>; Wed, 26 Jun 2024 16:39:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1719445145; x=1720049945; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=K3pmB34cCwtjnl+eYO8f6Z1wbmFiYiECc2kegHJsZVI=;
        b=QhdYsgFpqnCTNhhQJzsxrR/t4xE747dDo8ikQcVYTChFnC6GcJptwEbnb89ma11dO/
         TypW4FWTl2wzneOiH1n0TQLN4wTexHT7cF5h7hggzfvGDReFT4UOweBU8KvPEcK25ruG
         SPI9iJFVC6Y/T18tqmiHrwBYOQuOvrDfUXBB5R5hUbOqhNelv+bgeLmamde57tVo2Fv/
         9zAU07S2cJJDbfkqZj1DIdBWZMk8gP76f4A28HUyshD9dbi2JUZmrVl1+mc6PFaUP+LT
         SJE0palp41Dkivfndo023opoLbkU9ZrZ/Z6Yyeh8lwIbAq/MQZGpL9TOeiXHDDz7ZOJi
         pDeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719445145; x=1720049945;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K3pmB34cCwtjnl+eYO8f6Z1wbmFiYiECc2kegHJsZVI=;
        b=NZ0Qe/tYDYqEWFMgBjzaZ2AVOe5ImJ3LQ419cAcumRcPP1BNPBi+e7zdKZBQoFuSa0
         1/Cthl645i6VWYUmJ18CanpjdTTdeGq/uAeoIqYsMCrdU0sDHTOsmgAKjHtRVLrtOqbw
         snkCtUzYEp4q6td8wqySO3y0kZjR86cbElcfNzpeSTpNbZHr9XvhPw43BBzzTMcS7ZV9
         WDsMTqMVdu/RkBap3/wgbpRZdGXHuCw9152lghH0yOpHwfM5/K2mydoztd4MnDrRfJMB
         +fNYI2DkXo3Q03i8Z3DrFtT2R3Yn6++VomigHdhe/xs/5O48NLk6nw9OH6s5MzfGLJjm
         QekA==
X-Forwarded-Encrypted: i=1; AJvYcCWwROWlDH5Bgq5dwKOnxVtOdjJBijnZXI/cpxG/166UsFNnUZt3pqFmyxBQSGsCqvyVHivhut87Ug9+ykffsjl2dRk7y+mMv/0yIpT31iWitjs=
X-Gm-Message-State: AOJu0YyjZPz3j842pz0YUBIHduEjaiDMIjzQQm4C0hTtu772yElJfrAv
	XMV6/Lu6BkSZFylBi0GuBOOtNdOLZUjx46GfShmRClX0RePgmcAxA4VDuGmvvA==
X-Google-Smtp-Source: AGHT+IHRdsS+/Y76sEwDfKIkrb+jsZorceifOYSrWmMRro/2TsN9MxZqihS12VYFCI7AWUK+mR2ByA==
X-Received: by 2002:a17:902:f74d:b0:1f6:5bba:8ea3 with SMTP id d9443c01a7336-1faab5992d7mr812505ad.25.1719445144627;
        Wed, 26 Jun 2024 16:39:04 -0700 (PDT)
Received: from google.com (7.104.168.34.bc.googleusercontent.com. [34.168.104.7])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1faac99a30fsm527375ad.223.2024.06.26.16.39.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jun 2024 16:39:03 -0700 (PDT)
Date: Wed, 26 Jun 2024 16:39:00 -0700
From: William McVicker <willmcvicker@google.com>
To: Peter Griffin <peter.griffin@linaro.org>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	alim.akhtar@samsung.com, s.nawrocki@samsung.com,
	cw00.choi@samsung.com, mturquette@baylibre.com, sboyd@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
	tudor.ambarus@linaro.org, andre.draszik@linaro.org,
	kernel-team@android.com, devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: Re: [PATCH 2/3] soc: samsung: exynos-pmu: add support for PMU_ALIVE
 non atomic registers
Message-ID: <ZnymlHiCCIDt2dCJ@google.com>
References: <20240626194300.302327-1-peter.griffin@linaro.org>
 <20240626194300.302327-3-peter.griffin@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240626194300.302327-3-peter.griffin@linaro.org>

On 06/26/2024, Peter Griffin wrote:
> Not all registers in PMU_ALIVE block support atomic set/clear operations.
> GS101_SYSIP_DAT0 and GS101_SYSTEM_CONFIGURATION registers are two regs
> where attempting atomic access fails.
> 
> As documentation on exactly which registers support atomic operations is
> not forthcoming. We default to atomic access, unless the register is
> explicitly added to the tensor_is_atomic() function. Update the comment
> to reflect this as well.
> 
> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>

Reviewed-by: Will McVicker <willmcvicker@google.com>
Tested-by: Will McVicker <willmcvicker@google.com>

I verified reboot and power off on my Pixel 6 Pro.

> ---
>  drivers/soc/samsung/exynos-pmu.c            | 16 ++++++++++++++--
>  include/linux/soc/samsung/exynos-regs-pmu.h |  4 ++++
>  2 files changed, 18 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/soc/samsung/exynos-pmu.c b/drivers/soc/samsung/exynos-pmu.c
> index 624324f4001c..5556acc7c092 100644
> --- a/drivers/soc/samsung/exynos-pmu.c
> +++ b/drivers/soc/samsung/exynos-pmu.c
> @@ -129,14 +129,26 @@ static int tensor_set_bits_atomic(void *ctx, unsigned int offset, u32 val,
>  	return ret;
>  }
>  
> +static bool tensor_is_atomic(unsigned int reg)
> +{
> +	switch (reg) {
> +	case GS101_SYSIP_DAT0:
> +	case GS101_SYSTEM_CONFIGURATION:
> +		return false;
> +	default:
> +		return true;
> +	}
> +}
> +
>  static int tensor_sec_update_bits(void *ctx, unsigned int reg,
>  				  unsigned int mask, unsigned int val)
>  {
>  	/*
>  	 * Use atomic operations for PMU_ALIVE registers (offset 0~0x3FFF)
> -	 * as the target registers can be accessed by multiple masters.
> +	 * as the target registers can be accessed by multiple masters. Some
> +	 * SFRs don't support this however as reported by tensor_is_atomic()
>  	 */
> -	if (reg > PMUALIVE_MASK)
> +	if (reg > PMUALIVE_MASK || !tensor_is_atomic(reg))

nit: Should we just move all the logic, e.g. `reg > PMUALIVE_MASK` into `tensor_is_atomic()`?

[...]

Thanks,
Will

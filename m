Received: from out-183.mta0.migadu.com (out-183.mta0.migadu.com [91.218.175.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB5DE2D04A
	for <linux-samsung-soc@vger.kernel.org>; Sun, 18 Feb 2024 10:24:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708251900; cv=none; b=Ntka8SvgUGX5dRxIoQVVMaiQygqYp1JbXZspqoTCuHqbCe0Lk7BlAa0Pz1ljHEdSPutiF29EWbo2Rz0hCTiHJ8lzCmgh5PhIcMDItPi21up36LtuRkrDb7cRz2xz3r+xuRhZVMEKkvvyQkrxYJLZfn8xgX0b2r7M7o0CNS/xpz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708251900; c=relaxed/simple;
	bh=7T65f/Wd63Ks1lufnUN/PWkHZ5lS3y7W0WH/QysgGms=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O5JFgb3UwADIG5O3Q4Qxc5OZPhREQS2jx002US9+bqAdoNNRk7Jwz2vnMn3HmvKvDL+J7+C1iqgqmaN/gXsGCbIPr0t9Gn+q0FnIYC3SpqyYZohMMfTzMCMkUpjLZk9s9pE8W5wus0VxCnRYuxc+/Q6AZ46jMKEHbIf+WLj/mC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=grimler.se; spf=pass smtp.mailfrom=grimler.se; dkim=pass (1024-bit key) header.d=grimler.se header.i=@grimler.se header.b=POmXrPzV; arc=none smtp.client-ip=91.218.175.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=grimler.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=grimler.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=grimler.se header.i=@grimler.se header.b="POmXrPzV"
Date: Sun, 18 Feb 2024 11:24:49 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=grimler.se; s=key1;
	t=1708251893;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5Q6gteFXLuw2xa9qiBWiKUaLv3oz6lEnepe4NxbB9Vs=;
	b=POmXrPzVyqbX9+lwS3g3MVsM1gkzEC6PGkcdMmTbGjf5yrQqoVeEAEoDS4EJZiuikXJKfd
	1vWGINMT2dD/TMkzn6/SakwIOj1swc3zbVfj/gXijUECLRdfA7pjr8CBm/Tb4DkQjDtQYi
	OW/n+aog7oheGUfApsczc9y54aCsUcc=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Henrik Grimler <henrik@grimler.se>
To: Artur Weber <aweber.kernel@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
	~postmarketos/upstreaming@lists.sr.ht
Subject: Re: [PATCH] ARM: dts: exynos4212-tab3: limit usable memory range
Message-ID: <20240218102449.GA7577@grimlerstat.localdomain>
References: <20240217-tab3-limit-usable-memory-range-v1-1-49cc9c86a5cc@gmail.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240217-tab3-limit-usable-memory-range-v1-1-49cc9c86a5cc@gmail.com>
X-Migadu-Flow: FLOW_OUT

Hi Artur,

On Sat, Feb 17, 2024 at 08:02:47PM +0100, Artur Weber wrote:
> The stock bootloader on the Samsung Galaxy Tab 3 8.0 provides an
> incorrect available memory range over ATAG_MEM. Limit the usable
> memory in the DTS to prevent it from doing so, without having to
> disable ATAG support.
> 
> Signed-off-by: Artur Weber <aweber.kernel@gmail.com>
> ---
>  arch/arm/boot/dts/samsung/exynos4212-tab3.dtsi | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/samsung/exynos4212-tab3.dtsi b/arch/arm/boot/dts/samsung/exynos4212-tab3.dtsi
> index e5254e32aa8f..9bc05961577d 100644
> --- a/arch/arm/boot/dts/samsung/exynos4212-tab3.dtsi
> +++ b/arch/arm/boot/dts/samsung/exynos4212-tab3.dtsi
> @@ -45,6 +45,12 @@ chosen {
>  		/* Default S-BOOT bootloader loads initramfs here */
>  		linux,initrd-start = <0x42000000>;
>  		linux,initrd-end = <0x42800000>;
> +
> +		/*
> +		 * Stock bootloader provides incorrect memory size in ATAG_MEM;
> +		 * override it here
> +		 */
> +		linux,usable-memory-range = <0x40000000 0x3fc00000>;

Maybe it would make sense to set the memory reg to
<0x40000000 0x60000000> (1.5 GiB) and move the comment about last
512(/516) MiB being weird/broken here instead.  It looks a bit weird
that the memory range and usable-memory-range are identical, and device tree
should describe hardware, which technically has 1.5 GiB RAM.

From a functional point of view it does not really matter, so in any case:
Reviewed-by: Henrik Grimler <henrik@grimler.se>

>  	};
>  
>  	firmware@204f000 {
> 
> ---
> base-commit: 0f1dd5e91e2ba3990143645faff2bcce2d99778e
> change-id: 20240217-tab3-limit-usable-memory-range-1d1ffa8dc44d
> 
> Best regards,
> -- 
> Artur Weber <aweber.kernel@gmail.com>
> 

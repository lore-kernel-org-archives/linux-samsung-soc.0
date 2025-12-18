Received: from out-181.mta0.migadu.com (out-181.mta0.migadu.com [91.218.175.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3060D191F98
	for <linux-samsung-soc@vger.kernel.org>; Thu, 18 Dec 2025 19:19:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766085601; cv=none; b=oVovM+B9MJnhln/kgt6LLF8hWu51eWfgmy/DVOfMa9rDMYM4cHDl7i4v81nuhLxxvZzXjzkBn8Po10MMpzUaA6wu8lOKTAu4YhtpXdsXf8JEjhYhtYO+ezzdXuXt78eOYICg7X7kjJCewhlkcKwciVxY66WnXNCLQIZznJW5Ydo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766085601; c=relaxed/simple;
	bh=DPw3MEKEDTj6hhZJV240070qZUesK7eMmHDzezoTDnY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sOJJiH4TENGy0Zb3qdx8EceizESsN74S1jf957lsyrYRFvANK5ME2AlT4CQ3leGfHTFtjTsrxRr949vn54x66Zdmm8iciIU5r08BdM9tz23ItdLgAFP5gShDsA9toXlbiQtW0ieh6Y8tJyJf9eKZ5nBz1CLmsxvcyRgc25X8eKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=grimler.se; spf=pass smtp.mailfrom=grimler.se; dkim=pass (1024-bit key) header.d=grimler.se header.i=@grimler.se header.b=ayQeIOYW; arc=none smtp.client-ip=91.218.175.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=grimler.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=grimler.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=grimler.se header.i=@grimler.se header.b="ayQeIOYW"
Date: Thu, 18 Dec 2025 20:19:44 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=grimler.se; s=key1;
	t=1766085588;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=jMI8gahPCkzfyAYCyt7orDE3Hlig6obQSOnVubX38hw=;
	b=ayQeIOYWIhuWrcl1GyU8FZ8BHEhQhUVd/Pw/svHsWCKBWgvEJNIymCmuaxZq4bYlXCavMY
	+2JWoQDVXxj5qLtJNKgjsyeVtYjouI7V/IiDsneJK4ULcIFqa4EXnd5DnMnlZ61q6VCupa
	Hml87eBKtAduyqvV/5JOJNL01d7J14w=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Henrik Grimler <henrik@grimler.se>
To: Lukas Timmermann <linux@timmermann.space>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
	Alexandre Marquet <tb@a-marquet.fr>
Subject: Re: [PATCH v3 3/3] ARM: samsung: exynos5250: Allow CPU1 to boot
Message-ID: <20251218191944.GA63330@l14.localdomain>
References: <20251215-lat3st-staging-v3-0-2e4914b64dd8@timmermann.space>
 <20251215-lat3st-staging-v3-3-2e4914b64dd8@timmermann.space>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251215-lat3st-staging-v3-3-2e4914b64dd8@timmermann.space>
X-Migadu-Flow: FLOW_OUT

Hi Lukas,

On Mon, Dec 15, 2025 at 04:05:24PM +0100, Lukas Timmermann wrote:
> From: Alexandre Marquet <tb@a-marquet.fr>
> 
> The firmware trustzone needs a special call to bring up the secondary
> cpu core on the Manta board. This seems to be not needed on other
> exynos5 boards and comes down to the available firmware on
> a particular board.
> 
> Signed-off-by: Alexandre Marquet <tb@a-marquet.fr>
> Signed-off-by: Lukas Timmermann <linux@timmermann.space>

Reviewed-by: Henrik Grimler <henrik@grimler.se>

I had a look at the manta bootloader, but have not been able to
pinpoint where the smc calls are handled. Nevertheless, Seems like
manta might be the only Exynos 5 android device that needs CPU1BOOT. I
tried to track down exynos5250-arndale's tzsw to compare with, but
seems like it is no longer available anywhere unfortunately.

Here's a summary of my findings from looking at sboot/the tzsw from
various devices, where `CPU1BOOT SMC is handled == yes` means that the
device needs the SMC call.

.----------------------.--------------.--------------.--------------.
| Device (exynos-)     | Similar tzsw | CPU1BOOT SMC | sboot/tzsw   |
|                      | to odroidxu? | is handled?  |   source     |
.----------------------.--------------.--------------.--------------.
  4212-tab3            | yes          | yes          | T310XXSBQB2
  4412-i9300           | yes          | yes          | I9300XXUGPE1
  4412-i9305           | yes          | yes          | I9305XXUFPB1
  4412-odroid{x,x2,u3} | yes          | yes          | wiki.odroid.com/_media/en/boot.tar.gz
  4412-origen          | no           | don't know   | Linaro's origen hwpack 20130130
  5260-hllte (SM-N7505)| no           | don't know   | N7505XXSDRI2
  5410-odroidxu        | yes          | no           | github.com/hsnaves/exynos5410-firmware
  5410-ja3g            | no           | don't know   | I9500XXUHPK1
  5420-chagall-wifi    | no           | no           | T800XXU1CRJ1
  5420-arndale-octa    | yes          | no           | Linaro's arndale-octa hwpack 20140323
  5422-odroid-xu{3,4}  | yes          | no           | Hardkernel's u-boot 2020.01 branch
  5422-samsung-k3g     | no           | don't know   | G900HXXU1CVG7

As can be seen none of the Exynos 5 devices in the list have been
confirmed to need/handle CPU1BOOT.

Best regards,
Henrik Grimler


> ---
>  arch/arm/mach-exynos/firmware.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm/mach-exynos/firmware.c b/arch/arm/mach-exynos/firmware.c
> index a5e22678e27b..e9b0ed07bb90 100644
> --- a/arch/arm/mach-exynos/firmware.c
> +++ b/arch/arm/mach-exynos/firmware.c
> @@ -61,10 +61,10 @@ static int exynos_cpu_boot(int cpu)
>  	 * Exynos3250 doesn't need to send smc command for secondary CPU boot
>  	 * because Exynos3250 removes WFE in secure mode.
>  	 *
> -	 * On Exynos5 devices the call is ignored by trustzone firmware.
> +	 * On most Exynos5 devices the call is ignored by trustzone firmware.
>  	 */
>  	if (!soc_is_exynos4210() && !soc_is_exynos4212() &&
> -	    !soc_is_exynos4412())
> +	    !soc_is_exynos4412() && !of_machine_is_compatible("google,manta"))
>  		return 0;
>  
>  	/*
> 
> -- 
> 2.52.0
> 
> 

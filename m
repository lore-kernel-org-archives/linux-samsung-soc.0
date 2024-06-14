Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8098614A4CF;
	Fri, 14 Jun 2024 20:33:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718397194; cv=none; b=RHugzJf/hr6gaw8C40V8bO7B/4aHmhZxfHC3k27xTjREJ0EcUHPDFICGrju6F7GmKt523ZPgCKzM3iOsza4agzI6EqOR2RMME2+OF/cH0q3EUg8xU10mirwzbtKbNyLQESHXe0Yuqxysthzz176DpGjHVo5ZKDI2woezFokM8Rg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718397194; c=relaxed/simple;
	bh=SrGQawhOHAt457GSz0TS370IrGd04m3neidTOhOoNRc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NujPResWFzUCHGLPYXV6UXfRuL7iV4tT5lP1ChHB2WjQwFF8lcbAwr5ExAEN7N6kVqW061jgtk8XmAzfnnfNb+mC/UH22gdk6gdfpkjNZFzoZa4lnuBQiJxpPR/Ihcy/BTtoJWSlF9olFapaSW5JOH8+hcIhr1ZlsXRBzVuEujc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=r5hIFyDr; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="r5hIFyDr"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=Cpw5+2dcDOhDIommnV7v8AYXOFdFgYf0SjEsdScsFTw=; b=r5hIFyDrIjPgp34N/pO+OPmmRE
	dhLoLl/KGFHizzLnG3cL+gLl+w1cIyxmVMgpEo+vYJJ/mKaw5AuY36ZiuyJcp184RAmYG8BL0vxFD
	mw6vnJXgyPk+1Veoi9ku7+vpG0y3qmD0ukEORYGpjmE2xAcyJgkGhusKHM02aXG1Oh4inhDBbvWfq
	LV2PxkaYbxctUzTkJAEyo54+JL+Zt/9ULsxcPKSrhbkKHUtYd4m2Wn5O+ZB/9Ie6ZogNY9f8FXdj1
	/1nyuwivrizYyHc66fb8oigP1dgXxRWBGQIfqV42kmtAU7/7Qd1p0ZkIeS4UuPk+bGLB9JIPgTe+x
	4HNPATOw==;
Received: from [50.53.4.147] (helo=[192.168.254.15])
	by bombadil.infradead.org with esmtpsa (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sIDbj-000000040Hw-0A7O;
	Fri, 14 Jun 2024 20:33:11 +0000
Message-ID: <621856c3-50be-44d4-aafd-f08338f1c639@infradead.org>
Date: Fri, 14 Jun 2024 13:33:09 -0700
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Documentation: Remove unused "mtdset=" from
 kernel-parameters.txt
To: Thomas Huth <thuth@redhat.com>, linux-doc@vger.kernel.org,
 Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
 Alim Akhtar <alim.akhtar@samsung.com>, Russell King <linux@armlinux.org.uk>,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 arnd@arndb.de
References: <20240614182508.600113-1-thuth@redhat.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20240614182508.600113-1-thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 6/14/24 11:25 AM, Thomas Huth wrote:
> The kernel parameter "mtdset" has been removed two years ago in
> commit 61b7f8920b17 ("ARM: s3c: remove all s3c24xx support") and
> thus should be removed from the documentation now, too.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>

Reviewed-by: Randy Dunlap <rdunlap@infradead.org>

Thanks.

> ---
>  Documentation/admin-guide/kernel-parameters.txt | 5 -----
>  1 file changed, 5 deletions(-)
> 
> diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
> index 87d5bee924fe..ff02e1a02e12 100644
> --- a/Documentation/admin-guide/kernel-parameters.txt
> +++ b/Documentation/admin-guide/kernel-parameters.txt
> @@ -3631,11 +3631,6 @@
>  	mtdparts=	[MTD]
>  			See drivers/mtd/parsers/cmdlinepart.c
>  
> -	mtdset=		[ARM]
> -			ARM/S3C2412 JIVE boot control
> -
> -			See arch/arm/mach-s3c/mach-jive.c
> -
>  	mtouchusb.raw_coordinates=
>  			[HW] Make the MicroTouch USB driver use raw coordinates
>  			('y', default) or cooked coordinates ('n')

-- 
~Randy

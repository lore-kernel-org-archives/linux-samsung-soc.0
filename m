Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57A852D73A6;
	Thu, 11 Jun 2026 19:32:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781206323; cv=none; b=VpzFIAXrMbqZtPdXTBzEbGFyQv89kgWVN9yzrAN3yIIcXN+muQdocioflyNIDHOIdErJRUPW7rNyJYQjzKCjLxGwRq5Nl6fh4Vsfiza78sQP8fXolxUEZcLHAVjn+G/pvTK6v13e8o0C7PPxPksgu8P3kBOfQcjwEREjf1BjGng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781206323; c=relaxed/simple;
	bh=260eALo52JL67I5BXXirsBFEo7RheHsKr6WGe8VJtcw=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=dF+Cp+vfNKRI/4xYd9FU4F/BrVuEuKaG5WHmbmGnm8NvY25gSRUbDWHtBcYG6w9sJ2nrSdEfiqoOEBAQzi91ZE/qAcEoSukUig5NaitJa4KZyjvev2miL7rsHwkzpycLwCDTpePRD8Pt/POA4eJ8f2+PaNp80PMQvXs7kM2K9rg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=LNBc0IqM; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="LNBc0IqM"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Cc:Content-ID:Content-Description;
	bh=dzHuIpFbYrCgFwipPgG7Z1jCCHIP4pv/lJwgbnEmeHI=; b=LNBc0IqM7rCyEMAI2eK+n7euOK
	EL5tl1qU5tthxVnxNyHYfmyt7uh+YodDHxRY7kb/0zCqPJtfg1SmBxAo5buBIQ6IcPuj+tWmnMr++
	UsU+Ylgt9hBplMU/D6nl3sv3jan3dF1UVtWpZQFSOPttuT/e89rMwcrlZioZ0DLMvDI7ULWRdrL2W
	dkzaDKtT3Lf5UsARBNJGWGckkhuUhNpvsbtSYCeN06t46Qu+XfhIDcZ+9ntdETBR5Y2LZ3vAujiNz
	ibshv6mzE8J6MFQzkNdxvtkrVddEqUPtCKz9s7Uv3JvIIOvkylLANPbrZQQ097sSpO5o+/bNCASnv
	QszFYwZA==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXl86-00000009wz2-1JvM;
	Thu, 11 Jun 2026 19:31:54 +0000
Message-ID: <ac98ff55-99df-4c90-8e6b-ab1dde219b5a@infradead.org>
Date: Thu, 11 Jun 2026 12:31:52 -0700
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Documentation: arch: fix brackets
To: Manuel Ebner <manuelebner@mailbox.org>, Vineet Gupta <vgupta@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Peter Griffin <peter.griffin@linaro.org>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <chleroy@kernel.org>,
 "open list:SYNOPSYS ARC ARCHITECTURE" <linux-snps-arc@lists.infradead.org>,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 "moderated list:ARM/SAMSUNG S3C, S5P AND EXYNOS ARM ARCHITECTURES"
 <linux-arm-kernel@lists.infradead.org>,
 "open list:ARM/SAMSUNG S3C, S5P AND EXYNOS ARM ARCHITECTURES"
 <linux-samsung-soc@vger.kernel.org>,
 "open list:LINUX FOR POWERPC (32-BIT AND 64-BIT)"
 <linuxppc-dev@lists.ozlabs.org>
References: <20260611183525.153058-2-manuelebner@mailbox.org>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20260611183525.153058-2-manuelebner@mailbox.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,
A couple of comments but overall this is a nice cleanup.


On 6/11/26 11:35 AM, Manuel Ebner wrote:
> Add missing and remove needless parentheses, brackets and curly braces.
> 
> Signed-off-by: Manuel Ebner <manuelebner@mailbox.org>
> ---
>  Documentation/arch/arc/arc.rst                 |  2 +-
>  .../arm/samsung/clksrc-change-registers.awk    |  2 +-
>  Documentation/arch/arm/vlocks.rst              |  4 ++--
>  .../arch/arm64/memory-tagging-extension.rst    |  2 +-
>  Documentation/arch/powerpc/vas-api.rst         |  2 +-
>  Documentation/arch/sparc/oradax/dax-hv-api.txt | 18 +++++++++---------
>  Documentation/arch/sparc/oradax/oracle-dax.rst |  3 ++-
>  7 files changed, 17 insertions(+), 16 deletions(-)
> 
> diff --git a/Documentation/arch/arc/arc.rst b/Documentation/arch/arc/arc.rst
> index 6c4d978f3f4e..553851f43be7 100644
> --- a/Documentation/arch/arc/arc.rst
> +++ b/Documentation/arch/arc/arc.rst
> @@ -36,7 +36,7 @@ Important note on ARC processors configurability
>  
>  ARC processors are highly configurable and several configurable options
>  are supported in Linux. Some options are transparent to software
> -(i.e cache geometries, some can be detected at runtime and configured
> +(i.e cache geometries), some can be detected at runtime and configured

   (i.e., cache geometries),
or even
   (e.g., cache geometries),

>  and used accordingly, while some need to be explicitly selected or configured
>  in the kernel's configuration utility (AKA "make menuconfig").
>  


> diff --git a/Documentation/arch/sparc/oradax/oracle-dax.rst b/Documentation/arch/sparc/oradax/oracle-dax.rst
> index d1e14d572918..67867ea7be40 100644
> --- a/Documentation/arch/sparc/oradax/oracle-dax.rst
> +++ b/Documentation/arch/sparc/oradax/oracle-dax.rst
> @@ -438,7 +438,8 @@ that in user land::
>  The output bitmap is ready for consumption immediately after the
>  completion status indicates success.
>  
> -Excer[t from UltraSPARC Virtual Machine Specification
> +Excer?t from UltraSPARC Virtual Machine Specification

   Excerpt

> +i guess this is wrong, but i don't know what's correct
>  =====================================================
>  
>   .. include:: dax-hv-api.txt

and then you can add
Reviewed-by: Randy Dunlap <rdunlap@infradead.org>

thanks.
-- 
~Randy

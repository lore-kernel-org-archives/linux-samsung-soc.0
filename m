Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D961C3B7767;
	Thu, 26 Mar 2026 08:39:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774514372; cv=none; b=Au2sTSMef7b61jAzLn50ZwIB0n+uqPp6mJFlMHBj4bUhK+OlWWEY8Z0lo52mwVSJMUGYw6SA0AjdHZw9Ua93D5FDlJty/HIrhYUNZgKJXbDeCGExcmQHnoj/ZK7OGBKAeL4ShtTQhaf0qYsjeLRgpwEH4v7U7OLnub+rFKICtVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774514372; c=relaxed/simple;
	bh=cBO3567wJtbyK3YMHb75gSNycn+Tf6ScJgtK5vTL3yk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NP/fQOF5Ms4neivJ4kxkbDHekmpcsvoygenlCMZMQbK8KR49kVfDo9zSEMyrdfJ030EVdKryJdRiTkUqG6ZNVqtxPEox5rR4F0QAQ3bEjfDn4t0fL6rBC29jmpSPyx8gKWm6puetTvJbf5KDt8b8qk0m3GgmG+AwJKzlqBXJ350=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=RhuwY/AX; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="RhuwY/AX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34C16C116C6;
	Thu, 26 Mar 2026 08:39:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1774514371;
	bh=cBO3567wJtbyK3YMHb75gSNycn+Tf6ScJgtK5vTL3yk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RhuwY/AXI9m5M+k4ybSnzrjNCdxdLsx+s0C2nP4FEgesT8EQKQ+uV75+9iR2fsj0j
	 tudMwYwYSFeL5G5z5Ef7oHR6bMO+e/USekfDTUGceZjRYPsZGCyfgRY+J9B1BK/gJV
	 +R7YT5rk7rTutN/2y2gWTS0EVtyf1+OYNtwT98Eg=
Date: Thu, 26 Mar 2026 09:39:07 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Andi Shyti <andi.shyti@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>, stable <stable@kernel.org>
Subject: Re: [PATCH] i2c: s3c24xx: check the size of the SMBUS message before
 using it
Message-ID: <2026032602-backing-flogging-1632@gregkh>
References: <2026022314-rely-scrubbed-4839@gregkh>
 <acQYnURilS0_fTvS@zenone.zhora.eu>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <acQYnURilS0_fTvS@zenone.zhora.eu>

On Wed, Mar 25, 2026 at 06:17:58PM +0100, Andi Shyti wrote:
> Hi Greg,
> 
> On Mon, Feb 23, 2026 at 06:05:15PM +0100, Greg Kroah-Hartman wrote:
> > The first byte of an i2c SMBUS message is the size, and it should be
> > verified to ensure that it is in the range of 0..I2C_SMBUS_BLOCK_MAX
> > before processing it.
> > 
> > This is the same logic that was added in commit a6e04f05ce0b ("i2c:
> > tegra: check msg length in SMBUS block read") to the i2c tegra driver.
> > 
> > Cc: Krzysztof Kozlowski <krzk@kernel.org>
> > Cc: Alim Akhtar <alim.akhtar@samsung.com>
> > Cc: Andi Shyti <andi.shyti@kernel.org>
> > Cc: stable <stable@kernel.org>
> > Assisted-by: gkh_clanker_2000
> > Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> 
> merged to i2c/i2c-host.

Thanks!

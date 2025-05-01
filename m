Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41B0C21C9F0;
	Thu,  1 May 2025 11:58:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746100738; cv=none; b=WIaESsI3jCiDx3mkz1pVCFvY3dMIWtliSO0UhMOaFr3BecbQdj1EIQmn3tFlLEC3kq0cESkOacf+TUEqPqnVFK/nuOhciY+ZWyQd6Z8CswaGI+ydu8UEXwpdvZa2YrJV1jGNrH23TvgZbjnA5OR0LF3CLHBrsKXeiaWFTThoh2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746100738; c=relaxed/simple;
	bh=lumZpWP0OiXWgWPG1FqmM7YcJO8fszAqV2ndfUnzPdg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DfgkV+aTDKaDezizMjim1s5lzUd9PC1DxOXJMsj3mHRnSreFZviPDpoRshW3sm04WfT22jgdmQgKyToNCZfGedJh2dGkqQaCBhCIo2pf4XjhMvFWyAHCBMP0aORKXIqnpM2OPmvdESL5IpPuUCXtwlg/YuooWuWFdLh0OuF0Y4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MXjj3YxK; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MXjj3YxK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5BFBC4CEE3;
	Thu,  1 May 2025 11:58:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746100737;
	bh=lumZpWP0OiXWgWPG1FqmM7YcJO8fszAqV2ndfUnzPdg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MXjj3YxK9S85YEhVJJKTb2B8BV+cKzezDlB8FsDcTEi9iX2+6c4rjR41jkMTADNc7
	 jH6KBv1ay/EZ/OyppF/OAixPWZSXqxmI/h1a1vr8gXlYR5huqwSHTQ3DvZSklg/5LQ
	 h3SHcamV2/opdbOJldoSCBVsDA9gTfhizE2R/XqxK7LVckYZSRkZTIqGoDoCMbw5eV
	 cs4sJjo5H3kyNGNRRpZp3SrfdBm9R9RBwBWyF4YzI8a1J+NfTTyS7N2vp0hM70IN0f
	 XVIxwBISDNquTEQBsdLzpphT2V7mzfZr+V9Vc8oYAuUhwy4Nq484EHIPoLs9lrU1tA
	 LEyZFJHtSv6Jg==
Date: Thu, 1 May 2025 12:58:53 +0100
From: Lee Jones <lee@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Arnd Bergmann <arnd@arndb.de>, soc@lists.linux.dev,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [GIT PULL] samsung: drivers for v6.16
Message-ID: <20250501115853.GI1567507@google.com>
References: <20250501103541.13795-2-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250501103541.13795-2-krzysztof.kozlowski@linaro.org>

On Thu, 01 May 2025, Krzysztof Kozlowski wrote:

> Hi Lee,
> That's the stable tag for you to base MFD patches on top.
> 
> 
> Hi Arnd,
> Please pull it as regular drivers pull. Note this will be also shared with MFD
> tree.
> 
> Best regards,
> Krzysztof
> 
> 
> The following changes since commit 0af2f6be1b4281385b618cb86ad946eded089ac8:
> 
>   Linux 6.15-rc1 (2025-04-06 13:11:33 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-drivers-6.16

Pulled.  Thanks Krzysztof.

-- 
Lee Jones [李琼斯]

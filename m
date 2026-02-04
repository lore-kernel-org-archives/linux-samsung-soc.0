Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5309E2D5926;
	Wed,  4 Feb 2026 15:18:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770218309; cv=none; b=F24vqk9uL22lilOoLeEkhz+MW20fmjx2ehziyoD6M6ebrswF/YH0gcOasYchHEg90eLZBUg6ERZaXx/rU39jA+qUvCQq3SCkGAyC8z6emj/fqKIu9V7R85Yxrc89aolmiyDvR8gNVQ44IScLFhgH63UIhyvf/WVRNZGe+kEEjag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770218309; c=relaxed/simple;
	bh=Szm3QfQ7X3rGQRtzylMpLb3hyGhSDTXlCFdPG6u0Zxc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L/9PGox3Iv7+NHce3vwzKp2HcsScGtO/IFYxKa2to9xPhMCeUB6DZYhn2hdIC+rWFxKM1Mkiqptcs8Mpqz8EidKeWCWVuldlpenkg/Egj2uIDg3wY++lMZ4Z+FquFFxMyvZv8vBFmAlkErtRNIouvJOEEMNdxmze4nepw/SrioY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gmM4w6y7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gmM4w6y7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F2AAC4CEF7;
	Wed,  4 Feb 2026 15:18:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770218308;
	bh=Szm3QfQ7X3rGQRtzylMpLb3hyGhSDTXlCFdPG6u0Zxc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gmM4w6y7cvT7G7CYPX5cNC5pjGLzQp3+GvqHRzVdTS/DSi5+z+en3IeUQkeyXXTB9
	 FqHye+/2TsHXMr7kVsBBwVIGJmFlXJbFfcuKOYF07iLFgFnO8mcVKS2aR1XxRvFIwX
	 IpaHzLRJ9K49A469JoTitXYDqi6JZsmCkNKlqTaIDM5xUMU+OkzRA/+Ey+bhUim+Nx
	 ivhW2HdLYJuWdLcDKk83Tbfb91YvsL2Yd4Re8fiq9xP6t4YwhzGsJaxY64u4c4hMZv
	 ipY9J5Ebz7idqQB6/WB2fY/u7a8ZXhQL5UDd77/aGB26zgw+toNWokd/eLTk/cBVvz
	 zJjpRiQg41Q1w==
Date: Wed, 4 Feb 2026 20:48:25 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Roy Luo <royluo@google.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	=?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Joy Chakraborty <joychakr@google.com>,
	Naveen Kumar <mnkumar@google.com>, linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	kernel test robot <lkp@intel.com>
Subject: Re: [PATCH next v2] phy: google: fix build dependency for Google
 Tensor USB PHY
Message-ID: <aYNjQfXATNAx6reM@vaman>
References: <20260128-next-v2-1-624bdae8e6d0@google.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260128-next-v2-1-624bdae8e6d0@google.com>

On 28-01-26, 21:22, Roy Luo wrote:
> The Google Tensor USB PHY driver uses the Type-C switch framework to
> handle orientation changes. However, the Kconfig did not specify a
> dependency on the TYPEC framework, leading to undefined reference
> errors when building for architectures or configurations where
> CONFIG_TYPEC is configured as a module while CONFIG_PHY_GOOGLE_USB
> is configured as built-in.
> 
> Add 'depends on TYPEC' to the PHY_GOOGLE_USB entry to ensure all
> required symbols are available during linking, and 'COMPILE_TEST'
> to expand test coverage.

Thanks for the fix, looking at three patches for this, I like Arnd's fix
better and have applied that now

-- 
~Vinod

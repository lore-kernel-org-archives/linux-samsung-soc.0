Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28F7E21A427;
	Wed,  5 Feb 2025 08:48:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738745287; cv=none; b=i5Mhq1u/kD0l3NJmuYty74zooxSTv7YgvZck7oGQVRL1nxt3ZWCn2TjmI/82U9d6yvaBKiOfFHNiQbw6B5zBZcbsvCd+MGGJJ6aPH1gMEig8HYAZzKHhqhaPa1dihOYwmmgp8S1CE3zS/NpK1LLZkUaUSjz2NfWGBOmpsIZNDQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738745287; c=relaxed/simple;
	bh=gDxFlomX3dUPHwAXjNXKKOGj1Fq1lpYag63Qntcsa+I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Xf38J6rWJ8nGElIyp3eN8RP+2hT3g/Gc8nGFPQzbX1si2F42bb0xKKLO0I7ckGuAoLQMwotaDG8crCWqWZ6KTD2ixlKBx9ogZIYWjnDCus7cjSsboSue1STL1yLFotIukwPrqJblhltSLfU0ydQ7iQRpxD1t0J1SJ2duCW60ViY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EP0JHukC; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EP0JHukC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B900C4CED1;
	Wed,  5 Feb 2025 08:48:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738745286;
	bh=gDxFlomX3dUPHwAXjNXKKOGj1Fq1lpYag63Qntcsa+I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EP0JHukCBN3XkCr772neoXDy3/otFczJ33X9/L+Buwm2QgLLrZlgaEP6RHhs7xQQ3
	 FZmbGwEIOIVmVNQ0SXuHltZBRqFSAXArlIYI/OusNSh6ncU0qiUgc5gQ37mHB3Fzh6
	 ChhvAizusnR6JEMAn5TolwnQKLepPGlEtHcao9v/3XQXbXcENuPOi80Xrrq+e8k/sX
	 WmYdPLOzHxKMC4ELTKmga1l/kfmyTns3lFFh0eSI0neSTDoeRRRY2r0X9cJ1dO/Z8q
	 DhK7maPCL8BbEAPXSMLTqpqXB+5qLnV1etoTBvaMNpsA/a5KDCquQln0EUSlIqI+3h
	 MW4XPnqZuvdRA==
Date: Wed, 5 Feb 2025 09:48:03 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Kaustabh Chakraborty <kauschluss@disroot.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Rob Herring <robh@kernel.org>, Conor Dooley <conor@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
	Sergey Lisov <sleirsgoevy@gmail.com>, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: usb: samsung,exynos-dwc3: add
 exynos7870 support
Message-ID: <20250205-carp-of-inspiring-science-6dfebb@krzk-bin>
References: <20250204-exynos7870-usb-v1-0-a7753f8183a4@disroot.org>
 <20250204-exynos7870-usb-v1-1-a7753f8183a4@disroot.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250204-exynos7870-usb-v1-1-a7753f8183a4@disroot.org>

On Tue, Feb 04, 2025 at 02:09:29AM +0530, Kaustabh Chakraborty wrote:
> Document compatible string for Exynos7870 DWC3-compatible USB 2.0
> driver. The devicetree node requires three clocks, named "usbdrd20",
> "usbdrd20_ctrl_clk", and "usbdrd20_ref_clk".
> 
> Unlike other variants, Exynos7870's USB node doesn't require extra

I don't think that's true. What makes you think it does not require
them? Device works without power?

Best regards,
Krzysztof


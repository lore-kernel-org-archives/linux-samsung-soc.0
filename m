Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F47E1A23A9;
	Mon, 14 Apr 2025 19:50:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744660221; cv=none; b=QYkFFuj/jyYHhopGxtzBvfLG1S106NWMtwsCxyH6HL6Ht0NE23KJRSdjzEtTmQr8bUfPjoNBAbXEwDrlGSb/IHOe7p7n+4GE9BIypVEmXWll08jID/hCa+YZk/vGD+fEiau9h5sre/TmcHyl/V/gaSHbmLc7Afn51hvMfdM67qA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744660221; c=relaxed/simple;
	bh=dcR7kDT88f2BjMAzrV0CEFOH3VQYsiVxkmdWN9CU5NM=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=RZdg8ufHOPq5556VVysmOYyzXRG7sy4XS5X3ys19EIiZND9KQnErdGBwRLSKU19YO6whIOVeY7IKzl5gbAwRbYx/7tLhRp735/KC4YqmkJ9K7F13oR62Bl2nPCUwBytiXOB6U1sb06CYpGer6qyW0Wg20f+xK1IKrMJ3Y0KjYCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=R/qqRnXA; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="R/qqRnXA"
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 3121125DAC;
	Mon, 14 Apr 2025 21:50:11 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id R9FkhobHa6Ut; Mon, 14 Apr 2025 21:50:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1744660210; bh=dcR7kDT88f2BjMAzrV0CEFOH3VQYsiVxkmdWN9CU5NM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=R/qqRnXA/7LIcaoUZcttO7OYB2QWkbzAUYtZVZ0RCtvMPFukx1KCicdSN42BdMyWl
	 PPadXTuvAiQOE4UWFuTs8iS3WqcG3CAg7nzbe/YoGDN7k8Ke9kWWUCviGa0Nawpgja
	 F4adTiq8pct/uJkvEBJ/s6acYH3R5UmwquYLw2hkn+nS0ZfJxGM0slDRIWNgCm4Nqi
	 wqRyNqplFO9CXGfNv1qP8z2wtwvA3zo+kehpIe1nuizRK0+S69RlsBlo/2gXAo8DGZ
	 mgCzRsHmaOxHfsqTn7jTCxH7OItjfUUE7XT9408HAI76z9ZYiWZ6tUKNLDVp8H2Flz
	 A726QuDyBy9cw==
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Mon, 14 Apr 2025 19:50:10 +0000
From: Kaustabh Chakraborty <kauschluss@disroot.org>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org, Krzysztof Kozlowski
 <krzk@kernel.org>, devicetree@vger.kernel.org, Ivaylo Ivanov
 <ivo.ivanov.ivanov1@gmail.com>, linux-arm-kernel@lists.infradead.org, Kees
 Cook <kees@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, linux-kernel@vger.kernel.org, Tony Luck
 <tony.luck@intel.com>, linux-hardening@vger.kernel.org, "Guilherme G.
 Piccoli" <gpiccoli@igalia.com>, Alim Akhtar <alim.akhtar@samsung.com>
Subject: Re: [PATCH v6 0/5] Add support for the Exynos7870 SoC, along with
 three devices
In-Reply-To: <174463433283.154575.16025374701126076484.robh@kernel.org>
References: <20250414-exynos7870-v6-0-039bd5385411@disroot.org>
 <174463433283.154575.16025374701126076484.robh@kernel.org>
Message-ID: <524e47208a69616d700642857d37bd57@disroot.org>
X-Sender: kauschluss@disroot.org
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On 2025-04-14 12:42, Rob Herring (Arm) wrote:
[...]
> 
> My bot found new DTB warnings on the .dts files added or changed in this
> series.
> 
> Some warnings may be from an existing SoC .dtsi. Or perhaps the warnings
> are fixed by another series. Ultimately, it is up to the platform
> maintainer whether these warnings are acceptable or not. No need to reply
> unless the platform maintainer has comments.
> 
> If you already ran DT checks and didn't see these error(s), then
> make sure dt-schema is up to date:
> 
>   pip3 install dtschema --upgrade
> 
> 
> This patch series was applied (using b4) to base:
>  Base: using specified base-commit 29e7bf01ed8033c9a14ed0dc990dfe2736dbcd18
> 
> If this is not the correct base, please add 'base-commit' tag
> (or use b4 which does this automatically)
> 
> New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/exynos/' for 20250414-exynos7870-v6-0-039bd5385411@disroot.org:
> 
> arch/arm64/boot/dts/exynos/exynos7870-on7xelte.dtb: /soc@0/phy@135c0000: failed to match any schema with compatible: ['samsung,exynos7870-usbdrd-phy']
> arch/arm64/boot/dts/exynos/exynos7870-a2corelte.dtb: /soc@0/phy@135c0000: failed to match any schema with compatible: ['samsung,exynos7870-usbdrd-phy']
> arch/arm64/boot/dts/exynos/exynos7870-j6lte.dtb: /soc@0/phy@135c0000: failed to match any schema with compatible: ['samsung,exynos7870-usbdrd-phy']

Note: These have been accepted and are currently residing in vkoul/phy.

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A16D3C0C;
	Mon, 22 Sep 2025 15:40:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758555655; cv=none; b=R98VKSaqsXfQRoCsujMUtXToVv9paaJ8PAfuqXcKSeooFmvZFThkVxn6KgqWU56vCWZ3xfPrpYDVENKuRuzy//v2GHd2WIVMfX70Qz1DERj4Omdc91RHWy4RaMO7i0xPXpi4WDeYXHeQ/jg39byGF2HD9eHooLEwkRZCt85anb8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758555655; c=relaxed/simple;
	bh=gD63mzbxeV7BHyffKOeVlku5TInkJFsUy/h5vSG0OTs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gyAG8pSVEE1X7ybgl0hJMPzJ4cFyhGLj53TANhXsP8AlZHdUYhBqmzWTnTxnUVQIGBV1fSbtETz8K3K3m0M26GLqTi3HkkjqqNxekPh2p/iLI473u7Zt+v4DEcyYq7+8FzwNgsZF0zeCEOHcntUgsdOs8QSn42bmt3FMiOWsYJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nJGyKMl9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nJGyKMl9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF345C4CEF0;
	Mon, 22 Sep 2025 15:40:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758555655;
	bh=gD63mzbxeV7BHyffKOeVlku5TInkJFsUy/h5vSG0OTs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nJGyKMl9csZdOgWg3COPyInWdTtHp6qhQmKGO9FgdKjL/aNqNQqBcvNc4IVV8iw3Z
	 iMaUH/2xpBi6+mHJREIJNiP8RUTdwAAcPCxXDoKtXpXAGXmjy5+8QNb6B7iyWSVWB0
	 d8cqwqrEyvyBhx2dPiJ5sSrMscB0l2L2T+wJ2hKExRFHOEM7cey4z7eG+JJEtJeooW
	 okZC7iwAtEzoj+k5ljfK6YEnofjHVSj7blbmagbhO/MGV9fVOJaH0V5lJmuvM4388v
	 7ncMNRdohDUEolEiPLXgvc6t3sF8wT290y1TcvuXtOw/KuEa5YbWJqGsCsRraxAryP
	 kbAcJf8AWZ3bA==
Date: Mon, 22 Sep 2025 10:40:51 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
Cc: linux-phy@lists.infradead.org, Vinod Koul <vkoul@kernel.org>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH v2 1/2] dt-bindings: phy: samsung,usb3-drd-phy: add
 exynos8890 support
Message-ID: <175855565135.24221.297874866943953244.robh@kernel.org>
References: <20250914145555.2631595-1-ivo.ivanov.ivanov1@gmail.com>
 <20250914145555.2631595-2-ivo.ivanov.ivanov1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250914145555.2631595-2-ivo.ivanov.ivanov1@gmail.com>


On Sun, 14 Sep 2025 17:55:54 +0300, Ivaylo Ivanov wrote:
> The exynos8890 SoC features two dwc3 controllers with one USBDRD and
> one USBHOST controller. Document compatible for the USBDRD one.
> 
> Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
> ---
>  .../bindings/phy/samsung,usb3-drd-phy.yaml    | 25 +++++++++++++++++++
>  1 file changed, 25 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


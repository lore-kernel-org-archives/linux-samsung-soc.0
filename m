Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59A802185A8;
	Wed,  5 Feb 2025 08:56:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738745812; cv=none; b=pMPdQdT0pE31p6eRPnRmp+J46R1mWAoG80xBIC0RYixAHowbxrWIjFXZpoM/0ivOaS8PxnmXxpSNfBvPyIRbregYQRgbRLMJzPcQKlh4aAynjWRQhNN2HpsEBRixlZdJ5vbbGs3RRe5vxbxQjKDTZ0WAk9Jf30wc6GxYn23AJhY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738745812; c=relaxed/simple;
	bh=jDRflpWn/eNSVYWYsmChMhlBoAx8KSfDOFOxrHxoKr8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D2b9SgtyGy1Ihf8R1QecUdREC+qIPY0iXuUds7By82aPImL823llKvYoCOCAYXZNRQMDqjE8jxjUdQxCQKe/dKrTvqZJpJam0iLF452MG7Nh6vd2huy8Z9FxVm27PhPzqPG5eML4U41suIXwrkb18nX3zrzTlB9D0XqvMAvmQBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BMSlP1zt; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BMSlP1zt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0540CC4CED1;
	Wed,  5 Feb 2025 08:56:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738745811;
	bh=jDRflpWn/eNSVYWYsmChMhlBoAx8KSfDOFOxrHxoKr8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BMSlP1ztsEQ6urNcvZNA5LG4TmjqcVVFSqEmeOSjDrESzJZNO1oxJvblv8TodUMiU
	 R6413G/mmomrMVFAsyr/c/jxrDbubulBDssRG796vFMpUqYBRklhxfoOIXNxWK5256
	 /g+5HdjX08Opk7C/rVYaFxP4SrgpyAVp3aod4SgvN6wUvU2+Lr42bIK5Val/qGRG69
	 989H0jpSNzdQBOyJ09htb446gC5YHaQb62BSj6j3W/RWS//qpBPxLqrBP52meOGVR6
	 5dOHUnMbbujMt4eHY+7X0JzupJ+WI7ycN7P1ltK49yAExZJCYCb+y4hczpJ9duUxVU
	 1H9i6UOY80maw==
Date: Wed, 5 Feb 2025 09:56:48 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Kaustabh Chakraborty <kauschluss@disroot.org>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Vivek Gautam <gautam.vivek@samsung.com>, Rob Herring <robh@kernel.org>, Conor Dooley <conor@kernel.org>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, 
	Sergey Lisov <sleirsgoevy@gmail.com>, linux-phy@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org
Subject: Re: [PATCH 3/4] dt-bindings: phy: samsung,usb3-drd-phy: add
 exynos7870-usbdrd-phy compatible
Message-ID: <20250205-honest-versatile-bettong-9c4c0e@krzk-bin>
References: <20250204-exynos7870-usbphy-v1-0-f30a9857efeb@disroot.org>
 <20250204-exynos7870-usbphy-v1-3-f30a9857efeb@disroot.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250204-exynos7870-usbphy-v1-3-f30a9857efeb@disroot.org>

On Tue, Feb 04, 2025 at 02:10:14AM +0530, Kaustabh Chakraborty wrote:
> Add the compatible string "samsung,exynos7870-usbdrd-phy" to the
> documentation. The devicetree node requires two clocks, named "phy" and
> "ref" (same as clocks required by Exynos5).
> 
> Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
> ---
>  Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml | 2 ++
>  1 file changed, 2 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


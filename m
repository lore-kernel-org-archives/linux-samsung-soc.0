Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C22D2264B2;
	Mon, 22 Sep 2025 15:34:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758555243; cv=none; b=KKDN6Q3XXWxqItoPaUnXF31T8s+rWKSIRgCrD4V7r4l+jVaJDv/iVgI27rzhzZWPnRYyiJTa7Qopz70oF5kXrWl49UkrOnQtMayuraVxi7llO0Dn0dep32qOHR3+SoF8GQ7aY5gHrUk/YnWlP1hEVgEq0PlAuFhfm3xpyqMIytQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758555243; c=relaxed/simple;
	bh=e4OTGDJCAO9WCDKw8GXo7WVD6AKTZudff/hkCl+fuLI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cPLMRZtLARsFsIp0T3VcuDhI42ldlW1M8lenJDEsevqvqeldLwj1F2t3FwbpWkDjatVdo/19EsjSWWNOgkvPS8Ph/j3ZAFFB/Mm2UuPNtm6agR8HwxIqhXtG860NGO6y0wgnW1XoiYEFZkIJaq/bkx1N3/gPf64jiHj8YxN6B7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OajqGgjL; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OajqGgjL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF2C4C4CEF0;
	Mon, 22 Sep 2025 15:34:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758555243;
	bh=e4OTGDJCAO9WCDKw8GXo7WVD6AKTZudff/hkCl+fuLI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OajqGgjLQNLqt3/dDhmP+KsZnHUg59XIdFt3g723Vqri46eTURkZq8nq91C7B9s6v
	 yf7dT/pNPl04oN6JimHeKpHptTBAVjZBdsaoXOfUqiGmlkdcvE1QseFAGH2+e5QdX7
	 qLjKGDqqXWqyHC45LUrQbEPUf2jJhsYHPHkHho5fgAuCh2HrPiP12NLgOcZk6P8xFf
	 mjKn8MXturv8+r4Mi5FfpD5bV/gSoWBMGRTwoqnKU/OPMsWfHOEiLkqNiTJBpPZB6f
	 +qywvUjhPKWUqLUfNyC28PdlyGCYCWxJHQ+FOmEt68doxes+5XkcvQ3rHNzDWXI0bS
	 KrlcbDP/FhdBg==
Date: Mon, 22 Sep 2025 10:34:01 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org,
	Conor Dooley <conor+dt@kernel.org>,
	Maxime Ripard <mripard@kernel.org>, devicetree@vger.kernel.org,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, linux-kernel@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v1] dt-bindings: gpu: arm,mali-midgard: add
 exynos8890-mali compatible
Message-ID: <175855524067.4170586.7705155168461392581.robh@kernel.org>
References: <20250914131452.2622609-1-ivo.ivanov.ivanov1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250914131452.2622609-1-ivo.ivanov.ivanov1@gmail.com>


On Sun, 14 Sep 2025 16:14:52 +0300, Ivaylo Ivanov wrote:
> The exynos8890 uses the ARM Mali T880 GPU, document its compatible
> string with the appropriate fallback.
> 
> Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
> ---
>  Documentation/devicetree/bindings/gpu/arm,mali-midgard.yaml | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 

Applied, thanks!


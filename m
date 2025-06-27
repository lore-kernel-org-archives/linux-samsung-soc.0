Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25D2A171092;
	Fri, 27 Jun 2025 21:41:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751060465; cv=none; b=sl/RHvTLxvBKeJTYUBNz43VRwMLsX6XIsVErFMOqiMc5aKnszRvso3osmXmBEZ8Q0P5ZQhJ0bw/7F7E13HwsOv/7GCSdKgpM+Y3QGJ//DUMDzxwWMfAt3V6gVTA/LnZWvgKHgDDCPmHEXZypqNMRBHmDkEUDJ0Jixil7Rz1UZFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751060465; c=relaxed/simple;
	bh=3oXq16alLr2nxtGsTFfoEGRR7gxgyYoWYgqZxLOZzs4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U25nk5gAklc1QsfyWwWb5dxG8armI56Z41DNZls5Wk4nE8WVlh6AeIYukUY9Gs8bBH2nrIz4ZjiMvK83u2IQN2pB7+K/ugCm/MHMeQu7cm8Dfg81AYoNn1LXphF/C80YNzh39Eo70lDDxQgmg+9+7aHjjSXFdWXqqyMKvHIrTw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dN9mwFeZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dN9mwFeZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83AF9C4CEE3;
	Fri, 27 Jun 2025 21:41:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751060464;
	bh=3oXq16alLr2nxtGsTFfoEGRR7gxgyYoWYgqZxLOZzs4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dN9mwFeZPT7JwxGHE4dWUQZAF4GxPqyzFm6eryAnlLNFZfVVNmi5QK5zjzBA+Th5d
	 g8o++TJeOe0lEoTkudPKFxP56TyZhhOZzukJM2aKk9x+DswgJkBhwdQ9B11aba7Cn/
	 +u5ifsFlNcp5adThOkEIEtfjxVQzC+xR0979KalprhiA81vf09dK4ZFhQkR5+CKObq
	 SIZOV0orxaK+5EfL0Moe5tQJgH41RsGfAuw6lEOlYRA4qAJYT20xMOmmaUGu6LW3rA
	 RM6Zi5c1orSB3VPQCpNW7Bj5DvLK2ujsGgRYfs7KeQDDJIaa9e8HGDOV3ya1mn9BSX
	 pFawy5P3w3uvw==
Date: Fri, 27 Jun 2025 16:41:03 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Kaustabh Chakraborty <kauschluss@disroot.org>
Cc: devicetree@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>,
	Seung-Woo Kim <sw0312.kim@samsung.com>,
	Inki Dae <inki.dae@samsung.com>, Simona Vetter <simona@ffwll.ch>,
	Maxime Ripard <mripard@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Robert Foss <rfoss@kernel.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	Conor Dooley <conor+dt@kernel.org>, dri-devel@lists.freedesktop.org,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Kyungmin Park <kyungmin.park@samsung.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Jagan Teki <jagan@amarulasolutions.com>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
	David Airlie <airlied@gmail.com>
Subject: Re: [PATCH v2 11/13] dt-bindings: samsung,mipi-dsim: document
 exynos7870 DSIM compatible
Message-ID: <175106045083.188354.11616800580280221197.robh@kernel.org>
References: <20250627-exynos7870-dsim-v2-0-1433b67378d3@disroot.org>
 <20250627-exynos7870-dsim-v2-11-1433b67378d3@disroot.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250627-exynos7870-dsim-v2-11-1433b67378d3@disroot.org>


On Fri, 27 Jun 2025 01:09:00 +0530, Kaustabh Chakraborty wrote:
> Add compatible string for Exynos7870 DSIM bridge controller. The
> device requires four clock sources, in schema they're named as "bus",
> "pll", "byte", and "esc".
> 
> Suggested-by: Krzysztof Kozlowski <krzk@kernel.org>
> Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
> ---
>  .../bindings/display/bridge/samsung,mipi-dsim.yaml | 27 ++++++++++++++++++++++
>  1 file changed, 27 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


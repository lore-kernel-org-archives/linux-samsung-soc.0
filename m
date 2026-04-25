Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0D55208D0;
	Sat, 25 Apr 2026 09:54:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777110876; cv=none; b=r4e9GdwjlGiIBQuMx+rxDSsAtn0UyvkX8vJw4ttIHu7s9EOlSpKAsNwMimQNro3wRTHcfyPM+BPsgVdiHyO/Dp3+h1rZxh6QLmXHBKeZykzgnubl51tXmP6rBaXLB+b9Om0qJxYI8kThDI4Y+GNc2lB4tG8xF3ViNSm+TkM6t98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777110876; c=relaxed/simple;
	bh=RTKJFkZOhPvSkw4w1T5IdZXZkOeETqyobx085qFKyh0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LK+SwIEsORDNM9j0LMWQ8jgXgTOEbK1A7kXEj4BIcu8P4fWf8OiJ3FviGUKH77wFustut0GiFoxhuWfeG2qysSNBRL3d6qLktdpaldEJzQp19IgmubhWxB6+9Eg8eW5Jl9q8p6Vf6aA7sNuePJpeLHxrX9l4GaFTg4TlO+qLYAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XFm/6Ir0; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XFm/6Ir0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3858C2BCB5;
	Sat, 25 Apr 2026 09:54:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777110875;
	bh=RTKJFkZOhPvSkw4w1T5IdZXZkOeETqyobx085qFKyh0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XFm/6Ir0UoLq2kqL/P6LiY88zut5JBR0WxqAguLcedSe9xjim+tjjko8QnNSavNvB
	 6XHYz+D2CRO6BO+Gx3lI30y0pu8sO8sOX6CpxHRglsvlm9Rw6z1f7+GdjxgyDy5O0R
	 yND4prjQDM0XaTC4XmbUhf1v1XOnxHwEHBcOgOw8vsEu0Cd2YY5L8d18KuRccNSflz
	 nTaxduh7rAAWfXdPbK/fNFb3toSgSgXuhr/ZsWWt+TDesHI//MM7Htd8pdphJYKfFy
	 sjYg0qnCmpeSTHSeY8IhZEl0jVvcAC/q7OwOcD7RAx03RDyeJt0n9I7i8r9JyOTiNw
	 oH4+7vR90xH3Q==
Date: Sat, 25 Apr 2026 11:54:33 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Lukas Timmermann <linux@timmermann.space>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
	Jessica Zhang <jesszhan0024@gmail.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>, 
	Douglas Anderson <dianders@chromium.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, 
	Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, dri-devel@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Alexandre Marquet <tb@a-marquet.fr>
Subject: Re: [PATCH 1/5] dt-bindings: display: panel: Document Samsung
 LTL101DL02-002 panel
Message-ID: <20260425-subtle-silent-dolphin-0a7ae3@quoll>
References: <20260423-manta-display-v1-0-196f80c5673a@timmermann.space>
 <20260423-manta-display-v1-1-196f80c5673a@timmermann.space>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260423-manta-display-v1-1-196f80c5673a@timmermann.space>

On Thu, Apr 23, 2026 at 11:14:37PM +0200, Lukas Timmermann wrote:
> From: Alexandre Marquet <tb@a-marquet.fr>
> 
> Add the dt-bindings for the LTL101DL02-002 panel.
> 
> Signed-off-by: Alexandre Marquet <tb@a-marquet.fr>
> Signed-off-by: Lukas Timmermann	<linux@timmermann.space>
> ---
>  Documentation/devicetree/bindings/display/panel/panel-simple.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
> index 24e277b19094..2de0a3a6d1fe 100644
> --- a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
> +++ b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
> @@ -283,6 +283,8 @@ properties:
>          # Samsung Electronics 10.6" FWXGA (1366x768) TFT LCD panel
>        - samsung,ltl106al01
>          # Samsung Electronics 10.1" WSVGA TFT LCD panel
> +      - samsung,ltl101dl02-002

This looks like incorrectly placed (101 < 106) and comment should be
above the compatible, at least judging by context.

> +        # Samsung Electronics 10.1" WQXGA (2560x1600) TFT LCD panel
>        - samsung,ltn101nt05

Best regards,
Krzysztof


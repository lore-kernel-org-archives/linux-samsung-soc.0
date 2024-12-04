Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 864D21FC7C6;
	Wed,  4 Dec 2024 15:00:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733324406; cv=none; b=W0hykD/yZLXAiC2eSjXVkhrk8OnspYHOkJa8+pPhqdTbfxfcDcGL/ry2mhzAFnjOh2yOAWTSvHHXKX86DMCbEYzSje1S9rAwML3ugTv373abXGrdYC4EsP9ewPkG7dkV0fl1rAM5+ZOhBn3rVU7rPOo9+nwenMzaFcaKwsIcZJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733324406; c=relaxed/simple;
	bh=Xkir4c9pjGx9lAg+oTZfmHXzCTXKE5W+j5Z+hVglI5U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nxreK6aSVvFe9ieq1mghL0jbE5zQ721Bm2awHK1R9GyEeZqkKbQ+t7U3Gnj0mzlAPwFQwUXgvYs4wZJ5NWLm4ydkoqD1vQ9rQ12BcimhIVAcYivZVcM4iTHvKqgvtKgQbq9VdBUlzQj6nM6b6WDYoMjUmW/aWxcD5jIzIpc9Q8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Xo7UBX96; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Xo7UBX96"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA2D0C4CECD;
	Wed,  4 Dec 2024 15:00:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733324406;
	bh=Xkir4c9pjGx9lAg+oTZfmHXzCTXKE5W+j5Z+hVglI5U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Xo7UBX96c7oKyl5E7KZcIqRE76ZpMiwsKs9EejxH5cyzudDkdN2RgIxHNYgVOCGeR
	 Un7WeqtDYPR+ent/Qye4fBDcANa89ae7Jwi9pCTkxKvUG78wYnU39RZFNXM5v291j+
	 kP5oy3MCx3gyc76zqPHUGcsftsfru/0fRn0OovMuDQwycZNOxAmuy+gr4TQofL9hO1
	 AqaCT5Lyqsi2G438+RBbuqGBP+b7LCjUIIaHk6BDPgE+cS/BMwPt+nm2h1ABRgzrvS
	 eRdArIuyT0HD2z/klQB+q0oiyfaZzXXXADi+1urK3OvrxVBJr+YvsYTvagAIStKabl
	 IRL7E2IWq/B6g==
Date: Wed, 4 Dec 2024 09:00:04 -0600
From: Rob Herring <robh@kernel.org>
To: =?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
Cc: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Sam Protsenko <semen.protsenko@linaro.org>,
	Will McVicker <willmcvicker@google.com>,
	Roy Luo <royluo@google.com>, kernel-team@android.com,
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH v2 1/8] dt-bindings: phy: samsung,usb3-drd-phy: align to
 universal style
Message-ID: <20241204150004.GA217165-robh@kernel.org>
References: <20241203-gs101-phy-lanes-orientation-phy-v2-0-40dcf1b7670d@linaro.org>
 <20241203-gs101-phy-lanes-orientation-phy-v2-1-40dcf1b7670d@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241203-gs101-phy-lanes-orientation-phy-v2-1-40dcf1b7670d@linaro.org>

On Tue, Dec 03, 2024 at 12:13:49PM +0000, André Draszik wrote:
> In [1], Rob pointed out that we should really be separating properties
> with blank lines in between, which is universal style. Only where
> properties are booleans, empty lines are not required.

In the subject, just say 'add blank lines between DT properties'. 
'universal style' could be anything.

> 
> Do so.
> 
> Link: https://lore.kernel.org/all/20240711212359.GA3023490-robh@kernel.org/ [1]
> Reviewed-by: Peter Griffin <peter.griffin@linaro.org>
> Signed-off-by: André Draszik <andre.draszik@linaro.org>
> 
> ---
> v2:
> * collect tags
> ---
>  .../devicetree/bindings/phy/samsung,usb3-drd-phy.yaml     | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)

Acked-by: Rob Herring (Arm) <robh@kernel.org>

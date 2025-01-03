Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77D0214D2B7;
	Fri,  3 Jan 2025 08:16:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735892212; cv=none; b=U0wuWUzk3XFk+43WP7VyiFpYcjg2x5EwqwlzJWMVPY1/2cecFynQOASSR4iSaR9pDaSKRMrAVLaeY8z7pUZ1Ha+yWYgnIr2a6jztDyeE2LEcPaBEv5oMr0r3DOE4ikL8Ti/bjKGfxE+YYGHakW3k8ypNxmTO9bMqOdXw/YOWrbw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735892212; c=relaxed/simple;
	bh=SFo7wVrTHmj2UT3fAXhWBAIUsSWCM90v+/nOeVIUeSw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UtBR3BufLyxE+XjOgpP5TqEML1rbCfKp3u8F/xCrn7heeos/yKkifFGP9B29zU9YkLsQVJwYgqdMMFe7zloodpIPfSjEqh8IKBGkbub55MXhhBVxoRVfoZkZHWz1WYBpIPhJCyyuEw9zCPzGZO+dqUJNuSgCf2odwhQCZOnfJ08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qVyE2FXe; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qVyE2FXe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D78A8C4CECE;
	Fri,  3 Jan 2025 08:16:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735892212;
	bh=SFo7wVrTHmj2UT3fAXhWBAIUsSWCM90v+/nOeVIUeSw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qVyE2FXeKIqw0aVRh+ZKehBwyrJKwPmP02t6A6WWXOwkuyITLvqoC1k4NlpwfbjXE
	 eVGNwwvhUDrBB80aj5wkl2Y9BTNFv6iGN4Sq/XTKxqsYX7S8l5Zuz8U96CxyqkvZI1
	 WaJJ2bIEUe4B6g7EjxPDBoulDllr/zvsh2v3OQytxtr3vbX/V4GyKT2myn01nLg9pP
	 d5lnzAB4PtZOMPLxojj424wfkzDrwbZAKpvRptd+CX1icrEZYN1rGpg5D572WfmJVJ
	 EFpSPl3JqbyclIpvBU73MBlvkcjJXTiEoF5Dz/nbdl6YOdIzL8AP2rQSqeMPF5Zort
	 j+p9RA8/vzAaQ==
Date: Fri, 3 Jan 2025 09:16:47 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Sam Protsenko <semen.protsenko@linaro.org>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/3] dt-bindings: soc: samsung: exynos-sysreg: add
 sysreg compatibles for exynos8895
Message-ID: <r7yfnqeikyasfg3f7ivbjfq3fkgeingxffhxynbf5p2kyrcxx5@xl3brusctse3>
References: <20250102204015.222653-1-ivo.ivanov.ivanov1@gmail.com>
 <20250102204015.222653-2-ivo.ivanov.ivanov1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250102204015.222653-2-ivo.ivanov.ivanov1@gmail.com>

On Thu, Jan 02, 2025 at 10:40:13PM +0200, Ivaylo Ivanov wrote:
> Exynos8895 has four different SYSREG controllers, add dedicated
> compatibles for them to the documentation. They also require clocks.
> 
> Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
> ---
>  .../bindings/soc/samsung/samsung,exynos-sysreg.yaml       | 8 ++++++++
>  1 file changed, 8 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

I closed my tree for v6.14-rc1, so I will take the patches after merge
window.

Best regards,
Krzysztof


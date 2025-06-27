Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AE93171092;
	Fri, 27 Jun 2025 21:42:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751060579; cv=none; b=kLhuR8jXHNZ1k3kfdu2xu9N3vQFAsklmEtpucP1t+tLVTRFdZxmaKMNMUDsEq5DxDfkmAtRt+zbVpfXpoYbPK6Msv6c/djqbPiXikHZM9CSfFDKUFDjD16/uVfFNTK+ggfbmnsLSGMcbAzPW/dRoeRC3IuxTvJTcvcBrFsqfMi0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751060579; c=relaxed/simple;
	bh=czJLeHqDH1p8gvIVbBiKPlZAfz6hFhZHpZpUmMr4ul4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hNinfIddCtnfUgAWdn+SbhAfIAlcK0N1A/3U1i9c1VF/qLgaGwblmVY+ad5SsPDTxtyhunxq6NGt2aTTItbLON3dz54n2Z9erH1OQ3exjVviit5sOQPdqvIoUV/z+eADITOhZX4SYCJWihm0TaOD7//Ee2RUX/6YlOTYQlgFTCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uX2nW3F6; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uX2nW3F6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C61BEC4CEE3;
	Fri, 27 Jun 2025 21:42:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751060578;
	bh=czJLeHqDH1p8gvIVbBiKPlZAfz6hFhZHpZpUmMr4ul4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uX2nW3F60NzlirUdhuGn+AVs63uk+n9hSSxAUZyj/Wrrp43hdUDi/xBF1QFxeX3RQ
	 NHjTMB+zBHZPi1z893PX8D6bRe7NXlB3iUIVd7YzThcpaSRtiAZtHswxg1GxgDbda1
	 N3IZz/stGZQyaqdCEKbQxPpfPztxS5MzJTdyvhpduzzBJUdGtEHObV+1pW+MzFmmkS
	 t98XVMoiZJap5aU1bUMxXe0U4h17+145bsU6mYbG0HoTseRF0JoHpMAmnL3kpwE/wd
	 x5Yymx0tMLStbPFDz3AOxnBh2HDO1WD35mXI1jfSQCyPI4u0ff57TpGrTguTgO1HoU
	 WdHXIZpMabgzQ==
Date: Fri, 27 Jun 2025 16:42:58 -0500
From: Rob Herring <robh@kernel.org>
To: Kaustabh Chakraborty <kauschluss@disroot.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/6] dt-bindings: soc: samsung: exynos-pmu: allow
 mipi-phy subnode
Message-ID: <20250627214258.GA189284-robh@kernel.org>
References: <20250627-exynos7870-drm-dts-v2-0-d4a59207390d@disroot.org>
 <20250627-exynos7870-drm-dts-v2-2-d4a59207390d@disroot.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250627-exynos7870-drm-dts-v2-2-d4a59207390d@disroot.org>

On Fri, Jun 27, 2025 at 01:43:25AM +0530, Kaustabh Chakraborty wrote:
> Add Exynos7870's PMU compatible to the list of nodes which allow a MIPI
> PHY driver.
> 
> Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
> ---
>  Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml b/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
> index f0fb24156da9b8980dcfd5339ae75f12a71cf6d6..45acd6a03d761a833cec435302e5190fb50f7a23 100644
> --- a/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
> +++ b/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
> @@ -172,6 +172,7 @@ allOf:
>                - samsung,exynos5250-pmu
>                - samsung,exynos5420-pmu
>                - samsung,exynos5433-pmu
> +              - samsung,exynos7870-pmu

Don't you need to add this to 'compatible' and under 'select'?

>      then:
>        properties:
>          mipi-phy: true
> 
> -- 
> 2.49.0
> 

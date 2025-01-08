Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B9CB1DFD85;
	Wed,  8 Jan 2025 08:30:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736325025; cv=none; b=kHW/uwYyK3+ZZtksd5dLxP2Q9nNO2FqAOpuUHcTVRhAc70JBPqwMxfbztd/tqkroMgLk9t2gOR3TyWbY3ViyROg8WAZ0GjYUi6ptqhwgU+cDSEYbEgjd0fDRShGCDBzGFuhHvg5AbbDLDNETwzdapnB520VDSMGeKHQwUkjc35Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736325025; c=relaxed/simple;
	bh=lSdp/Tf14ZXeM2+DPwDlUFDomlBVvyqUfx1JcR+/Bag=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N4pUSxhJ+gWtJ/V5QJ9oZlLLdkwehceOEm5EMK1vAyuuOKIkS02ZW8eUR4WgyQ/l3cwAsHtT9rj6HSMJUHsiTWoJAeMlPk97OBYQvrCFRV+x/XTfCgQGpezde4HHMHtG0FaOnzh7WLlBxkSRnRu8/Z/WM6gH+4idD9joL/iFHWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FPiIwrOV; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FPiIwrOV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39ECDC4CEE0;
	Wed,  8 Jan 2025 08:30:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736325025;
	bh=lSdp/Tf14ZXeM2+DPwDlUFDomlBVvyqUfx1JcR+/Bag=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FPiIwrOVK8BEyg6KgQZ58eDlM1ck122ZWw7hRYUSiyScdiabQZTUjAQi9utpEqywd
	 mQWNx15YyZY5QFOgOVNYf+AjiuqU4qooNB0AzyEIKea/T0jJXO3TZaRx8w8UtVZwaf
	 KVEAynjsH7CxTOz5cRnot8Q4WpqPyey5QqVdxHfEWOZy/FpPmaBS4i6JwP97y11Zyq
	 YlH7oMokk6NVI7OUjofoqovbZ/QQ6p/8jqsZdgT2QSz3G3hR/5F17Rx7NKyfoX+sVP
	 bJCz93Y3YBUV/F5Q9xEkKCsC9V0WfXRI42BIyNFOetTga6JBW1jjSf2eJEXAg0rYj6
	 PWQdn1cOIFlYQ==
Date: Wed, 8 Jan 2025 09:30:21 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Sam Protsenko <semen.protsenko@linaro.org>, 
	Peter Griffin <peter.griffin@linaro.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/3] dt-bindings: soc: samsung: usi: add USIv1 and
 samsung,exynos8895-usi
Message-ID: <ataxete4izo3hpyuqve3isktvvbuwoosc6burnkhqcratfgv4c@ycejvdx6k3cr>
References: <20250107113512.525001-1-ivo.ivanov.ivanov1@gmail.com>
 <20250107113512.525001-2-ivo.ivanov.ivanov1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250107113512.525001-2-ivo.ivanov.ivanov1@gmail.com>

On Tue, Jan 07, 2025 at 01:35:10PM +0200, Ivaylo Ivanov wrote:
> Add new constants for choosing the additional USIv1 configuration modes
> in device tree. Those are further used in the USI driver to figure out
> which value to write into SW_CONF register. Modify the current USI IP-core
> bindings to include information about USIv1 and a compatible for
> exynos8895.
> 
> In the original bindings commit, protocol mode definitions were named
> with the version of the supported USI (in this case, V2) with the idea of
> leaving enough room in the future for other versions of this block. This,
> however, is not how the modes should be modelled. The modes are not
> version specific and you should not be able to tell USI which version of
> a mode to use - that has to be handled in the driver - thus encoding this
> information in the binding is meaningless. Only one constant per mode is
> needed, so while we're at it, add new constants with the prefix USI_MODE
> and mark the old ones as depracated.
> 
> Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
> ---
>  .../bindings/soc/samsung/exynos-usi.yaml      | 99 ++++++++++++-------
>  include/dt-bindings/soc/samsung,exynos-usi.h  | 17 +++-
>  2 files changed, 79 insertions(+), 37 deletions(-)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


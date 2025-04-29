Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D2CE274670;
	Tue, 29 Apr 2025 08:01:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745913707; cv=none; b=KoQpuf+Dif5pm4A9nokn+HRGMTGXhy7wZ5Gv5DYOTRDaHwNR13knV/lycxQb0sRpEz7S+jFJ++7nX3Y2vvQ+7eHNuTuGpYEsHYShg0eeLpowtXHtvOL9DUdt57TKbZdbPD7FJRjsrizSb1prVL2tzRz5gJSJNAt6XfpNBBQ1KoE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745913707; c=relaxed/simple;
	bh=x9VoDbvoqvFqnT/X3scRFhes5XAkMzFvSdG4jDOS5BQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qPWAWyOru13Xr/VvhCgDXC5TL7FvKCGMwe7rez2oox2Ij+XO3AgDafSEMtQTR1P/GBY5piPAb5zVim+nTR+v/EhNr2giyLwYHPJXJpZQB/wCnQlJoZ9+RR5MltYFF7aJV7a2/a9THAW0m8XOSNcMjG9r2wHkcZlRHs5LkIYnbIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=B13+zFI2; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="B13+zFI2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4EE16C4CEEA;
	Tue, 29 Apr 2025 08:01:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745913706;
	bh=x9VoDbvoqvFqnT/X3scRFhes5XAkMzFvSdG4jDOS5BQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=B13+zFI2FLbAV3uk06BxtWvdLY89xXuV7vQKdNdEkVH7XUeFXyiLxbQpXJlqA/0ly
	 2Hik6VuJJeY/+vfUU7m8h4esoK3NIHPnFePj8OjfM83HdzHVROhmqUE+ou0kk4orYu
	 46ApDRG4grEmAZkq+AE33xs37iMb+0s8P8Rq4pk9H99jfl5/Es+tBv2ovlWJ0NCmsM
	 nlbvYMAFnzwbtJf2TSxbVCR/VlaHC/p2hAkwv1F/7ucTpZDN6GObDmVGO/Sw9ktbO7
	 A/ZsMc8oEz7ofhqY1pRJrSPZ8W45HuGOAd/9ax0HyOkEzGvj7BykExfN3iQAmlf2OZ
	 Kk+ok18Q5ormA==
Date: Tue, 29 Apr 2025 10:01:44 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Peter Griffin <peter.griffin@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, tudor.ambarus@linaro.org, 
	andre.draszik@linaro.org, willmcvicker@google.com, kernel-team@android.com
Subject: Re: [PATCH v3 2/5] dt-bindings: soc: samsung: exynos-pmu: gs101: add
 google,pmu-intr-gen phandle
Message-ID: <20250429-frigatebird-of-unexpected-feminism-aecb7e@kuoka>
References: <20250429-contrib-pg-cpu-hotplug-suspend2ram-fixes-v1-v3-0-1bcc44fb1d55@linaro.org>
 <20250429-contrib-pg-cpu-hotplug-suspend2ram-fixes-v1-v3-2-1bcc44fb1d55@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250429-contrib-pg-cpu-hotplug-suspend2ram-fixes-v1-v3-2-1bcc44fb1d55@linaro.org>

On Tue, Apr 29, 2025 at 07:19:38AM GMT, Peter Griffin wrote:
> gs101 requires access to the pmu interrupt generation register region
> which is exposed as a syscon. Update the exynos-pmu bindings documentation
> to reflect this.
> 
> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> ---
>  .../devicetree/bindings/soc/samsung/exynos-pmu.yaml       | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


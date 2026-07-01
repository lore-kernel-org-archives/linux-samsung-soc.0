Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A39CE3B47E3;
	Wed,  1 Jul 2026 19:58:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782935933; cv=none; b=mRac3v3AHayT+RRJiZTLUqF1xCTBPyTnz/2DNTxDNPFfNJGjHMNxLB03Y49c3u1nE+rujqoVoNATqer9a+Qmu0CGYbRR0ktLyRgnbnj4wEvadrxwUeP0k4XfTSxUfBEoxsEQc6UqilCM7HfKRgParv0g93z9XI89j1hd8ixssDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782935933; c=relaxed/simple;
	bh=rkYUQczp4+85V/VIyMVobs+d+wDC5pIQ5z0WwBx8tgU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YZTGXAnXIASyPoFBUQcegXWpRjWMnSORweppRfsV15dftKanB+5ugZlCBInM6TmKhDivpGsLphQME3Ykyfn2zMDNQWQI9gEWLbGyDJUTnHUwUYK4Udeatymum+AtQUIz1jzm5BbEQN7FI1Ug7yvL9qgXkvc1RRU0bid/I2Z6xmw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XZ++U1dV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XZ++U1dV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16B291F00A3D;
	Wed,  1 Jul 2026 19:58:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782935932;
	bh=JrikhqZFPP+Lng8d8INd8zXdTRmN3rWF23+dPXAUK9Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=XZ++U1dV6WpJuG1bYUo8HIfR4hyErcRySYZg0RooAht8UD9dschBWcjvukcNEbQsd
	 l8yTsJZc/So+SSxKEOK5bvnG+B9ZBZom1MnHwLeEOkEkqYvHuP0+jUAlpOQruekH9W
	 om22bL6NOmDTR7/UBQriOExfyTlxYtwAo4409l2d9v83vwNgxBJZRkfbvDNFXUvjw7
	 KsUtP5FrOsuci2VaDbETURk8x8gRQHzth1gAzpz1CU11ONcvBdg+lpFXHUbz3xAvg5
	 zUTiIbMwB4vi+YtOOgQiTvx9Mt0fZ9lAFTJ1W/tLmVfflLfbsd69/LV8ybMFXZB4XU
	 U7N/bGZu4Q4bw==
Date: Wed, 1 Jul 2026 14:58:51 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Peter Griffin <peter.griffin@linaro.org>, linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	Alim Akhtar <alim.akhtar@samsung.com>,
	linux-samsung-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/2] dt-bindings: samsung: exynos-pmu: Narrow allowed
 reboot modes
Message-ID: <178293593089.1663807.4500562387695566670.robh@kernel.org>
References: <20260701105731.196618-3-krzysztof.kozlowski@oss.qualcomm.com>
 <20260701105731.196618-4-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260701105731.196618-4-krzysztof.kozlowski@oss.qualcomm.com>


On Wed, 01 Jul 2026 12:57:33 +0200, Krzysztof Kozlowski wrote:
> syscon-reboot-mode schema allows arbitrary "mode-.* properties but only
> a subset actually makes sense and is valid.  Provide negative look-ahead
> pattern to disallow any modes not supported by the device, which
> tightens the binding.
> 
> Most of Android-based Exynos devices share the bootloader or its parts,
> thus reboot modes are most likely the same, however only a few upstream
> DTS define them, so add restrictions only for these.
> 
> Google GS101 has on the other hand quite different bootloader with many
> known reboot modes.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  .../bindings/soc/samsung/exynos-pmu.yaml      | 21 +++++++++++++++++++
>  1 file changed, 21 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


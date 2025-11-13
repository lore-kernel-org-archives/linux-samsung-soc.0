Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B37333120B;
	Thu, 13 Nov 2025 08:30:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763022614; cv=none; b=Q+RVTr6EAi4d/CY07/fHh/oRDXRozVzZ/lI+AxLwovBd8Ryd1xda70ifMdO4miY24tVYYZM/WgciK/LTcylBVmEX8LGS6LzfCrFouzEUBiyAPQlhyN1Ix+qyc9beXl3+TwUa9F25gPrn0THEeNdW0qlnBgzAIW3twvjftoxYp+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763022614; c=relaxed/simple;
	bh=owgvi7e/WVMKOP1mop+3LP3dxzPrNllYG4CabDQBWPA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZtpLjEBdY6uUGunQp7uV/KhczS/Q75QvRZuZ/wejEDKMrfsdc17PSNc2pB0QdsdWPeHA+7sbMX0KVDxeda2Zq3ilOqE4oGWiV6ERIDudIhJOXZ0TwlgRtxui4MOy447pCKe6Y4wiGMeenem5LS7GC2tcS1U9H0LHwpTfDRoq2aw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=noGiq7Mm; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="noGiq7Mm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D5C3C4CEF8;
	Thu, 13 Nov 2025 08:30:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763022612;
	bh=owgvi7e/WVMKOP1mop+3LP3dxzPrNllYG4CabDQBWPA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=noGiq7MmYCNKJ1cR2HQfHLE/DsKAWpRldbypcwbvwm69kmrXogxMDHzdOSgT1TJzN
	 cbkw5BS0zR/rrXovmgGmxFQjNLThhHVoBOV29tDDf738tUT3bFbf5Kna6K2SrxDV3w
	 4DiR6bgbxYZ5T1Tla7fN7f8nd2r9Y8taU2DyFgZvhxsyn5+gDW2PtqslAgWogZkDQN
	 8hbQn/kcGtQ2Ipl92ecHaX2yC7+Wkh7nLtDilUD+flb12/E9dpmBujPnGEKdM9uNkW
	 VSDlu9nl2WiFzkOJZ7QYKPSKXEo+t1O3xvoqPgLMzH/+GriLiWIlHyrZVw2SgJPk58
	 /LG7yuGEQIMrA==
Date: Thu, 13 Nov 2025 09:30:10 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Peter Griffin <peter.griffin@linaro.org>, 
	=?utf-8?B?QW5kcsOp?= Draszik <andre.draszik@linaro.org>, semen.protsenko@linaro.org, willmcvicker@google.com, 
	kernel-team@android.com, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 2/5] nvmem: add Samsung Exynos OTP support
Message-ID: <20251113-benign-macaw-of-development-dbd1f8@kuoka>
References: <20251112-gs101-otp-v2-0-bff2eb020c95@linaro.org>
 <20251112-gs101-otp-v2-2-bff2eb020c95@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251112-gs101-otp-v2-2-bff2eb020c95@linaro.org>

On Wed, Nov 12, 2025 at 08:29:06AM +0000, Tudor Ambarus wrote:
> Add initial support for the Samsung Exynos OTP controller. Read the
> product and chip IDs from the OTP controller registers space and
> register the SoC info to the SoC interface.
> 
> The driver can be extended to empower the controller become nvmem
> provider. This is not in the scope of this patch because it seems the
> OTP memory space is not yet used by any consumer, even downstream.

Quick look tells me you just duplicated existing Samsung ChipID driver.
Even actual product ID registers and masks are the same, with one
difference - you read CHIPID3... which is the same as in newer Exynos,
e.g. Exynos8895.

What is exactly the point of having this as separate driver? I think
this can easily be just customized chipid driver - with different
implementation of exynos_chipid_get_chipid_info().

Best regards,
Krzysztof


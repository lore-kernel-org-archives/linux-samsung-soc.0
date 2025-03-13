Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01090266EF5;
	Thu, 13 Mar 2025 13:01:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741870918; cv=none; b=m0ls53IFcHlXg/IPw3+XWUZV5+m5R4zb6hMirepbQ5G5VU9vXUU9uIKTQ8e2b2la7sujMJ4FUca4hPPpI49mlaYX8R41oHXCFBNAG3FS1xIMetZeSdtCvWxFCUQs0M2MvW7gqtOzWWxQfQj1CAfhmzGltEtg+qezUFnTDixyyA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741870918; c=relaxed/simple;
	bh=c0FvekInO8FCbcUc49J6tuRqYWdLPdnPlSLNVOhYGqo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=NN+hCdRJFFS+3Z1fHP3Qpuego6HNd28jOwyXD/XLBFs/KdzFD1dxtwcnFxYk+75QaqDugNyfeXQmEjWJkr3SxgelO+834v4eN+wZUakIUdm4YcGgi+Ahc03RmRshm9IffD0GmUOByoOna4F7rOH4KgAIeS3i8zlJygR2isQLxI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hPA9NA4L; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hPA9NA4L"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8A16C4CEDD;
	Thu, 13 Mar 2025 13:01:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741870917;
	bh=c0FvekInO8FCbcUc49J6tuRqYWdLPdnPlSLNVOhYGqo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=hPA9NA4LYBE3/gCT92Hq7Gtb66zpjMlnCbwmviYI9QOPeSmmvcD8b2MZMvklHKCDZ
	 c8tTKEP4GS7fHzzkbAi70YWJZsDtWRRGF6DUpsm1NdohBxchT9A1NsPHlAwFXeEpef
	 cKmg61RLeShIyl2D0S8jN+yJ20Bp1bhnvIxhuwg08eKYl8Jgj6gvPKqhFwF/ZW6rcr
	 6dy+OlDC5DIrzYqIceQIHfBQDx6Bvl6bM4bmTovDYhXOLm0IsKvVXVR1RZNuncu4zC
	 t0cDDlWX24LFj9eAmrBB8L11U8XHj7hPfn629x2fVmYr2wbGPlAquu24+9buAFuAF7
	 3AVctEybAaWgg==
From: Lee Jones <lee@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Lee Jones <lee@kernel.org>, Kaustabh Chakraborty <kauschluss@disroot.org>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org
In-Reply-To: <20250301-exynos7870-pmic-regulators-v3-0-808d0b47a564@disroot.org>
References: <20250301-exynos7870-pmic-regulators-v3-0-808d0b47a564@disroot.org>
Subject: Re: [PATCH v3 0/3] Introduce support for Exynos7870's S2MPU05 PMIC
 and its regulators
Message-Id: <174187091537.3628407.1952858339919432293.b4-ty@kernel.org>
Date: Thu, 13 Mar 2025 13:01:55 +0000
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15-dev-510f9

On Sat, 01 Mar 2025 01:07:11 +0530, Kaustabh Chakraborty wrote:
> Exynos7870 devices use Samsung S2MPU05 as its primary PMIC. Add support
> for it in the existing PMIC driver. Additionally, also add support for
> voltage regulators which can be accessed and controlled from the PMIC
> itself.
> 
> Patches from mfd and regulator subsystems have been placed together in
> this series. Here, both patches from both subsystems depend on the other:
> 1. The regulator driver patch includes a header file which describes the
>    PMIC registers. This header is introduced in a PMIC patch.
> 2. The PMIC dt-binding patch references the regulator documentation.
> 
> [...]

Applied, thanks!

[1/3] regulator: dt-bindings: add documentation for s2mpu05-pmic regulators
      commit: 07ef6dc942741b918dd0dcbb951e0ae3dd6b53b9
[2/3] mfd: sec: add support for S2MPU05 PMIC
      commit: ed33479b7beb2b2dc9649a4e7474b47253d554f9
[3/3] regulator: s2mps11: Add support for S2MPU05 regulators
      commit: 169cd52fd9445b30379ea6deafa28a260d489699

--
Lee Jones [李琼斯]


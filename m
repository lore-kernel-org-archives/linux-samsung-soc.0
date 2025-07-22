Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFF5128AB11;
	Tue, 22 Jul 2025 13:37:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753191457; cv=none; b=bG0XbJ1yZdg8KdS2AShAnpx/+eKOEszPD297mGgQhvmd4EUOe4WWZAo7K4wmAkd8yVQObOHozdK0Z/EquA29YYBahw3iOz07SfduRikvYaPBgbTM6oUn/J57q1esiQ9SdQomK9+8j8wkjZGTrCfuYmMRACyCauWD+cHoY7wU/rE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753191457; c=relaxed/simple;
	bh=rI+1S1kmO3QI9TmwvrHiGuc2Jv3Xex+oryrpyYJLimg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Lyj+BXZyp+yC/NyVvZGhGpDSdrybz9g7ceZ+wssQgLRqsmgWcDa2YWNu1AOzK5x/VMRjNqwWmH9VPomGyhO3fi6ISDtNFJPUAcKbUhO1ZVo7bRvTWrxFdJ95H1Lr7qdQ1iuT1nfeBsAVxpFIHMiYYX7maPmG6n6yl41LUFWkxME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VrCNr7Td; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VrCNr7Td"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AFB47C4CEF1;
	Tue, 22 Jul 2025 13:37:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753191456;
	bh=rI+1S1kmO3QI9TmwvrHiGuc2Jv3Xex+oryrpyYJLimg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=VrCNr7TdjDJGqXP1DsaR6hIoBd4m2fdsKaGsIv0aSPeiwe71UTgxu0dA0DxTDWk7E
	 Fh7WL2+eKjgaqA/2p+nY+7cvcpJSjcbDMG4Dx/aqKU72SNf4/PIZ7JqxWe7a4SPlC6
	 MsXwO98fHc1XSJ5ZdFDz7zUXY2vMDboh57SwUvOxGTocgrtD5zR4dvxyUM/NcsN2Ar
	 4oVLhDepkThAe5CA4V3MZNaIi3LhIA1flPX4hYT9HdZTiRKKuOr22x06jH3/hoas3q
	 GggWp1mcqJ7kwrCcIa2tax2VmFoYemhEsg4G9UImygq+8UhN1veAZa74188YyQ4Xkp
	 XwBRoh/3q4bKA==
From: Vinod Koul <vkoul@kernel.org>
To: Kishon Vijay Abraham I <kishon@kernel.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kaustabh Chakraborty <kauschluss@disroot.org>
Cc: linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20250710-exynos7870-mipi-phy-fix-v2-1-5cf50d69c9d7@disroot.org>
References: <20250710-exynos7870-mipi-phy-fix-v2-1-5cf50d69c9d7@disroot.org>
Subject: Re: [PATCH v2] phy: exynos-mipi-video: correct cam0 sysreg
 property name for exynos7870
Message-Id: <175319145333.114152.12348662786862068642.b4-ty@kernel.org>
Date: Tue, 22 Jul 2025 19:07:33 +0530
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0


On Thu, 10 Jul 2025 16:42:48 +0530, Kaustabh Chakraborty wrote:
> Fix the cam0 sysreg property name (samsung,cam0-sysreg), which has been
> erroneously declared as samsung,cam-sysreg. This follows the same name
> used in Exynos5433 PHY.
> 
> 

Applied, thanks!

[1/1] phy: exynos-mipi-video: correct cam0 sysreg property name for exynos7870
      commit: f31ac39c037a77a87e210b0f6d86fdefe8fc7258

Best regards,
-- 
~Vinod



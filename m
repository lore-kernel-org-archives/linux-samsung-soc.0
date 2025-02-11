Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3145A24F5AA;
	Tue, 11 Feb 2025 15:08:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739286514; cv=none; b=JazB2odjswKP3hGWSZjK0V6MWtdmPorI00Yk/TptlGkhx0v7sFekHEICvg4FIkgMSuYRKyr1/bcuK+3DIVxT4hBObVzaVxsJhFWYw3R2CJxuJMMn/jmRnGWzn8nM6/LHkaW48StbYEktP6HTBKP14NHru0XqeWUmn8gLbjMCVL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739286514; c=relaxed/simple;
	bh=BL96cbuR3qWCo7GHtxKj34XPlMXb6Sqp2Ebs/ONUmxU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=tioJdomp6oppntfrMZgVmk0ZiEkBHBeicOMRCBIeH3UMBgRf3oWD4fwdt0SZDN9wLrhGGkPirEq3B5ePkYjHb1zPYojQIWBba5b0avrkGlOSZ6TH5628Kke5tJAMf5EBwR7h5GGEAl5UmN3uFic9maVs8VKMc0fzDwc4KjleR+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=G+Ad7wWi; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="G+Ad7wWi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2CA8C4CEDD;
	Tue, 11 Feb 2025 15:08:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739286513;
	bh=BL96cbuR3qWCo7GHtxKj34XPlMXb6Sqp2Ebs/ONUmxU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=G+Ad7wWiLWwnZgu/nx9E+8/ctdBCbryhqFl+gNGdkzLtNQ+YyiA5GgOcLszErKruR
	 nCzHcSw5cMLz+iY/In8X55Dr+pXfpxowoUJeET77FVnkr4gf7ifqElFPoIQKjt9Lgc
	 77EkzKqhsi8thuAsv9FcN2w336ja2OwXUIZJ4KljyBHHOljpA0t2/MUG3E3Hfn9/XF
	 SVzyEF6WbU4dbJtFRCfLuGK/dKwsCd8sP5oebNxJH3alIIZTTvpjrecnowX98qaOc3
	 q1dxr/oNnGtKLyDdqRxcl1mf808gQcfAjlLPK2e5DN/ilPY8ANWvWcwUv6y34Rc+VS
	 /DPeyuFb+i0Cg==
From: Lee Jones <lee@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Conor Dooley <conor@kernel.org>, 
 Lee Jones <lee@kernel.org>, Kaustabh Chakraborty <kauschluss@disroot.org>
Cc: Sergey Lisov <sleirsgoevy@gmail.com>, linux-kernel@vger.kernel.org, 
 linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20250204-exynos7870-pmic-regulators-v1-2-05adad38102c@disroot.org>
References: <20250204-exynos7870-pmic-regulators-v1-0-05adad38102c@disroot.org>
 <20250204-exynos7870-pmic-regulators-v1-2-05adad38102c@disroot.org>
Subject: Re: (subset) [PATCH 2/4] dt-bindings: mfd: samsung,s2mps11: add
 compatible for s2mpu05-pmic
Message-Id: <173928651138.2238525.2074698799034104775.b4-ty@kernel.org>
Date: Tue, 11 Feb 2025 15:08:31 +0000
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.13.0

On Tue, 04 Feb 2025 02:06:27 +0530, Kaustabh Chakraborty wrote:
> S2MPU05 is a PMIC present in Samsung's Exynos7870 devices. It houses
> voltage regulators (21 LDOs and 5 BUCKs), and an RTC module. Add the
> compatible string "samsung,s2mpu05-pmic" to the PMIC documentation.
> 
> 

Applied, thanks!

[2/4] dt-bindings: mfd: samsung,s2mps11: add compatible for s2mpu05-pmic
      commit: 929a8b608d1acd1ca7a493a72d80768a32925981

--
Lee Jones [李琼斯]


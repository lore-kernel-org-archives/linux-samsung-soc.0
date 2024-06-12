Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8200220DF7;
	Wed, 12 Jun 2024 17:51:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718214710; cv=none; b=jaSXCiBFBsThgwHgrjkL+rKDxC0zab5vt6O4Vb5IT2623lSEUCHhkJmGKcGT9BEgRiqCQG1LitLNa3Xz1GyM+3S+f1KQaac7iEPoDGz/JdFmmqhP1Yyn9FEl2DHFe+hoxRMl9FRCWyA0LFcOE04YVvcWJ2YtuCCu2DccziFGkxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718214710; c=relaxed/simple;
	bh=vvib4mDLNFGbxtjwNx1VQX4FbVFw8DxDSeb+iVnMLJk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=cThMannvp+lKmvmpeBvRsMCuHIzsK4+GcEnTHIk7dD0HBWCQX9HUL6BG1iEoVi32v6/5Z7TbUK7yE8H3S0m+hR1jwFAg7hJJS0epwQY4TdZtZSedV/h2Hc7g8MM6DF1yxXS8Ebr0P3Ea/j9V8BcA/rue4dG9jbmB7t17TlRlFrU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ABTrFF7v; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ABTrFF7v"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E7D5C116B1;
	Wed, 12 Jun 2024 17:51:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718214710;
	bh=vvib4mDLNFGbxtjwNx1VQX4FbVFw8DxDSeb+iVnMLJk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=ABTrFF7vZPtXgioJTr56V+Wpd5t2B3DAoaYSkgl/Yq3NXgAmw+I8YohN9jMOnxdxw
	 qFAJ1NyOXzpjnjWsirudk7Kjzul7zJnTS2Nlo4xGr6sKrQ08ndJww33cJ7ymKNhm5o
	 oFTB1L+wZDlT+eDtek53ypwzyguDr0mKOtuPTps4mOcBCkfuregZOodH9buqpUoyFd
	 H8ATPdOY3sVPlXB0dnEDXSHmR9Shb+Pp4NLGo8zGSgDZaqaJgTT+C1FDaocsAoqVmW
	 9zr328B7Av3dk3GNTU1MpSsx90jfgDm7f3EBDlLMx1kmtXW4Ou3JHueJfnXfDRTpVJ
	 dKD/rxqCpLJkQ==
From: Vinod Koul <vkoul@kernel.org>
To: Kishon Vijay Abraham I <kishon@kernel.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Sam Protsenko <semen.protsenko@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20240507-samsung-usb-phy-fixes-v1-0-4ccba5afa7cc@linaro.org>
References: <20240507-samsung-usb-phy-fixes-v1-0-4ccba5afa7cc@linaro.org>
Subject: Re: [PATCH 0/5] a few fixes for the Samsung USB phy driver
Message-Id: <171821470509.586907.3119518278516252634.b4-ty@kernel.org>
Date: Wed, 12 Jun 2024 23:21:45 +0530
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.13.0


On Tue, 07 May 2024 15:14:43 +0100, André Draszik wrote:
> Before coming to an agreement on my Samsung USB31 / gs101 phy changes [1]
> [2], I decided to split out those changes from that series which can also be
> applied independently and add a few additional fixes I had lying around.
> 
> This contains mostly cleanup, but also a change to using fsleep() as
> recommended by the timers-howto, and a fix for setting the ref frequency for
> E850.
> 
> [...]

Applied, thanks!

[1/5] phy: exynos5-usbdrd: uniform order of register bit macros
      commit: 2a0dc34bab8ede5fa50378ef206f580303eed8de
[2/5] phy: exynos5-usbdrd: convert udelay() to fsleep()
      commit: 27f3d3f6d87f650cc6b3ea08335dea749f1b04aa
[3/5] phy: exynos5-usbdrd: make phy_isol() take a bool for clarity
      commit: f2b6fc4d5c9793c556412e9a8ac122670a0d8dcb
[4/5] phy: exynos5-usbdrd: fix definition of EXYNOS5_FSEL_26MHZ
      commit: 32b2495e731f2a56118034e9c665e6fe56bbfe3a
[5/5] phy: exynos5-usbdrd: set ref clk freq in exynos850_usbdrd_utmi_init()
      commit: d14c14618e851eb25d55807810c2c1791a637712

Best regards,
-- 
Vinod Koul <vkoul@kernel.org>


Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AFF92D7D2E;
	Sat, 17 Jan 2026 19:34:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768678485; cv=none; b=eqZm7hhfkE3RXKMef6UENOgFcuYiEPE7AA0r5wNTAOJayuypUuQAmUGcjL2uXZOuWglIBJgpPC/Uf1oe946MG9MMl+W3wKQ/lxydVNpfrDF5AlYj3n5vgOS2iWZlfnLgS9xeqp8bmqYGlKnF7Cx5fhkSuGmb45Wru5hx5xxoV70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768678485; c=relaxed/simple;
	bh=1VII0wh1BOHYF1G6k82HsDSKZgInSRAVEk6spvnXkrI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=ehuPXvf2RS54Md+ZhZZBDFvyLmcKwWJay0SKa0BJth1VUaRfHw5YaaBy4fmXKFJS6yGRUYpuZQDuMEwTJP+TOZ57oZn2XQp/UdbaQdp9IYw9AEi7cJlMJzR64FZU0hDD901hTTUcAOfkaDYbfP6ww3+gOhscpW0+gstsrVhuGuQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EP6ugdga; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EP6ugdga"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40815C19423;
	Sat, 17 Jan 2026 19:34:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768678485;
	bh=1VII0wh1BOHYF1G6k82HsDSKZgInSRAVEk6spvnXkrI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=EP6ugdgaGiSCAsv3rkVofx9GZrbafMX91E4lYf4bepvu+DTWjpHi2/yPIFIhf6PRb
	 dnVRsxpsNZnysOInsxhuoACYSoMNB75QSAl3jHEMkY7u10czaMvlxA7/VRX3Mdpk7L
	 DOjyAtJcR7fMftqh4ocxUyARWWNTwSWD/3rV/Wxsy9O1eQLCdUkFwaf6qvGChZTzAr
	 6tX+8ls5+Dtak/W+v+6SuzJUdtF0uvJn04hkKa6Gjk6vxvcophnE7JWjbf85mvy1U9
	 DQB5U/M6HQc2BtuzZ+xGHrnh7dfsjARo+wBZ240JF6Aerq8S/6+jb60TFthoD4tRwK
	 n2URtrKvcwPkw==
From: Krzysztof Kozlowski <krzk@kernel.org>
To: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, 
 Peter Griffin <peter.griffin@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, kernel-team@android.com, 
 Will McVicker <willmcvicker@google.com>, Juan Yescas <jyescas@google.com>, 
 Doug Anderson <dianders@google.com>
In-Reply-To: <20260113-dpu-clocks-v3-0-cb85424f2c72@linaro.org>
References: <20260113-dpu-clocks-v3-0-cb85424f2c72@linaro.org>
Subject: Re: (subset) [PATCH v3 0/5] gs101: Add support for Display Process
 Unit (DPU) clocks
Message-Id: <176867848098.124121.13465976483676296810.b4-ty@kernel.org>
Date: Sat, 17 Jan 2026 20:34:40 +0100
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3


On Tue, 13 Jan 2026 10:58:57 +0000, Peter Griffin wrote:
> This series adds support for the Display Process Unit (DPU) Clock
> Management Unit (CMU) aka CMU_DPU found on gs101. These will be used for
> the IOMMU and display enablement.
> 
> As all the patches will go via Krzysztof tree it has been sent as one
> series.
> 
> [...]

Applied, thanks!

[5/5] arm64: dts: exynos: gs101: add cmu_dpu and sysreg_dpu dt nodes
      https://git.kernel.org/krzk/linux/c/024d8f4aa35970c4563c6ef0c4170133719b2103

Best regards,
-- 
Krzysztof Kozlowski <krzk@kernel.org>


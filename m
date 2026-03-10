Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 827133B7750;
	Tue, 10 Mar 2026 16:04:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773158648; cv=none; b=ncMpHl4+lwjkTNatrHYhFgr6Rbr0SdgkETR33ejxjaKcpQbanEHoBEVBggbnyRCZDotgnFOWzIuDLEOha+poSUdl4gZPaftiGuVwFQmSLRbGEr2nPAeS1ylM+2dsPilXMKZc5YQdCh4hV+LUmganblFYHb37e1c68N8+S9gfemY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773158648; c=relaxed/simple;
	bh=3vTsoiQM6i7kY7LrHCQyDmM3Co4y6Ipej73O1XI5CsM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=TNF+n7Mp91KTEk7XCnrDTxAR20BKUHXK1qPbkIg7WNJCv90nTeeyAPCS7YIR01RTCixc/ZtzaC1EXF70dBa1YkSWZggNN6nZ/IZLjB4aC+QcfUmdqT50tppaR+cXF0WRzF2VIf2S1KntN+HJ+cjRz3LNB/KNKzuS+/+5ZzKDyoA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EGxdc25X; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EGxdc25X"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3CE80C19423;
	Tue, 10 Mar 2026 16:04:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773158648;
	bh=3vTsoiQM6i7kY7LrHCQyDmM3Co4y6Ipej73O1XI5CsM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=EGxdc25XWo0m5WaJOlbYKFD2CecpSF2u65CUxLs5LEg+VBgWNwY+oKu8IpH5Voncu
	 emt1beNypaOnGxnIlmF9AZz12RflrU1hUk7NidW9H6zQrPQXnvuyW5Q0Su5rbBOAtq
	 CxYiU52nMOyBLweyAfIyE42P2HrUXwDnDxVD9e58t/fm0EKeHqJHbTWc87NdOcSJ+n
	 578Lq8rhSGOHkTxIgqmqJe5OfwVaWUIgawi6s+Wa46ctUwthyo6qeRGsu69wC2F5qu
	 Sd0+a8Jt0763wt1YtC7ApZk2h7/LmGlOIZ+1M2fCDKoMaLpOPqWqtXdKuD6OYUPClD
	 HlGsndZNM77aA==
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260305-dts-exynos-i2c-v1-0-2c8d3df3b9ca@oss.qualcomm.com>
References: <20260305-dts-exynos-i2c-v1-0-2c8d3df3b9ca@oss.qualcomm.com>
Subject: Re: (subset) [PATCH 0/5] ARM: dts: exynos: Cleanup I2C
 address-cells and size-cells
Message-Id: <177315864595.219146.1067906832304585370.b4-ty@kernel.org>
Date: Tue, 10 Mar 2026 17:04:05 +0100
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3


On Thu, 05 Mar 2026 10:09:23 +0100, Krzysztof Kozlowski wrote:
> No functional impact expected.
> 
> Best regards,
> Krzysztof
> 

Applied, thanks!

[3/5] ARM: dts: exynos3250: Drop duplicated I2C address/size-cells
      https://git.kernel.org/krzk/linux/c/cb243c21bbe14739406b5be680c850cdf20c9739
[4/5] ARM: dts: exynos4210-smdkv310: Drop duplicated I2C address/size-cells
      https://git.kernel.org/krzk/linux/c/7c40913bc532f3645c522a89886070a08b1ad23b
[5/5] ARM: dts: exyons4412: Drop duplicated I2C address/size-cells
      https://git.kernel.org/krzk/linux/c/44ee52a030a6dd2f6e0ecb3632ecf8b263114619

Best regards,
-- 
Krzysztof Kozlowski <krzk@kernel.org>


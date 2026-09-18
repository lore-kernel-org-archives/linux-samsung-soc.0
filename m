Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE7514BF95D;
	Fri, 18 Sep 2026 10:42:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789728178; cv=none; b=TpcRsYtAUcuTB/yO4CNnbSObvHElh4pd65o/TLsLq69pfBZkcT4Pukyy87x1iVnhDOAOGZtIUNIWgrs3HzxrAOd7VukGsf32NTHf1rlZyrDwfmPM9hHppib5pnXv6SuizIJQ4VsD8NN8D6g5ov0nenpuLU+sPlldJOq/ZNrGZ1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789728178; c=relaxed/simple;
	bh=ojfPL2DSF1gZlYBZPDqqZJQjogi6EUK25xhZatqGsLI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=HFz0EBKKUARJhLfLc3AIpiI/PuvtHcoGJpmOv9Iz0QqJwfs/Jln4I2FrgPETLHtOStCVNpLYOHBvN8jLdRiUdCU9jtfo7eINy/QPi1gYBQB+D7ljXsPSRfvQ9aCcC27CaSA9C8+Kp5AI6E+tyO8+sLJShez+K6motasxZn6Oxek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NvstjFlp; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NvstjFlp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07B171F00893;
	Fri, 18 Sep 2026 10:42:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789728176;
	bh=W65260PL0LUngU2B5q4xFMH5FD3mWtrx6eWZgwnRxcE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=NvstjFlpfWoBaBWoCvPZVphIXMxQcVVa5OB621H3tuHI/tJHld5XJB6ENF7taFlDH
	 yx3DdT8ziaR2Blzslvci+yrFMtdsHUlfrtc0EKkpkKidf14xrilrl4TibMT95UgyJz
	 R5tRvhCu2Nxc/XsqCqlr8UtCp5UnbKrWGCFaiPFuWFG36igkeibqrdtSTLd6luHeS9
	 5CWEnUdhriCQ/KuW2nIYPp3BoGcCK/IUtvCw+DWGdQq8pD02DITIS2SmVUbFa6xNAK
	 NqWE6AlmUNBHNG6T6PYC2gjaVZKpo0/Qs951ZxR6V+xaQ83IpuKzgnZKcFv6vmQh2S
	 ogESXARWwUA+g==
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jesper Nilsson <jesper.nilsson@axis.com>, 
 Lars Persson <lars.persson@axis.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-arm-kernel@axis.com, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260916-b4-dts-samsung-cleanup-strict-continued-v2-0-8e9d534ba5b8@oss.qualcomm.com>
References: <20260916-b4-dts-samsung-cleanup-strict-continued-v2-0-8e9d534ba5b8@oss.qualcomm.com>
Subject: Re: [PATCH v2 0/2] arm64: dts: exynos: Few strict dt-style-check
 cleanups
Message-Id: <178972817074.83665.4431390528303203267.b4-ty@b4>
Date: Fri, 18 Sep 2026 12:42:50 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16.0


On Wed, 16 Sep 2026 19:06:16 +0200, Krzysztof Kozlowski wrote:
> Changes in v2:
> - Do not reorder CPUs because cpu@4 must be the first one/boot.
> - Remove applied patches.
> - Link to v1: https://patch.msgid.link/20260911-b4-dts-samsung-cleanup-strict-continued-v1-0-9aa55051c42b@oss.qualcomm.com
> 
> Not yet complete, more files will follow. I probably won't re-order all
> Exynos5433 soc nodes by unit address because it is way too disruptive.
> 
> [...]

Applied, thanks!

[1/2] arm64: dts: exynos5433: Re-order nodes to match coding style
      https://git.kernel.org/krzk/linux/c/b940eb8b2153130a960f9d9da63f27b5001d17f3
[2/2] arm64: dts: exynos5433: Re-order properties to match coding style
      https://git.kernel.org/krzk/linux/c/1b1dae647d7395a524dad2a0135bbb07a2b2d519

Best regards,
-- 
Krzysztof Kozlowski <krzk@kernel.org>


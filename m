Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C61B939448C;
	Thu, 26 Feb 2026 08:40:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772095225; cv=none; b=QkKMvxQ+dTXQn6U1R78kQKtZwVupNzFgYVBLIj15e6Ebl3REb6ySUfCvNs9yEr1WXxDahERXyTMCDXrWB4pdzvA1PKAONKMBY1581c7QtWJhUoK0ojJuuafZXAMdEZc7wssLKLLNZZtHJ4MXyB3UM7T1iBNEvQxL+WPcEwHRlXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772095225; c=relaxed/simple;
	bh=03ww9eTAIOimZhGpfh2LPpkkMRKr/FXHrMGkGgHg/uw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=uhPPHWLzIk44otYB8hSEEuL71QJqjy5wjTAwv9ojgmCRq7FJI+sXsg+Iy6K0fapf8ZFaUagIhC6ldpcaLuxgnRWDbk4mNMfgu5ykAhkeqoHOfKotUSENp8XJF6mWxSxsOY4PD2ivlRdlKw1KQeGAOrkNomaJNDVigkVqPqg4bbU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ThIjjoHx; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ThIjjoHx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86137C19422;
	Thu, 26 Feb 2026 08:40:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772095225;
	bh=03ww9eTAIOimZhGpfh2LPpkkMRKr/FXHrMGkGgHg/uw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=ThIjjoHxqM636G0Cb4gnvicEzqDaWweb11h4BxNO2jwU+10Vl/Wm9iKZjaw+5VWjm
	 ufG1bjxq4wdlIb2/8c+ESNhu4fquHv61kkdnMXhsscm6nNgZoBSDd/XFlMMIII4bta
	 VELfeTX6NG22vMvnuPbsOfGMHKYXCUP7nOR02q5dIBc8cDrHMu8Lkq6ibO7Xp+gN6w
	 jmkhuT6D3/c/X1KILWfAeZ72tsTAcXx9sGyAJYBB+Sm0lYnuO2MNBLkGY1kWSlkjyU
	 fPY5MQ5RwoiBS3jeqMHMtlbIvvOrJAN5lBLFN5YvDtHrCrlCWPTE6wzCfu5zBJpgDb
	 SsBLNBXbUPIWg==
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Alim Akhtar <alim.akhtar@samsung.com>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Kees Cook <kees@kernel.org>, 
 Tony Luck <tony.luck@intel.com>, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>, 
 Kaustabh Chakraborty <kauschluss@disroot.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Rayan Marzouk <rayanmarzouk743@gmail.com>, 
 bluebunny <kalorin.bok084@passinbox.com>
In-Reply-To: <20260125-exynos7870-j7xelte-v1-0-5cacc3042c42@disroot.org>
References: <20260125-exynos7870-j7xelte-v1-0-5cacc3042c42@disroot.org>
Subject: Re: [PATCH 0/2] Add device tree for Samsung Galaxy J7 (2016)
Message-Id: <177209522223.26390.6219893536178441080.b4-ty@kernel.org>
Date: Thu, 26 Feb 2026 09:40:22 +0100
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.14.3


On Sun, 25 Jan 2026 01:35:25 +0530, Kaustabh Chakraborty wrote:
> This series introduces the device tree for a new Samsung Exynos 7870
> device – Samsung Galaxy J7 (2016).
> 
> I have acquired permission from the authors of this patch to upstream
> this on their behalf.
> 
> 
> [...]

Applied, thanks!

[1/2] dt-bindings: arm: samsung: add compatible for samsung-j7xelte
      https://git.kernel.org/krzk/linux/c/be961cdb8ed3befa81dce118a6a41f0138732d10
[2/2] arm64: dts: exynos: add initial support for Samsung Galaxy J7 (2016)
      https://git.kernel.org/krzk/linux/c/5d692f20de6311fa507c952adc3487c641edee00

Best regards,
-- 
Krzysztof Kozlowski <krzk@kernel.org>


Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10552272803;
	Mon, 12 Oct 2026 06:22:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791786139; cv=none; b=s5BLp35gLgzpduRZaPV8lonTRANJMiXZj0zmrgdygbRxTWuhclWWPICncyT/gSStYMeZdO/ArFZCnJ9rHJ7mZ4rPAwsY8X2b/K1x84kwIfGSF/olVmIiObJCf2GUeg58KWRAf6xuuqk4cNo4pCnhRObjXh+35IfQM8LjoiJ6aFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791786139; c=relaxed/simple;
	bh=JFiwabstfo2SJh2jNq0ox4oeLUOrnCJEDtNV/d4DvmY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Pabw585LVuSwABECP6EcZhqvN2VA1L+ku++u8lnFeFuh/bDSYVG+92u+S0rsK8QEG2+auKdHjg7mk/mfbGERmZeIVCHvaaFfxLp5Q/jTDFSqES6b0/L2cVZQ4/7KpxjiZw9yZ8iO6QTqWUHtufo7lnhV5FFLHWCRlAtrfm4UZjU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nSOds2w7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nSOds2w7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1E231F0089B;
	Mon, 12 Oct 2026 06:22:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791786138;
	bh=zAvr8au5jXx2j4KwWUXT+ieUZwz0pxq8u0e8g2/D1FQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=nSOds2w7z+8rJmHn2mqIiY0ZKhg54PNCMXUlPK+Op83b6r6RIna7a9USi4aK4XChL
	 xFHm73+LjbCiUjjmpJR2L13EcJQ3szmcyrzP4G3R+bu2p0kTAJQ76qMO0e+y9LAYp4
	 /QXZpM2C9CZGzJ2sItlIdMe3iOyQXSo0dzdsMUJoq5oWgnz9AyJoe7bWqFxvMpyX4d
	 ruAgSCs8yiy3WXljLw0B6CAwZxpMII/YMQOwuV8GvjTFnYmOKXkGa32v+UhZMB5S6+
	 /1/TDDcKu4XGz4yA7b4Bmjyn2r53YXlJb4r55VT08w4+Yr/W1mt6GCBo5TEoLFHur2
	 S2mhmk09hh6Gg==
Date: Mon, 12 Oct 2026 08:22:15 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Raghav Sharma <raghav.s@samsung.com>
Cc: s.nawrocki@samsung.com, cw00.choi@samsung.com, 
	peter.griffin@linaro.org, alim.akhtar@samsung.com, sboyd@kernel.org, 
	bmasney+clk@redhat.com, jbrunet+clk@baylibre.com, robh@kernel.org, conor+dt@kernel.org, 
	linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, is.gandhi@samsung.com, 
	ts.amit@samsung.com, pokala.reddy@samsung.com
Subject: Re: [PATCH v2 04/14] dt-bindings: clock: exynos8855: add hsi clock
 definitions
Message-ID: <20261012-furious-ginger-rabbit-a6fbf2@quoll>
References: <20261009120137.2801911-1-raghav.s@samsung.com>
 <CGME20261009114342epcas5p4345e99027177004b612da6fc103ba80f@epcas5p4.samsung.com>
 <20261009120137.2801911-5-raghav.s@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261009120137.2801911-5-raghav.s@samsung.com>

On Fri, Oct 09, 2026 at 05:31:27PM +0530, Raghav Sharma wrote:
> Add device tree clock binding definitions for CMU_HSI
> 
> Signed-off-by: Raghav Sharma <raghav.s@samsung.com>
> ---
>  .../clock/samsung,exynos8855-clock.yaml       | 21 +++++++++++++++++++
>  .../dt-bindings/clock/samsung,exynos8855.h    |  8 +++++++
>  2 files changed, 29 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


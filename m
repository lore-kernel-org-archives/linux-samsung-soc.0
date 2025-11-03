Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5762A2E7624;
	Mon,  3 Nov 2025 10:18:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762165098; cv=none; b=U5bk/2BRbAEZDlTh1FnDWGYjLs/1UdndAu+vSEKSx1vY+jPzS1z3ZEJTgqWaOO+iYgRimzBa4IA3vLVqZfTJrrH/WC4NXJUp0b82+9rvLk8DQt/QMVUyj0JAEKw5p5ybfu2GfPSStkKaZ9ioj/MBdyGz/JTNIjmoRC42MGHaa9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762165098; c=relaxed/simple;
	bh=C4QQnsShf5Y8+8Ho+Em1/waNjgFMK29LcwCRpg08oZs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AdEbYKCc4VzYI0Rcb9Tw3ZkUaO4ZHwdmumexUOih8QR/TK/Vn64/4NmDhRYXJOrtwitx1i12ng+AehtrLDdSkFz2OvTtQyVNUOoz+mPdljoI0aLx3eoIWxUHfi0NQztPz167cQEzZMZIYTV49ac0qYboGuqa5omzfZQ6W71cX5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UVYeexe/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UVYeexe/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49578C4CEE7;
	Mon,  3 Nov 2025 10:18:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762165097;
	bh=C4QQnsShf5Y8+8Ho+Em1/waNjgFMK29LcwCRpg08oZs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UVYeexe/SU2kLqppXCrgZ12xr7hjWV4gFx+NZfTOAdfFor6bpyeLxkounCwgN/qH1
	 LRYYLPRWSnpjPD3aKriQF3S/6i2V87mzFy9vNbW33P0D7uFDsulFNvjSIQCILIZZ5H
	 3PASHPOla3AEYTYjO32t/kQRTMpVWu8qlUB4Ou5SfaDiSg0661FIdNngmD7/w6SlQ5
	 EHP2ds+29sKEYg1vhCMq8zaArngc0IU1vDd0XbvywyT3t5taiEFJQXyB2nEqepMQd5
	 stdql9iwef3g1gdXjfS1GhEgWCSvYxtAMJf2q0LOcOuXHHiC8OzyRdiIqrIC+cGWQK
	 Ce4WuDFhe9LOA==
Date: Mon, 3 Nov 2025 11:18:15 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Peter Griffin <peter.griffin@linaro.org>, 
	=?utf-8?B?QW5kcsOp?= Draszik <andre.draszik@linaro.org>, semen.protsenko@linaro.org, willmcvicker@google.com, 
	kernel-team@android.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 10/11] arm64: dts: exynos: gs101: add the chipid node
Message-ID: <20251103-pompous-lean-jerboa-c7b8ee@kuoka>
References: <20251031-gs101-chipid-v1-0-d78d1076b210@linaro.org>
 <20251031-gs101-chipid-v1-10-d78d1076b210@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251031-gs101-chipid-v1-10-d78d1076b210@linaro.org>

On Fri, Oct 31, 2025 at 12:56:09PM +0000, Tudor Ambarus wrote:
> Add the chipid node.
> 
> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
> ---
>  arch/arm64/boot/dts/exynos/google/gs101.dtsi | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/exynos/google/gs101.dtsi b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
> index d06d1d05f36408137a8acd98e43d48ea7d4f4292..11622da2d46ff257b447a3dfdc98abdf29a45b9a 100644
> --- a/arch/arm64/boot/dts/exynos/google/gs101.dtsi
> +++ b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
> @@ -467,6 +467,12 @@ opp-2802000000 {
>  		};
>  	};
>  
> +	chipid {
> +		compatible = "google,gs101-chipid";

That's not a real device, sorry.

I had some doubts when reading the bindings, then more when reading
driver - like chipid probe() was basically empty, no single device
access, except calling other kernel subsystem - and now here no single
actual hardware resource, except reference to other node.

Are you REALLY REALLY sure you have in your datasheet such device as
chipid?

It is damn basic question, which you should start with.


Best regards,
Krzysztof


Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAA122222B5;
	Thu, 13 Feb 2025 17:22:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739467351; cv=none; b=etvg/oGMoXJO7QL8CwQHlgglBRU9OxYGUH++uZVsx1YZ+mfXkq5xPP/YCs8i1o6o0coYnT4gAiqVU15Gtkga/mOV0UZ7jHeXbZnDnJSImVOm9He51M6TSIZiaPb2uN7KdE48ZOvIGoHKMuxoh5c7+VK0+K1THXYLMwMVW9CaklU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739467351; c=relaxed/simple;
	bh=S0OhMDWIGff52utNObwPzkVUWW6web7D0hUEz9SRg7I=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=FfJa2AQtff8s8g/j1x4Nt7U2RJU68UGzZ6xhwkVAKHtMxdHX6clPnpYfLZBGJBvA22DwSzwmX4GNNc+LYSBNZOqAhpy7Ql+MGXuFfid9jvtH8ieKybMMa6YiMIGG0mvtSxDhYskYhQZKpvRZjktedqAx8EhbwSEc+okCJwK5qbc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FH16R/H2; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FH16R/H2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CEBAEC4CEE5;
	Thu, 13 Feb 2025 17:22:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739467351;
	bh=S0OhMDWIGff52utNObwPzkVUWW6web7D0hUEz9SRg7I=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=FH16R/H28sbPKn7EPgQPJsfz+nmj0y3nzBbR0EjMfaCwbetXv0ivK1A13IlWN4KYn
	 xxh3mjPC0v273p7AuQPftFcvd8uxlNddFF8xf+N6cwk+/Wa22aeIXWXylmbbz+3k+1
	 V4rf78TrK2EGyVh8M+OWZ105e0mtLiRIuntBfBvii2sqzsJ3PoBVxhwQrtzHVHyuEe
	 DFT9W2L+P2eBWhOZMeCIuA8ryD97qx9iHlWx/vDPxYRiJqEG0HiQNHEPLQCzxJeycx
	 QfmCplKmvyQI3L6/Q8R4xYTb2NFl637T3OBXR6MlUmQiLMzJtQlUN5bioH6BPvt9ir
	 cucz4MO8FK2aQ==
Date: Thu, 13 Feb 2025 11:22:29 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-kernel@vger.kernel.org, alim.akhtar@samsung.com, 
 linux-samsung-soc@vger.kernel.org, krzk+dt@kernel.org, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 conor+dt@kernel.org
To: Denzeel Oliva <wachiturroxd150@gmail.com>
In-Reply-To: <20250213000226.277-1-wachiturroxd150@gmail.com>
References: <20250213000226.277-1-wachiturroxd150@gmail.com>
Message-Id: <173946704422.3328564.13834631635241088489.robh@kernel.org>
Subject: Re: [PATCH v1] arm64: dts: exynos: r8s: enable UART interfaces and
 aliases


On Thu, 13 Feb 2025 00:02:26 +0000, Denzeel Oliva wrote:
>  - usi_uart: Main UART interface, required for debugging or
>    communication.
>  - usi_bt_uart: UART interface for Bluetooth connectivity.
>  - Added serial0 and serial1 aliases for standard UART access.
> 
> Signed-off-by: Denzeel Oliva <wachiturroxd150@gmail.com>
> ---
>  arch/arm64/boot/dts/exynos/exynos990-r8s.dts | 23 ++++++++++++++++++++
>  1 file changed, 23 insertions(+)
> 


My bot found new DTB warnings on the .dts files added or changed in this
series.

Some warnings may be from an existing SoC .dtsi. Or perhaps the warnings
are fixed by another series. Ultimately, it is up to the platform
maintainer whether these warnings are acceptable or not. No need to reply
unless the platform maintainer has comments.

If you already ran DT checks and didn't see these error(s), then
make sure dt-schema is up to date:

  pip3 install dtschema --upgrade


New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/exynos/' for 20250213000226.277-1-wachiturroxd150@gmail.com:

Error: arch/arm64/boot/dts/exynos/exynos990-r8s.dts:122.1-10 Label or path usi_uart not found
Error: arch/arm64/boot/dts/exynos/exynos990-r8s.dts:127.1-10 Label or path serial_0 not found
Error: arch/arm64/boot/dts/exynos/exynos990-r8s.dts:131.1-13 Label or path usi_bt_uart not found
Error: arch/arm64/boot/dts/exynos/exynos990-r8s.dts:136.1-10 Label or path serial_1 not found
FATAL ERROR: Syntax error parsing input tree
make[3]: *** [scripts/Makefile.dtbs:131: arch/arm64/boot/dts/exynos/exynos990-r8s.dtb] Error 1
make[2]: *** [scripts/Makefile.build:465: arch/arm64/boot/dts/exynos] Error 2
make[2]: Target 'arch/arm64/boot/dts/exynos/exynos990-r8s.dtb' not remade because of errors.
make[1]: *** [/home/rob/proj/linux-dt-testing/Makefile:1464: exynos/exynos990-r8s.dtb] Error 2
make: *** [Makefile:251: __sub-make] Error 2
make: Target 'exynos/exynos8895-dreamlte.dtb' not remade because of errors.
make: Target 'exynos/exynos850-e850-96.dtb' not remade because of errors.
make: Target 'exynos/exynos7885-jackpotlte.dtb' not remade because of errors.
make: Target 'exynos/exynos990-x1slte.dtb' not remade because of errors.
make: Target 'exynos/exynos5433-tm2.dtb' not remade because of errors.
make: Target 'exynos/exynos990-r8s.dtb' not remade because of errors.
make: Target 'exynos/exynos7-espresso.dtb' not remade because of errors.
make: Target 'exynos/google/gs101-oriole.dtb' not remade because of errors.
make: Target 'exynos/google/gs101-raven.dtb' not remade because of errors.
make: Target 'exynos/exynosautov920-sadk.dtb' not remade because of errors.
make: Target 'exynos/exynosautov9-sadk.dtb' not remade because of errors.
make: Target 'exynos/exynos990-c1s.dtb' not remade because of errors.
make: Target 'exynos/exynos9810-starlte.dtb' not remade because of errors.
make: Target 'exynos/exynos990-x1s.dtb' not remade because of errors.
make: Target 'exynos/exynos5433-tm2e.dtb' not remade because of errors.






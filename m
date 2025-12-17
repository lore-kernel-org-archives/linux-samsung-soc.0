Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 724EE335090;
	Wed, 17 Dec 2025 08:18:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765959529; cv=none; b=GB5cR4qyOrfaFZdmGALz++4f+56HSwlMsHJzVTmQ5x7DCoBB+lqCRQlHq/5Q1FuUgMBYixQYzP4duZrCwRirX3uJ/9VTQIKCJ1po0NZMGjCXAmgx4kyAAN1/famkXc/T7ECcpiS9b+l9DRZ1YqkpiOmAN/KF0y0bxG2W4K4LL4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765959529; c=relaxed/simple;
	bh=hzq+qlfrm/XHsPUHquJSzRmimdiL8pDjtXmG8is3c/M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k6+WsYg3M0KrCVsXTSzUF9EXr1JrBRhTR/tdlAblPbKYG9Q1+4AYMY9MQBC1JRPapEy/4t6/6aya+szIHUEcONypuzJ0oB12k61W7ZjJFtE/o+RQaFfvUh2XjFalzX4mguSXAN4Hidi3Qt0TAA4hRJYS773ugtSjkFLLY1HyWBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sRX5bDil; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sRX5bDil"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9AB8FC4CEF5;
	Wed, 17 Dec 2025 08:18:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765959529;
	bh=hzq+qlfrm/XHsPUHquJSzRmimdiL8pDjtXmG8is3c/M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sRX5bDilyC3cJ2UuW/tbAlCdHYCfsWGhDwTcN3Ufd1dQ4NuPR4X92Ebc3n2jPBMe8
	 MpF8JEMa0xf/Ll0Hp/fx07+utYT/FKIXIKqmtYkfP5o5Vui5svM5TS6K5NJDq2L3vT
	 1zrSdapoSQLr6//VhCVPZHjgLkYGpyKTMo7v8Ib+XaimdJTay3SrREYGrL2AnbOtmf
	 pZkihWhtu1CtlxtFU7vWdC/dCke7F4os6/GAW2rezjW24S8GSTdZ7NIpY1Vpk6vGZ9
	 O4aRJQrDPgSZVQx1JE6LsMnaybLM/7em66L7dfRIAoVB7arRR1/PH+EeuLpd19Z5PF
	 zEN21PGEppjKw==
Date: Wed, 17 Dec 2025 09:18:46 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Lukas Timmermann <linux@timmermann.space>
Cc: Alim Akhtar <alim.akhtar@samsung.com>, Rob Herring <robh@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Russell King <linux@armlinux.org.uk>, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org, Alexandre Marquet <tb@a-marquet.fr>
Subject: Re: [PATCH v3 0/3] Add support for exynos5250-manta (Google Nexus 10)
Message-ID: <20251217-placid-taipan-of-fascination-20e002@quoll>
References: <20251215-lat3st-staging-v3-0-2e4914b64dd8@timmermann.space>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251215-lat3st-staging-v3-0-2e4914b64dd8@timmermann.space>

On Mon, Dec 15, 2025 at 04:05:21PM +0100, Lukas Timmermann wrote:
> This patch series adds initial support for the google-manta board, known
> as Google Nexus 10 to users. The device is powered by
> the Exynos 5250 SoC. The bindings for the notification led are already 
> in the kernel mailing list, got recently applied and can be found here:

$ git describe
next-20251217
$ git grep ams,as3668
Nothing.

> https://lore.kernel.org/linux-leds/20251125114015.355487-1-linux@timmermann.space/

That's the posting, if you wanted to convince me, you could link to
actual commits in maintainer's tree.

Please ping me when this reaches next.

Best regards,
Krzysztof


Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10B714A64D1;
	Thu, 24 Sep 2026 20:19:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790281182; cv=none; b=GuNISw/ibTYqBqwXdz4mkcoJlY/lKgUc1IzYgdjt0RpO+g1wO03pu0b/VoPYB0K2/ZOTY0JCDQJyUjtAX3IpJoqgrGhj1YEAKC+vHKZ+dmepdd2BQdJlgefBaJCWd61xl+a7UnDwQcgFAgEPAz9Bp4iE0Z2BNCS9rOCrswigxoA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790281182; c=relaxed/simple;
	bh=4wxf0584elCt48Bw1N9PUXi1ZzdQ9TqESTB+mA77Dxc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=HUesuIsTotxJqt7zlLckpWqhghSVrksKr+wL7+c10ls1BCelPbo+kgU6swLQio1W/DTryWA4g87X75FUku6TiNIRPRm6lppiNk3UGBE9NIyTeW+VX8hIfIWp5W5MouMF+PqTG2mZ6fWmymxtgzc9T3tgU2H1IbhoMrr1D7n4ZZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UoOI7/oA; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UoOI7/oA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 980021F00893;
	Thu, 24 Sep 2026 20:19:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790281179;
	bh=Ow2O8of2Y71X7MukV9Nlt7v7jN1qAv8RcOjuQZoIiUY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=UoOI7/oAsLn8O+bOUSB1w2r9wR57yEkrOUMZaK8OpZywXxvcqkkQDslm3EUKqoVK2
	 NOAUqFw4j5oWPoNUBPUmiApPO70umTf26mUIRnvKVDl6/RgQAxYMD3xSDXfeF+R+6j
	 dtVhHE+iYS+9XOec9JyWy7IIV8Y9m+cEjsk+Yz7xrVZAduDvLNJH5VaGxUTd43P3JZ
	 1sF1uurG6MCyNOpNOkGbLE+Ja1VrWmDhvFDAUrhD2w2idyQ68B7BP3tu1dkP4tTqQw
	 1cOEAo9Hr/czI88I52jyE/qdPsIsfZqZt0uDdV6pCsIcDGCWzAvJA2AWe6ceR7DWpi
	 vjqDM9HeTk1zQ==
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Paul Cercueil <paul@crapouillou.net>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260918212923.148505-1-paul@crapouillou.net>
References: <20260918212923.148505-1-paul@crapouillou.net>
Subject: Re: [PATCH v3] ARM: dts: samsung: exynos4210-*: Fix Bluetooth
 nodes
Message-Id: <179028117510.127367.15417070276593312684.b4-ty@b4>
Date: Thu, 24 Sep 2026 22:19:35 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16.0


On Fri, 18 Sep 2026 23:29:23 +0200, Paul Cercueil wrote:
> The BCM4330 Bluetooth chip is capable of doing 4 Mbps over UART. The
> Exynos 4210 however, can only do a maximum of 3 Mbps. Add this
> information to the Bluetooth nodes using the 'max-speed' property.
> 
> This fixes extremely choppy audio when connected to external Bluetooth
> speakers.
> 
> [...]

Applied, thanks!

[1/1] ARM: dts: samsung: exynos4210-*: Fix Bluetooth nodes
      https://git.kernel.org/krzk/linux/c/b47faa6004d86ade16b90d24fa1e1f179e6f7230

Best regards,
-- 
Krzysztof Kozlowski <krzk@kernel.org>


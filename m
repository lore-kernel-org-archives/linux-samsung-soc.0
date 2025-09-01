Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BAB017B418;
	Mon,  1 Sep 2025 13:04:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756731846; cv=none; b=Cg46mnkbggRh+SaWE79JRcjDdWvfq4yBweKl6ZYEn0GEz/ASjiYJW3a1dIUzaab73i+54ESxSgaHy450ROSrWm8C1+oR/ivupL+jFj1PtKsi8vRd60We407yOkpxlCu9iPKCjWaJ5+ihzRvQARTzI7IxECpnzhOomCe82bg+nFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756731846; c=relaxed/simple;
	bh=TOiIhiyCyJG5AxUoW1hpwxuptZ/Xs/OCeoRXC0Hc2uI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=X5mhdoRFvOWUvYimqrNLiQuMIuXBUKHrUN6tt7+4Bd7pTELIAmPh0XMiKyb8Nto2bf45BBV2SJ5lI4OuUYLUObc8R7KxHxeLnZEFfR8sREkZLp5YpVE+MZeCTvslwHshhP4rr4lDk7pzTQ9u5nrLRbGsXxNWwXWLkZzlHCK9jFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=k1oKLpPB; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="k1oKLpPB"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id F1BB34E40C64;
	Mon,  1 Sep 2025 13:04:01 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C797960699;
	Mon,  1 Sep 2025 13:04:01 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9E05C1C22D9A3;
	Mon,  1 Sep 2025 15:03:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1756731840; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=IgnLlO7jOt0FD4jUzFN4p+RS1ZzKoUQ5W4E4v5dt5GY=;
	b=k1oKLpPB/xN0+LSXuE9pFlMVOUwjjpm7z8hAbcHZtb0psY9101Tjrjs28FX958mzmZUq8x
	j+gzj3qdRTLpgo4ok9b2M4wGzhsOcTn3dLwI/XfvMuy9C8UUoiaPqYKHReFkhFb4jX4mKw
	xIa5XkhNemDk0/EnwoEeFeRxF9WyDFFiEoKVHa85brb9FxSZD2vm+MmmIIyl+hE1l0I5DM
	dE4XNUduk70udDE+jSkvWrVjQnrV/cjMC+9xGGijQJflgcj7gtEEsIge2U0eVTdp/fhl7c
	IotwMfSHozv8JMWEu0XdK65xQ8LPdUeLPtg0IRykP9WJACUU1sSIRKgkVRVf3g==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Russell King <linux@armlinux.org.uk>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH 0/4] mtd: rawnand: s3c2410: Drop S3C2410 driver
Date: Mon,  1 Sep 2025 15:03:48 +0200
Message-ID: <175673179165.52555.3449710772627669678.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250830-s3c-cleanup-nand-v1-0-05b99ef990fe@linaro.org>
References: <20250830-s3c-cleanup-nand-v1-0-05b99ef990fe@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

On Sat, 30 Aug 2025 19:01:08 +0200, Krzysztof Kozlowski wrote:
> Drop S3C2410 NAND driver because its only two users were:
> 1. S3C2410 SoC: removed from kernel,
> 2. S3C64xx SoC: does not reference this driver.
> 
> Best regards,
> Krzysztof
> 
> [...]

Applied to nand/next, thanks!

[1/4] mtd: rawnand: s3c2410: Drop S3C2410 support
      commit: 773b9202de0127444fc8802a611a19637b7fa12f
[2/4] dt-bindings: mtd samsung-s3c2410: Drop S3C2410 support
      commit: 451f1184f8f6a90c701b9d8c8c055f6a1d9308bb
[3/4] mtd: rawnand: s3c2410: Drop driver (no actual S3C64xx user)
      commit: d40934bea54ca5509138d40ab530c6700c830802

Patche(s) should be available on mtd/linux.git and will be
part of the next PR (provided that no robot complains by then).

Kind regards,
Miquèl

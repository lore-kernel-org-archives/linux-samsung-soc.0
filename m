Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5BE71E5219;
	Mon,  1 Sep 2025 07:26:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756711594; cv=none; b=BHdVxL9QPnCFRS3iPpP2RSM4AeEoenE8th+7MChOP7GCeTaF7l23y+FNsCVx4Z/TZQZ/UVcAdn3ecdU/uT9ENH6SQ+SczBIv3ShAvJpzqnAyXsxUizquxdFlkD7nanf21efgrHEr4RYQg2VrcILc4KkL2iIImSPJPhlvmOPsDm4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756711594; c=relaxed/simple;
	bh=ImQL93cWU9txQnD2Z/VJCpp3Mddb+X9LqtZaBzfGqPs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=VGL62DR1C+iNlAh2d7Lhq4YGwYrzmrwkAD+F+j/lvr6JxH+jBnvpANyHDRlxH12vZtKlCbnJ3eg+P/SvBpDcNJA2zU687cdZFeRy8AXhkkC+5CBcE8qOcYUO3lJliX5zaPOpRULxvBojVhvMAUsN8nOze0cJSFJcilGlkkP4Rik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=218vl8jr; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="218vl8jr"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 985FA4E40C10;
	Mon,  1 Sep 2025 07:26:23 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 6DB7B60699;
	Mon,  1 Sep 2025 07:26:23 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 291E41C22DC76;
	Mon,  1 Sep 2025 09:26:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1756711582; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=ImQL93cWU9txQnD2Z/VJCpp3Mddb+X9LqtZaBzfGqPs=;
	b=218vl8jrV5nS1OF9XPtgqctOBR4E5Wt9W4UG6OxZHv7VtXkQRBmbUVPaVY/3b1cPBl7ehQ
	J7kK4SYpusaEVXga/qqSB0wfgkzV9Xt8jKrBzVRabErX/7SV2YBYZ2q8FAQAJ1EigBut1s
	luu06JS21cW3gu2DjeH9Jet88Qx3zB/QM7V+5dZ6hNn1z9Do6W0Yo8wZ+ClFPoglbkXT/Q
	ii9Sl8lbZqdedK97AHAk6UzFxuoZPlr5m9YkYhiiBZ7lix/nt9QHMSrAohu3Sb+yskUiXh
	F2EpllC44LqrZxMO0GAq6p3Sc0xKPaXuSnNd4s7Rq7Zgg7yw6UbWFjtYS6PmLg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  Rob Herring <robh@kernel.org>,  Krzysztof Kozlowski
 <krzk+dt@kernel.org>,  Conor Dooley <conor+dt@kernel.org>,  Krzysztof
 Kozlowski <krzk@kernel.org>,  Alim Akhtar <alim.akhtar@samsung.com>,
  Russell King <linux@armlinux.org.uk>,  linux-mtd@lists.infradead.org,
  linux-kernel@vger.kernel.org,  devicetree@vger.kernel.org,
  linux-arm-kernel@lists.infradead.org,  linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH 4/4] ARM: s3c6400_defconfig: Drop MTD_NAND_S3C2410
In-Reply-To: <20250830-s3c-cleanup-nand-v1-4-05b99ef990fe@linaro.org>
	(Krzysztof Kozlowski's message of "Sat, 30 Aug 2025 19:01:12 +0200")
References: <20250830-s3c-cleanup-nand-v1-0-05b99ef990fe@linaro.org>
	<20250830-s3c-cleanup-nand-v1-4-05b99ef990fe@linaro.org>
User-Agent: mu4e 1.12.7; emacs 30.1
Date: Mon, 01 Sep 2025 09:26:01 +0200
Message-ID: <87qzwqr5va.fsf@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3

Hello Krzysztof,

On 30/08/2025 at 19:01:12 +02, Krzysztof Kozlowski <krzysztof.kozlowski@lin=
aro.org> wrote:

> MTD_NAND_S3C2410 driver was removed from the kernel, so cleanup
> defconfig as well.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>
> ---
>
> I will take it via Samsung SoC.

Ok, I'll take the other patches through mtd.

Thanks,
Miqu=C3=A8l

Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39E96410D3C
	for <linux-samsung-soc@vger.kernel.org>; Thu,  4 Jun 2026 13:52:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780581145; cv=none; b=H6tx1iHJDoe0yofDfNyyw8gklo14WkRl+jnNr2hLfgrK4XmQX6qDXPpwBZ2o+MmYWtwRT7btQvt7s0WO+GXyDG080UdCBjFZdbn3kstJKwuq/Q2ooUsaXcPex0Wn7+03M7nHTy9OLl+472rf3Bu8t8lSBRHSjkQTrq0Buv5HXHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780581145; c=relaxed/simple;
	bh=ZaY5vFxG9aYZCmRrkh4G6IJ/GRp154Miry9zwaOYwzM=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=BiTGgWkeeAIiZW2vCkXkweDNz55tIrsjPAZq+9p6gIdNc1CJq+xV9EwgPQfVCUHBpMhRuIkpE1mRIIJSjch6jTH2+564Lq9Q8mRJplRC4GwJsFY3z6blySgZ2CaWuoosYvDVm+e3qOK0p5FAE+i6aAkTNn9gF8L579+UK5hfpZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=q9mp3cGz; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="q9mp3cGz"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-45fd45e596cso392024f8f.1
        for <linux-samsung-soc@vger.kernel.org>; Thu, 04 Jun 2026 06:52:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1780581141; x=1781185941; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tr8tJV7XonRe9aqon2KQXf6etaodi+ES5SfBfdU6e68=;
        b=q9mp3cGzn3h2MhRK6XrbG8QMIeXE841LVChyHfXx/v/cDtiOssHcUex4ij4no+uRjD
         vddVlYmG1cGOuUAPBPAAeEF7trsMjG71cu3014VC6TONpgcIj1tfJxm+IdvBzCIOTh05
         M3n0i60J28z1Ii7Y3YtDSm5BTi5YGXjyJv6FzBUPCcPbLeOPPlZ5kWC1qstA4yjSUd7S
         Ix+TjKzndwrHsTgVOoV4H3gD/CKW6WTGMfofWnUiiizqAwpyJwfybW5wO42UJWRMqLhZ
         sb0s8gZAEPhxeUmOfnXRW+dYbPpJ8rbeKjc5knoo4qBC1CJRnHtGd4yJim9yf/MWcxhM
         SyCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780581141; x=1781185941;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tr8tJV7XonRe9aqon2KQXf6etaodi+ES5SfBfdU6e68=;
        b=onbb+S7toscYCwe/dl5BlQjzcEmc7dV8x1P7NejBnRbd0+0PosLW6HLi7gMhmbSM44
         MjntOGntZX/XsXLxI+gT+ho1LhUOE7E5GXm8VFYwaWeE1kgIwkO3pzNIH73YzO2B3/mp
         7lplIsJbtq9D8PgfteO+NHwVhaXF8pLPYPh2ZWLBkTM1VoN3cziY91ZhIOWv+U3Oo5YO
         AoL7xcfH8b8hUP/WXns9ir17KU89o2Sx6fw8YobKdbnLd5Ga3dyV7dugVV7B/Hjw5tZ0
         Sox6aOvKyLGwvhiLAS6r/FpN4eYHlxvzVZweX9O5iPvGXsMtEzkQ45gGIUl1ckdmCCVm
         jwPA==
X-Forwarded-Encrypted: i=1; AFNElJ/dvLDDe1kWuiMR2/uakIlfTQ1zPthvICDMyKLQ2WZ3BzEHTG9ygdBu1UK7Cf6b9l5CHAT7uD/uN30tliVjLVyUwQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwetxlW7kb8xjHY6oupEfPnbtq9HC63OHeKjYlP2ANnSXWDn14T
	jQoYXjFwhzzcTbIPIpkLBdz6Ds9+1HolwEZGKPsqXVGulfFTUjwf5PEHzOrkm2yjyUk=
X-Gm-Gg: Acq92OG2+LTP91IuiW8Z4+J/uEdPVaOl+98uyoW6P5VyJdbRP3wNuzxktSVcKmcEnMk
	X9lV+gW7m3P50p9xUnM9VP+Wb8zmRBVUku8cgZwuO+63QJjDxAGspViceSqLY0XoeV1UrCkUAvo
	UEHgZtRUceL5OxgiZP6d+Akzq+V91SoL2orb396NGG6iDUrECuf9NEUs7beyKc6SO+ql8VF/b5k
	0xIT+OQ+1mxqVh6cHRPQYGQdhzq1qcmylJNlj2vzWjEKjljiOYdg0G4Xdj/DBkupKyDscbkRg0w
	hx4+7K7cTsjCILeSIfkLHwCNGqS1npx+aznG9M01hbKc1Btvk2eJbP2BgAbOW/rOsPbLhRVOOFf
	k1xA+rTCloEoXhpdamWXk22g6ZI/7oftNy1u040u8GygcPmFDGXk/SdrTnMnCd+K9NKMiBoGnO8
	Uri3dE+EkaIIUgQso9UAAf9VHF+59pamDsfwi/qEOadFLPX7Th9FsGcHE+z/zh/sLulsx51N+yt
	9GcOvc3PJPSVnENrE6WB7lp
X-Received: by 2002:a05:600c:3596:b0:490:44eb:c1ea with SMTP id 5b1f17b1804b1-490b5edd71amr146656455e9.24.1780581140625;
        Thu, 04 Jun 2026 06:52:20 -0700 (PDT)
Received: from localhost ([94.4.195.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f351ac0sm27268044f8f.27.2026.06.04.06.52.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Jun 2026 06:52:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 04 Jun 2026 14:52:19 +0100
Message-Id: <DJ0BC2X0G04D.18CIJDSEP0PVP@linaro.org>
Cc: <jyescas@google.com>, <linux-kernel@vger.kernel.org>,
 <linux-samsung-soc@vger.kernel.org>, <linux-pm@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-hardening@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, "Krzysztof Kozlowski"
 <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v8 2/5] thermal: samsung: Add Exynos ACPM TMU driver
 GS101
From: "Alexey Klimov" <alexey.klimov@linaro.org>
To: "Tudor Ambarus" <tudor.ambarus@linaro.org>, "Rafael J. Wysocki"
 <rafael@kernel.org>, "Daniel Lezcano" <daniel.lezcano@kernel.org>, "Zhang
 Rui" <rui.zhang@intel.com>, "Lukasz Luba" <lukasz.luba@arm.com>, "Rob
 Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>, "Bartlomiej Zolnierkiewicz"
 <bzolnier@gmail.com>, "Krzysztof Kozlowski" <krzk@kernel.org>, "Kees Cook"
 <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, "Peter
 Griffin" <peter.griffin@linaro.org>, =?utf-8?q?Andr=C3=A9_Draszik?=
 <andre.draszik@linaro.org>, "Alim Akhtar" <alim.akhtar@samsung.com>
X-Mailer: aerc 0.21.0
References: <20260603-acpm-tmu-v8-0-0f1810a356e6@linaro.org>
 <20260603-acpm-tmu-v8-2-0f1810a356e6@linaro.org>
In-Reply-To: <20260603-acpm-tmu-v8-2-0f1810a356e6@linaro.org>

On Wed Jun 3, 2026 at 2:00 PM BST, Tudor Ambarus wrote:
> Add driver for the Thermal Management Unit (TMU) managed via the Alive
> Clock and Power Manager (ACPM), found on Samsung Exynos SoCs such as
> the Google GS101.
>
> The TMU on the GS101 utilizes a hybrid management model shared between
> the Application Processor (AP) and the ACPM firmware. The driver
> maintains direct memory-mapped access to the TMU interrupt pending
> registers to identify thermal events, while delegating functional
> tasks - such as sensor initialization, threshold configuration, and
> temperature acquisition, to the ACPM firmware via the ACPM IPC
> protocol.
>
> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Reviewed-by: Alexey Klimov <alexey.klimov@linaro.org>

> ---
>  drivers/thermal/samsung/Kconfig    |  19 ++
>  drivers/thermal/samsung/Makefile   |   2 +
>  drivers/thermal/samsung/acpm-tmu.c | 651 +++++++++++++++++++++++++++++++=
++++++
>  3 files changed, 672 insertions(+)

[...]

Best regards,
Alexey

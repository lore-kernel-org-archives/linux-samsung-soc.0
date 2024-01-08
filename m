Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE35B46459
	for <linux-samsung-soc@vger.kernel.org>; Mon,  8 Jan 2024 14:30:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SGqaF2MR"
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-6808c3938afso17492246d6.1
        for <linux-samsung-soc@vger.kernel.org>; Mon, 08 Jan 2024 06:30:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704724206; x=1705329006; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=us/CVEv6G9k9DQOG3dlOmhBFEblPcysaqhNz+rCQ/Uw=;
        b=SGqaF2MRmOPcIFyxwezOastuAeBZSpsSPiC4+TsD+th6ZYdUXkzXPa7eO4zuC+7KSc
         rFYqskt9GDrFmbcrS3lvx/edOAHGT/C1HIjfiWDGoPgl17rA+DikjMPdU2n0di7/ow1n
         eY/4xxH6KXLW9KlLOanJOfJRngoxK8hPqV7xObOSPjZmO3WCqwbeXz2FooiL1/csJ8rX
         9ZecwMjbpuRPv9UIVQavsCdNThaFNGz+6T/58fM9vTfUss7MJZ8ODDYzNlfkm0MmPsNX
         DriUdpbjgc96pLtWq6iHJ9Zi2Kl2HCheG9BODvSImImUVn7DZZACIuln9aAHbJVHHR+1
         UW+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704724206; x=1705329006;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=us/CVEv6G9k9DQOG3dlOmhBFEblPcysaqhNz+rCQ/Uw=;
        b=CDkAUov4EvQgry4giH6XEe5gatLUYJd8x6JyPi5oDRWUjpsLNBO7HG1A+ORnLouWvi
         pxJNaaYIBVgB0aUo9g4pVtrCYJOEXjB95AZSqWQ3o5VtuNf7NEb2BQqXtcqZGJ9IXthx
         X7nsbjkEi2i8pxBS9+9c3ASPbHSR+b77ECWx/wbDi/S8OaIltukFWp8b/hppmaapAF4S
         Vqz4lpdqmsLELWTvRDeQTji9UtIRlJC8B7X6ixTbmqqQmCPa+7PerkF78mhLeoBCO0y+
         lhyhk7Ky91qTDs+qLtDBtmHkMss0iVlSISG8qdY6CJEAnd256Ab2YJApJfAeiBXP3cF5
         q2EA==
X-Gm-Message-State: AOJu0YzPc8748y7dAga3gMa/bCwJe8GPhV5QHIX03rbunkEic1N3IJs6
	vGh8QyhyDAAu1dPQDwPoL+LPuqonpJr4KVcxk3pPgEYLKL08PA==
X-Google-Smtp-Source: AGHT+IFjtzhQ3BfPSDEs8Agdj1p4sk1vFjnrvq9PUoG7FKgA33cadkc0hjK10VeuHBRIfWpXwQrhgg7VCPy+lRL1XnI=
X-Received: by 2002:ad4:5f4a:0:b0:67f:a6b6:f050 with SMTP id
 p10-20020ad45f4a000000b0067fa6b6f050mr5204636qvg.75.1704724205761; Mon, 08
 Jan 2024 06:30:05 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231228125805.661725-1-tudor.ambarus@linaro.org> <20231228125805.661725-6-tudor.ambarus@linaro.org>
In-Reply-To: <20231228125805.661725-6-tudor.ambarus@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Mon, 8 Jan 2024 14:29:54 +0000
Message-ID: <CADrjBPrGmi5Dq4dLM2pJDtFS6Zq72FqzvBEnu=1wbeehsODijA@mail.gmail.com>
Subject: Re: [PATCH v2 05/12] tty: serial: samsung: set UPIO_MEM32 iotype for gs101
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
	mturquette@baylibre.com, sboyd@kernel.org, conor+dt@kernel.org, 
	andi.shyti@kernel.org, alim.akhtar@samsung.com, gregkh@linuxfoundation.org, 
	jirislaby@kernel.org, s.nawrocki@samsung.com, tomasz.figa@gmail.com, 
	cw00.choi@samsung.com, arnd@arndb.de, semen.protsenko@linaro.org, 
	andre.draszik@linaro.org, saravanak@google.com, willmcvicker@google.com, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org, 
	linux-serial@vger.kernel.org, kernel-team@android.com
Content-Type: text/plain; charset="UTF-8"

Hi Tudor,

On Thu, 28 Dec 2023 at 12:58, Tudor Ambarus <tudor.ambarus@linaro.org> wrote:
>
> GS101's Connectivity Peripheral blocks (peric0/1 blocks) which
> include the I3C and USI (I2C, SPI, UART) only allow 32-bit
> register accesses.
>
> Instead of specifying the reg-io-width = 4 everywhere, for each node,
> the requirement should be deduced from the compatible.
>
> Infer UPIO_MEM32 iotype from the "google,gs101-uart" compatible.
> Update the uart info name to be GS101 specific in order to
> differentiate from the other exynos platforms. All the other settings
> are not changed.
>
> exynos_fifoszdt_serial_drv_data was replaced by gs101_serial_drv_data
> because the iotype restriction is gs101 specific and there was no other
> user of exynos_fifoszdt_serial_drv_data.
>
> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>

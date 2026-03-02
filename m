Received: from mail-yx1-f48.google.com (mail-yx1-f48.google.com [74.125.224.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABEEC306D26
	for <linux-samsung-soc@vger.kernel.org>; Mon,  2 Mar 2026 18:31:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772476269; cv=pass; b=mkvyQR+kqCsl4tR6z6smbfh9Zmtv6MF93Gb2WNqVVaxFIgM2qdwFsmhrRYoWyvVGan9S65YOQX0SAMcX2KnCRUiVAW2rXvx1K8gqLQrR5yqiN0ywpguU49Ko31msRXrzS/paJlRNOYv7IY9E3Lz+ah3NGHnB6K4rKevLPQJMQXs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772476269; c=relaxed/simple;
	bh=kt2T9iC2Y/wd08xI3GU9gJHg4i4C2OvrhJg73KQ4pds=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KeaNplEc+S1Z9J+pBsCMWY2Z4/zwPgZsCmmFaMhxpXb8vwyH0Lk0dAeMrX3EkforhxBRiLPgb9bdd+IWkBZZ/jF2lAJU4HmpezM1YrrFKfkoJzRVtIYAzSYbLzUmB7vxE3zmXcOPruiiPtpEAE++5czG+jqnqTThNSkc2cp0CBA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IsfZWYW4; arc=pass smtp.client-ip=74.125.224.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IsfZWYW4"
Received: by mail-yx1-f48.google.com with SMTP id 956f58d0204a3-64c97997b0fso3256525d50.3
        for <linux-samsung-soc@vger.kernel.org>; Mon, 02 Mar 2026 10:31:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772476266; cv=none;
        d=google.com; s=arc-20240605;
        b=ZBH5ZmhMKuRSDmzhPZhQMF0JPWlvt+7Qdbu8PvzHybLrk5FE422htH6wVyI5+gbiqM
         QFhvvW8OM1V/FlyetcjBz2HnMiXSIB3Q/VgU4DTtgfHmKyWCMQ4f2wfQcQ+hXlFDL6YO
         6II9u3vgn45EeVYdEiKKeNzD4H8eTqRXk0uheLqoNEc4f91rn1r1Izu1M9lglSEmNQxz
         2t7SdMCVjqP7i8AMD+6S/bG6w8aLhxiVRcoSXkMdVGmRdqLVKRo9CNyWv4Fsjv+pt72U
         FbqsjnOGha4Rc/BS158FbG6W3a5/YRWHSzC0ySzSbhL5Yrp5zTtSZx8t4+NzVizUzMoZ
         ZHkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=81g1AQ9LUBvNGZAcgE0oE1RFZWKZ81udvij0ADF9Goc=;
        fh=sA/DMeCVoZkGgjpeecPl5sg5hNYLuW130vVBN7Kr0EM=;
        b=e8vc44VMJ4wiaP7FifGT34vRiFEPyuk2vKdjQvxSvs2SPA0HGCphqCIoqRvnQUbmH8
         2nU+LhjwdNq3T2caMllJLS5cln97PAx04s44uxFQlI9PLVnrfnwtZYTQPNomc7GizJ4H
         sHXzqgs8I2G4m4F2zpAp5NBby4a7rQ7mgraMrXYH2XWj4dygJHMrMo6uRIsnr91+ge94
         w6qX5vHqGZCWYITqANthQnDaRrrwe0wYqZp0fLB62OBwdTZiiIZSMg2DSd3pVd+TlnvP
         Py3IpRofWqk3KREFWsq/dLL639+VSkpbCDqukQw3QuITiOV9JOzYpbqGbJ2n84PNzJSh
         ze/w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772476266; x=1773081066; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=81g1AQ9LUBvNGZAcgE0oE1RFZWKZ81udvij0ADF9Goc=;
        b=IsfZWYW4jZJ0ZN6TNJlkST4AU6gR+cnISCt1N6NZwSy40N2iZ+pY5KinFwN+vZUyEU
         DqmETpflSKqPtOnA2Dx0q2Be7tRAqv28/eouzOON68SCBUQwa1m50LEquroKh+jSSvkw
         JtDPAhSAW/L8akw/EJUKgH6BLJBPJ5lUN2eucqN+qsWqXlVJVLappLXdpl2YKgfzWk7C
         6RInREWG/HWugItMpcTiwTcVWaNcoSxF1x2utlSnMvjeQn2MK4xa0MoJugW3OtkOqi+I
         UlWf99I0+NY5idT6SgvJxVhJ5Xr0hOJihlbk4XedAKm6DexdTVUOV7cz927PWArNn3cI
         BXlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772476266; x=1773081066;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=81g1AQ9LUBvNGZAcgE0oE1RFZWKZ81udvij0ADF9Goc=;
        b=h2IHwW6F8O2iKFd5/pKYTkZ1ogwco20diZecC6k+o7Rqt5cprkUaM0stGFG+vLVmIE
         TVPnMv7WP1wSJhQdl281eaIVgMAn7z5S8mIobpW9Z1+OSd3gpjy4iQZn+Dm/MMZPDyCl
         AlKA/w3AoN7VUADyl+NQVZjYHAfsPcEZqgKVGKDhnTgFfYM9EhFKo36DriEgS6unJ20I
         Jfio8j5tVloeWqmcDBYT7o15QCc7jDV8X2CXEmCAGm8NV2N5Tbv1Kjr4VV6J6PSPHTam
         7927KPiiRPYJGaHWyJiT2Dg72E/AQTstKslDVHrDhnIdATS9pH2weohrFLvelCk7ag69
         KxaQ==
X-Forwarded-Encrypted: i=1; AJvYcCVkuZb8B8H/YZNzZI/YU+X9P75wXn8pR/HVT+4mDBkhXgOwc2JbhWghZK/PjYbZo9c3gcmpwiGlIVjUIvX1NMfVuw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwWln3lydzr/U1Yke1IkTloObWyMXXFCWRdAu1b+X13kRbaYb8a
	e4RTD+Ma41n/iAGGpGibyewTeJ2L4GVuPkHQUS0eqfRNsY2oRL7UOAyS4zaCv/7tbatH+Ktdln1
	iizJnSYxXvRkWHXs7tymi5IwOJrleagV7EJgxBysBFw==
X-Gm-Gg: ATEYQzzNIX5BtlGUw4m9TxxeKwprTCHAeNctXKM2qBOhFmLGP02wqHhzADpAX5zfjF+
	wzVqchEYpKhAl9cTqeLSg/yELDJicqKh1ExThI2qxqmofr39044RsutHV3jqeULS5Y+i/MYyHgA
	2nbCxVjk2pE3tHqYa7AlvGYg5ZuZBFuoSXEo9GP5zJceR+BYESrs50tPUo8PhEaXDaj7PB91alL
	WNw913hK9V4OsHdHxxAYLGf/oJ5u5RtMRhF7gV9qxDqgbY8zednASP75z8gXkjintsBZGJnS+t5
	vfbXKjndgNFq3LWW4sQ2pm2jLYSRsxHira+mPPjtr+yrj3J5bVKTHkUIw6o8YpjSXQ==
X-Received: by 2002:a05:690e:2060:b0:64a:e1de:e830 with SMTP id
 956f58d0204a3-64cc2025a5cmr8768669d50.16.1772476265235; Mon, 02 Mar 2026
 10:31:05 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260119-acpm-tmu-v2-0-e02a834f04c6@linaro.org>
In-Reply-To: <20260119-acpm-tmu-v2-0-e02a834f04c6@linaro.org>
From: Alexey Klimov <alexey.klimov@linaro.org>
Date: Mon, 2 Mar 2026 18:30:54 +0000
X-Gm-Features: AaiRm515e3WzwnsMys39sfPXCKSu89p0-qrgz1al4LhQ_1OobhhtPkQJhg_LdoM
Message-ID: <CANgGJDpjsyoCnuXuMMi1L3nWNJsM4aMs6C=NvBcTkWeC3NFadQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/7] thermal: samsung: Add support for Google GS101 TMU
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, 
	=?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	willmcvicker@google.com, jyescas@google.com, shin.son@samsung.com, 
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Tudor,

On Sun, 1 Mar 2026 at 02:26, Tudor Ambarus <tudor.ambarus@linaro.org> wrote:

[...]

> ---
> Tudor Ambarus (7):
>       dt-bindings: thermal: Add Google GS101 TMU
>       firmware: samsung: acpm: Add TMU protocol support
>       firmware: samsung: acpm: Add devm_acpm_get_by_phandle helper
>       thermal: samsung: Add support for GS101 TMU
>       MAINTAINERS: Add entry for Samsung Exynos ACPM thermal driver
>       arm64: dts: exynos: gs101: Add thermal management unit
>       arm64: defconfig: enable Exynos ACPM thermal support
>
>  .../bindings/thermal/google,gs101-tmu-top.yaml     |  67 +++
>  MAINTAINERS                                        |   8 +
>  arch/arm64/boot/dts/exynos/google/gs101-tmu.dtsi   | 209 +++++++
>  arch/arm64/boot/dts/exynos/google/gs101.dtsi       |  18 +
>  arch/arm64/configs/defconfig                       |   1 +
>  drivers/firmware/samsung/Makefile                  |   1 +
>  drivers/firmware/samsung/exynos-acpm-tmu.c         | 212 +++++++
>  drivers/firmware/samsung/exynos-acpm-tmu.h         |  33 ++
>  drivers/firmware/samsung/exynos-acpm.c             |  35 ++
>  drivers/thermal/samsung/Kconfig                    |  16 +
>  drivers/thermal/samsung/Makefile                   |   2 +
>  drivers/thermal/samsung/acpm-tmu.c                 | 643 +++++++++++++++++++++
>  .../linux/firmware/samsung/exynos-acpm-protocol.h  |  30 +
>  13 files changed, 1275 insertions(+)
> ---
> base-commit: e2211f5d980086dd9fbdab3bcd86b715e12cae13
> change-id: 20260113-acpm-tmu-27e21f0e2c3b

JFYI, the series doesn't clearly apply on today's linux-next:

Grabbing thread from
lore.kernel.org/all/20260119-acpm-tmu-v2-0-e02a834f04c6@linaro.org/t.mbox.gz
Checking for newer revisions
Grabbing search results from lore.kernel.org
Analyzing 18 messages in the thread
Looking for additional code-review trailers on lore.kernel.org
Analyzing 20 code-review messages
Checking attestation on all messages, may take a moment...

Base: using specified base-commit e2211f5d980086dd9fbdab3bcd86b715e12cae13
Applying: dt-bindings: thermal: Add Google GS101 TMU
Applying: firmware: samsung: acpm: Add TMU protocol support
Patch failed at 0002 firmware: samsung: acpm: Add TMU protocol support
error: patch failed: include/linux/firmware/samsung/exynos-acpm-protocol.h:40
error: include/linux/firmware/samsung/exynos-acpm-protocol.h: patch
does not apply

Was it done against mainline?

Thanks,
Alexey

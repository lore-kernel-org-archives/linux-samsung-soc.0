Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CC043D0907
	for <linux-samsung-soc@vger.kernel.org>; Wed,  6 May 2026 15:13:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778080439; cv=none; b=ORfJ+LQHRBie/sTG8r7LYlFAvU83FxgrKvENZeJq065eUCNtInpVAM+QJSHzAQEC1ynV7f3H21zuMnVjOx8cRlNxE7VlVe5YD+dT3Sd96gVvRWNf1ir255v2upzRYZ4x+1ONeHxX+dmhAGyfK9Br8YyxlCCv7LfOz74v32ljC24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778080439; c=relaxed/simple;
	bh=Oo4i4j0mTt7dtOMl1Y8KVKIr7pZfRNebOGCP7BQL4P0=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Cc:Subject:From:
	 References:In-Reply-To; b=jgMpBZCf/u1evuA2BGsa1zVB1/K+f9LRp3aYEWFbwWBgZyy3zLdYbjzgKXwgQ1vij7gkmrQqRMnzcaSNkCKS9tcUMssSTDixZsVCnxRUPRne0zMyhVktXVh2pLUTQ2aAs9RgtzpSn24yEixAH3pJTyqr2suygrKb99fr8kFE90c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vIUtfowo; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vIUtfowo"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-43eb05b1875so3536309f8f.3
        for <linux-samsung-soc@vger.kernel.org>; Wed, 06 May 2026 08:13:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1778080436; x=1778685236; darn=vger.kernel.org;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kIXyjuQuCOrl0qpSAMQmNPe9xAI4vxQ6Y9W1Xz3sToY=;
        b=vIUtfowoWmKBAWDDOHM0mBaF5KndlEk6uNkx4WWXVRjiQQtcpEgW/7HlkMX74odaUB
         FuamaI4iXoEHnGU3WBl12iR7Tz7eIEdSy7pvUxh9LRL6JJNETI+DL5of41U1jhgptcwT
         SOZNo8Z5FRk4vn9WtDpuclhsgGR7EGx3Q3V57H6IiVx1SgFLKtoeLXAZ9wt5cMIbQzgn
         FsmOD/RhTSeeF67d1NeSsE8501v29GaRz12Tj9U06ewWOqmImuGtROJctMlIFtuADlmq
         ZQwJJLmRcP5DLaFelf3qQeiVS1gl2mREZnm5wsXLmRNovXGKPS2fjjW38XvMAy05PURu
         vz3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778080436; x=1778685236;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kIXyjuQuCOrl0qpSAMQmNPe9xAI4vxQ6Y9W1Xz3sToY=;
        b=Lmu1BsHiwI7StJCoHsG8FAos/BF7+7/qkx4NDEOGWkR4y8Mv8TGjUVsaloM+yANSOZ
         jlAoFrmkf20a0GNFb3OoZ5v7wJ4sRd/TLH1pqxIUxD58lNxEjT7O61hum6e31Ls3W9+G
         cwDeb49+1fOPF5lT/jXgxfww9q/xEnKiG9huYdyUzJtEa4FIprC4KmWlszL9jDEU7Ds9
         fFjokFvZhSs3HnEAiU0j4ylyMPU92aw72vc8Ds0OzaWIR2+gFEfdTW65/3qfVnuNLF6i
         epq7E6edEtj5w3ApEx7SrUSb3Y/D8xjKcKVplOVS+U4rOFtjaj7acVg+sOQ4XtpttPgp
         h8Pw==
X-Forwarded-Encrypted: i=1; AFNElJ+7IlnP5ExRC4RFPooR4XHDfxUA7BY/QL4M77x0sGP6yPAfOt0JOWUjRmQ1PsJrccqpqPivx+ImpR0V8ZYhyxjdTQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxlCdZIvqnKswmDUsjhpg6hj+hk0njLz8ctmlkyy0fuGCF1CZ1w
	/HrR1f4v07kfOeS38rSvK5Im2y8T0tAeOPICWAyGo8ko6pfgYcZpcuD+J6mDbwpalWhblNkd6ud
	p1Ebv
X-Gm-Gg: AeBDiev34SRxhN1dKoIsaNUUahXSuGGy2cW7Y+jLD+X48FOdy92lOqNhJONER6Jr9iv
	7yXsTXObbeO6AuHAwmaLh0oHBqXMGwEOgD7Up3GZDUIp0L6rx5wYnQ5wWerVR0ssnGjVt14EXJ5
	bF4IQeotWzDYD7bbB1HIHt9JSl+5a1n2jmqfvGzqNfZdKLUGQkpjHSNyhXgK7oFgx0e4WCfeN+s
	pvQ/VnyjZSLPgVxLEstmoYrHh9Np02e8QGyNl/ub8zLP53vff1DcexdGa8vnhf3YR+J5hpNPhqx
	S+f3jhuEez3wf7ALAtT2F0QiFV/wvfA5bJi//SEZ2i6/Y8cXpn/HpP6h1xQwNmY1BCZALVrZxWH
	js0gOqRMjJqZneoKOQOtR3NdvpJLYDJdbGDAefDnHw4BAJzE3uo+06HgDFu3e5857s8bK4IFF1v
	w1c1+GocmijRRZU+2z9uyO0djHxWP+40F1JWyc/BixjS2F02Y3nFuhejvre/4ZAJzeb9x15MKNq
	PYiHwR53+sLAGWBzZeMwXf9i05tcB6MbplzQiA=
X-Received: by 2002:a05:6000:288b:b0:451:26e1:3cd1 with SMTP id ffacd0b85a97d-4515d5c56bfmr6478647f8f.35.1778080435844;
        Wed, 06 May 2026 08:13:55 -0700 (PDT)
Received: from localhost ([2a00:2381:fd67:101:da69:ce01:65af:7871])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4505238e174sm13297431f8f.1.2026.05.06.08.13.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 May 2026 08:13:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 06 May 2026 16:13:54 +0100
Message-Id: <DIBOWQYHOPOU.3PCLCL8030WRL@linaro.org>
To: "Tudor Ambarus" <tudor.ambarus@linaro.org>
Cc: "Krzysztof Kozlowski" <krzk@kernel.org>, "Michael Turquette"
 <mturquette@baylibre.com>, "Stephen Boyd" <sboyd@kernel.org>, "Lee Jones"
 <lee@kernel.org>, "Alim Akhtar" <alim.akhtar@samsung.com>, "Sylwester
 Nawrocki" <s.nawrocki@samsung.com>, "Chanwoo Choi" <cw00.choi@samsung.com>,
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 <linux-kernel@vger.kernel.org>, <linux-samsung-soc@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-clk@vger.kernel.org>,
 <peter.griffin@linaro.org>, <jyescas@google.com>,
 <kernel-team@android.com>, "Krzysztof Kozlowski"
 <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH 5/6] firmware: samsung: acpm: Add TMU protocol support
From: "Alexey Klimov" <alexey.klimov@linaro.org>
X-Mailer: aerc 0.20.0
References: <20260506-acpm-tmu-helpers-v1-0-a9cd5daf8355@linaro.org>
 <20260506-acpm-tmu-helpers-v1-5-a9cd5daf8355@linaro.org>
In-Reply-To: <20260506-acpm-tmu-helpers-v1-5-a9cd5daf8355@linaro.org>

On Wed May 6, 2026 at 12:39 PM BST, Tudor Ambarus wrote:
> The Thermal Management Unit (TMU) on the Google GS101 SoC is managed
> through a hybrid model shared between the kernel and the Alive Clock
> and Power Manager (ACPM) firmware.
>
> Add the protocol helpers required to communicate with the ACPM for
> thermal operations, including initialization, threshold configuration,
> temperature reading, and system suspend/resume handshakes.
>
> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  drivers/firmware/samsung/Makefile                  |   1 +
>  drivers/firmware/samsung/exynos-acpm-tmu.c         | 239 +++++++++++++++=
++++++
>  drivers/firmware/samsung/exynos-acpm-tmu.h         |  28 +++
>  drivers/firmware/samsung/exynos-acpm.c             |  12 ++
>  .../linux/firmware/samsung/exynos-acpm-protocol.h  |  18 ++
>  5 files changed, 298 insertions(+)
>
> diff --git a/drivers/firmware/samsung/Makefile b/drivers/firmware/samsung=
/Makefile
> index 80d4f89b33a9..5a6f72bececf 100644
> --- a/drivers/firmware/samsung/Makefile
> +++ b/drivers/firmware/samsung/Makefile
> @@ -3,4 +3,5 @@
>  acpm-protocol-objs			:=3D exynos-acpm.o
>  acpm-protocol-objs			+=3D exynos-acpm-pmic.o
>  acpm-protocol-objs			+=3D exynos-acpm-dvfs.o
> +acpm-protocol-objs			+=3D exynos-acpm-tmu.o
>  obj-$(CONFIG_EXYNOS_ACPM_PROTOCOL)	+=3D acpm-protocol.o
> diff --git a/drivers/firmware/samsung/exynos-acpm-tmu.c b/drivers/firmwar=
e/samsung/exynos-acpm-tmu.c
> new file mode 100644
> index 000000000000..c68d60b4c0b3
> --- /dev/null
> +++ b/drivers/firmware/samsung/exynos-acpm-tmu.c

[..]

> +static int acpm_tmu_to_linux_err(s8 fw_err)
> +{
> +	/*
> +	 * ACPM_TMU_INIT uses BIT(0) and BIT(1) of msg.rx.ret to flag APM
> +	 * capabilities. Treat zero and all positive values as success.

ACPM_TMU_INIT returns capabilities inside designated error field?
What about other messages/commands? They just return error code there?

> +	 */
> +	if (fw_err >=3D 0)
> +		return 0;
> +
> +	if (fw_err =3D=3D -1)
> +		return -EACCES;
> +
> +	return -EIO;
> +}

Could we map these return values with better granularity instead of
returning -EIO for everything else that is not minus one?

Is this error code convertation applies only to TMU protocol?

[...]

Best regards,
Alexey

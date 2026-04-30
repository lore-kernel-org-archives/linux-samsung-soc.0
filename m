Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9442039D6E3
	for <linux-samsung-soc@vger.kernel.org>; Thu, 30 Apr 2026 10:27:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777544860; cv=none; b=jXobNp7gVhpoFpmU7g/6iTb4pqbF40Yxm+7JM27JCtzcMjARg7UeTX54B6OX2mgbRNN3IllwzBIwNdzXlpNPeytsvvOJiS4UZano7nt89m6521JxRSQqzXWief+aRG7l0AhEBEIEAjzpCqzyqWjgYWtdM19iWEGEaRWfR5xGzhU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777544860; c=relaxed/simple;
	bh=vENJ+C81bb9efHvds7kbMpLjqIJ06ZgJQ3cEdIMWx6Y=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=ICYy+5yFYvEE93LUxKXvwlPrHUoQgir/qfT0nkoSabbaO4Gz28W3PfUDhXlERAptebuVLgdpzgZTH98WifPvlkyPKdPe5b1XcA0bFbqYOM4fGaneFiTs/VvB9oKf1T9COOpWa7AQRsLeoOe073vmGkywP8zoUBK+hw2nn7a0m0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OqV6qhIX; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OqV6qhIX"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-4486b5fcf3cso686735f8f.2
        for <linux-samsung-soc@vger.kernel.org>; Thu, 30 Apr 2026 03:27:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1777544856; x=1778149656; darn=vger.kernel.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qJtC8axtxZ6PlTBw/4plYqbYMGHIdhbjoFEFpeBa84g=;
        b=OqV6qhIX3q/VcRiCHjx/JandIIOdYFpMvKdfWQGwbXzhJyfeS7nIWmOaQx3bGEjqI4
         LRPemS7zFMMel9ZGdlB38awxOzzsYMesBQqlQtVLj6+UxHzDuTxDAdu3lzoV+CvnL/cZ
         NT3GFnc+U19nXPIdli9RwT+1QBX1x2ucTfk1CS2fxo3mDWS9oXOr7dT6RjyhQMTr08px
         LuXAVpJ+cDa71SoYxal5PKkxUNoiNJIQly3XgqxoSKtRN4FKKXVPZif+m6p9CFQ9v4kP
         LDt2liBkOIYDg2bD4wrjV/uNI7pq8I5qzgFiEGJA31mI/PChjbE49g+VIjq7ik03czdJ
         oJgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777544856; x=1778149656;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qJtC8axtxZ6PlTBw/4plYqbYMGHIdhbjoFEFpeBa84g=;
        b=nGjUzowyVWVygN9dpXGj8PdGF2K1quz52bfP2PPJfSSAdkOefttr7ZeiIZQSNjiWZr
         0QByAsGgXHHZP0TX1SP2UmlGtvfITkZHjnytDxGdLfNaaZnE/yECpa6H/MayNEemedvA
         7zBsNQ50Yul+lkbmv04ojBkSjfObueNBhif3ZRriZdmwUwVyNAuqLM95fkC0n15CWpse
         ij24sW8PeDTLwcJLt5TJL7g+iU3kXH+57j4HqbfjJ6eUHNqBSoHq1an+Zby4Cj18lzHZ
         boI0cURRqia6JpgweeZcZBapPyNAAPYEOdowSqt5BxhNr8VslVLMcq1eCrjzb+s9aVjx
         28rA==
X-Forwarded-Encrypted: i=1; AFNElJ+zfZzYxVtoO9HRR5K7jFrvxVBqcKfEG+6dZ8eZsj/mir6KbzTs9Fwpntwa0nbUJwlXkAblkCNljSUaOqS7NLRVIg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzRtY4YB3+bPhWQmMMztAzC3V17RrjKtkP4wDIajpW1roYQqDwo
	mDc/tni948VLINeKjEoSFQh1yH+KWoduUYKwjyMzGupR24rPXyhisNHvjqFi5aXOWuA=
X-Gm-Gg: AeBDiev8WT3MYFqX4BFdd3WdcsZUD/Hhv/mqkGjWnppnnMhlSGJqpGP7tsgeu/8JZ7x
	z0zTNmVWz1+F0MyiLF1KMr6g371/9oEww+nPFLmQqGQI3nudEm9VE/ieHrOxYaSOv3gdAhYJd3w
	8Vzw6JdrlfLl+rrlHI3ycXq4+uMVlYE6aU3Bh5CqVhKGR/gF8h+oH6XzkWaJMr9lp0m403lZRrg
	TqvE2ZORFcXlosIuMnSxAICd0HhKqV4a2hzPZN6IngW8j2E9IoFw4qPo/bT8ReP7sORTfPBiBp1
	0AqN+o8Ttx3Gys4fZThFzI01JwftIc73V5zmYjfKi+mqKXs71GmKD5WlL3Qz5Idj0jmvg78ESRY
	MdFViCfuMXJhf+ooHvy/JRqG5TALlYFYGCT+z+hzwmsoo7dd6whax2RGacpE9MQL0vAi/s7V5CN
	G/NTO1V/4rBUwlGAcnGxhkoTbVTkTJx1RP4FxwytZlgZLxdUMYcDt2uhUuzJdizj2/ntfay0yDm
	Z7FAjYByd5TuFlLodO4cbsog0Y+
X-Received: by 2002:a05:6000:2383:b0:43c:4810:dc4a with SMTP id ffacd0b85a97d-4493ffcb2b1mr3621503f8f.38.1777544855840;
        Thu, 30 Apr 2026 03:27:35 -0700 (PDT)
Received: from localhost ([2a00:2381:fd67:101:9e61:b264:2b8d:1e57])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-447b7218622sm12070800f8f.21.2026.04.30.03.27.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Apr 2026 03:27:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 30 Apr 2026 11:27:34 +0100
Message-Id: <DI6F28VL7ZGX.1ZJNLS41FF55N@linaro.org>
From: "Alexey Klimov" <alexey.klimov@linaro.org>
To: "Alexey Klimov" <alexey.klimov@linaro.org>, "Sam Protsenko"
 <semen.protsenko@linaro.org>, <linux-samsung-soc@vger.kernel.org>,
 "Krzysztof Kozlowski" <krzk@kernel.org>, "Peter Griffin"
 <peter.griffin@linaro.org>, =?utf-8?q?Andr=C3=A9_Draszik?=
 <andre.draszik@linaro.org>, "Conor Dooley" <conor+dt@kernel.org>, "Alim
 Akhtar" <alim.akhtar@samsung.com>
Cc: "Tudor Ambarus" <tudor.ambarus@linaro.org>, "Rob Herring"
 <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 4/6] soc: samsung: exynos-pmu: add Exynos850 CPU
 hotplug support
X-Mailer: aerc 0.20.0
References: <20260430-exynos850-cpuhotplug-v3-0-fd6251d02a17@linaro.org>
 <20260430-exynos850-cpuhotplug-v3-4-fd6251d02a17@linaro.org>
In-Reply-To: <20260430-exynos850-cpuhotplug-v3-4-fd6251d02a17@linaro.org>

On Thu Apr 30, 2026 at 2:56 AM BST, Alexey Klimov wrote:
> Add cpuhotplug support for Exynos850 platforms. This SoC requires
> its own specific set of writes/updates to PMU and PMU interrupts
> generation block in order to put a CPU or a group of CPUs into
> a different sleep states or prepare these entities for a CPU_OFF
> or wake-up out of idle state or after CPU online.
> Without these writes/updates the CPU(s) wake-up or online fails.
> While at this, also add description of Exynos850 PMU registers.
>
> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
> ---
>  drivers/soc/samsung/Makefile                |  2 +-
>  drivers/soc/samsung/exynos-pmu.c            |  1 +
>  drivers/soc/samsung/exynos-pmu.h            |  1 +
>  drivers/soc/samsung/exynos850-pmu.c         | 79 +++++++++++++++++++++++=
++++++

[..]

> +const struct exynos_pmu_data exynos850_pmu_data =3D {
> +	.pmu_cpuhp =3D true,
> +	.cpu_pmu_offline =3D exynos850_cpu_pmu_offline,
> +	.cpu_pmu_online =3D exynos850_cpu_pmu_online,
> +};
> +

Ah, sorry, I forgot to remove blank line here. Will do in the next
update.

BR,
Alexey


Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D9822E3376;
	Sun, 24 Aug 2025 18:09:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756058955; cv=none; b=sO7pSSxJWQdAE7iKr0vSG0DVKm3pCPYLjBrHm1/V7vdebQ9uqoXZfuCfEjUdO9DZAIFNbZmWaF4cokjAVW9CdaqZaPGsRPHXmORuMp+JZMMAL76VkZ+sItdJYpX5r1tNS1YJxD6neMDPltbW2ek+OZQwcpfQoB9xcQbhr9fSz4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756058955; c=relaxed/simple;
	bh=np+VrBVospNSVz3iEYSM8cUG8EfYPYLfyDd/NbXqYT8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HJKT2lrX0mIJvpkVojkwHiAHR1gqfQBG3QRig9ewIU7AgMKmN7rvvvXNKVbu+VkLAFo5znw9IA1C9iOluFjn/kLAMkphBmFsP7XWcIXjnZs3knstVXU8pvniml9Gnxef93VgInHCdVQe00ixvb4+9JLTe0mJC50fJkRyBQLE5J4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QllgAN/3; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QllgAN/3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2105AC4CEF4;
	Sun, 24 Aug 2025 18:09:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756058955;
	bh=np+VrBVospNSVz3iEYSM8cUG8EfYPYLfyDd/NbXqYT8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=QllgAN/35E0N/fl3OlfDYFxmkkjUQq8LaArzXX6nlr85KfEQTpilF3S+9ZIWD0cSW
	 lz0RAgL0ZVGJYHk6x8vqogdd0c8ATf3HKxG1nLyhsxeGb5jLo6OaOEPmFSXveqcBB8
	 Lj2t47+67V0Agu+b/qlUPLZucnLpqUY5h/JoDVeUjfcjHqDxv/zVDDxwxxLlV3Ouel
	 2fcIs9NAffNwAC/SyxdR/zrCXZ5eMhV/aMGSJVoc04udjSFOBItNUPrVaK1P2VkQvo
	 1dmjonveLmM5kfc8w+ahlPEr8Nj50Gp87W06s/gc9lWAdUbOSwjtxc8E0dfJB/pnCQ
	 ahfo1RTB0SZxA==
Message-ID: <ca2b3b24-91dd-478f-888e-4f46dd26a672@kernel.org>
Date: Sun, 24 Aug 2025 19:11:38 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] firmware: exynos-acpm: add DVFS protocol
To: Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Peter Griffin <peter.griffin@linaro.org>,
 =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org, willmcvicker@google.com, kernel-team@android.com
References: <20250819-acpm-clk-v1-0-6bbd97474671@linaro.org>
 <20250819-acpm-clk-v1-2-6bbd97474671@linaro.org>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <20250819-acpm-clk-v1-2-6bbd97474671@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 19/08/2025 13:45, Tudor Ambarus wrote:
> Add ACPM DVFS protocol handler. It constructs DVFS messages that
> the APM firmware can understand.
> 
> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
> ---
>  drivers/firmware/samsung/Makefile                  |  4 +-
>  drivers/firmware/samsung/exynos-acpm-dvfs.c        | 85 ++++++++++++++++++++++
>  drivers/firmware/samsung/exynos-acpm-dvfs.h        | 21 ++++++
>  drivers/firmware/samsung/exynos-acpm.c             |  5 ++
>  .../linux/firmware/samsung/exynos-acpm-protocol.h  | 10 +++
>  5 files changed, 124 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/firmware/samsung/Makefile b/drivers/firmware/samsung/Makefile
> index 7b4c9f6f34f54fd731886d97a615fe1aa97ba9a0..80d4f89b33a9558b68c9083da675c70ec3d05f19 100644
> --- a/drivers/firmware/samsung/Makefile
> +++ b/drivers/firmware/samsung/Makefile
> @@ -1,4 +1,6 @@
>  # SPDX-License-Identifier: GPL-2.0-only
>  
> -acpm-protocol-objs			:= exynos-acpm.o exynos-acpm-pmic.o
> +acpm-protocol-objs			:= exynos-acpm.o
> +acpm-protocol-objs			+= exynos-acpm-pmic.o
> +acpm-protocol-objs			+= exynos-acpm-dvfs.o
>  obj-$(CONFIG_EXYNOS_ACPM_PROTOCOL)	+= acpm-protocol.o
> diff --git a/drivers/firmware/samsung/exynos-acpm-dvfs.c b/drivers/firmware/samsung/exynos-acpm-dvfs.c
> new file mode 100644
> index 0000000000000000000000000000000000000000..ee457c1a3de2ff2e4395d9fc3ff4c13294473b2d
> --- /dev/null
> +++ b/drivers/firmware/samsung/exynos-acpm-dvfs.c
> @@ -0,0 +1,85 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright 2020 Samsung Electronics Co., Ltd.
> + * Copyright 2020 Google LLC.
> + * Copyright 2025 Linaro Ltd.
> + */
> +
> +#include <linux/bitfield.h>
> +#include <linux/firmware/samsung/exynos-acpm-protocol.h>
> +#include <linux/ktime.h>
> +#include <linux/types.h>
> +#include <linux/units.h>
> +
> +#include "exynos-acpm.h"
> +#include "exynos-acpm-dvfs.h"
> +
> +#define ACPM_DVFS_ID			GENMASK(11, 0)
> +#define ACPM_DVFS_REQ_TYPE		GENMASK(15, 0)
> +
> +enum exynos_acpm_dvfs_func {
> +	ACPM_DVFS_FREQ_REQ,
> +	ACPM_DVFS_FREQ_GET,
> +};

These are actual values for hardware/firmware? If so, please use rather
defines.

Rest looks good.

Best regards,
Krzysztof

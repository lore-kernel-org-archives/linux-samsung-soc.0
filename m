Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA34920E30E;
	Fri, 18 Oct 2024 06:32:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729233156; cv=none; b=iQhshzoIkGDxEgsnFbYRlTe42v6k8MN3PPJiQw24MTyErySl1XXYoCoQz1Wm7JGq+ZynBpEl5SGqdJ5oD3/+q1GXiR8k7q7FDCY4KhI+Q18ZwyYO2prpdv1clBQz6ta8S8Re347C9b0BweeAw7ltuUOiHkfLA9wkRFPkigHhmiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729233156; c=relaxed/simple;
	bh=EnUwPW7HoPLOfLN2+uJ+xCsmQHstEx9fnNHE5H5mR0s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pI/E5WTu0SjVJ17AKKg/t2rvIiUAGVPrc9Ro5OEHfsRzykWrgTbvNmzX+WpfdEsRiwxtcWkUP70S7DYp9gHYd4SSpSmNkA8DHqd2hPDrd0ahzzrbVSewczJl+ht7j0LTLo1c+WJtKu+lfQGmPmrtdgPpRaOzm9llPMSfv/I4c5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GcrpCD8K; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GcrpCD8K"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59C4CC4CEC3;
	Fri, 18 Oct 2024 06:32:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729233156;
	bh=EnUwPW7HoPLOfLN2+uJ+xCsmQHstEx9fnNHE5H5mR0s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GcrpCD8K5de0gfBddqhcRaulw2jdw7B+CZrIOjcQYlq/5bA4rDB3dyhlnujmXAzvt
	 QTsDYiPLPrp/x7wBaHuO2Ji5KcIHXnPor0MfbqN3CCfJfRcoMxM2ldiwYxIi3cSmRL
	 RJGKr0Jetfm3bKpJ1q3tYL3+yKzp7BlqqdvdvKDE/LCuVBzQGrZHYeu9eSyD8XUu0n
	 d8ccWsamOb3AJqF3XDwQFouhZZluNsDiPPP2vZOjBxKepzSSdcGh7pIbGSmpALdDY6
	 +Yu1T4ItATMHYkc/VfqNTAy/sfqNHVUTgN1AxOIvUHyv4wKfpGwZPROWxdDhIpi8iu
	 smigCvrtn/5wQ==
Date: Fri, 18 Oct 2024 08:32:32 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Umer Uddin <umer.uddin@mentallysanemainliners.org>
Cc: Alim Akhtar <alim.akhtar@samsung.com>, Rob Herring <robh@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	igor.belwon@mentallysanemainliners.org
Subject: Re: [PATCH v2 2/4] arm64: dts: exynos: Add initial support for
 Samsung Galaxy S20 Series boards (hubble)
Message-ID: <px4lfzrmgppve7rhwihjg3fbejemxtufoxlxu6r4igvuynuim7@vu2w746zuxlk>
References: <20241017164328.17077-1-umer.uddin@mentallysanemainliners.org>
 <20241017164328.17077-3-umer.uddin@mentallysanemainliners.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241017164328.17077-3-umer.uddin@mentallysanemainliners.org>

On Thu, Oct 17, 2024 at 05:43:25PM +0100, Umer Uddin wrote:
> Add initial support for the Samsung Galaxy S20 Series (hubble) phones.
> They were launched in 2020, and are based on the Exynos 990 SoC.
> The devices have multiple RAM configurations,
> starting from 8GB going all the way up to 16GB for the S20 Ultra devices.
> 
> This device tree adds support for the following:
> 
> - SimpleFB
> - 8GB RAM (Any more will be mapped in device trees)
> - Buttons
> 
> Signed-off-by: Umer Uddin <umer.uddin@mentallysanemainliners.org>
> ---
>  .../dts/exynos/exynos990-hubble-common.dtsi   | 109 ++++++++++++++++++
>  1 file changed, 109 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/exynos/exynos990-hubble-common.dtsi
> 
> diff --git a/arch/arm64/boot/dts/exynos/exynos990-hubble-common.dtsi b/arch/arm64/boot/dts/exynos/exynos990-hubble-common.dtsi
> new file mode 100644
> index 000000000..2c634e4bb
> --- /dev/null
> +++ b/arch/arm64/boot/dts/exynos/exynos990-hubble-common.dtsi
> @@ -0,0 +1,109 @@
> +// SPDX-License-Identifier: GPL-2.0 OR BSD-3-Clause
> +/*
> + * Samsung Galaxy S20 Series device tree source
> + *
> + * Copyright (c) 2024, Umer Uddin <umer.uddin@mentallysanemainliners.org>
> + */
> +
> +/dts-v1/;
> +#include "exynos990.dtsi"
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/input/input.h>
> +#include <dt-bindings/interrupt-controller/irq.h>
> +
> +/ {
> +	chosen {
> +		#address-cells = <2>;
> +		#size-cells = <2>;
> +		ranges;
> +
> +		framebuffer0: framebuffer@f1000000 {
> +			compatible = "simple-framebuffer";
> +			reg = <0 0xf1000000 0 (1440 * 3200 * 4)>;
> +			width = <1440>;
> +			height = <3200>;
> +			stride = <(1440 * 4)>;
> +			format = "a8r8g8b8";
> +		};
> +	};
> +
> +	memory@80000000 {
> +		device_type = "memory";
> +		reg = <0x0 0x80000000 0x0 0x3ab00000>,
> +		      /* Memory hole */
> +		      <0x0 0xc1200000 0x0 0x1ee00000>,
> +		      /* Memory hole */
> +		      <0x0 0xe1900000 0x0 0x1e700000>,
> +		      /* Memory hole */
> +		      <0x8 0x80000000 0x1 0x7ec00000>;


If I am counting correctly, that's only 8 GB, not 12.

Best regards,
Krzysztof


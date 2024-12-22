Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAC4113B7AE;
	Sun, 22 Dec 2024 08:44:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734857054; cv=none; b=YxBg8DCtbrOFzp1fbJ/SQtDkNBBKSH8zwspkqw/ttnLh9dh7hIt0N90iwLQRwv/GU2dIS97rBMOqNxUXbLNjyiRI/Q3ohmrw61nqVRJfFHybj0nbucDqeItSgORh6X0b8Jpyu17yq9vyLiXj9SsQo+84Tf/loycL2xIR670Fh+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734857054; c=relaxed/simple;
	bh=FulWww1sbzJO3b867Nrkdh4wLx+LMHxeVucGOcRpMlw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GqID161THaoF8kOU3sHDLdxEp47Du4Qrr9rc4bqZLvtDmFu/q5CZ2Lb3nTraXcGt3mQYkJp6IjwbiiUsD9Tc9SDBPnGq/4FRgYs2qSEHabErbmMsOAJVY0kSrkvUJ3mXpkwC68tGLQKm75Ygkru3Vm584AhzCC2gxE9jm42P6qk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=occDcVq7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="occDcVq7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7DF7CC4CECD;
	Sun, 22 Dec 2024 08:44:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734857053;
	bh=FulWww1sbzJO3b867Nrkdh4wLx+LMHxeVucGOcRpMlw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=occDcVq7Cz4JxWPiwSEBYMPGgqf+goJ/jE8rwNcja5D7WIFIeP7sep21RJf2L2H5Q
	 s1lr1lbKeQEgw0kYvc71nLn6thbNSgobV5FZt3DSPb4zOicfj5HCtQKsEF/hYvtWUV
	 0c27JHIKlg7xFlDrloZSqoE8dXoCH7CMjX2T8RlTXw/CTx5XLbVrhh7r7K1/OfBkaX
	 UggAk7LghIyA6H0rOenIIBTc48+NkZEHDaTTDEPZK3/jt+p4/fgJiHxnTrG2vuVE8T
	 tL5lC8JYYqpndGkINvcQ1IPsAe8Ek7uW8iMd0oCvdDMwuCBZ3UMfELz4Uz/UrYYOMJ
	 WBlBtnPNxGDqg==
Date: Sun, 22 Dec 2024 09:44:10 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, andre.draszik@linaro.org, 
	peter.griffin@linaro.org, kernel-team@android.com, willmcvicker@google.com, 
	daniel.lezcano@linaro.org, vincent.guittot@linaro.org, ulf.hansson@linaro.org, 
	arnd@arndb.de
Subject: Re: [PATCH v6 2/5] dt-bindings: mailbox: add google,gs101-mbox
Message-ID: <uo4zvw4sl6uxsj2ewvoue7l3obugivq5z74ukwnd4sj3ndtwhu@hxxque3r4nvb>
References: <20241220-acpm-v4-upstream-mbox-v6-0-a6942806e52a@linaro.org>
 <20241220-acpm-v4-upstream-mbox-v6-2-a6942806e52a@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241220-acpm-v4-upstream-mbox-v6-2-a6942806e52a@linaro.org>

On Fri, Dec 20, 2024 at 01:49:57PM +0000, Tudor Ambarus wrote:
> Add bindings for the Samsung Exynos Mailbox Controller.
> 
> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
> ---
>  .../bindings/mailbox/google,gs101-mbox.yaml        | 70 ++++++++++++++++++++++
>  include/dt-bindings/mailbox/google,gs101.h         | 14 +++++

Drop the header, not used.

>  2 files changed, 84 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/mailbox/google,gs101-mbox.yaml b/Documentation/devicetree/bindings/mailbox/google,gs101-mbox.yaml
> new file mode 100644
> index 000000000000..a1fbc3b2b9de
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mailbox/google,gs101-mbox.yaml
> @@ -0,0 +1,70 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +# Copyright 2024 Linaro Ltd.
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mailbox/google,gs101-mbox.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Samsung Exynos Mailbox Controller
> +
> +maintainers:
> +  - Tudor Ambarus <tudor.ambarus@linaro.org>
> +
> +description: |

Drop |

> +  The Samsung Exynos mailbox controller, used on Google GS101 SoC, has 16 flag
> +  bits for hardware interrupt generation and a shared register for passing
> +  mailbox messages. When the controller is used by the ACPM protocol the shared
> +  register is ignored and the mailbox controller acts as a doorbell.
> +  The controller just raises the interrupt to the firmware after the
> +  ACPM protocol has written the message to SRAM.
> +
> +properties:
> +  compatible:
> +    const: google,gs101-mbox
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +  clock-names:
> +    items:
> +      - const: pclk
> +
> +  interrupts:
> +    description: IRQ line for the RX mailbox.
> +    maxItems: 1
> +
> +  '#mbox-cells':
> +    const: 0
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +  - interrupts
> +  - '#mbox-cells'
> +
> +additionalProperties: false
> +
> +examples:
> +  # Doorbell mode.

Drop comment, not applicable now, I think.

Best regards,
Krzysztof


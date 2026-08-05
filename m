Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A85623BED4F;
	Wed,  5 Aug 2026 21:10:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785964264; cv=none; b=tKf1hYWQIfxV5JKOmiI7qc6xCP5p1tLAb4ey2y6pbrYUHkUEnXWgUQh+iDyqdQwA/bXxBkhVGVt2kqzM67OjrqiAtXXrTzcM8K36EQlCKZ0wBdvjplXGOcZ1D7L9myYVoEiShDkNWYcWL/PG6/wXS/kTMZLjry/Xw7s0TcanVq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785964264; c=relaxed/simple;
	bh=u2MzKtUhXWoW5pNBBqbaSR33sJx/OJ3sbg2J3tK5LC4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ozZVQx0SMsAN7JwQyhBVfwtkkA7gLD/qTWZ0tj0SmNw7c0NYzAYu1Hw6MCCkLRn+VCmrahy54Anh6mxHPGcH9HSxMsXUaI12S0/fovXmJzcpWLbo4zm6PQPIm00gclbQK8iYJT/k8+nG1GTlw6Ko4tmZ82nyRUkdFLLT1+SDTtw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kPmWNwcW; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kPmWNwcW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33ECD1F000E9;
	Wed,  5 Aug 2026 21:10:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785964255;
	bh=HOnt+mlWKgahltXJogjp3RXlb2gzBmZSb7vGUrLlr+o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=kPmWNwcW/a2+GTDqsCuxybRSLYK6rygLIowK+o0tF6OmRIvWaNJFyQlgRrlA5qrGA
	 JOnog+xabydNVu+zWzJ8mYUplnfwQgNCiY+LYcVCAVh1qhGKoR21iIZ2TZbVvtHyqT
	 63kK8kw7vKw/RGInQxfznoDxEE4Tu7GyeeohwD1T5DmLgIkkR5SAYzT3SBUbYgivy2
	 iejUl19x0hiCewezJHsaPH2HmGfd1A00NmrmOhizhB2oOzr7m2bxV5/hhIYPRxqVcR
	 PRoPOd6RK7IoPLBX8B7/pZDWwT3WnifvHhx5xJQ5TY4Umf8PH2Az2E1LcTaq09IJQp
	 G760Lb+L5rFpA==
Date: Wed, 5 Aug 2026 16:10:54 -0500
From: Rob Herring <robh@kernel.org>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Lee Jones <lee@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Lubomir Rintel <lkundrak@v3.sk>,
	Dmitry Osipenko <digetx@gmail.com>,
	Shree Ramamoorthy <s-ramamoorthy@ti.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Joseph Chen <chenjh@rock-chips.com>,
	Chris Zhong <zyw@rock-chips.com>,
	Zhang Qing <zhangqing@rock-chips.com>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Andreas Kemnade <andreas@kemnade.info>,
	Jonathan =?iso-8859-1?Q?Neusch=E4fer?= <j.neuschaefer@gmx.net>,
	Julien Panis <jpanis@baylibre.com>,
	Matti Vaittinen <mazziesaccount@gmail.com>,
	Alexander Kurz <akurz@blala.de>,
	=?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>,
	mfd@lists.linux.dev, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH 00/10] dt-bindings: mfd: Use generic power-controller
 schema
Message-ID: <20260805211054.GA1783131-robh@kernel.org>
References: <20260804-mfd-syspower-v1-0-a440783c2e78@nxp.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260804-mfd-syspower-v1-0-a440783c2e78@nxp.com>

On Tue, Aug 04, 2026 at 10:16:35PM +0800, Peng Fan (OSS) wrote:
> The generic power-controller.yaml schema has been added to dt-schema[1],
> providing a common definition for the `system-power-controller` boolean
> property. Convert MFD bindings that locally define this property to
> instead reference the shared schema.
> 
> The common change across all patches is:
>  - Add a $ref to /schemas/power/power-controller.yaml#
>  - Remove the local `system-power-controller` property definition
>  - Switch from additionalProperties to unevaluatedProperties
> 
> This is a pick of patches 2-11 from [2], rebased to linux-next/master,
> no changes. Patch 1 (the generic power-controller.yaml schema itself)
> is dropped since it has already been picked up by dt-schema.
> 
> [1] https://github.com/devicetree-org/dt-schema/pull/187
> [2] https://lore.kernel.org/all/177523251875.1559844.9690289848283345069.b4-ty@b4/
> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
> Peng Fan (10):
>       dt-bindings: mfd: ene-kb[3]930: Use generic power-controller schema
>       dt-bindings: mfd: ti,tps65910: Use generic power-controller schema
>       dt-bindings: mfd: rockchip,rk8x: Use generic power-controller schema
>       dt-bindings: mfd: ricoh,rn5t618: Use generic power-controller schema
>       dt-bindings: mfd: netronix,ntxec: Use generic power-controller schema
>       dt-bindings: mfd: ti,twl: Use generic power-controller schema
>       dt-bindings: mfd: ti,tps6594: Use generic power-controller schema
>       dt-bindings: mfd: rohm,bd71828-pmic: Use generic power-controller schema
>       dt-bindings: mfd: fsl,mc13xxx: Use generic power-controller schema
>       dt-bindings: mfd: samsung,s2mpg10-pmic: Use generic power-controller schema

Can we hold off on this until at least the next cycle. This change 
effectively bumps the minimum version of dtschema. While 
power-controller.yaml is added to dtschema, it is not yet in a released 
version. I'm not all that sure these changes are much improvement given 
it is a single boolean.

Rob

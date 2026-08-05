Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2531D481658;
	Wed,  5 Aug 2026 21:13:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785964395; cv=none; b=cHgBmCcHP9EXKNq2eu8Kh/VgfGNYpo+KMDVWAYqsvcf3Wfresp5XsqikY09L59RakcGUCAS9lS3MGknYwECzeyIWYhffRlXRE95CsYxQ+xVE5FXOXH7PZj/V3LzFZLhOX01HE27AOFbVfz/bC9glRezy4y0uP7Rauv/1kXqFBe0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785964395; c=relaxed/simple;
	bh=IccJcjZKXaLUO5taPWCPJ8eduAPPU4QfCEFCOx/VtDc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AOuOQl2YolgFxeusrNYkN8j11eTltKBsuTSMUzvA4Ad2XYBQaUUOTYi+whPd5F5NtRQhzxkkA7S27Mzou6e7rxyW0g6x/ZkKVbw87iXQP+zTJYMGe7PCVBKmUVk20wI9O6L1YSAfOuuXc9orgD7kYjcB7npFgDSElgoGvHIkc+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HydHWDqm; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HydHWDqm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79BE51F000E9;
	Wed,  5 Aug 2026 21:13:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785964380;
	bh=UC3IO8cIp/jhpoXZx6fPB2Bw4heXNVKT+nG8vL5ge50=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=HydHWDqmDA4oYO1lXbKSt6JxI4wlEWZr0Fnnri09qzeBwKTC+Hc14TpFgCu82ZWmM
	 USmb/p2zBO4ELQc+GUYsrzESrO98fYQf2+kknu9nPjVBnfYNMvBsofrF85WKAB33EL
	 pAfRrd/f3AcKqqGqTOesUVNxCyDWJwjlTftVzt1162VBFa5Ogdhi7SkrLHVTVepkmo
	 98mYOwhVTQaPffJuK6CG+d2cTxWS6PtN42bcr+7hYStleZjDqalk66SGsLtnZ4E1L3
	 y2K8u4MlQE/ZcmWNlgc2U45OucgC/kumrOq/Cpipf62Lrs2UJh06yZJVXrMTe9njLZ
	 HVtFVevgEBOdQ==
Date: Wed, 5 Aug 2026 16:12:59 -0500
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
Subject: Re: [PATCH 02/10] dt-bindings: mfd: ti,tps65910: Use generic
 power-controller schema
Message-ID: <20260805211259.GB1783131-robh@kernel.org>
References: <20260804-mfd-syspower-v1-0-a440783c2e78@nxp.com>
 <20260804-mfd-syspower-v1-2-a440783c2e78@nxp.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260804-mfd-syspower-v1-2-a440783c2e78@nxp.com>

On Tue, Aug 04, 2026 at 10:16:37PM +0800, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> Mark the "ti,system-power-controller" as deprecated and include a reference
> to power-controller.yaml to uses the common definition.

There's little point in doing this. You can't change existing DTs and 
you'll have to support both properties in the driver forever. Maybe if 
there are new devices added and new platforms.

Rob

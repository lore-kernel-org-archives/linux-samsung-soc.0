Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15EE6271468;
	Mon, 13 Apr 2026 22:16:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776118601; cv=none; b=AA3Lhi+ppGjHZwBIexC/TqDWU3bTMN5CjfMfkfz0crSzO1YPiOqVb3TgzED+gyLzUSGT4P1fMhJNgain+aQbXxABEttrwct5dQpvxCcTVw/1EEFJQmtlGD0LYiv77/+nc64Bt9qqnJDReMyeZ5+q177sv2XRtQPmrW4KSSh8v78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776118601; c=relaxed/simple;
	bh=ZPV8j6woHqmMX+C+tViyHCpt/QUU2vIwRkFqnvR4S8Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iYZIe3AhowKUAP/+mYJ6XafjPHGsCDNmbJrNfndfurtDB/5jVoLt0tQ57xpX9fptL9KC/9aQb52vJZPIxmupVuCuoPmkYmiGKAsbf4GJO1biBzTfwc6FZRuV0ZWHWnDJgwE55xRGkmNAtr+jjtuZdRtHtX8xrs00SqXQZXzkPdQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rqT71u8R; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rqT71u8R"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66E5BC2BCAF;
	Mon, 13 Apr 2026 22:16:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776118600;
	bh=ZPV8j6woHqmMX+C+tViyHCpt/QUU2vIwRkFqnvR4S8Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rqT71u8RzdXSnF6K5fsbFr8URahNmMY1Rv4dyxQI7yrHpedW6u3XrxQEpxSlmkUor
	 iKfOCkF8Uj6aL1LOj09ekvcNHCE+CqsvrwyJRci2FLKEOHP7HDtU4irV8OfaC/WnDQ
	 ueNt/NVYgWP7t/Iw2mWjjVsu5wD+5L2AjveLBgxmVO5pgSPJtyNZhW94TQiVMnWhvA
	 DLmxGH44CUy2T1fD00kLmMw/wCDgYDLxkeGGA8Pm4s2VoSno1aQ7PufadXRZQANg0T
	 R/tBUDXAhzxatYm/UQYkvB6iqp20FylFBZXHicpk1DTy8OID6AwHO6VfOYNb4s4JQy
	 alfVXcniysCHQ==
Date: Mon, 13 Apr 2026 17:16:38 -0500
From: Rob Herring <robh@kernel.org>
To: Alexey Klimov <alexey.klimov@linaro.org>
Cc: Sam Protsenko <semen.protsenko@linaro.org>,
	linux-samsung-soc@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	=?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/7] dt-bindings: soc: samsung: exynos-pmu: add
 samsung,pmu-intr-gen phandle
Message-ID: <20260413221638.GA3624532-robh@kernel.org>
References: <20260401-exynos850-cpuhotplug-v2-0-c5a760a3e259@linaro.org>
 <20260401-exynos850-cpuhotplug-v2-2-c5a760a3e259@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260401-exynos850-cpuhotplug-v2-2-c5a760a3e259@linaro.org>

On Wed, Apr 01, 2026 at 05:51:55AM +0100, Alexey Klimov wrote:
> Some Exynos-based SoCs, for instance Exynos850, require access
> to the pmu interrupt generation register region which is exposed
> as a syscon. Update the exynos-pmu bindings documentation to
> reflect this.
> 
> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
> ---
>  .../devicetree/bindings/soc/samsung/exynos-pmu.yaml    | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml b/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
> index 76ce7e98c10f..92acdfd5d44e 100644
> --- a/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
> +++ b/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
> @@ -110,6 +110,11 @@ properties:
>      description:
>        Node for reboot method
>  
> +  samsung,pmu-intr-gen-syscon:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description:
> +      Phandle to PMU interrupt generation interface.
> +
>    google,pmu-intr-gen-syscon:

Does this mean the driver is just going to have to look at both 
properties for the same thing? If so, just use the existing property. We 
don't need 2. Yeah, 'google' in Samsung SoCs is a bit weird, but that's 
Samsung's fault for not upstreaming support for their h/w first.

Rob

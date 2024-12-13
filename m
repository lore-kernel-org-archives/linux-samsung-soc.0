Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19893189B8D;
	Fri, 13 Dec 2024 08:57:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734080259; cv=none; b=U9W5jAgcnmIwuJ0Rq2o+QSA16sF0cbw1EfIzrTAMy43YPRoiE+GGoVfkV1o/FpzDyZldM5+4ilftaNYyUyO8v+AcDUB78u94GKf7oF1sseP3Zzsf+f2WrxG12HUESr27km3JA9ZRkMnw9egLw0oEqV0depvt6d/IOYhTxSVCgSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734080259; c=relaxed/simple;
	bh=xDmSPde6zgTTU8RgYt3vl6ZlezjpwcKd+HV0Kib8ULM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OoZAGhdqnXYNVcF9ZGSFNheJw12E00Zgd1w24xZ63gaZ0CT/jhHjR3vJ5Z5sAfFUw55Ccj+mRet7ESHvkLfdOJ7E+Vt/tXhTdmeDN/V5Z3AA/1EkO2ll1SwXFzDBy9gEe5TxE9kq2UeQrnPFvBSM0VW0ZlPM+3C5FZF9YNyxMg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=t+veKa6H; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="t+veKa6H"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2DC4C4CED0;
	Fri, 13 Dec 2024 08:57:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734080258;
	bh=xDmSPde6zgTTU8RgYt3vl6ZlezjpwcKd+HV0Kib8ULM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=t+veKa6H3gfVGJH2pAd/wzzzO4upCTB9lprVGLB9pVR5PZD2IJNs0R6M8zIG1Y+oH
	 Fa4fzTKihME5boi/Nak035iEoiIzLNoOdQTJGwEk0vhM/Wk4bWbEJCsaHaa2e9qArg
	 QSpqsuk4z2oQUy9m+Am8mw+UQCaW8r+lZj6iwe/tpLhnmnVnYxG0tOsjMxrXlnHYgE
	 E3X1WuwtrwfmluwzR5KMKvxUH7INsHCVPNh/qUmdN6ZvnuTDBFd7L67qjxYNDcNIKH
	 +4mEHNQ7HbLobs0YTokloCjApWgb2GXISJpsh46VuNPOMKsiFfsfmbCceCRdyLBH7x
	 eD8elA9PmuISw==
Date: Fri, 13 Dec 2024 09:57:34 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, andre.draszik@linaro.org, 
	kernel-team@android.com, willmcvicker@google.com, peter.griffin@linaro.org, 
	daniel.lezcano@linaro.org, vincent.guittot@linaro.org, ulf.hansson@linaro.org, 
	arnd@arndb.de
Subject: Re: [PATCH v4 1/3] dt-bindings: firmware: add google,gs101-acpm-ipc
 binding
Message-ID: <qwwd2hqcqtk27kw3f4jtnxwu2joebr5ysyusomqlnsdu3wbcco@ldurbcu5ymr6>
References: <20241212-b4-acpm-v4-upstream-firmware-v4-0-3f18ca64f1b9@linaro.org>
 <20241212-b4-acpm-v4-upstream-firmware-v4-1-3f18ca64f1b9@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241212-b4-acpm-v4-upstream-firmware-v4-1-3f18ca64f1b9@linaro.org>

On Thu, Dec 12, 2024 at 03:46:22PM +0000, Tudor Ambarus wrote:
> +properties:
> +  compatible:
> +    const: google,gs101-acpm-ipc
> +
> +  mboxes:
> +    maxItems: 1
> +
> +  shmem:
> +    description:
> +      List of phandle pointing to the shared memory (SHM) area. The memory
> +      contains channels configuration data and the TX/RX ring buffers that
> +      are used for passing messages to/from the ACPM firmware.
> +    maxItems: 1
> +
> +

If there is going to be new version, just one blank line above.

Anyway, wearing DT hat:

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

(I'll review drivers a bit later)

Best regards,
Krzysztof


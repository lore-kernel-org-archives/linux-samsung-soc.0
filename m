Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD00218C937;
	Mon,  3 Mar 2025 09:10:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740993051; cv=none; b=UXj9mT39bVhKod0fUp9AbkKxxJBiWCRWwRWWPWOY4UVwy3K1unvX4NfJ2/lepz3R7gq4MnYkDWwvhGsjs0HWmu2+UilyfxAuSoCm2qbi/Uhpw/h5dEhXjVqlWADSM0z2iax1ZRlQpsQPrpeVdA9NfBNr5tHWeZcwmf0C9qngNBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740993051; c=relaxed/simple;
	bh=rQhuOhPQN+FZjrqXHcNYZMzBbVyBkKtzpG5IcXStqR8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MQd73sBUIpCRAWCnO0Qy5Ez+DMHwcXxSSjD66/sfyfhK78pPhPB5NhUd23+BjTo5vWbqunjrgsld+sDRQkZom7SoeX4O90s0xhAt/i/Irs+2Fs259wMA3f6c3OO9uRKdQpJQ4wJzalI12D/r6IcLBwj8CS3X+aurFrdCkKNr8Wc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RXBGCcFN; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RXBGCcFN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3101C4CED6;
	Mon,  3 Mar 2025 09:10:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740993051;
	bh=rQhuOhPQN+FZjrqXHcNYZMzBbVyBkKtzpG5IcXStqR8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RXBGCcFNN5gm4B/UBhQRJynuGQLRDdWPsWpYTdmJRsPjjfKdWZXQ5jrPIXqmgUWfq
	 NlzKeDul7PAk0gqc8gTqP2YkQxyxcySHjm9xLWZEePPU8bTEavVcPqszz/jLR3Vcmv
	 ijZ3m/3oeaBr5CnLzNMFS5oqmcYqDIuMF7+jmIQWwDTkYRvI8JWcKS3nl+swa11l44
	 9b6SzMqwkbJPiLWFqsjiNFiaB3VtKagM73SChIc8M9rDwXgoqZt712F057rGARYzKj
	 O+6gahZBSWAj2zscHAj9zSbUeiRjSHL1AL+HBSI4/WvIB9OjXLabSrCu7f04v1n07S
	 xbDHKLWhRXJiw==
Date: Mon, 3 Mar 2025 10:10:48 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Kaustabh Chakraborty <kauschluss@disroot.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, 
	linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v3 2/3] mfd: sec: add support for S2MPU05 PMIC
Message-ID: <20250303-screeching-quartz-puma-9ea09a@krzk-bin>
References: <20250301-exynos7870-pmic-regulators-v3-0-808d0b47a564@disroot.org>
 <20250301-exynos7870-pmic-regulators-v3-2-808d0b47a564@disroot.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250301-exynos7870-pmic-regulators-v3-2-808d0b47a564@disroot.org>

On Sat, Mar 01, 2025 at 01:07:13AM +0530, Kaustabh Chakraborty wrote:
> Add support for Samsung's S2MPU05 PMIC. It's the primary PMIC used by
> Exynos7870 devices. It houses regulators (21 LDOs and 5 BUCKs) and a RTC
> clock device.
> 
> Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
> ---
>  drivers/mfd/sec-core.c              |  12 +++
>  drivers/mfd/sec-irq.c               |  34 +++++++
>  include/linux/mfd/samsung/core.h    |   1 +
>  include/linux/mfd/samsung/irq.h     |  44 +++++++++
>  include/linux/mfd/samsung/s2mpu05.h | 183 ++++++++++++++++++++++++++++++++++++
>  5 files changed, 274 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


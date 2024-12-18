Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BFF21991D8;
	Wed, 18 Dec 2024 09:29:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734514173; cv=none; b=mZbR4vyfkbtLN/8uDkdE08hmAyanAd2iXxrptX2UQ4GymykfUkkBTG+2J+UKUFGCbj+mC6I1hSjvGxyEG3RwZuiSLaqfBecrxBPUyYFfsTOvNvZOTrzupne6LW2HIlsfN9CzT9SI/tgBsVCcgodJG3nwzudU/NWucIZ4lY1gFyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734514173; c=relaxed/simple;
	bh=uMaQBYgrV9ljE06+tLk+AuJ83F3ius8rQBr+XfzzbO0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hdAfeyDCTSEXzYAALMe/eq30bl3nVoQy/kz72RwS+i/NM8nsWGB5PryolTnz6IAPZ8wdr2g1veZLy6Y/eurVQzoZ9LuouJp8kSqY/fkU3m2e4bmsh50+FkLtfVc79GVTx8eIBwVUIPmLluU0RICIjXIGbxrALFt0jpYZ1m/S6Vw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=C0I9Qd33; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="C0I9Qd33"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0BF8C4CECE;
	Wed, 18 Dec 2024 09:29:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734514171;
	bh=uMaQBYgrV9ljE06+tLk+AuJ83F3ius8rQBr+XfzzbO0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=C0I9Qd33zvtdsN/mTMLlAOklkK9LWTPCxQFnMrSQs346GFZy6sgeHiyZ4WXSBiLNM
	 vQOXNMj0ZKxht8O/MWag+GaYy/CzxK3bdADBj5MlK1hvs5qGoR7cmz/M0BvcD4r+fO
	 0S2Pw8evoWMTtddKsmxY+fDNzHL4YXvpNg8KWW650FtQeahVpryCiI2GUv+WBzwXOl
	 47IzG0bW8YXUHZHFb+rXJzetR/0lL2VGM92Vv+8JhXc54pyKwgL5OgmAax7l56jHKy
	 Ke3ObkW4fSgX5tvNdDfovCODI9mf/4mw95fwLCTLrGQvUTUQU1xJaV0Du1dokwjwDL
	 I5W9M91ogjdDQ==
Date: Wed, 18 Dec 2024 10:29:28 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, andre.draszik@linaro.org, 
	peter.griffin@linaro.org, kernel-team@android.com, willmcvicker@google.com, 
	daniel.lezcano@linaro.org, vincent.guittot@linaro.org, ulf.hansson@linaro.org, 
	arnd@arndb.de
Subject: Re: [PATCH v5 1/3] dt-bindings: mailbox: add google,gs101-mbox
Message-ID: <wlvvuq2ldv4funye2ylnccq7soyrqkqggg36oimnvmhxbbjvnl@yyy4y5nyruzn>
References: <20241217-acpm-v4-upstream-mbox-v5-0-cd1d3951fe84@linaro.org>
 <20241217-acpm-v4-upstream-mbox-v5-1-cd1d3951fe84@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241217-acpm-v4-upstream-mbox-v5-1-cd1d3951fe84@linaro.org>

On Tue, Dec 17, 2024 at 09:40:20AM +0000, Tudor Ambarus wrote:
> +description: |
> +  The samsung exynos mailbox controller has 16 flag bits for hardware interrupt

If there is going to be any new posting:

The Samsung Exynos mailbox controller, used on Google GS101 SoC, ....

> +  generation and a shared register for passing mailbox messages. When the
> +  controller is used by the ACPM protocol the shared register is ignored and
> +  the mailbox controller acts as a doorbell. The controller just raises the
> +  interrupt to the firmware after the ACPM protocol has written the message to
> +  SRAM.
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
> +    description: |
> +      <&phandle type channel>
> +      phandle : label name of controller.
> +      type    : channel type, doorbell or data-transfer.
> +      channel : channel number.
> +
> +      Here is how a client can reference them:
> +      mboxes = <&ap2apm_mailbox DOORBELL 2>;
> +      mboxes = <&ap2apm_mailbox DATA 3>;

This ordering assumes there is channel "2" in doorbel and in data, so
two times "2" and of course the same for all others. If this is
configuration of one channel, so "2" is either doorbell or data, then
type should be the last.

With that assumption:

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


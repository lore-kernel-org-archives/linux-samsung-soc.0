Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54B8D2857EA;
	Thu, 13 Nov 2025 08:04:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763021052; cv=none; b=u8DIirKS/ckzhevMAoTDQJzBhdqnItiVSSuFm2076vT6050bOTiCUjkN0lkgV0h5Db3k35CrlnEjw5YY97I+oC0zJotK/z28wRzcuqCmjRhiKWX+tuV7pj5vX0owgVe++9rE1Paa/4bco6JbyOd5hvE1bEpeClpo//7a13TJLHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763021052; c=relaxed/simple;
	bh=i1oNMIHvWsAeS3i6DTVuOuI5Z+m3+7ctncfDc4TLaio=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PvspONucFFyjbHbekYCu4JrUdZCteXXa+qdbrEMNbJbQ5mIE2DNWMr6zLsWOd5Zd6A3LmWCW+7ncu2ahl69W62xtVOKXaxyHe60Ig5Xg1tC5ukrZj7mCSbSLZ63iiDk53TlPG7gyZZbMcoxNN0JZ68n0csFW/MyHzfe4qRWbAI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZBE1EexD; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZBE1EexD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 526C0C4CEF8;
	Thu, 13 Nov 2025 08:04:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763021051;
	bh=i1oNMIHvWsAeS3i6DTVuOuI5Z+m3+7ctncfDc4TLaio=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZBE1EexDU5SbeIBNCQGmYj8/m63V4lR+zfzROzdqGDKjM2mL7y4rq5P9DWb66k2tb
	 AbTrQ+JE+LKrzBP2phVxlorNSmnAu17Vv7LoJ18WZWegW4whxD6JYO3aSOSSDtFtL4
	 d+9JLOPAWLtwea/5qGJKhNUYjymYcLYYUNFt05BgmffDSZRhs9MHdXA5xwJqhIZ2dT
	 oWT+CUXqI2jP7Av/cQNClyxFYPnFxkpFMEa9fWKuZhnoiJJvybKoeMNo5+iKs+ApJo
	 5xl0FR0D778RAbRDBApao8GcAE9zrmVk3Ms5VW7NJnmURMNi2GQNmoQjIqUwVwtSXY
	 z+1+n5lIFfKUA==
Date: Thu, 13 Nov 2025 09:04:09 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Roy Luo <royluo@google.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Peter Griffin <peter.griffin@linaro.org>, 
	=?utf-8?B?QW5kcsOp?= Draszik <andre.draszik@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	Joy Chakraborty <joychakr@google.com>, Naveen Kumar <mnkumar@google.com>, 
	Badhri Jagan Sridharan <badhri@google.com>, Doug Anderson <dianders@google.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH v6 1/2] dt-bindings: usb: dwc3: Add Google Tensor G5 DWC3
Message-ID: <20251113-stoic-authentic-angelfish-c52a32@kuoka>
References: <20251112123257.3755489-1-royluo@google.com>
 <20251112123257.3755489-2-royluo@google.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251112123257.3755489-2-royluo@google.com>

On Wed, Nov 12, 2025 at 12:32:56PM +0000, Roy Luo wrote:
> Document the device tree bindings for the DWC3 USB controller found in
> Google Tensor SoCs, starting with the G5 generation (codename: laguna).
> 
> The Tensor G5 silicon represents a complete architectural departure from
> previous generations (like gs101), including entirely new clock/reset
> schemes, top-level wrapper and register interface. Consequently,
> existing Samsung/Exynos DWC3 USB bindings are incompatible, necessitating
> this new device tree binding.
> 
> The USB controller on Tensor G5 is based on Synopsys DWC3 IP and features
> Dual-Role Device single port with hibernation support.
> 
> Signed-off-by: Roy Luo <royluo@google.com>
> ---
>  .../bindings/usb/google,lga-dwc3.yaml         | 140 ++++++++++++++++++
>  1 file changed, 140 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/usb/google,lga-dwc3.yaml

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


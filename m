Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 813752690ED;
	Mon, 16 Jun 2025 08:16:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750061760; cv=none; b=mTVgxI0xbrPFx2OfOBT21d/ZTEJR8n9FX/IJt6rj0iWYEc/VNSVwEjIjLjtIJ1Z8RU6WFWWp8b/PNCJqJdduJ6cCJcA8G3LFBp4GPJAutGqfLplz8PZh4pfgW+fGCEUT9i9l2RZS2NTGs6PiOQFegma4UH5/BafSa3gBlyBPb8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750061760; c=relaxed/simple;
	bh=MzI1E+oOIoSk80d4S3TvWsn/IU5ID9KI4c1rk+PvR4c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pglX8B4JhD9RPPy3Io4wNNeF2u+87KIcwFkjepnWNJVk2YQXH1x3Xvvh4hm4A6/OMCHNVSr2hyTJRRWxvY5dul85Jg58/TtfplOLLjm3MbSCac9iOYo4jyNwLZ5JCtt2++PFsKRDQdaxfoYQCEsN+3NTHvWR2P774/13dOcxoww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YAsx8iw2; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YAsx8iw2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4611C4CEEA;
	Mon, 16 Jun 2025 08:15:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750061760;
	bh=MzI1E+oOIoSk80d4S3TvWsn/IU5ID9KI4c1rk+PvR4c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YAsx8iw2J+P8iF16mbNBojULCRJaBQw2oBbEDuBkQ4KNUNupDYsn5kl7aR6HTar7O
	 YdWPfQkHo8709sXukjS939uiygkNpS4JS8ltNiIGeVw6Y8eodN2WSjXJIlC9DfsTob
	 okqRDWrx6uFdjHOp2vnZYiv08M+qBEl3ZwBFH6fSE79y6q8xupKhdhrYLTNJ7mM/L2
	 7vdMZh+59JlJJhWlzt0FPpf+n+jYG3MFE6qitS+ZNudIp6OQkBFVe7fBPVkVEyArDU
	 7YQZd3mmgsXC2vvxrZMs0XWEnB8nsv5j21HienB9q4WF9SBFWJaEVAjg8kXiO7xbvk
	 f2CH+5CV2EqHA==
Date: Mon, 16 Jun 2025 10:15:57 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Pritam Manohar Sutar <pritam.sutar@samsung.com>
Cc: vkoul@kernel.org, kishon@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, alim.akhtar@samsung.com, 
	andre.draszik@linaro.org, peter.griffin@linaro.org, kauschluss@disroot.org, 
	ivo.ivanov.ivanov1@gmail.com, m.szyprowski@samsung.com, s.nawrocki@samsung.com, 
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, rosa.pila@samsung.com, 
	dev.tailor@samsung.com, faraz.ata@samsung.com, muhammed.ali@samsung.com, 
	selvarasu.g@samsung.com
Subject: Re: [PATCH v3 4/9] dt-bindings: phy: samsung,usb3-drd-phy: add
 ExynosAutov920 combo HS phy
Message-ID: <20250616-snobbish-chimpanzee-from-arcadia-bd9fcb@kuoka>
References: <20250613055613.866909-1-pritam.sutar@samsung.com>
 <CGME20250613055050epcas5p3f995a6696ccf4f7eeb0b5d76382f71f7@epcas5p3.samsung.com>
 <20250613055613.866909-5-pritam.sutar@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250613055613.866909-5-pritam.sutar@samsung.com>

On Fri, Jun 13, 2025 at 11:26:08AM GMT, Pritam Manohar Sutar wrote:
> Add a dedicated compatible string for USB combo HS phy found in this

I reviewed patch #1, then went here and see that this is HS PHY. So
patch #1 is not HS PHY?

Best regards,
Krzysztof


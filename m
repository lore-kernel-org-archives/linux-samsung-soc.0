Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A371747F;
	Tue,  7 Oct 2025 05:51:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759816290; cv=none; b=gVfyGrn1gzuQosz7QG+plN7f96r0+u2UxbGcZmDdvu3KnhE6ArvD5rNLSjTHt7FksRhDhJ5rZwFUZq7q8IJXXWgQn7LZMc01vbxgp+0VvIxHPNm003I8mvczNq3Tf+mP5MYU/CznGWBcIRGWB0iYzw93mRS/ONd0/R4uB0V6udA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759816290; c=relaxed/simple;
	bh=LPQQPlIwuR2+Qcdx0QIWLHqlQNGepDAbb03LkBRGWUE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d0kEsFH/w8myI/5faQDJ2yBbgelCUR+cly+NDYVV4qncNvWcKPEXdqv6JfupNLv/uwBVOc4DNylLBCK4M7fV9+tH5gWOcFbRjbjgjsr2UDnEGTPbjoAekSxdjLojaf20PaQpjO5tXTfXIyBLxWRDqfJ164RG6eYofo1P5a1YiEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=JAJlWI1h; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="JAJlWI1h"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 384EAC4CEF1;
	Tue,  7 Oct 2025 05:51:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1759816289;
	bh=LPQQPlIwuR2+Qcdx0QIWLHqlQNGepDAbb03LkBRGWUE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JAJlWI1h8cZeELmkitk9Hz2GVuULYk1cHI3gCRt/ZfSKrGohI+U9rVFP8ZXwFrSa9
	 DW/iLS9KT0KU+6L0wk+LFrZMaDdcd0RIeAbBO49gFGrHqZu2RNnBuGI2/+9phU+GhB
	 Y9c1+pAR4MLaUzmZetibux383gBX/aA7BoudcwkM=
Date: Tue, 7 Oct 2025 07:51:27 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Roy Luo <royluo@google.com>
Cc: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Peter Griffin <peter.griffin@linaro.org>,
	=?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Joy Chakraborty <joychakr@google.com>,
	Naveen Kumar <mnkumar@google.com>, linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH v1 3/4] usb: dwc3: Add Google SoC USB PHY driver
Message-ID: <2025100735-gulf-error-2ce2@gregkh>
References: <20251006232125.1833979-1-royluo@google.com>
 <20251006232125.1833979-4-royluo@google.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251006232125.1833979-4-royluo@google.com>

On Mon, Oct 06, 2025 at 11:21:24PM +0000, Roy Luo wrote:
> Support the USB PHY found on Google Tensor SoCs.

That's great, but that's not what your subject line says (it says "usb:
dwc3")

> This particular USB PHY supports both high-speed and super-speed
> operations, and is paired with the SNPS DWC3 controller that's also
> integrated on the SoCs.
> This initial patch specifically adds functionality for high-speed.
> 
> Co-developed-by: Joy Chakraborty <joychakr@google.com>
> Signed-off-by: Joy Chakraborty <joychakr@google.com>
> Co-developed-by: Naveen Kumar <mnkumar@google.com>
> Signed-off-by: Naveen Kumar <mnkumar@google.com>
> Signed-off-by: Roy Luo <royluo@google.com>
> ---
>  drivers/phy/Kconfig                 |   1 +
>  drivers/phy/Makefile                |   1 +
>  drivers/phy/google/Kconfig          |  15 ++
>  drivers/phy/google/Makefile         |   2 +
>  drivers/phy/google/phy-google-usb.c | 286 ++++++++++++++++++++++++++++

And as others said, you don't need a whole new directory for one single
.c file.

thanks,

greg k-h

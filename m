Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CE99398FB9;
	Fri,  5 Dec 2025 06:05:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764914730; cv=none; b=LFV8KAX0cdo1/XcGN2jd1rwg7ctgma00SZf/HlnOWSBeIzr585eKTOUYL3b62cYPJU9JkKfH6aJZYCdWjyvWhYNULqGAQXgduSdbfv3IzwYbxyfzrGu3oiYvwjzDqBGSE8qo1M5JcCYSREPT+4WUJi0WGndJcSJQ23ocfBOb+8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764914730; c=relaxed/simple;
	bh=jab9snt46oPpyIlOxpmF0rFOtQv/+fyPPNBeaMr1cIw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lx6FUhO47nDgq+2bpoir5YEOByZkQDgQcFol4mNzfMiL0y1CtiPhXuHMgHiPyVlw39mYEfxIFYp/Nn0wZo+nNTb2atwiPGFvaStl6Et+AqXGFH7fElpkazdgwGaWVN3WeaoVPq03oCX2MNCc6YB8HPUCAAEmoNXu4r5LJZuRfl8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=ysHn1/ZB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="ysHn1/ZB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79510C4CEF1;
	Fri,  5 Dec 2025 06:05:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1764914730;
	bh=jab9snt46oPpyIlOxpmF0rFOtQv/+fyPPNBeaMr1cIw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ysHn1/ZB7IVhRmNXcEX77XYvFL5Tth6pQYyODG62Q5P5fRGU2k91InSh4EOy8mEdV
	 7PUZC7RNjslG6UVWiVjCqX8Z2bxP1VlFpY4b0WS6IgRv5FA0mO/30lYJXSUPOdZf5e
	 Sv6mkHFeApBsVGUVcuET1rXH0PVAEh0AipEoKyNY=
Date: Fri, 5 Dec 2025 07:05:24 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Roy Luo <royluo@google.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	=?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Badhri Jagan Sridharan <badhri@google.com>,
	Doug Anderson <dianders@google.com>, linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	Joy Chakraborty <joychakr@google.com>,
	Naveen Kumar <mnkumar@google.com>
Subject: Re: [PATCH v9 2/2] usb: dwc3: Add Google Tensor SoC DWC3 glue driver
Message-ID: <2025120553-suffrage-divisive-5890@gregkh>
References: <20251205-controller-v9-0-9f158b18f979@google.com>
 <20251205-controller-v9-2-9f158b18f979@google.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251205-controller-v9-2-9f158b18f979@google.com>

On Fri, Dec 05, 2025 at 02:26:38AM +0000, Roy Luo wrote:
> +config USB_DWC3_GOOGLE
> +	tristate "Google Platform"
> +	depends on ARCH_GOOGLE || COMPILE_TEST

There is no ARCH_GOOGLE in the tree now, so how is this supposed to
work?  Shouldn't tools that check for "invalid config options" trigger
on this?

thanks,

greg k-h

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0FB81C5D6A;
	Mon,  1 Sep 2025 21:36:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756762612; cv=none; b=N4uOxIUv5iZ3aGC8XdISy07G33uGAhV/XEazb93eTdin0JKWh4ziQjg+CrLVHPrR1ohWS+EuSlqAyhu2RxI5Lj90l8be5pydtoxZ8phdkrpY2kiHzyj51m9jpAgusiRYTZTMp3ByNBQH8N6NnIAXOsMW5GdHTl/wbYbHTzHe6GU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756762612; c=relaxed/simple;
	bh=/VwsRtkf+UQjoJQCltm2n7rC7ZNkfCMHAtZoj9SYAoM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dhbKohXUS1Mlp2mqHBZFDky2nBDu4/FT+YafQi6Jp0HLkz0cZQ5Y2vAlfPIkUxskc7Gze7xRL1+1zfu0VumhntJPQMmMV3XCAVKFw8IxpcsNGzyR8UU0aLyIluAntuZA139O6ukfcVOKrdphKwwH+NUO7H/bp4OfU/v3zMj+YzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WR9x4nD5; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WR9x4nD5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CBD0FC4CEF0;
	Mon,  1 Sep 2025 21:36:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756762612;
	bh=/VwsRtkf+UQjoJQCltm2n7rC7ZNkfCMHAtZoj9SYAoM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WR9x4nD5mYppOBzRfQSkxm81iBYsxGRWcszsJt8sbAAxey5vAaNGJHkH1XIPXisn0
	 fsNfW0+R1HySPCR6as9SgO6O1yK46w8W3KJJ9sWezje+VopTCLWEOdFaGtSNSUY0xf
	 i4V/Rbw5V8Qu7bLnmm1H/GHe/ku6UhwPGRyl0LjSDlFN2S/KqbyKJKnf3xJ6KLeuAG
	 3xjaMCRzzCQGnLskabc8nAYbTTXZwAinY4Kpmgg/xmudOvnqGwYkXv+Xhyk4TV8Txt
	 GzQJvsDXEIEGK0Y8wgtWMN4WhXXehSPp+0kaiEjryN6AJVG8W0HLkpEyH1RXJ0Frxa
	 2WVij89GLHJ6w==
Date: Mon, 1 Sep 2025 16:36:50 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	Alan Stern <stern@rowland.harvard.edu>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	Conor Dooley <conor+dt@kernel.org>, linux-usb@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v2 2/2] dt-bindings: usb: s3c2410-usb: Drop entirely
 S3C2410
Message-ID: <175676261030.385621.4936391711475637356.robh@kernel.org>
References: <20250831122222.50332-3-krzysztof.kozlowski@linaro.org>
 <20250831122222.50332-4-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250831122222.50332-4-krzysztof.kozlowski@linaro.org>


On Sun, 31 Aug 2025 14:22:24 +0200, Krzysztof Kozlowski wrote:
> Samsung S3C24xx family of SoCs was removed the Linux kernel in the
> commit 61b7f8920b17 ("ARM: s3c: remove all s3c24xx support"), in January
> 2023.  There are no in-kernel users of remaining S3C24xx compatibles.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---
> 
> Changes in v2:
> 1. None
> ---
>  .../devicetree/bindings/usb/s3c2410-usb.txt   | 22 -------------------
>  1 file changed, 22 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/usb/s3c2410-usb.txt
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


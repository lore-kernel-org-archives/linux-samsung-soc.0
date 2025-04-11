Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58E931AA786;
	Fri, 11 Apr 2025 13:42:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744378936; cv=none; b=Z5Z4kwOrgLW3thXOmlCGoVnE/fJJLS7CRI1ypDsDWaUvxW5jQUOsccT3GnSRCG5jck3lpROH1cPI92tjJMk0RbVmxZ/ODo1g2fMx3reuE4YjtFtVeUYtxjRugnACCQkw5b0zlO83+hXj++Q/aMThUERud4M5jhkZkqIdPoF6jQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744378936; c=relaxed/simple;
	bh=nS4mtmxGRp+CcFT9tVDGPOWxYtnM+243zUP7ZIU9t4U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WqUKmTSAZYUMKHrLCygYwIEmA9PImJNvhvWi66/B9Re7J5c+SBfbt+gbsC35soJxXe2uQMAhdXbUrJCbmfCVCMv1v3DKcOIpKXL6gkLFL6q1B/wjMeiBfLLjqW34kYD06/aooLTTQoSrL/5SEJhaIJujlLdpgT3yeyJJ12SAgL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=wveHEQwU; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="wveHEQwU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A547C4CEE2;
	Fri, 11 Apr 2025 13:42:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1744378935;
	bh=nS4mtmxGRp+CcFT9tVDGPOWxYtnM+243zUP7ZIU9t4U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=wveHEQwU8QrxS6q3qjGn/QYQwFp5Wu9bwvhXBzF5ePMzmcNztJHnud0AdX+yOVylA
	 YOyQBQ2tHfE8TjwG7Z8IGtk1XrzHRw8sgDKX205WpOQVcsaAwlNiWTZVHubUn1k+99
	 GrJBgVvG4AdvJ+p86Lx61F/sN+3BAoPBSpnoLy/4=
Date: Fri, 11 Apr 2025 15:42:12 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	devicetree@vger.kernel.org, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH v3 1/2] dt-bindings: usb: samsung,exynos-dwc3: add
 exynos2200 compatible
Message-ID: <2025041157-stilt-sculptor-c978@gregkh>
References: <20250321144804.1435502-1-ivo.ivanov.ivanov1@gmail.com>
 <20250321144804.1435502-2-ivo.ivanov.ivanov1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250321144804.1435502-2-ivo.ivanov.ivanov1@gmail.com>

On Fri, Mar 21, 2025 at 04:48:02PM +0200, Ivaylo Ivanov wrote:
> The Exynos2200 SoC has a DWC3 compatible USB controller and can reuse
> the existing Exynos glue. Update the dt schema to include the
> samsung,exynos2200-dwusb3 compatible for it.
> 
> Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../bindings/usb/samsung,exynos-dwc3.yaml          | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)

This doesn't apply to my tree, can you rebase it and resend the series?

thanks,

greg k-h

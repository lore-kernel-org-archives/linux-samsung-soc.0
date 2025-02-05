Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EBB7219A6E;
	Wed,  5 Feb 2025 08:47:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738745243; cv=none; b=G0SlsNWbPlrhHiBcJ83b5WrUxuPVA87g148NjjBCCO0Q65mTQ6+QgSMEeqZj1XooDzIeYgZhtkSD6pEB1AYR16ID/UI+DJY5HwljjlbOEvAdwj4VhfxDKBVTQ5k0HXkyiXKCNaL6V0MwcBNimGKdrcmhjRHo2nSOZxYDczos6kU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738745243; c=relaxed/simple;
	bh=uneNg+O/MbXGyjnuoovNGs4oaGpveM8WtUe65AIHv6Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B1G23zkhPmRtktttpR5kOLN6dWC9KtM5ICUjTvyiBSV1WX8Zazi4wev56rw+8Dy9FENKyGOE4ze88cqKdAw2CHhtGbyr/DbDBiSXMLIZT+vwVMORT5+Q+2/YpYxp3u0CjDyJ6rgKZs867RYNlxTPbEM1L31MbG9p6aEBzwSOccI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DyTw/sdD; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DyTw/sdD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4BEDFC4CED1;
	Wed,  5 Feb 2025 08:47:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738745243;
	bh=uneNg+O/MbXGyjnuoovNGs4oaGpveM8WtUe65AIHv6Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DyTw/sdDiOx7NIo9rTHCia+SRptdfIeprG4LZHe0P1Qh5WKSCALQMPLxEzqVrJ84m
	 wrt5OYQRa2DnuGE6Xlg7uetNaaE5zva7jyZ6t3VOfPrYyEsznS9L4gvOZUQ7ZJr/7E
	 sjMl9HMDyYxJyIUyepFzzW6thdIleLPMh5jixajDMshZa/VbFsWC3PgYtlT40zEfmz
	 e+UlB9oQyxO64HCJG7i8pF89xxcoAv0CDl82XB9uS/HoPlflBv9+zMbJ2OdYMJuieA
	 bfYrfsRBFXQMlDOPtXWe+maVtbaDCm1TOE75rnT09dGd4JGVpnmGdDClAt6SVbiefd
	 U1JyNeODHG7oA==
Date: Wed, 5 Feb 2025 09:47:19 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Kaustabh Chakraborty <kauschluss@disroot.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Rob Herring <robh@kernel.org>, Conor Dooley <conor@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
	Sergey Lisov <sleirsgoevy@gmail.com>, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] usb: dwc3: exynos: add support for exynos7870
Message-ID: <20250205-eager-ibex-of-pleasure-61e3bb@krzk-bin>
References: <20250204-exynos7870-usb-v1-0-a7753f8183a4@disroot.org>
 <20250204-exynos7870-usb-v1-2-a7753f8183a4@disroot.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250204-exynos7870-usb-v1-2-a7753f8183a4@disroot.org>

On Tue, Feb 04, 2025 at 02:09:30AM +0530, Kaustabh Chakraborty wrote:
> Exynos7870 devices have a DWC3 compatible USB 2.0 controller.
> Add support in the driver by:
>  - Adding its own compatible string, "samsung,exynos7870-dwusb2".
>  - Adding three USBDRD clocks named "usbdrd20", "usbdrd20_ctrl_clk", and
>    "usbdrd20_ref_clk", to be controlled by the driver.
> 
> Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
> ---
>  drivers/usb/dwc3/dwc3-exynos.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/drivers/usb/dwc3/dwc3-exynos.c b/drivers/usb/dwc3/dwc3-exynos.c
> index f5d963fae9e069e1bd145ff5bd1b704da89fb74c..34f2b9e8529303cd2a957baed5819a45cbcf3309 100644
> --- a/drivers/usb/dwc3/dwc3-exynos.c
> +++ b/drivers/usb/dwc3/dwc3-exynos.c
> @@ -163,6 +163,12 @@ static const struct dwc3_exynos_driverdata exynos7_drvdata = {
>  	.suspend_clk_idx = 1,
>  };
>  
> +static const struct dwc3_exynos_driverdata exynos7870_drvdata = {
> +	.clk_names = { "usbdrd20", "usbdrd20_ctrl_clk", "usbdrd20_ref_clk" },

We already stopped this mad downstream pattern, so don't reintroduce it.
Use proper names describing the purpose of the clock, not the source
name. See Exynos850 or GS101.

This is probably bus_early, "something?" and finally ref.

Best regards,
Krzysztof


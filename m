Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B768202F67;
	Thu, 15 May 2025 08:20:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747297253; cv=none; b=acuQGw6Z3ETkNqlYIK94L5KyFM3qRb5m5FK8c+bDDDClmbJGsPugVSXEuNXfp3k1vV+n1K9KNe6N5+Jp8Mfu2ibI8mfirkbP8WGB3vUGWOIFRrkWFsYw5xmG9edPbkHGA4lPAUjUQdc6XnwBkfFNx8mbk5tn9Mql/oESHjgds9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747297253; c=relaxed/simple;
	bh=PwH7evc+Zg9zQbRLNnZYre+nyvUninerAdI6sm9HyQQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qVMcEESdwgZPaDhO8giEzv74yPGJ83BBNp5ntl1V6x4W/E96pXgOgY1SoZ1O57R3GPVRRuo4aaT/1zQjep233Gj16xuSlDd8OzGSDeU/Hp9Zq9nZGcoXGjwUTacBykVo0qZAt2IJ+ZDkxCUOXDNpoSzYryiMTmJmymcTFdrjIwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=R8e7QL4f; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="R8e7QL4f"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7EEA5C4CEE7;
	Thu, 15 May 2025 08:20:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747297253;
	bh=PwH7evc+Zg9zQbRLNnZYre+nyvUninerAdI6sm9HyQQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=R8e7QL4f51Ns4Svc0BXooM7bT20NZqGbI//uIINvG1stzHDxRcXJHYef3s//B1WpU
	 7GNI0lWPGEe9/Cj3Cczav4tFDlVpjDBDJ3F35V9E6+r1hAu21RctQtzhUkuXi0jnUI
	 cQCLFRf3tk1S/gioQhLMXqESwWaU6bJNXFZH5m20dh0KJykQ6OS882ysxZPl7UhM8/
	 rivdHdJUeuWxsuPi35S75xgmhmAon9rYsZBF0FicGfQHcIleW6jj/wLftN2vJg9g+2
	 DX2vYLGbiu4BguZ6ZgXbfCX3eVryGzzbkiEiWed0lsYOCjaTy8ItdHkkkh+/wbBRZq
	 pd9djPFaUyykQ==
Date: Thu, 15 May 2025 09:20:49 +0100
From: Vinod Koul <vkoul@kernel.org>
To: Igor Belwon <igor.belwon@mentallysanemainliners.org>
Cc: Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v2 0/2] USB PHY support for Exynos990 SoCs
Message-ID: <aCWj4cn4y+RyfGiZ@vaman>
References: <20250420-usb-resends-april-v2-0-25dc7d2e6dd4@mentallysanemainliners.org>
 <aCRXgpD0Ld2W4lHE@vaman>
 <D9VYC98LJTR0.LJXYC1H0BAKA@mentallysanemainliners.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <D9VYC98LJTR0.LJXYC1H0BAKA@mentallysanemainliners.org>

On 14-05-25, 16:26, Igor Belwon wrote:
> On Wed May 14, 2025 at 10:42 AM CEST, Vinod Koul wrote:
> > On 20-04-25, 21:28, Igor Belwon wrote:
> >> Hi all!
> >> 
> >> This patchset adds support for the USB 2.0 PHY of the Exynos990 SoC.
> >> This SoC has a combo PHY that supports highspeed, superspeed USB and
> >> DisplayPort, however due to my inability to test the superspeed part of
> >> the combo phy (device always enumerated as high-speed, even on the
> >> vendor kernels/bootloaders) only the highspeed part is brought up.
> >> 
> >> These changes have been tested and confirmed working (with the USB_ETH
> >> gadget and telnet/ssh in a ramdisk) on a device from the hubble family
> >> (x1s) and also a device from the canvas family (c1s).
> >
> > I am missing the dt patch, can you pls report the whole series if you
> > would like me to review and apply this
> 
> Hi Vinod,
> 
> I've sent the DT series a while back (before resending). Usually I
> propose DT changes through Krzysztof's tree. The patches are 
> unchanged (they will be resent unchanged when all usb and wdt 
> changes are merged).

It makes sense to post bindings and driver togther and mostly these go
thru subsystem trees!

> 
> Here is the patchset:
> - on patchwork: https://patchwork.kernel.org/project/linux-samsung-soc/patch/20250217-exynos990-dt-changes-febuary-v1-2-99935218cbf4@mentallysanemainliners.org/
> - on the mailing list archives: https://lore.kernel.org/all/20250217-exynos990-dt-changes-febuary-v1-2-99935218cbf4@mentallysanemainliners.org/
> 
> Best regards
> - Igor

-- 
~Vinod

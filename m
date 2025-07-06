Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FB8E1D5CE8;
	Sun,  6 Jul 2025 09:44:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751795062; cv=none; b=rxCFPYLGZ9XVp7OrbQ8Vm4XIb1ZBO8UYfs+z9kXPj1+MM48oGSJoHFuG4XwD5TJERyyyldUrs+A7gmUAZvEcCSZMoWJufhorUe9dTgxPQqhW/sD33GyKVkRg0r+L4+DdU+mkktNMBpfuij/L7rw5NuzseW3K1hSClJ872WjoVHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751795062; c=relaxed/simple;
	bh=+TfC+wPk/bSE3tIMJmcXCuJm6QOuYn/Hzvt0nI3VoHk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=picbpiLq/sZv/UGcxP174t2cWljSorVXPybbplqTm0poLGYhqvH2dH2UVNfw3QrE4bifKZcWDDq+010vbgiAfC6bFoOXc+56jyKNHJLd4KEIcbslIHJEtv6WVLj+ibitIlJIGFZo4OubSSracf7A6oad6KzU8r4bQD8brExrCMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RBSVzSbN; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RBSVzSbN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0CFD2C4CEED;
	Sun,  6 Jul 2025 09:44:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751795061;
	bh=+TfC+wPk/bSE3tIMJmcXCuJm6QOuYn/Hzvt0nI3VoHk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RBSVzSbNHmfQxX+AWV3h55UI6WakRg9IrkTao6uCaCt+XVGPB6cR/j3TLlPTiNRrE
	 7QvT/Yab84ddVWPLJJMNhNYhTkb8YobUTHOh6a+3CMLvPkAeqndUmt4i7PywL2H0oe
	 nCskUTKgLGWmhSnrQlYRWdKk9ajPYvF91Bk7V0/GbEN02SpEzpgbCqSDeIH7RP6kcA
	 uCFJ8lqp9izMAQxe8zkMbqqoamUDrzmaOnCIsDXfk2p7hIPTTI3cMeXFgA9dh3y1o5
	 kr+cTI4schFOjMKNydeFA3DkPRN6E1VkjZBByuk1qlAwWIe2CGXqaIp4OnI0R44eDv
	 /aOmjT9HGM0yw==
Date: Sun, 6 Jul 2025 11:44:19 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Pritam Manohar Sutar <pritam.sutar@samsung.com>
Cc: vkoul@kernel.org, kishon@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, alim.akhtar@samsung.com, 
	andre.draszik@linaro.org, peter.griffin@linaro.org, neil.armstrong@linaro.org, 
	kauschluss@disroot.org, ivo.ivanov.ivanov1@gmail.com, m.szyprowski@samsung.com, 
	s.nawrocki@samsung.com, linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, rosa.pila@samsung.com, dev.tailor@samsung.com, 
	faraz.ata@samsung.com, muhammed.ali@samsung.com, selvarasu.g@samsung.com
Subject: Re: [PATCH v4 5/6] dt-bindings: phy: samsung,usb3-drd-phy: add
 ExynosAutov920 combo SS phy
Message-ID: <20250706-diamond-crab-of-will-72205e@krzk-bin>
References: <20250701120706.2219355-1-pritam.sutar@samsung.com>
 <CGME20250701120009epcas5p46bc2870446c499f9c0008c1d396650bb@epcas5p4.samsung.com>
 <20250701120706.2219355-6-pritam.sutar@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250701120706.2219355-6-pritam.sutar@samsung.com>

On Tue, Jul 01, 2025 at 05:37:05PM +0530, Pritam Manohar Sutar wrote:
> This phy supports USB3.1 SSP+(10Gbps) protocol and is backwards

Agian, this?

> compatible to the USB3.0 SS(5Gbps). 'Add-on USB2.0' phy is required
> to support USB2.0 HS(480Mbps), FS(12Mbps) and LS(1.5Mbps) data rates.
> These two phys are combined to form a combo phy.
> 
> Add a dedicated compatible string for USB combo SS phy found in this
> SoC. The SoC requires two clocks, named "phy" and "ref" and various
> power supplies (regulators) for the internal circuitry to work.
> The required voltages are:
> * avdd075_usb - 0.75v
> * avdd18_usb20 - 1.8v
> * avdd33_usb20 - 3.3v

One more commitm message completely copy-pasted and completely
uninforming. The voltages are irrelevant. Explain the architecture. This
should be just one patch with proper full description.

> 
> Add schema only for 'USB3.1 SSP+' SS phy in this commit.

Why only? Add everything, describe everything, but not what voltages you
have there but the architecture of the PHY.

Best regards,
Krzysztof


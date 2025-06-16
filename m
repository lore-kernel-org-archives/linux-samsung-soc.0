Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6F0323314B;
	Mon, 16 Jun 2025 08:15:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750061714; cv=none; b=C+b2gTLX5Kt32Q2ZQ0Aw/164E2CfxCm2jU5dOVHXYdCHSj/etI9z2B8iuzxCGx9/0dp7t7o5SkigcH8sx0g47/KVhWPboC6RXaGkVDAhLkoUa0gzIQ1MnrT8UMy8MRN0UEdgFPArazdEyjsLpFs1BsNSqEH1uTw2ClR7P5P6C4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750061714; c=relaxed/simple;
	bh=NX6xHsAZt0PtKiXJvcYGNWCSJAKCZDeVPjlN1P/2qAQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s0yWDy+MpR1/9PNVTI4Ea+Nru9UasX9iZhfzkq4fVdVxKcqfqD/xxnVuT197TBaHrAApk9ekBFTckfxL/B6htHdMmjy6eQtHQ00YlPOn1O4fplidZW/krbigugJLl4YF9CIPESS45xHB62Cf2kInl/T4wLSjgq5hJJ5Et+2F+vg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=q4VmhLwq; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="q4VmhLwq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B573AC4CEEA;
	Mon, 16 Jun 2025 08:15:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750061714;
	bh=NX6xHsAZt0PtKiXJvcYGNWCSJAKCZDeVPjlN1P/2qAQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=q4VmhLwqcp2Cx6Mf8DWGmSeldB6aP+9zrK0qLKCDVt+vSzUuwrVfCBd2Sq3gt073a
	 f/ynsXzdEwkx4GiF9nfAkhEt6dyHpwVMepx6HgXioSRyWGGnRX+rQuanOVSzwCELVv
	 5abS44EzFORuLShdkQiyt2q1/eBcBqdxHTQl7cdJgFiCJF54Li7sT4RbTFUUxWEHP+
	 f7TQWhYrAWgwQMsSUJtGgP/+4sp8nthzSR4/Q7a8TADSYr7lFuq1gg14ZoPTQlt/Vk
	 JU/QBUybZ4pLrackeC3kR4Wh+pGIj3sk1ToN+HtGVZIcN2rKD1G+5A0JTZAvkowDhT
	 qpxmMraB071oA==
Date: Mon, 16 Jun 2025 10:15:11 +0200
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
Subject: Re: [PATCH v3 1/9] dt-bindings: phy: samsung,usb3-drd-phy: add
 ExynosAutov920 HS phy compatible
Message-ID: <20250616-resolute-ocelot-of-shopping-1c9c4a@kuoka>
References: <20250613055613.866909-1-pritam.sutar@samsung.com>
 <CGME20250613055040epcas5p35219ddeddd9fe5f4632ca837db91847a@epcas5p3.samsung.com>
 <20250613055613.866909-2-pritam.sutar@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250613055613.866909-2-pritam.sutar@samsung.com>

On Fri, Jun 13, 2025 at 11:26:05AM GMT, Pritam Manohar Sutar wrote:
> Add a dedicated compatible string for USB HS phy found in this SoC.

You add HS phy in other commit/patch. This is just confusing.

> The devicetree node requires two clocks, named "phy" and "ref"

No. Explain the hardware, not the DTS. How many clocks, supplies etc
hardware has.

Best regards,
Krzysztof


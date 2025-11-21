Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE774296BDF;
	Fri, 21 Nov 2025 15:11:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763737912; cv=none; b=poq6HjkPTOnSzZzWXcAKf9r97ZZA9rbwVKEKVEC3HOX5FmvmIEm5pIxGF22zEvJK86/1P58GcMbS5aF/OqnClwcA6OI0yYc+unx1lyAW8RcmEEgcEseCL8+c+GlBKysSHeekfBfWwmg79VWCpvOVI2n+X5QFBhwFnLR0WD8Yef4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763737912; c=relaxed/simple;
	bh=SKoDHcGJ5PytGthjxeiCyI1kNPst8hhb3LyVyjrNVJg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AH+W7I2RYqrOifpLCEW883opJBqdr+i0cPDAZ3bKAr5vDV3rhivvC7mWTIkgZ9Sv9AwppN80oJ74+mD/XGSUYXm4rmW/29il7brhsnwgWr492owQ4z6oatG7WPQ68G1z6VQiRDtBMcz3JgdcQ5l236eXFgVeVg2h+jitcaveSTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=anCz6EmO; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="anCz6EmO"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=yrMI9qC7qe1gsOZZ1prerqDmHlWyocs6JVdfMEZHxfs=; b=anCz6EmOITiC5aK/Ur+2Vw+zhF
	LX+NdXsoXLsUlIpWSvHwMP7/r4y73U7yRNih5FxnuuGGBTjYwKQnw3C+Yaqj3v9fDKCmZ9PH5OYpi
	9vmiyb1FnBCfJC5WsGW7En8OkKpAC+YSSx2mgvzd4bJYj7Z/LZdOuXHEAyCZaNYFu5gcV9+W/jL6i
	EoTU72b6dXJrmfWCJP8HAEdy6OItTBbzsg8S3ISm8ucT1oQi6o0YSxw+rX6ZlYS+6s/rAyBOC8e6x
	RnsvJxbTam0Efa9hNrnFxDmmyLMigpXkaHjtw9Ux3H4PKs60X7rTJ658HHuGhqjbVHS7+2mnC0jdN
	ID58x1hg==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:52644)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1vMSnV-000000007ip-03gv;
	Fri, 21 Nov 2025 15:11:41 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1vMSnS-000000005Rs-0dMy;
	Fri, 21 Nov 2025 15:11:38 +0000
Date: Fri, 21 Nov 2025 15:11:37 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Will McVicker <willmcvicker@google.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Donghoon Yu <hoony.yu@samsung.com>,
	Hosung Kim <hosung0.kim@samsung.com>, Rob Herring <robh@kernel.org>,
	John Stultz <jstultz@google.com>,
	Youngmin Nam <youngmin.nam@samsung.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	=?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	linux-samsung-soc@vger.kernel.org, kernel-team@android.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 0/6] Add module support for Arm64 Exynos MCT driver
Message-ID: <aSCBKRpA4jSw1iuF@shell.armlinux.org.uk>
References: <20251120184242.1625820-1-willmcvicker@google.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251120184242.1625820-1-willmcvicker@google.com>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>

On Thu, Nov 20, 2025 at 06:42:28PM +0000, Will McVicker wrote:
> This series adds support to build the Arm64 Exynos MCT driver as a module.

There are parts of this that are just totally incompatible with it
being a module. For example, you can't register a replacement udelay
loop after the system has booted.

This is the second time I've faced a patch series wanting to remove
__init anntations to call it from a module, where the author has
clearly not analysed the code to see whether that is a valid thing
to do. This is unfair on reviewers - it is the submitters
responsibility to check that what they are doing is valid.

Moreover, in _this_ case, you will have received a kernel diagnostic
message stating that the call to register_current_timer_delay()
was ignored, so I also question whether you bothered to run-time
test this change.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

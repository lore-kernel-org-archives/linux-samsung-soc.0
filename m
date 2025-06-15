Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C08627A93D;
	Sun, 15 Jun 2025 16:52:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750006344; cv=none; b=GWgGwHk5Sn4NUxmGd15/DAP0EDkvMyymPurAZijK5fht8v0Quv6KI2rwJRHbZSdp0vFfXFyPYse/hI2I+6cqGKLfbPyriWUpXZtWvxNIm8JcWIsdAsovvL2jfpgfH5VvoRYm+s/Bp4qXEmnHK7t3baX3shJo6gDlJL3xCvJDj1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750006344; c=relaxed/simple;
	bh=bAvi/hc899Xx4wJEJHPJhi4z7oQVc3CAWG5FfnZi+Yo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=R7AC6xgrQJmL5HTHRK07u3i7bVU1XLKUD4do2bTfFCFe12dA1/+T+T94lU26aGHob/dYoAqLF6L/xFojtKy0B3rYmUkP/xcDZhQux6GHpT6mf+MPXQc8U9XEHS/1OtcAGYBLU1C4c78wYi2J5gyxROamriQgUWyMOUJdPPGffFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NFi+H/B7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NFi+H/B7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4B69C4CEE3;
	Sun, 15 Jun 2025 16:52:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750006343;
	bh=bAvi/hc899Xx4wJEJHPJhi4z7oQVc3CAWG5FfnZi+Yo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=NFi+H/B7gtAN8b/2kL0xOSpZpe9+o725fPZ0S2gYt7fLbupKVdwUq4484g5M37VAk
	 ZYHqnF0N6wD7GfSWM28thiPG5ySFTOGlvRlc5bFntTpHmRfngf7pqHceayBszIi83u
	 4JH5agtj0tPwNz31Jwhu533LNML/kF0wTP6AQZYxiy2qm0gRwnKNgLVrp6veep/50E
	 kMkSN2upTbNSqpfKQD+16EHCvmzw+xyP28J8ztnZVHbeneclVRmy21WFz02n+04HHS
	 bSZs/I+F86vWp3VeSBXopaayFOsAenZ17EVrA/5yEIX7RpKAs79X67Vn744jtGGJIu
	 /9S8K7io7+DQw==
From: Vinod Koul <vkoul@kernel.org>
To: Kishon Vijay Abraham I <kishon@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Igor Belwon <igor.belwon@mentallysanemainliners.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
In-Reply-To: <20250214-exynos990-dwusb-v1-0-d68282c51ba8@mentallysanemainliners.org>
References: <20250214-exynos990-dwusb-v1-0-d68282c51ba8@mentallysanemainliners.org>
Subject: Re: [PATCH 0/2] USB PHY support for Exynos990 SoCs
Message-Id: <175000633955.1180927.15897677423516410884.b4-ty@kernel.org>
Date: Sun, 15 Jun 2025 22:22:19 +0530
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


On Fri, 14 Feb 2025 18:21:06 +0100, Igor Belwon wrote:
> This patchset adds support for the USB 2.0 PHY of the Exynos990 SoC.
> This SoC has a combo PHY that supports highspeed, superspeed USB and
> DisplayPort, however due to my inability to test the superspeed part of
> the combo phy (device always enumerated as high-speed, even on the
> vendor kernels/bootloaders) only the highspeed part is brought up.
> 
> These changes have been tested and confirmed working (with the USB_ETH
> gadget and telnet/ssh in a ramdisk) on a device from the hubble family
> (x1s) and also a device from the canvas family (c1s).
> 
> [...]

Applied, thanks!

[1/2] dt-bindings: phy: samsung,usb3-drd-phy: Add exynos990 compatible
      commit: 9f77d234c1f41e78a99f124bf6fee59dc2e3d46f
[2/2] phy: exynos5-usbdrd: Add support for the Exynos990 usbdrd phy
      commit: 385a766bed48c5bcf620061f24e864dafeca671a

Best regards,
-- 
~Vinod



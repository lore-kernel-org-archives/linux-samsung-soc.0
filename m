Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBA2B27C158;
	Sun, 15 Jun 2025 16:52:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750006348; cv=none; b=iUZMlwrfzCUPutRVhPLCZOV4lnFP+ZQCcR8xG/zsTwkf/WwU8dFbrXCvrorAdIZP6pxyckNEA2+Sqnvrmeuz9lZw5vPw7tA6sidufEbyDkw+Nel2MoNFTzrxYI6HAQc+1nqWQkxpN8Rfp28bXSkTkvqZQLxEujeRJ0ucxkfNWCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750006348; c=relaxed/simple;
	bh=6dx0ILj5WkvRoRHu2oDu87MNsa+P9Y+3Mn7PSQB54sA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=bd+/u3LDqrhGYroYB3O/VN3CLv93WnSVZB0SDsvxK7Fk7RsqkjtUoWfoGM2pF1L5349owR4NXRQkG0q70vT0DljX6hjPptFSPuj0rPZYCYNr1Ttvwxy2qRao9c1s+VQ19i0YaFOJeI0J8EYnB1j+Pg7UuMiyxmbBTvDvp8JZyuo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JeFgtW+v; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JeFgtW+v"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4FE8AC4CEE3;
	Sun, 15 Jun 2025 16:52:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750006348;
	bh=6dx0ILj5WkvRoRHu2oDu87MNsa+P9Y+3Mn7PSQB54sA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=JeFgtW+vDFB/ZZFYAx5DvgBl0GSqCk9ehFkrQJEAB6KuzIgSLU+DNZqS2/e9czBhY
	 +vrcx7thVoW21LkNAJrZQEq+4tpquq3xyoDpKgq0s0Evw+Wulby2o30A6l3mNaexQF
	 OWNDSruG5I+fATP13e/N2MZKUVoyrqhCSWT6vGoDRSjROsLgdfqhsz12crajlbbLmO
	 2GNESTgQYW8IT1pWyq6b9xNAd32LA39Kxea6Bjc04UedolPI8hMgYZZhO0Zeyn69dO
	 GqKHoTQ3l4syKRJtc4zl7w164eLT9JLQ3G05JLqZSlO/RGx6PjHE+zje/vmdS+TYD+
	 FJB52x1SS381g==
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
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20250515-usb-resends-may-15-v3-0-ad33a85b6cee@mentallysanemainliners.org>
References: <20250515-usb-resends-may-15-v3-0-ad33a85b6cee@mentallysanemainliners.org>
Subject: Re: [PATCH v3 0/2] USB PHY support for Exynos990 SoCs
Message-Id: <175000634396.1180927.14227423710203816797.b4-ty@kernel.org>
Date: Sun, 15 Jun 2025 22:22:23 +0530
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


On Thu, 15 May 2025 16:43:00 +0200, Igor Belwon wrote:
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



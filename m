Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90E18357D07;
	Sat,  3 Oct 2026 15:25:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791041118; cv=none; b=rRhH3HPdCY6tnmcaEBcvTUAr95gHigpCk4/70JBbyOabuJmuNjPhQW+dc1Cm/u9/B0IQTnuD5d/qkSGs9QdWBCjhOnERhGpo/8Jkms70HnHqAzB5Xd3x3ZM+orfj/4WmfqCaiBrr2r11I7n1r2TcjDDIT2+7KOa/iF1Nnl1svfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791041118; c=relaxed/simple;
	bh=sDoFKaoyWRCwJKFiSvqolIPlwHWZdVZVcgzRP0Lxawo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=FzJ38ruE0orkLjAE5YkEjOZIlQoJMrxzrsO5capD7ewEV7UFLoJTgsIeB95bQeAJ8sAsImCzbeY3E0PysMQe95u71qI4eEnScO0Fq/sF4+jDAvo9e5NEpKxF4vR5kqNHuqzVeSh0JyeCkZSmAbg9tfMZ/P0yGGVHZExxrfOJeuo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aAoqDat+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aAoqDat+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B8701F0089B;
	Sat,  3 Oct 2026 15:25:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791041117;
	bh=MX9aB6PwQHsHsiY0tEeijH0+CAtN1fEbIer9DwvycAc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=aAoqDat+Q89oO/U4XsYvv+6iolQlUiVFN2uAyCGDz9O8O5zeNf0bG9/M5BtZVfbRA
	 y9vpNHqOqXKntCf5ly5efU77IKcGAPsbjCnJ5AOySwX32MWJ2Hlj2tRrwCGSGS0rfE
	 6e8aEXzKDNQlyvmteKbXFUNUFx2vorFfutyKmDWOZF7Q/ypTCubxFVRgwpidjfqBAD
	 qUIOWvYgBu0kDXgJBNTLILGsXLSqcFL+4nOrAztAnmhMVwO1z19zfE2GzlVCWteRzW
	 HKfz+COj3lDOhi/JAF7BaVJTZhKP0FCWFlOfNSeiTAKShGexJvyGWqfyXlFOpwjGc3
	 939xtt+1OLawQ==
From: Vinod Koul <vkoul@kernel.org>
To: peter.griffin@linaro.org, andre.draszik@linaro.org, 
 tudor.ambarus@linaro.org, p.zabel@pengutronix.de, neil.armstrong@linaro.org, 
 RD Babiera <rdbabiera@google.com>
Cc: badhri@google.com, nkapron@google.com, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260925222959.3607769-2-rdbabiera@google.com>
References: <20260925222959.3607769-2-rdbabiera@google.com>
Subject: Re: [PATCH v8] phy: Add USB3 PHY support to Google Tensor SoC USB
 PHY driver
Message-Id: <179104111428.223537.9712692661355161326.b4-ty@kernel.org>
Date: Sat, 03 Oct 2026 17:25:14 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3


On Fri, 25 Sep 2026 22:30:00 +0000, RD Babiera wrote:
> Add USB3 PHY support for the Google Tensor G5 USB PHY driver.
> This patch adds functionality for the usb3_tca register, usb3 clock,
> and usb3 reset as defined in google,lga-usb-phy.yaml. Kconfig now lists
> USB SuperSpeed support.
> 
> Refactor the probe sequence to initialize the USB2 and USB3 PHYs, and then
> initialize clocks and resets for both PHYs afterwards.
> 
> [...]

Applied, thanks!

[1/1] phy: Add USB3 PHY support to Google Tensor SoC USB PHY driver
      commit: 8c2b331e6327ead44e72e347ce405c21dd781a99

Best regards,
-- 
~Vinod



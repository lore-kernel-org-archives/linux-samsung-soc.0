Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9390328A2BF;
	Thu, 13 Feb 2025 18:17:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739470620; cv=none; b=TkSNCpnaZDXGOGOBzKbiSHKAbIKUJ4Hjx4/6Bgs3R3i9FL9JmyV/5+tJdczCwzb22tXORumSfmYtRebHdWqJ8wfRdwN2u8CvEI92iiGVurV2QxJh8FYECncn26bc799OQ3j8nh5SfN3CIq7GuxBwJyiTDdvZaxSLtGuLRvOM8zA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739470620; c=relaxed/simple;
	bh=QLZRApTrn4O2R9Ogb2JhlUkm/5ex8J5sTyiNSk7EKzY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=kT2uxq9SCxz42eU4B1movddAghjX7XiPt9QH3AC6Y6jCIRKTMksczJocy66SH7WWFswehRraF7nPWuCkQJHNpMIK0n21Z14kLvYSkjsw+8ztGVYiPb0VRkPvsSibCGXS6cW5bF+S++JCf40fP0UPGqVafPTULbsCXHS/b7P5BAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FAvQM0YQ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FAvQM0YQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8CEE0C4CED1;
	Thu, 13 Feb 2025 18:16:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739470620;
	bh=QLZRApTrn4O2R9Ogb2JhlUkm/5ex8J5sTyiNSk7EKzY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=FAvQM0YQ8e1kNEkDs7XTsZeSyNoMSVt2pjlJ7sOfzTT/SCVjI5jgV17A5FCdhmTed
	 8z1F4uT5DPqUR8QRmx/+plKomU8Kx4nzCDjyrQ3/UkimOgannIQBYyFMb6zkepjGOf
	 XDdhZstfdnaKv86qW0+J+MlRPGX7qT9DuzbnZD/SrQGnF5heZOnEwApBCsOXRqsiV1
	 L0pUqS3MEXZA5yFw6K3agIhYwJSnzJ80YHALS76pzL/6IO0U4d/b3T81qeyKXXr9VR
	 islrjn+Ln23J2TlHIe5NsP/QHweIFsy1p9huv2qy7DRo+vnsCxzQlFORW2oK+CVGCG
	 oD5NS+XE8WHZw==
From: Vinod Koul <vkoul@kernel.org>
To: Kishon Vijay Abraham I <kishon@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Sam Protsenko <semen.protsenko@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, Roy Luo <royluo@google.com>, 
 kernel-team@android.com, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20241206-gs101-phy-lanes-orientation-phy-v4-0-f5961268b149@linaro.org>
References: <20241206-gs101-phy-lanes-orientation-phy-v4-0-f5961268b149@linaro.org>
Subject: Re: [PATCH v4 0/7] USB31DRD phy updates for Google Tensor gs101
 (orientation & DWC3 rpm)
Message-Id: <173947061417.294083.6730012157242194658.b4-ty@kernel.org>
Date: Thu, 13 Feb 2025 23:46:54 +0530
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.14.2


On Fri, 06 Dec 2024 16:31:00 +0000, André Draszik wrote:
> This series enables USB3 Type-C lane orientation detection and
> configuration on platforms that support this (Google gs101), and it
> also allows the DWC3 core to enter runtime suspend even when UDC is
> active.
> 
> For lane orientation, this driver now optionally (based on DT)
> subscribes to the TCPC's lane orientation notifier and remembers the
> orientation to later be used during phy_init().
> 
> [...]

Applied, thanks!

[1/7] dt-bindings: phy: samsung,usb3-drd-phy: add blank lines between DT properties
      commit: 642b1ed4cd184d5c2e5814c220bb93453492644d
[2/7] dt-bindings: phy: samsung,usb3-drd-phy: gs101: require Type-C properties
      commit: c38528812c2e9b05fe8b5fd1f66cf4c75835a38e
[3/7] phy: exynos5-usbdrd: convert to dev_err_probe
      commit: ee064390b82329df7fd8e0c48da03a8fee7d46ce
[4/7] phy: exynos5-usbdrd: fix EDS distribution tuning (gs101)
      commit: 21860f340ba76ee042e5431ff92537f89bc11476
[5/7] phy: exynos5-usbdrd: gs101: configure SS lanes based on orientation
      commit: 0bccdcb3eea93e087887027ff374dac5c3de36cd
[6/7] phy: exynos5-usbdrd: subscribe to orientation notifier if required
      commit: 09dc674295a388e71192430b6f9c3c5cb0eb47da
[7/7] phy: exynos5-usbdrd: allow DWC3 runtime suspend with UDC bound (E850+)
      commit: f4fb9c4d7f94dabef4abf2209cf840dd1c9ca11e

Best regards,
-- 
~Vinod



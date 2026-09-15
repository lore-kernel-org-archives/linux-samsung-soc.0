Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CC4D37F8AF;
	Tue, 15 Sep 2026 06:49:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789454952; cv=none; b=PX1AoNJOBTs+U9Y/WAC0jkrezbDzUXZQScZJn/pd6x5OGFzUEbIqRzwXy0bsVLwRCOMR18vJ0yuJoGwCCL6akaG9aSPeyyzglW1k9ew4bXqrVQzspeEN3ZdJCs6re116ien2OtOdSvFOtVkUOEY4ARUbp8j4yxyyOlli1xC27Ko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789454952; c=relaxed/simple;
	bh=WlMYEhTIcXH9OgmJnXApQUW1aZrFo9CVDN16osMVXVE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=AqU9r0IOOz5Lk5DvTIPJDpPD1ifJAgOxYTQPsMiOk2LMTDIfJ+1DqSMfpYP1NBkQIe5ZTTenWePQ+7FH0YWKM6Lxj//BX+BpKiRsM5sfglb61rgEEcm75OVtgUcNDHkqZNBFyKhjz6vRo/6ynseGpvbHcsD+I8AHQ2TjJOQO0N4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=L+/UvwwA; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="L+/UvwwA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 409181F000FF;
	Tue, 15 Sep 2026 06:49:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789454950;
	bh=Sbu+/WbQu3pdOwQDlDnrwv9zUnsRT7Rl41y7tZPm4ng=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=L+/UvwwA1MOrGfGwMGB4/UwKWGWQyQjLkbIdbX01TmWlMMszKpPSOFowMOEG1Sq3b
	 veynuymebifVhvaGEO77Oms/6JJJsiSQu6L+ZSlG+YLsWzt//h8gLajdfzE/pN6REp
	 uWGxOpHGv0DoP0PlBVl3bvvd9fVrLlxTY3JghTCwZyi/OuoPxjH3hlQVZ6Yrq8VPg5
	 JNQ3/NohKDfIBqqILYwwa127ZhTOZQJYdT/rYye7Hy5Dr5y+VjjtYAmD6GIUr+tL9b
	 tF+wiwNUpwXvh1HoQWMrvD3I9e5jz39FPFHJbVLqE1vhq89LL9TJugRNRGh4g6GJtR
	 uOTj7/uxRKjSw==
From: Krzysztof Kozlowski <krzk@kernel.org>
To: semen.protsenko@linaro.org, robh@kernel.org, krzk+dt@kernel.org, 
 conor+dt@kernel.org, peter.griffin@linaro.org, 
 Thomas Turner <tturner@lineageos.org>
Cc: alim.akhtar@samsung.com, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, thomas_turner@talktalk.net
In-Reply-To: <20260909194450.183693-1-tturner@lineageos.org>
References: <20260909194450.183693-1-tturner@lineageos.org>
Subject: Re: [PATCH v4 0/2] Exynos850 GPU support
Message-Id: <178945494682.36945.3330317622213793582.b4-ty@b4>
Date: Tue, 15 Sep 2026 08:49:06 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16.0


On Wed, 09 Sep 2026 20:44:48 +0100, Thomas Turner wrote:
> This patch series documents and provides basic GPU support for the
> Exynos850 SoC, making use of the Mali G52 GPU through the panfrost
> driver. Only basic support is provided here and as such lots of features
> are missing. This series only adds the GPU node for the Exynos850 SoC
> dtsi, but keeps it disabled, so it stays disabled currently on E850-96
> board (The only user of the Exynos850 SoC dtsi upstream).
> 
> [...]

Applied, thanks!

[1/2] dt-bindings: gpu: arm,mali-bifrost: add exynos850-mali compatible
      https://git.kernel.org/krzk/linux/c/5a881e2dfce03d6426d81beb35e68089a02aad89
[2/2] arm64: dts: exynos: Add GPU/Mali Bifrost node to Exynos850
      https://git.kernel.org/krzk/linux/c/3d7bf30480f3a34fe530213da9e5bd0aa406929d

Best regards,
-- 
Krzysztof Kozlowski <krzk@kernel.org>


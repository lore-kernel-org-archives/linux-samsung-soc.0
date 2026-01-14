Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8BE53A6409;
	Wed, 14 Jan 2026 16:52:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768409527; cv=none; b=RiYjIEX6LZTctwDrnJph3FsNSaqWXDNdCVLwv3URDWUtYO6H63SwrGGEZYzz8FXsrZmBiZLsJYMsWmK9Iash8p4mF6EyLfOBLFoREX64hphshaLuWYpMmRdamRcb6dBdXN6C2ef3iXhUEsWtRhNwclZVzRjD1hXqpoYD5q5P8jI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768409527; c=relaxed/simple;
	bh=UNYfWTgs2Wu0kYNxydtgUIcaXgFHmwIxZQCk0gOPwM0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=VEAc+exMXoaglMCxBYlvN5D32uMaHEhxn9McxT1EvyxqfxBg5sEtsfNFbgzfiR4Eh4ULluI6hFUzv1KWwkZgE16xlOo1LO4a5dXdnPVgdetHXGVNdjuTgKBADg42ADUz9hqAH/3ksCPECs6v550WMQmrFLQJK93OzBRimNgpAEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LCDZ5kcy; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LCDZ5kcy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67B5EC4CEF7;
	Wed, 14 Jan 2026 16:52:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768409527;
	bh=UNYfWTgs2Wu0kYNxydtgUIcaXgFHmwIxZQCk0gOPwM0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=LCDZ5kcyZcLkuJBrwbw9oNMtXV5ea2Rxx/LOEwxzgyDHPNn8fXQGdLGge4grZWutn
	 1FgeDa8FsHPk5bIrMvfqyNAl/8ZgWgdb/SDWRKRo0i7CU720s5//HUeVlT2dzeystu
	 phuWpamonrsqKCqmamppizZ4i7jN0658W0KP2xLNIAYEwhEv5OWG1H78L4Gspb/pUo
	 ddB8mp8J+ZkUrLEHcqcz7mXIInkYHmUcJjG0jQAxQHG4nbhF10ZPD9Q0wIQqMEFS5X
	 u+aKzkO5hqm0yT1E192TnszKiM9iuNAVzyk8gPx0SP58x8EPWkR5IZT53BCQ1HzX2D
	 k5IsO8ASysBEg==
From: Vinod Koul <vkoul@kernel.org>
To: Kishon Vijay Abraham I <kishon@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Roy Luo <royluo@google.com>
Cc: Badhri Jagan Sridharan <badhri@google.com>, 
 Doug Anderson <dianders@google.com>, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 Joy Chakraborty <joychakr@google.com>, Naveen Kumar <mnkumar@google.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
In-Reply-To: <20251227-phyb4-v10-0-e8caf6b93fe7@google.com>
References: <20251227-phyb4-v10-0-e8caf6b93fe7@google.com>
Subject: Re: [PATCH v10 0/2] Add Google Tensor SoC USB PHY support
Message-Id: <176840952204.979558.17473922474901235501.b4-ty@kernel.org>
Date: Wed, 14 Jan 2026 22:22:02 +0530
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0


On Sat, 27 Dec 2025 00:53:27 +0000, Roy Luo wrote:
> This series introduces USB PHY support for the Google Tensor G5
> SoC (codename: Laguna), a new generation of Google silicon first
> launched with Pixel 10 devices.
> 
> The Tensor G5 represents a significant architectural overhaul compared
> to previous Tensor generations (e.g., gs101), which were based on Samsung
> Exynos IP. Although the G5 still utilizes Synopsys IP for the USB
> components, the custom top-level integration introduces a completely new
> design for clock, reset scheme, register interfaces and programming
> sequence, necessitating new drivers and device tree bindings.
> 
> [...]

Applied, thanks!

[1/2] dt-bindings: phy: google: Add Google Tensor G5 USB PHY
      commit: 876dc58c3fa532e38cd1b287a7b8143a1a4c5dc7
[2/2] phy: Add Google Tensor SoC USB PHY driver
      commit: cbce66669c82ee9ae0e26523c0fcd3c721fcfe85

Best regards,
-- 
~Vinod



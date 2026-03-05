Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6335374185;
	Thu,  5 Mar 2026 08:24:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772699098; cv=none; b=XScA2aJHOeCU75fsSIhOqJA8Ma6PCVQEdZx+R8hGkIyWe2moyVUmKavepTDQhnS9sF01o2/+/87GvJn0tQLsdMyXdf0/okY8lR0gtHzXcf5AIdS1v2gfyYUe8aO53+JsUWr+MQHuUMqZUs2tgpS12B6FtWpDejAFMdzVbiJooEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772699098; c=relaxed/simple;
	bh=CcyQ0FMKZLYA3+oMSJy4e+mo+GRWCZA/Ac3gQFkgIFM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=ennFETv80clM2CXazcTwMloMIAM8kEa+JK5k8DJJDY/M9bavA/cJlbWTC71OZKljI/qj99EXDZcHeLj8Tr3uLiG3vYc54jgoF+1KCWc0X33a9dqIE0S/CF+vSzTmBwConL7rUEx64rZ41woBXAikR846OLETfPKa/bXSwxWefDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=B0gP836d; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="B0gP836d"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A34BDC116C6;
	Thu,  5 Mar 2026 08:24:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772699098;
	bh=CcyQ0FMKZLYA3+oMSJy4e+mo+GRWCZA/Ac3gQFkgIFM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=B0gP836dyQqJ/ZqrtT88OSaSVc4D9DXhcHlGKUuLEMRd8+2YAyjR1SmTOaAMUGlgk
	 hGPF6vCIUcX+o+jB+AsE5h2zfe5oN7ihWTVXKE+oCzxSHhpiQxepHSddUu0HjjtXRS
	 R2fG7BV45RsVH7E/ZU/9Aq4bahlLxCJv4Hf0Pk53aM1PtfNOFLyouyvnvogCL9SJBt
	 OnPEtvFhgLRfivGZaY6jz/vxbMhkEfkEnx3ykjfo4ABkPPFZIZTAq8Umn0UwHOZyQN
	 gI9U+iOHW8+0LGEVLVTpFu7bQ/MQoffQ0+ZxZeG2UqdSPcXcGWeX1Bss4muwplFNiI
	 CMqTrpPYP1ALg==
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Alim Akhtar <alim.akhtar@samsung.com>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Kees Cook <kees@kernel.org>, 
 Tony Luck <tony.luck@intel.com>, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>, 
 Andras Sebok <sebokandris2009@gmail.com>, 
 Kaustabh Chakraborty <kauschluss@disroot.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260304-exynos7870-j5y17lte-v1-0-eb25902c84c8@disroot.org>
References: <20260304-exynos7870-j5y17lte-v1-0-eb25902c84c8@disroot.org>
Subject: Re: [PATCH 0/2] Add exynos7870-j5y17lte
Message-Id: <177269909539.19782.10813796455691399837.b4-ty@kernel.org>
Date: Thu, 05 Mar 2026 09:24:55 +0100
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.14.3


On Wed, 04 Mar 2026 22:56:52 +0530, Kaustabh Chakraborty wrote:
> This series introduces the device tree for a new Samsung Exynos 7870
> device – Samsung Galaxy J5 (2017).
> 
> 

Applied, thanks!

[1/2] dt-bindings: arm: samsung: add compatible for samsung-j5y17lte
      https://git.kernel.org/krzk/linux/c/135b55014109de2e6c8b9c5d52e5cfd7b765315e
[2/2] arm64: dts: exynos: add initial support for samsung-j5y17lte
      https://git.kernel.org/krzk/linux/c/a3a20c5f4e10f43e137ee32842639637c853c3a6

Best regards,
-- 
Krzysztof Kozlowski <krzk@kernel.org>


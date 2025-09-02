Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 226583054E7;
	Tue,  2 Sep 2025 13:33:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756819985; cv=none; b=kNE/1eSiHGErI0MzCbksaIaB504rKpaCj5nxXgcASA0jMY0qeVHhls3YMMWmNhpxBESFRRLJo1DftxM3shF8d7ZGPTvbUJI277zk8KYB8l1y8OvNx5Lg/vmLFojPaxswG9kQySc3nOnJwRE/nZhGJjLh7TpcVtBz+H1u8emVg5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756819985; c=relaxed/simple;
	bh=sBkfvtV88WJvhk99waVh61fGOEuvu+CGCXjjjDwFWgk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=dGM+UM6e8k68R50XMFjfg/bcn2ZpaLGMLyKdWkpCZrprEIFkRCRPzCDKoEZCkzjt3oCTnkTSZKIQBgkzJQqhax1OCkuG8JG0cAqKubI2sDNjRjhzSvvJDJf73WMmudsPnbWVi1KHAYMoAVavLUBx/8OrOcHrUCcbZROdVg6FE4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YR8flJhN; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YR8flJhN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C3C5C4CEED;
	Tue,  2 Sep 2025 13:33:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756819985;
	bh=sBkfvtV88WJvhk99waVh61fGOEuvu+CGCXjjjDwFWgk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=YR8flJhNtGVFxi4yKyTwDq+mLCufp8faONJNipdW7vSjbwjD5FUbZycT4DKFuNyE+
	 Bes9NXoM/9CB0B4gA+/dPGb86ZNXZyJtMUL9vZG/ULM1401w7jjHqUP4wlM/JY3IFO
	 RCjP091qHL6sOu/acZEFenbKuLb4CpzZNTS/gnAb9KHMuUAxhbNSvvwroNvygTbxr4
	 qfUqXfQWh6CUMTvmfio/DVMcVeE03p1HxWJn9OLRJVC5h6lsyUDPJTAFM7tafV06hS
	 7WpZoQ0U0EjkOQ8xOa/4fBqRxjPdvYmRvXn75UDFrlHf6Chuw20rSTwwjybHEevXB6
	 8AULmPhMRqE/A==
From: Lee Jones <lee@kernel.org>
To: linux-kernel@vger.kernel.org, 
 Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Mark Brown <broonie@kernel.org>, Lee Jones <lee@kernel.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Fabrice Gasnier <fabrice.gasnier@foss.st.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, imx@lists.linux.dev, 
 linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev
In-Reply-To: <20250813161517.4746-10-wsa+renesas@sang-engineering.com>
References: <20250813161517.4746-10-wsa+renesas@sang-engineering.com>
Subject: Re: (subset) [PATCH 09/21] mfd: remove unneeded 'fast_io'
 parameter in regmap_config
Message-Id: <175681998119.2360872.14819773585148263316.b4-ty@kernel.org>
Date: Tue, 02 Sep 2025 14:33:01 +0100
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15-dev-c81fc

On Wed, 13 Aug 2025 18:14:55 +0200, Wolfram Sang wrote:
> When using MMIO with regmap, fast_io is implied. No need to set it
> again.
> 
> 

Applied, thanks!

[09/21] mfd: remove unneeded 'fast_io' parameter in regmap_config
        commit: 8a7d550ceea258220e31982903b8a017351526ec

--
Lee Jones [李琼斯]


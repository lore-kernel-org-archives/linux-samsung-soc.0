Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55AB43537F1;
	Fri, 29 May 2026 01:21:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780017680; cv=none; b=F10aHo43Dg33gOqpElh8FTxrjeDdiN85WDn9viDShFean3Cbw/X18V23utEbcB0amQHSm+fokyszTCeIMrATKOxWyRZWeXwo+OjUozq7wQzZzxoLc88hdg6pK0GEtpQNSl0dNRKhSMl+dvIYRnr4zw6y97d//e2ypX3m6Pr0FwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780017680; c=relaxed/simple;
	bh=Nq9JF8/ejCtCSsTdRz9SW65gb2sGvLrtyy3FWnEJ8Po=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=YgL+X1gNN2GWhPKM/mTdDjwe59dAxErXRW4uPjqrQAqAoEvTqquIgEoPBZ74DFWGd5Ds33BUiT7tlRnezgL8jsicDCg4Yw4bkYcpKWU89itmulbmGIkFBvVuX6kPVdVgifcMiqSppYLliD5FJ1Vc8D8+VGTpBf1G9IzwAhzviTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BRRkDF6C; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BRRkDF6C"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B975B1F000E9;
	Fri, 29 May 2026 01:21:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780017678;
	bh=B1fdyORPeXwVnM0sOVGVQvdONUxVTJ8NIxo91EPGSlk=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date;
	b=BRRkDF6C3Y/8wKPLSY2UI6GE4UPn+NNGrXIEkvw9z4hhbDF0brwaep0U5uRv4IMZM
	 mYChWO7smrWL8eyDT1Ai/DTGyOmykyRusloWJbGrkk5Fr+lpRoPxCS1t9Rtpo2kmXJ
	 BLOAaHtC12BAYr7hhR+3w5U/cAl8x3iagRp9tMgOmAoG3FwhQqz5QbRuxWtN+x5qFe
	 VRkJYgfhNCCU9dpeTGinUSCKRdDGg5iFVNWVzsTi7YVi9kt96WYlkdtETYKMfOKXCH
	 1m07QTybfBKso3cSnUM4S6ZujoEVcNMK5Ey2ZO7DcV9OH4xuheZUKTbM1oDN+MiseV
	 hTFdkj7bp5eOQ==
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260524184701.16599-2-krzk@kernel.org>
References: <20260524184701.16599-2-krzk@kernel.org>
Subject: Re: [GIT PULL] clk: samsung: fixes for v7.1
From: Stephen Boyd <sboyd@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Chanwoo Choi <cw00.choi@samsung.com>, linux-clk@vger.kernel.org, Sylwester Nawrocki <snawrocki@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, Peter Griffin <peter.griffin@linaro.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
To: Krzysztof Kozlowski <krzk@kernel.org>, Michael Turquette <mturquette@baylibre.com>
Date: Thu, 28 May 2026 18:21:16 -0700
Message-ID: <178001767699.5961.8049719569121972475@lazor>
User-Agent: alot/0.12

Quoting Krzysztof Kozlowski (2026-05-24 11:47:02)
> Hi Stephen and Michael,
>=20
> Just one fix for current cycle.
>=20
> Best regards,
> Krzysztof
>=20
>=20
> The following changes since commit 254f49634ee16a731174d2ae34bc50bd5f45e7=
31:
>=20
>   Linux 7.1-rc1 (2026-04-26 14:19:00 -0700)
>=20
> are available in the Git repository at:
>=20
>   https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/sam=
sung-clk-fixes-7.1
>=20
> for you to fetch changes up to 78ee734b36284d82454e87a92094fdb926985b47:
>=20
>   clk: samsung: gs101: Fix missing USI7_USI DIV clock in peric0_clk_regs =
(2026-05-14 18:48:05 +0200)
>=20
> ----------------------------------------------------------------

Thanks. Pulled into clk-fixes.

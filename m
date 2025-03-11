Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25045262813;
	Tue, 11 Mar 2025 17:55:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741715730; cv=none; b=tIibUlYSGo1a9CJP9CLBjgrnbwDVKtpWzkyL+OZytJ6QOYmzZdZSJpsw3fsYR59asbpY7jesUnK/mxr/lXIcbieiXn6Qesp0EwnORvsQ/g2nNs5R2VXhwXX1feiMTDaYCA7tSim5jHETg04zgWO6e5s8WaXDls9uo45Sq/qIA+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741715730; c=relaxed/simple;
	bh=Rz9lyXxmaf/uzAfEKbd8SJdVtz9OIb9oURg/10eXquA=;
	h=Message-ID:Content-Type:MIME-Version:In-Reply-To:References:
	 Subject:From:Cc:To:Date; b=NTFSiGaiU/SFMskHbQFv/L7Y8YhLwyUoKao0RNWqLwphwkBb4heu4UdjW9tDqLkhXYn5YsuQ5BeMpB8YsIXMjai6qC2QObwEmbmvJ2vaMkk6+ZMkFkRW8TZptIYRjSa/sQCtIPaYW+OD2vS29YUA/ObDL2B16vuDToCIGsZNAig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=i/HOHbgc; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="i/HOHbgc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 824D7C4CEE9;
	Tue, 11 Mar 2025 17:55:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741715729;
	bh=Rz9lyXxmaf/uzAfEKbd8SJdVtz9OIb9oURg/10eXquA=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=i/HOHbgcZA3W7kQIsdjRhP5xRNu+hCUGvVBJX1Sx3YkUfVUaOgAw8KduexfZqjDU6
	 DTpOus9iGsjyLbU2y3v9ILC/c6Wdf1/b3gtmAtq93p8SSrpT07a+x5mH0PeY18meYL
	 qt4I38BV1GBRSCzq1Hy4xIMJA2duFRCgT2HdR+dqXUzV46k7gjFeTyolEGoNNpvMte
	 K4gnp7Pi3gMMPSOXg89PxozYI+xWzS44J10/QNOWQhoAZKUH+zpHrNEv6KryLqGocp
	 UBEq1ys/HMh6UlTaGj2Y34eHSfNqdusRzhz1JmM8Xi+3u9dmInC+9NvvVMOr7ZvbDR
	 GfgOLuyV1gDCg==
Message-ID: <3436f5e74321461507801ce5a405396b.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250309175154.6701-1-krzysztof.kozlowski@linaro.org>
References: <20250309175154.6701-1-krzysztof.kozlowski@linaro.org>
Subject: Re: [GIT PULL] clk: samsung: Fixes for v6.14
From: Stephen Boyd <sboyd@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Chanwoo Choi <cw00.choi@samsung.com>, linux-clk@vger.kernel.org, Sylwester Nawrocki <snawrocki@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, Peter Griffin <peter.griffin@linaro.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Michael Turquette <mturquette@baylibre.com>
Date: Tue, 11 Mar 2025 10:55:27 -0700
User-Agent: alot/0.12.dev8+g17a99a841c4b

Quoting Krzysztof Kozlowski (2025-03-09 10:51:53)
> Hi,
>=20
> Fixes for current RC.
>=20
> Best regards,
> Krzysztof
>=20
>=20
> The following changes since commit 2014c95afecee3e76ca4a56956a936e23283f0=
5b:
>=20
>   Linux 6.14-rc1 (2025-02-02 15:39:26 -0800)
>=20
> are available in the Git repository at:
>=20
>   https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/sam=
sung-clk-fixes-6.14
>=20
> for you to fetch changes up to 53517a70873c7a91675f7244768aad5006cc45de:
>=20
>   clk: samsung: update PLL locktime for PLL142XX used on FSD platform (20=
25-03-05 20:13:25 +0100)
>=20
> ----------------------------------------------------------------

Thanks. Pulled into clk-fixes

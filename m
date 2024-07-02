Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D40371CE081;
	Tue,  2 Jul 2024 19:43:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719949384; cv=none; b=Zzt9JE8f4hzi2urfYGwPQWlGz+iBKPjmspDuFK03OdxVOE3dHD4qDXqMTLfA1Jhqb5z4AJhvYzeS454zAenVjhaMqoPD6UG80MWBVQBE0mYU77dTLopUMFZPcjQceVEU3t+yvZ/e2tohE3s+TeWZGonBEtIgvUHJOs53sZB+/7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719949384; c=relaxed/simple;
	bh=1Af7dOq/VVVXmMQiunoP36ng6uRURIvlVcmZwUEBrOY=;
	h=Message-ID:Content-Type:MIME-Version:In-Reply-To:References:
	 Subject:From:Cc:To:Date; b=UStGiP/a1HIPH7MYpu+ZY2pCyknA+0t3NUWCqUdk4Ju8wxscHWkmzkkAiDxK+ReYGR+TvqMViPSzofTUzO4STXc6eiSs258peA9b6gQOSF8AwR3KMZq7RSf6n4V3ocQFMNah/JsdjGcH3dCE52ZspYFmS5/7pdE7RZifXj12Be0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=T4Rl2+TV; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="T4Rl2+TV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0D70C116B1;
	Tue,  2 Jul 2024 19:43:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719949384;
	bh=1Af7dOq/VVVXmMQiunoP36ng6uRURIvlVcmZwUEBrOY=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=T4Rl2+TVsw6zOxuU1a8rY978AYWyDyxJAe1T84mZtlip+KTLFN+Tot7zSRFdtA9M1
	 w7kq3iBdDSot4E0e3L+NfVO09TPFSnpOYy/bhvCcIptcohIlZGdgjZwElCZh03GU6A
	 zUczEBcv8JMKoU6DaNlkEnIAw8eiutvVSIxUoYvEoJsRoGvZeXDyyX82Bd03Hk4wER
	 zoquKXEPs9LckGiO8GDwYyG3E+pQ+An3+ReZ4j+GocbnaXc9FkgSqS5U/+NFjYXd3E
	 cR566AL8SOWfuWWJGZMU8j/3CDPXwIJ/H2NYy7OAnzho0fB2+J7xpkADogNXSrAkAg
	 U6EjeB4SkUjAg==
Message-ID: <a35c04d7d3ba579294ff1b7319a147b6.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20240702063120.5821-1-krzysztof.kozlowski@linaro.org>
References: <20240702063120.5821-1-krzysztof.kozlowski@linaro.org>
Subject: Re: [GIT PULL] clk: samsung: drivers for v6.11
From: Stephen Boyd <sboyd@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Chanwoo Choi <cw00.choi@samsung.com>, linux-clk@vger.kernel.org, Sylwester Nawrocki <snawrocki@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, Peter Griffin <peter.griffin@linaro.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Michael Turquette <mturquette@baylibre.com>
Date: Tue, 02 Jul 2024 12:43:02 -0700
User-Agent: alot/0.10

Quoting Krzysztof Kozlowski (2024-07-01 23:31:19)
> The following changes since commit 1613e604df0cd359cf2a7fbd9be7a0bcfacfab=
d0:
>=20
>   Linux 6.10-rc1 (2024-05-26 15:20:12 -0700)
>=20
> are available in the Git repository at:
>=20
>   https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/sam=
sung-clk-6.11
>=20
> for you to fetch changes up to e61f400d6cf3d598ac3ff88a47b34823f9e1f2d5:
>=20
>   clk: samsung: gs101: mark gout_hsi2_ufs_embd_i_clk_unipro as critical (=
2024-07-01 10:15:30 +0200)
>=20
> ----------------------------------------------------------------

Thanks. Pulled into clk-next

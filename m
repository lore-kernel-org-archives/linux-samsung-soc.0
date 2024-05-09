Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4344C45BF0;
	Thu,  9 May 2024 01:17:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715217471; cv=none; b=jQfH6phB4FpR2ZD1Mwx14O4YwgxOX/WNDMobD/MpK2XLroGmwUn7XlNVQVhnbbveQZ5MBQ/yUzva9bnaV+fU9YUOOswLfngdx6+JtIBlAKNKz6HzkF7eoIxmf/ENGFNLjBQyeWWynBn2V4cUQn88kPUewWBxp4SyoX+fkijatXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715217471; c=relaxed/simple;
	bh=kV1VWqbr0RH6auTOE68NJ9vQgoBqmwiq6D1n/S8sNy0=;
	h=Message-ID:Content-Type:MIME-Version:In-Reply-To:References:
	 Subject:From:Cc:To:Date; b=Nhdcgx+efV6ziCACDB/rY6zwGnu4byWfV/SE9wxH7Hj4/f6mKYdS/KDzrpdWPeaFSath+jVfdz5GwjEfrHyXofRuHCG5QRN3V4/ZA35XV171L/jpnblsbfNOqGHCM5W1x6OHjMuMKwq3J+9iCkzCQP7gD/eJYqCUtVfoHOSJ80o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YksXqOMI; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YksXqOMI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2CFCC113CC;
	Thu,  9 May 2024 01:17:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715217470;
	bh=kV1VWqbr0RH6auTOE68NJ9vQgoBqmwiq6D1n/S8sNy0=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=YksXqOMI4lsIaZqx0A5/i0JLSUHcsO6uruynoyRGSTcqWF903u/LNNb6O00rrl71F
	 cJoCY9K10j5YsDpFFHaW+Q/GDTqNdnFWxJZYEJtbqXcGypoZ9L2+lfbeRhWCjdQ5Fc
	 I2f/XBoH04xYOYY2Kv45HjT4EJgTKItrn6caanPg57Ooh/8V7a7CC8OeP8k5gXlVmk
	 wSEbxqrnDWea86AU7J9YgABLuuA35vwEF8jtn2Y/GO18uMF9XLAmCYiNY11uWwmdnR
	 aBt3zDugGxm3jz5EmWt6uOeJ0qm0hpePouEkYn/Q0TpQ4GSGlw3M9WAKm9hX28rbhj
	 xS2d+YmPOdkQA==
Message-ID: <9e2440caa122d05cfc0ee3cf64b46e48.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20240508153158.496248-1-krzysztof.kozlowski@linaro.org>
References: <20240508153158.496248-1-krzysztof.kozlowski@linaro.org>
Subject: Re: [GIT PULL] clk: samsung: drivers for v6.10, fixed pull, 2nd try
From: Stephen Boyd <sboyd@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Chanwoo Choi <cw00.choi@samsung.com>, linux-clk@vger.kernel.org, Sylwester Nawrocki <snawrocki@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, Peter Griffin <peter.griffin@linaro.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Michael Turquette <mturquette@baylibre.com>
Date: Wed, 08 May 2024 18:17:48 -0700
User-Agent: alot/0.10

Quoting Krzysztof Kozlowski (2024-05-08 08:31:56)
> Hi,
>=20
> Updated pull request with fixed issue of non-used local const data.
>=20
> Best regards,
> Krzysztof
>=20
>=20
> The following changes since commit 4cece764965020c22cff7665b18a0120063590=
95:
>=20
>   Linux 6.9-rc1 (2024-03-24 14:10:05 -0700)
>=20
> are available in the Git repository at:
>=20
>   https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/sam=
sung-clk-6.10-2
>=20
> for you to fetch changes up to 7c18b0a5aa46cc7e5d3a7ef3f9f8e3aa91bb780f:
>=20
>   clk: samsung: gs101: drop unused HSI2 clock parent data (2024-05-07 11:=
47:39 +0200)
>=20
> ----------------------------------------------------------------

Thanks. Pulled into clk-next

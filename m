Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7AD719A2A3;
	Thu, 10 Oct 2024 21:48:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728596921; cv=none; b=bquTt1zPXO31rE1TFcuxhvSXWMYQ686tYnEQo0yOPDRMmxS2NQJl64WM4tvnRbVIf7K5fucPNcuac+8hdt+y6bBh+ogejo3XChLvR3wiI3v/bhfeyXqmThzfJc8mjf9OmHs7TmkN1gkJNA0FNkPLdXpUUezuoSGmWG4dtRUl4jM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728596921; c=relaxed/simple;
	bh=yrGcbToO/wQ5cOvuutppQRUqlBhyFYBBk1mix09MZro=;
	h=Message-ID:Content-Type:MIME-Version:In-Reply-To:References:
	 Subject:From:Cc:To:Date; b=kBUU3XuZY6o6r+HoBjdvvJFZQXNPEi1m3c1UO5FLrAMtYa0dmKYyzNsa/iqcGliXGBAQFDxyfzGwHQjojmCtuJhcvFVm92FAXFCg8TUnKEQOzI2ZTuocvzq5lSNhB168QrMU++NeDX+1Z0WP/LYxPJa5KXorrqkCdCvlju3cMig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Sx1nSLzC; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Sx1nSLzC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41CB6C4CEC5;
	Thu, 10 Oct 2024 21:48:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728596920;
	bh=yrGcbToO/wQ5cOvuutppQRUqlBhyFYBBk1mix09MZro=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=Sx1nSLzChLIagzSBRgsRR89iZcI/71SyY9dwEM1SPthQygVdPqjXIlZBX85lyovMY
	 4uSj+0hSslIWxq3rcYzCxsexMBNBT928xFbX9sHb8iDFP3Ffcz46MV9bEeJ6ZPOOF2
	 N4e30tTgDOuBWkrma6JWhgf2+lbFepDvJGiVD4ohH85DnPOFmX+CJrQYwUZ4B4RRPl
	 krUYAYTK/NxAE3SZ5CYUbs015gwKvFwJzjCLkVWBUBwkkfa7zLzm65QJOj7ECJbU9W
	 DNYqoggXyEW0g1/PWzV5jmsntzmDcHqQPy7QNGo2tAWCLH7s8XzpmPZuyqzhQ9Imoj
	 WICABpMSAkklg==
Message-ID: <17bc2c2193f9a909457466387a2a9b76.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20241010085036.141170-1-krzysztof.kozlowski@linaro.org>
References: <20241010085036.141170-1-krzysztof.kozlowski@linaro.org>
Subject: Re: [GIT PULL fixes] clk: samsung: fixes for v6.12
From: Stephen Boyd <sboyd@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Chanwoo Choi <cw00.choi@samsung.com>, linux-clk@vger.kernel.org, Sylwester Nawrocki <snawrocki@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, Peter Griffin <peter.griffin@linaro.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Michael Turquette <mturquette@baylibre.com>
Date: Thu, 10 Oct 2024 14:48:38 -0700
User-Agent: alot/0.10

Quoting Krzysztof Kozlowski (2024-10-10 01:50:35)
> Hi,
>=20
> One patch with a fix for current RC.
>=20
> Best regards,
> Krzysztof
>=20
>=20
> The following changes since commit 9852d85ec9d492ebef56dc5f229416c925758e=
dc:
>=20
>   Linux 6.12-rc1 (2024-09-29 15:06:19 -0700)
>=20
> are available in the Git repository at:
>=20
>   https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/sam=
sung-clk-fixes-6.12
>=20
> for you to fetch changes up to a03c246d4ec836ae5827a4a16f6b9e730ec5ee8c:
>=20
>   clk: samsung: Fix out-of-bound access of of_match_node() (2024-09-30 13=
:10:11 +0200)
>=20
> ----------------------------------------------------------------

Thanks. Pulled into clk-fixes.

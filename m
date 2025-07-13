Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 524823C17;
	Sun, 13 Jul 2025 16:46:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752425206; cv=none; b=b7KzoGiUm9C3GCAFdsDtSGg5ZSJFiBlCa8lQ5gRi+M5PwCnwpWUYRprG5deE3Mqt10T8QUQfL14OOnR27YujI/ep2Jy6DF2lleeIGGLifuEc7QD4gOkPNgoUwBsBUdi1/1C6nqgOw56fgr1v0SBvo4xle5Y1yJveTAE1LaaePvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752425206; c=relaxed/simple;
	bh=g9dw72VLQAWHJtOpKYtM+S8Zwnhwl7h+5NFfEjYDrqQ=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=sb0RFGw5Xba9GiOQrtzICGNZVitkH5IAzrqLJxzSiA/vP4oYgJLAYu5ineoYysjuwflVA06CFEWA6n2Qd+lxjG4RoYKsntxDYM6li5uRl7A3ynNdu5DqUc7RCzKOkDhIrnIGL7XSL3pZLkjLE/KhYcQEBG7NUifbBzQ6hRDlifU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aibomoIf; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aibomoIf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE7AFC4CEE3;
	Sun, 13 Jul 2025 16:46:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752425205;
	bh=g9dw72VLQAWHJtOpKYtM+S8Zwnhwl7h+5NFfEjYDrqQ=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=aibomoIfweVUJ+BsiFGbW6qx0uIYc+4LEEfwrcbsU7JrbTRWzotDUMYINttnxbphh
	 y6D9dtV4f0ih2NVJsKitVha8Hz1oi/DY0HXh98Ib95ROFT3tzXKTXuA94MJ/FzY9NO
	 KBgJX78nFkSfDzfi31kjOhPSdLfSkoAdlFOYL103wy1TckUury0IbsfnAegMsVmf2Z
	 GrdohLTPQaZn6o0PXQ1MYZ/+ibPII9OvRBg6LbZirMBWSfx5cdQT49BM90XQhXU7Bo
	 7otxujTO9Pu7enpx3TX6PKMqfa8ozXXl2MJQx1uwqaboVwZ6x5dHiTaM93I6XkFZ84
	 O0zRiry942M0g==
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250709191358.171004-2-krzysztof.kozlowski@linaro.org>
References: <20250709191358.171004-2-krzysztof.kozlowski@linaro.org>
Subject: Re: [GIT PULL] clk: samsung: drivers for v6.17
From: Stephen Boyd <sboyd@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Chanwoo Choi <cw00.choi@samsung.com>, linux-clk@vger.kernel.org, Sylwester Nawrocki <snawrocki@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, Peter Griffin <peter.griffin@linaro.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Michael Turquette <mturquette@baylibre.com>
Date: Sun, 13 Jul 2025 09:46:44 -0700
Message-ID: <175242520461.1004940.5516510155875270578@lazor>
User-Agent: alot/0.11

Quoting Krzysztof Kozlowski (2025-07-09 12:13:57)
> Hi,
>=20
> Clock drivers. The bindings were kept on separate branch, just in case, b=
ut
> eventually they were not shared outside.
>=20
> Best regards,
> Krzysztof
>=20
>=20
> The following changes since commit 19272b37aa4f83ca52bdf9c16d5d81bdd13544=
94:
>=20
>   Linux 6.16-rc1 (2025-06-08 13:44:43 -0700)
>=20
> are available in the Git repository at:
>=20
>   https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/sam=
sung-clk-6.17
>=20
> for you to fetch changes up to 2d539f31ab0eb3eb3bd9491b7dcd52dec7967e15:
>=20
>   clk: samsung: exynosautov920: add block hsi2 clock support (2025-06-12 =
17:28:11 +0200)
>=20
> ----------------------------------------------------------------

Thanks. Pulled into to clk-next

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C12D35CBBC;
	Fri, 14 Nov 2025 03:51:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763092286; cv=none; b=gYegk3jV7ledx/9gYQ2yQ4v7spcNXGW5tWcnFU+92vUs6TeGD7v2x2KV+qDLrJSN6jIYPi+MNc02clF08O2P9+zQfUGEpAQhSPRzODzGYsPh8waa/Ve+s7j1TGcmJrPPFnENc6+jNLBjxhDgjalkQD2lUKWTzy61sMVGjwNGGvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763092286; c=relaxed/simple;
	bh=22oFX8wBRRC9Nq9UVdE5yPbQ8/s/QPRCJqJO6guZmak=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=u2Wa/sYZ2ZTphMQZaBGsDDYbNV3xf9tlzXKhzOasxYAd7WymZymghqSwe+FNiGZiMhjGHZyLVYXvd2aOYGp6CBXOGzwHXwW/5aCGB2fD2Vipvm/GD0pk3few7aZS7iBRxDZ/1kxq5DGL/whH+Dmv85Ig6n4bZZnYDmZ2KC7tppU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PWMDKLHC; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PWMDKLHC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1598FC4CEF8;
	Fri, 14 Nov 2025 03:51:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763092286;
	bh=22oFX8wBRRC9Nq9UVdE5yPbQ8/s/QPRCJqJO6guZmak=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=PWMDKLHCoYkxTbwYOMpLSG8qbPOEk1S+vVTN5opd1Q7edMh/6H+c+v8J5ai/Mu7LC
	 CuKKox9/PPZibwtFhguQoGUk4Ilwuy7cW4mkwXmTQxUEcaVlqe5MnF5JCQd7mRcGI/
	 nXxeafOJtEwsxXyokhflYvc1wQ9GvX12iDOSTDFFXm5VPCVPcBAs4O6aLA+QItRk/e
	 wrPb2K7IVKRiLCebArzReHQLDLtDLpXGsVKk0WaA5ZxPnQ1DTKC0CE2H4bCITM5/Vh
	 pXjVqDr8dH/DLFm9a6BnkGn3NcIsHpl9/DzvTLAIrWvnfxvQWNWanHG/UvC6ei3+DQ
	 uqlNzyLbXSqxw==
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20251110151242.136508-2-krzk@kernel.org>
References: <20251110151242.136508-2-krzk@kernel.org>
Subject: Re: [GIT PULL] clk: samsung: drivers for v6.19
From: Stephen Boyd <sboyd@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Chanwoo Choi <cw00.choi@samsung.com>, linux-clk@vger.kernel.org, Sylwester Nawrocki <snawrocki@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, Peter Griffin <peter.griffin@linaro.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, Michael Turquette <mturquette@baylibre.com>
Date: Thu, 13 Nov 2025 19:51:24 -0800
Message-ID: <176309228416.11952.16188046098586273315@lazor>
User-Agent: alot/0.11

Quoting Krzysztof Kozlowski (2025-11-10 07:12:42)
> From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>=20
> The following changes since commit 3a8660878839faadb4f1a6dd72c3179c1df567=
87:
>=20
>   Linux 6.18-rc1 (2025-10-12 13:42:36 -0700)
>=20
> are available in the Git repository at:
>=20
>   https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/sam=
sung-clk-6.19
>=20
> for you to fetch changes up to d669ec6be0b1965c67248407d87c848b1b7c12ae:
>=20
>   clk: samsung: clk-pll: simplify samsung_pll_lock_wait() (2025-10-18 18:=
12:41 +0200)
>=20
> ----------------------------------------------------------------

Thanks. Pulled into clk-next

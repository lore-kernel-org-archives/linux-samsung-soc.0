Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E225219E;
	Wed, 14 Aug 2024 00:01:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723593713; cv=none; b=EC6n1+KVzc1n85M90kf1RT82pEIvGZ3eD2YUCb9qkHRCnAqxcMnf8/0teKjsLmFLPyBZa2PZAi/5UzddIp0NW2lksB6OUOF2NqeEuuBpk7cCgw2Ioq63HUc2Nm9rtTrirGW61lYkuAqSdYHxRhdJa12SovNvUzlq1tCIHfkbXn0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723593713; c=relaxed/simple;
	bh=O+tDBnWVqdcf72Sp7gBl+Zs0H0ScKcO7cHY7UGsqRb4=;
	h=Message-ID:Content-Type:MIME-Version:In-Reply-To:References:
	 Subject:From:Cc:To:Date; b=ryHhOGOoWIetK7IB7RleijZE4aKV/uJOnEKHeJrArdzmuwkWjYQ+W9fP5uozL53qEqZAgm+cWZ9LTGuOBErKSfvf9VfJp/URiK1iVxX+fmysoxXjVn/oVMSbGMk5jQnevcUDkRUlYiL/zpA91UtOiWP8GyyuMJaFAVeHpihSJC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fMT8PLDN; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fMT8PLDN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 767A0C32782;
	Wed, 14 Aug 2024 00:01:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723593712;
	bh=O+tDBnWVqdcf72Sp7gBl+Zs0H0ScKcO7cHY7UGsqRb4=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=fMT8PLDNvelDL+HOD1J1ZYfRGoqt/Q0iK5aJd7x1P+B5EC1E0NLInZLBX3KaqFqyC
	 r5coCZOcQJoRZVopkzNQsBlYBayN/L78TDPzA8OLLJTBDVCgx1KZkMHEfRTWDzB3si
	 p1Rwp9OTfazqu73Df99nbhdmHDOBgc2kjIZ7OpIgV7CD7Fp+lY+Lr9tqK3q/ICJpYT
	 NIl6mLPJ+rn0Hj1sc2tOmD83V0jgkhUfUGRYobSo0fE5ggy+ffDfLcNegEBgypHnYE
	 HE0HiyNTZVUdxE/Ug6anRB8lTH04PAI0PRmFoPv97XIopx2idgrTyTb4Oqckmh+IJL
	 RenYj8Jt8LzaQ==
Message-ID: <2478bc8a787d07cd3e412b6ee4400669.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <ZrsbXMVy1Dsi4UZe@smile.fi.intel.com>
References: <20240606161028.2986587-1-andriy.shevchenko@linux.intel.com> <ZrsbXMVy1Dsi4UZe@smile.fi.intel.com>
Subject: Re: [PATCH v1 0/4] clk: Switch to use kmemdup_array()
From: Stephen Boyd <sboyd@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>, Heiko Stuebner <heiko@sntech.de>, Krzysztof Kozlowski <krzk@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Sam Protsenko <semen.protsenko@linaro.org>, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Date: Tue, 13 Aug 2024 17:01:50 -0700
User-Agent: alot/0.10

Quoting Andy Shevchenko (2024-08-13 01:37:48)
> On Thu, Jun 06, 2024 at 07:09:30PM +0300, Andy Shevchenko wrote:
> > Replace open coded kmemdup_array(), which does an additional
> > overflow check.
>=20
> ...
>=20
> >   clk: mmp: Switch to use kmemdup_array()
>=20
> >   clk: visconti: Switch to use kmemdup_array()

I have them all as "changes requested" so please resend.

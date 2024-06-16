Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7A8016D33E;
	Sun, 16 Jun 2024 08:00:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718524817; cv=none; b=jyooDlwRF8eR0j81/UZYngWkON1t5hR63is3igmqdJnTPPB1AFTMd7mtGPgYiQY0tcKo3iL0VBMdPIHCqvLt9F5sIQoerlqAsOMcsw0elN40glVMe1gkJGdF3Npm0up01ZUcXtB4ZtR+AK6GIJXoqFmW3drNbpRI+d0KOX5I5+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718524817; c=relaxed/simple;
	bh=Kx9wz1mFls9/uJS/vpae1QpuUfW4zPS3SusOm+sxWXQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AlVi7tXSErSntSTOXazmeMH1UgkQKrjmYN9TeFh4bNosKH7tGpS8lU0+1NsW0qNMaXkgFGMrYaxsWEBJItqbS0T6OP2w+KkAracSDC1+UqGgLm4ifB49dl98/LXTaI1MtAc/fpVjIVbCbUHvgNRwWSoQ4pKHP29bZiseibxHao0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Received: from 79-98-74-242.sys-data.com ([79.98.74.242] helo=phil.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1sIko5-0000Vp-S0; Sun, 16 Jun 2024 10:00:09 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Sam Protsenko <semen.protsenko@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>,
 Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
Subject: Re: [PATCH v1 2/4] clk: rockchip: Switch to use kmemdup_array()
Date: Sun, 16 Jun 2024 10:00:07 +0200
Message-ID: <6087515.R56niFO833@phil>
In-Reply-To: <ZmhPBccSC0Uc2fjQ@smile.fi.intel.com>
References:
 <20240606161028.2986587-1-andriy.shevchenko@linux.intel.com>
 <8182279.JRmrKFJ9eK@diego> <ZmhPBccSC0Uc2fjQ@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"

Am Dienstag, 11. Juni 2024, 15:20:05 CEST schrieb Andy Shevchenko:
> On Fri, Jun 07, 2024 at 10:13:04AM +0200, Heiko St=FCbner wrote:
> > Am Donnerstag, 6. Juni 2024, 18:09:32 CEST schrieb Andy Shevchenko:
>=20
> ...
>=20
> > > -		cpuclk->rate_table =3D kmemdup(rates,
> > > -					     sizeof(*rates) * nrates,
> > > -					     GFP_KERNEL);
> > > +		cpuclk->rate_table =3D kmemdup_array(rates, nrates, sizeof(*rates),
> > > +						   GFP_KERNEL);
> >=20
> > are you sure the param order is correct?
> >=20
> > According to [0], it's (src, element_size, count, gfp), while above
> > (and below) element_size and count seems switched in the
> > kmemdup_array calls.
>=20
> I'm glad you asked. The parameter order is going to be fixed [1].
>=20
> > [0] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/=
tree/mm/util.c#n149
>=20
> [1]: 0ee14725471c ("mm/util: Swap kmemdup_array() arguments")

ah that clears it up :-)


Thanks for the pointer
Heiko



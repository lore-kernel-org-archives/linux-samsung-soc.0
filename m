Received: from mail-106101.protonmail.ch (mail-106101.protonmail.ch [79.135.106.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E95633D6ED;
	Tue, 18 Aug 2026 09:22:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787044927; cv=none; b=KZEAvvZheNtrWd2IywZ5GrdXa6w/QjtSgwnhqc616274256t9ODkRE0CC8hfnlASb2lw1S8YI+VOBvIgEZjmUUAj+/hQ4NkQDbSC846J+D3ezcFdayvis+FyZfsd6CtZOBMLzLgsQJkN7b+z/c3zrYVPFnjFCiHfs3eIxVVOyhU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787044927; c=relaxed/simple;
	bh=zTSgW3lqKvxe96bVUgTAt0zx4SrLraeyYO8HpL7beks=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=amzBCT8PWF3Z/s1RKfoJN98+EsbrAAnDD4SYqAgv9kcvydwtOc6vCwtsLJiGFByv+tFjiB2VkWSVmymSR3mH4Po/0ez6hbS9GpghVf7bcC6x2dhzqHBCshyEJWVQiE1+sWsG23n+szYf8qYLIS/FKWpvjxs+Pr6qYa9OTTBi3Cg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=XUxmBcBZ; arc=none smtp.client-ip=79.135.106.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="XUxmBcBZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1787044922; x=1787304122;
	bh=zTSgW3lqKvxe96bVUgTAt0zx4SrLraeyYO8HpL7beks=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=XUxmBcBZ5e6SeXUVt+WJsc8HpGpKBN2hWyltd8u6Sm+MWzeQmxGaJT6h2DTsYaXfM
	 cPaD1wQioujiB9ujpeg0tvQHqtVdPo1v9AxkH5274/GX+l0a3m849a5jC/CqAVg/RH
	 af4+qMb4PFxu8bFu60P1QSDBjnYGoOZCZk0WxJ0y2SHe7OPenVJArRXb3HOULU9glt
	 6UFMtwYThNZQZnMdgFnOLFKTeuE3S9wyzXp6CxJUY9OSYsaCHSud3s2+LgGHzs3gmU
	 m/1dHUZfbqQk9Xf9y7YYQ5sPMoj0+DyDcgl1rBb8szYqjaoOoYxNiGKrSBrwBdWDK/
	 rlOrmqETvYYSA==
Date: Tue, 18 Aug 2026 09:21:56 +0000
To: Alim Akhtar <alim.akhtar@samsung.com>
From: Aiden Isik <aidenisik@protonmail.com>
Cc: aidenisik@member.fsf.org, 'Krzysztof Kozlowski' <krzk@kernel.org>, 'Sylwester Nawrocki' <s.nawrocki@samsung.com>, 'Chanwoo Choi' <cw00.choi@samsung.com>, "'Peter\tGriffin'" <peter.griffin@linaro.org>, 'Michael Turquette' <mturquette@baylibre.com>, 'Stephen Boyd' <sboyd@kernel.org>, 'Brian Masney' <bmasney@redhat.com>, 'Rob Herring' <robh@kernel.org>, 'Conor Dooley' <conor+dt@kernel.org>, 'Kees Cook' <kees@kernel.org>, "'Gustavo A. R. Silva'" <gustavoars@kernel.org>, linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, 'Aiden Isik' <aidenisik+git@member.fsf.org>
Subject: Re: RE: [PATCH 2/3] clk: samsung: clk-pll: Add support for pll_309
Message-ID: <WlIHBa8-P07AMfFe5EEKZh_6Wf7Uy5uOuF7Jn23UY5QHcjjSpab2Vw0u_bZLCjHe73lu3fg6IevtFeJrkc3lNcZZtDnN41QJwZ7hzzBAsfg=@protonmail.com>
In-Reply-To: <025901dd2ec6$0245bcf0$06d136d0$@samsung.com>
References: <20260817-for-next-lucky7-clock-v1-0-032e4b229c76@member.fsf.org> <CGME20260817101721epcas5p228e56fa915717b7a547df144ff801c8c@epcas5p2.samsung.com> <20260817-for-next-lucky7-clock-v1-2-032e4b229c76@member.fsf.org> <025901dd2ec6$0245bcf0$06d136d0$@samsung.com>
Feedback-ID: 46524699:user:proton
X-Pm-Message-ID: cb31ad2511c84fea8b1ab9d40af6ee6983b56437
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

> This patch does more then what is described above; please explain all cha=
nges in the commit.
> If needed, split this into common and pll_309 specific changes. Thanks!

This was a mistake I made when rebasing onto a newer commit.
It's not meant to do that. Will fix in v2. Thanks.

> Regards,
> Alim

Kind regards,
- Aiden Isik

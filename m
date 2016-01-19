From: Andi Shyti <andi.shyti@samsung.com>
Subject: Re: [PATCH 2/2] clk: s2mps11: allocate only one structure for clock
 init
Date: Tue, 19 Jan 2016 11:43:16 +0900
Message-ID: <20160119024316.GA3793@samsunx.samsung>
References: <1453105525-31506-1-git-send-email-andi.shyti@samsung.com>
 <1453105525-31506-3-git-send-email-andi.shyti@samsung.com>
 <CAKew6eX4WZa4595ZUhiX+Ndc_WCzBNJBh5ejzxaJVkCnAskCYw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:39511 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932446AbcASCn1 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 18 Jan 2016 21:43:27 -0500
Content-disposition: inline
In-reply-to: <CAKew6eX4WZa4595ZUhiX+Ndc_WCzBNJBh5ejzxaJVkCnAskCYw@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Yadwinder Singh Brar <yadi.brar01@gmail.com>
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Sangbeom Kim <sbkim73@samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, linux-kernel <linux-kernel@vger.kernel.org>, linux-clk@vger.kernel.org, Andi Shyti <andi@etezian.org>

Hi Yadwinder,

>     The driver allocates three structures for three different clock
>     types. They are quite similar and in the clock init data they
>     differ only by the name. Only one of these structure is used,
>     while the others lie unused in the memory.
>=20
>=20
> If you are worried about memory, they can be made __initdata by
> creating a copy during probe.

mmmhhh... allocating in boot time as much as we want and then copy
what we need? It doesn't look that pretty to me.

>     The clock's name, though, is not such a meaningful information
>=20
>=20
> I think it can be meaningful in debugging.

Can you explain what's the use of the naming other than
debugging?

>     and by assigning the same name to the initial data we can avoid
>     over allocation. The common name chosen will be s2mps11,
>     coherently with the device driver name, instead of the clock
>     device.
>=20
>     Therefore, remove the structures associated to s2mps13 and
>     s2mps14 and use only the one referred to s2mps11 for all kind of
>     clocks.
>=20
>=20
> IMHO, with all these modifications, it will leave driver with some ex=
tra
> checks and reduced readability, perhaps will make it complex to add
> support for similar clocks but with different clk_ops, if next versio=
n or
> =A0any similar mfd chip comes up in future.

In that case, when the new chip will come, we would need to
figure out something, but for sure I don't see it as a good idea
to leave allocated unused structures.

Thanks,
Andi

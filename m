From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v5 4/4] drivers/rtc/rtc-s5m.c: add support for S2MPS15 RTC
Date: Mon, 2 Nov 2015 10:58:49 +0000
Message-ID: <20151102105849.GV4058@x1>
References: <1446186334-16510-1-git-send-email-alim.akhtar@samsung.com>
 <1446186334-16510-5-git-send-email-alim.akhtar@samsung.com>
 <20151101174048.GD22331@piout.net>
 <5636A44D.4090908@samsung.com>
 <20151102004722.GI22331@piout.net>
 <20151102090359.GR4058@x1>
 <20151102101931.GK22331@piout.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wm0-f52.google.com ([74.125.82.52]:34254 "EHLO
	mail-wm0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753200AbbKBK6x (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 2 Nov 2015 05:58:53 -0500
Received: by wmff134 with SMTP id f134so55482940wmf.1
        for <linux-samsung-soc@vger.kernel.org>; Mon, 02 Nov 2015 02:58:52 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <20151102101931.GK22331@piout.net>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Alexandre Belloni <alexandre.belloni@free-electrons.com>
Cc: Krzysztof Kozlowski <k.kozlowski@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, broonie@kernel.org, linux-samsung-soc@vger.kernel.org, rtc-linux@googlegroups.com, linux-kernel@vger.kernel.org

On Mon, 02 Nov 2015, Alexandre Belloni wrote:

> On 02/11/2015 at 09:03:59 +0000, Lee Jones wrote :
> > > > I think you cannot apply it directly because it depends on head=
ers from
> > > > patch 2/4. It won't build.
> > > >=20
> > >=20
> > > Yeah, this depends on the mfd tree. I don't thin Lee applied patc=
h 2/4
> > > yet so I'm taking that one for 4.5.
> >=20
> > I don't mind if you take it, but if you do so you need to take the
> > Regulator patch as well AND provide Mark and I a pull-request from =
an
> > immutable branch please.=20
> >=20
>=20
> Actually, I was thinking that you would take 2/4 through your tree an=
d I
> would either base myself on that or delay the patch for 4.5. You coul=
d
> also take the rtc patch if you plan to apply 2/4, feel free to add my
> acked-by.

Perfect.  I will do the latter.

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog

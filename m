From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v2 0/8] clk: max77686: Clock provider implementation fixes
Date: Mon, 6 Jan 2014 11:06:04 +0000
Message-ID: <20140106110604.GN23772@lee--X1>
References: <1386864441-19561-1-git-send-email-t.figa@samsung.com>
 <20131231194215.12054.39705@quantum>
 <2890647.PEOApIOYyP@amdc1227>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-we0-f178.google.com ([74.125.82.178]:36268 "EHLO
	mail-we0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752144AbaAFLGJ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 6 Jan 2014 06:06:09 -0500
Received: by mail-we0-f178.google.com with SMTP id u57so15481127wes.37
        for <linux-samsung-soc@vger.kernel.org>; Mon, 06 Jan 2014 03:06:08 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <2890647.PEOApIOYyP@amdc1227>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <t.figa@samsung.com>
Cc: Mike Turquette <mturquette@linaro.org>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Samuel Ortiz <sameo@linux.intel.com>, Sachin Kamat <sachin.kamat@linaro.org>, Kyungmin Park <kyungmin.park@samsung.com>

> > > This series intends to improve clock provider impementation of ma=
x77686
> > > PMIC driver. First two patches are simple fixes of current implem=
entation
> > > to allow correct control of provided clocks. Further patches refa=
ctor
> > > the driver to make the code cleaner and prepare for further patch=
es. Then
> > > last two patches add registration of OF clock provider and adjust=
 device
> > > tree nodes of boards containing max77686 chip to contain properti=
es
> > > required by clock provider.
> >=20
> > Acked-by: Mike Turquette <mturquette@linaro.org>
>=20
> Hmm... Shouldn't this series go through the clk tree directly? If not=
, who
> should be taking it?

I'm not quite sure why this patch-set was sent to me in the first
place, but I guess that's by the by.

Mike is probably waiting for the ARM and DT patches to be Acked,
applied.

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog

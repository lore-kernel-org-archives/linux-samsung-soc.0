From: Seungwhan Youn <claude.youn@gmail.com>
Subject: Re: [PATCH 3/10] ARM: S5PC100: Add SCLK_SPDIF clock
Date: Fri, 8 Oct 2010 19:45:14 +0900
Message-ID: <AANLkTinZuMkDNotnwDFS8_EPhbG+p_GWEZjU5thzvW++@mail.gmail.com>
References: <1286191550-22197-1-git-send-email-sw.youn@samsung.com>
	<1286192545-18327-1-git-send-email-sw.youn@samsung.com>
	<001901cb66d1$32db1e10$98915a30$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wy0-f174.google.com ([74.125.82.174]:43830 "EHLO
	mail-wy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753043Ab0JHKpR convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 8 Oct 2010 06:45:17 -0400
Received: by wyb28 with SMTP id 28so954765wyb.19
        for <linux-samsung-soc@vger.kernel.org>; Fri, 08 Oct 2010 03:45:15 -0700 (PDT)
In-Reply-To: <001901cb66d1$32db1e10$98915a30$%kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: Seungwhan Youn <sw.youn@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, alsa-devel@alsa-project.org, ben-linux@fluff.org, lrg@slimlogic.co.uk, broonie@opensource.wolfsonmicro.com, jassi.brar@samsung.com

Hi,

>> +static int s5pc100_spdif_set_rate(struct clk *clk, unsigned long ra=
te)
>> +{
>> + =C2=A0 =C2=A0 struct clk *pclk;
>> + =C2=A0 =C2=A0 int ret;
>> +
>> + =C2=A0 =C2=A0 pclk =3D clk_get_parent(clk);
>> + =C2=A0 =C2=A0 if (IS_ERR(pclk))
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -EINVAL;
>> +
>> + =C2=A0 =C2=A0 ret =3D pclk->ops->set_rate(pclk, rate);
>> + =C2=A0 =C2=A0 clk_put(pclk);
>> +
>> + =C2=A0 =C2=A0 return ret;
>
> How about following?
>
> static int parent_set_rate(struct clk *clk, unsigned long rate)
> {
> =C2=A0 =C2=A0 =C2=A0 =C2=A0struct clk *p_clk;
> =C2=A0 =C2=A0 =C2=A0 =C2=A0int ret;
>
> =C2=A0 =C2=A0 =C2=A0 =C2=A0p_clk =3D clk_get_parent(clk);
> =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D clk_set_rate(p_clk, rate);
>
> =C2=A0 =C2=A0 =C2=A0 =C2=A0clk_put(p_clk);
>
> =C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;
> }
>
> Hmm...isn't there any method?...

I think you mean is that adds a new clock api function that sets
parent clock rate.(am I right?) But as you know, this also needs that
S/PDIF knows it's source clock can not set rate directly and set it's
parent clock.

Actually my point was that I want to make S/PDIF does not care about
clock characteristics, so I did make it solve in clock part, not in
audio driver. And also, I do not want to modify a common function
'clk_set_rate()' that can support jassi's opinion, because I'm not
sure about side effect that I can not grantee it's safety with other
drivers.

(snip)

Thanks,
Claude

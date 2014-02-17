From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH 08/12] clk: samsung: add clock controller driver for s3c2410,
 s3c2440 and s3c2442
Date: Mon, 17 Feb 2014 23:37:16 +0100
Message-ID: <53028F1C.7090806@gmail.com>
References: <201312131356.40755.heiko@sntech.de> <201312131401.52029.heiko@sntech.de> <52F7D842.5060609@gmail.com> <5643318.r2EB20boll@phil>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ea0-f174.google.com ([209.85.215.174]:51704 "EHLO
	mail-ea0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751445AbaBQWhY (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 17 Feb 2014 17:37:24 -0500
Received: by mail-ea0-f174.google.com with SMTP id z10so4182008ead.19
        for <linux-samsung-soc@vger.kernel.org>; Mon, 17 Feb 2014 14:37:23 -0800 (PST)
In-Reply-To: <5643318.r2EB20boll@phil>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: =?ISO-8859-1?Q?Heiko_St=FCbner?= <heiko@sntech.de>
Cc: Kukjin Kim <kgene.kim@samsung.com>, t.figa@samsung.com, mturquette@linaro.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

On 17.02.2014 22:05, Heiko St=FCbner wrote:
> Hi Tomasz,
>
> Am Sonntag, 9. Februar 2014, 20:34:26 schrieb Tomasz Figa:
>>> +/*
>>> + * fixed rate clocks generated outside the soc
>>> + * Only necessary until the devicetree-move is complete
>>> + */
>>> +struct samsung_fixed_rate_clock s3c2410_common_frate_clks[] __init=
data =3D
>>> {
>>> +	FRATE(XTI, "xti", NULL, CLK_IS_ROOT, 0),
>>
>> Do you need to assign this clock an ID? When DT is used, it's define=
d as
>> a separate clock provider using fixed clock bindings, so it is not
>> provided by this driver.
>
> I think that I'll need this (and similar on the s3c2412). This is due=
 to the
> cpufreq driver for the earlier SoCs needing the xtal-frequency to cal=
culate
> the pll lock time (s3c24xx-cpufreq.c s3c_cpufreq_update_loctkime).
>
> Or do you have an idea on how to fix up the cpufreq driver in an easy=
 way?

OK, I get the problem here. So you need the ID to register an alias.

Still, the ID would be invalid when booted with DT and xti clock=20
registered using fixed rate clock bindings. So I'd suggest moving the=20
XTI clock ID definition from your DT binding header back to your driver=
,=20
leaving a comment in the header that this ID is reserved.

What do you think?

Best regards,
Tomasz

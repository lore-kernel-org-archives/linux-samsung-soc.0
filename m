From: Kyungmin Park <kmpark@infradead.org>
Subject: Re: [PATCH 3/3] ARM: S5PV210: Add voltage consumer of WM8994 to the
 regulator framework
Date: Fri, 1 Oct 2010 14:40:02 +0900
Message-ID: <AANLkTinRgTJdPowTEZX0nix2FR31A-8cVmBUf7n8zdE7@mail.gmail.com>
References: <4CA5623D.3000002@samsung.com>
	<20101001053139.GE30949@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wy0-f174.google.com ([74.125.82.174]:46498 "EHLO
	mail-wy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751193Ab0JAFkD convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 1 Oct 2010 01:40:03 -0400
Received: by wyb28 with SMTP id 28so2596084wyb.19
        for <linux-samsung-soc@vger.kernel.org>; Thu, 30 Sep 2010 22:40:02 -0700 (PDT)
In-Reply-To: <20101001053139.GE30949@sirena.org.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Mark Brown <broonie@opensource.wolfsonmicro.com>
Cc: Chanwoo Choi <cw00.choi@samsung.com>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, Kukjin Kim <kgene.kim@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Myungjoo Ham <myungjoo.ham@samsung.com>, Ben Dooks <ben-linux@fluff.org>, Liam Girdwood <lrg@slimlogic.co.uk>

On Fri, Oct 1, 2010 at 2:31 PM, Mark Brown
<broonie@opensource.wolfsonmicro.com> wrote:
> On Fri, Oct 01, 2010 at 01:23:25PM +0900, Chanwoo Choi wrote:
>
>> Additionally, I explain the constraints of the regulator of WM8994 c=
odec.
>> All these consumer supply of WM8994 codec connected the regulator(VC=
C_1.8V)
>> on a circuit diagram. "VCC_1.8V" regulator is always enabled, becaus=
e it is
>> used to many devices on Goni/Aquila board. This is required especial=
ly
>
> It would be nicer to connect this to the regulator on the PMIC (I'm
> assuming there is one), even if it is always enabled. =A0That said, i=
s the
> PMIC on these boards supported by Linux yet?

=46YI: now wm8994 codec is connected to I/O power directly. and there's
no connection with PMIC.
Maybe you mean the I/O power LDO and use it. but it's always on in
case of s5pc110.
and can't turn off the this LDO on max8998 except the sleep.

Thank you,
Kyungmin Park
>
>> when there are many devices physically attached to "VCC_1.8V" and so=
me of
>> they did not "register" as consumers to "VCC_1.8V". "VCC_1.8V" might=
 be
>> turned off by those who are registered while "unregistered" are stil=
l active
>
> You can set the always_on flag in the regulator constraints to preven=
t
> this happening - if that flag is set the supply will be kept active e=
ven
> if all consumers are disabled.
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsu=
ng-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>

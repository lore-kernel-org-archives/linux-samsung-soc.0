From: Kyungmin Park <kmpark@infradead.org>
Subject: Re: [PATCH 3/3] ARM: S5PV210: Add voltage consumer of WM8994 to the
 regulator framework
Date: Fri, 1 Oct 2010 17:25:43 +0900
Message-ID: <AANLkTi=4XjbTDb_vukFicO2tXYvww-dGFyaErwx1i-BF@mail.gmail.com>
References: <4CA5623D.3000002@samsung.com>
	<20101001053139.GE30949@sirena.org.uk>
	<AANLkTinRgTJdPowTEZX0nix2FR31A-8cVmBUf7n8zdE7@mail.gmail.com>
	<20101001072425.GD20529@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ww0-f44.google.com ([74.125.82.44]:58956 "EHLO
	mail-ww0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754125Ab0JAIZp (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 1 Oct 2010 04:25:45 -0400
Received: by wwj40 with SMTP id 40so992504wwj.1
        for <linux-samsung-soc@vger.kernel.org>; Fri, 01 Oct 2010 01:25:44 -0700 (PDT)
In-Reply-To: <20101001072425.GD20529@opensource.wolfsonmicro.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Mark Brown <broonie@opensource.wolfsonmicro.com>
Cc: Chanwoo Choi <cw00.choi@samsung.com>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, Kukjin Kim <kgene.kim@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Myungjoo Ham <myungjoo.ham@samsung.com>, Ben Dooks <ben-linux@fluff.org>, Liam Girdwood <lrg@slimlogic.co.uk>

On Fri, Oct 1, 2010 at 4:24 PM, Mark Brown
<broonie@opensource.wolfsonmicro.com> wrote:
> On Fri, Oct 01, 2010 at 02:40:02PM +0900, Kyungmin Park wrote:
>
>> FYI: now wm8994 codec is connected to I/O power directly. and there's
>> no connection with PMIC.
>
> Presumably there's a power rail connection...
>
>> Maybe you mean the I/O power LDO and use it. but it's always on in
>> case of s5pc110.
>
> ...like this.
>
>> and can't turn off the this LDO on max8998 except the sleep.
>
> It's still good to show the actual connection on the board for clarity -
> like I say, the regulator API can handle always on regulators and
> keeping the regulator setup in software close to the schematic helps
> make the code easier to follow.

It's best but in most case schematic is confidential. so it's impossible.

And as you concerns there's no power issues related with codes. it's
already verified design. I think wolfsonmicro already confirmed.

Thank you,
Kyungmin Park

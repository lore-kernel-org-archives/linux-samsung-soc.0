From: Thomas Abraham <thomas.ab@samsung.com>
Subject: Re: Cleanup Samsung stuff
Date: Tue, 19 Apr 2011 14:10:00 +0530
Message-ID: <BANLkTim2VJBoO-otakfVQaYsXLTyM91jsA@mail.gmail.com>
References: <012801cbfe33$a76fa490$f64eedb0$%kim@samsung.com>
	<20110419080307.GA26650@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-px0-f179.google.com ([209.85.212.179]:57539 "EHLO
	mail-px0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752833Ab1DSIkB convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 19 Apr 2011 04:40:01 -0400
Received: by pxi2 with SMTP id 2so4293438pxi.10
        for <linux-samsung-soc@vger.kernel.org>; Tue, 19 Apr 2011 01:40:00 -0700 (PDT)
In-Reply-To: <20110419080307.GA26650@sirena.org.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Mark Brown <broonie@opensource.wolfsonmicro.com>
Cc: Kukjin Kim <kgene.kim@samsung.com>, LAK <linux-arm-kernel@lists.infradead.org>, linux-samsung-soc@vger.kernel.org, Russell King <rmk+kernel@arm.linux.org.uk>, Ben Dooks <ben-linux@fluff.org>

On Tue, Apr 19, 2011 at 1:33 PM, Mark Brown
<broonie@opensource.wolfsonmicro.com> wrote:
> On Tue, Apr 19, 2011 at 10:46:47AM +0900, Kukjin Kim wrote:
>
>> - Device tree (with Linaro)
>
> What is going on with device tree? =A0I've asked a couple of times ab=
out
> this in the other thread but I'm still not clear where the code is or
> what could usefully be done with it.

The initial work on Samsung's s5pv310 is available at
http://lists.ozlabs.org/pipermail/devicetree-discuss/2011-February/0043=
50.html

It is based on Grant's tree.
git://git.secretlab.ca/git/linux-2.6 devicetree/test

Currently I am working on supporting clkdev and Jeremy's common clock
for all of Samsung's platforms and then continue with the device tree
support for s5pv310.

Regards,
Thomas.

> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsu=
ng-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>

From: Vasily Khoruzhick <anarsoul@gmail.com>
Subject: Re: [PATCH 1/2] clk: samsung: fix several typos to fix boot on s3c2410
Date: Mon, 30 Jun 2014 17:16:53 +0300
Message-ID: <2414590.ONaMigMLUH@vasilykh-desktop-i5>
References: <1403555350-14895-1-git-send-email-anarsoul@gmail.com> <1519968.Vijxn8Mc9S@vasilykh-desktop-i5> <53B16F1C.4040206@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wg0-f45.google.com ([74.125.82.45]:49027 "EHLO
	mail-wg0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752007AbaF3OSJ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 30 Jun 2014 10:18:09 -0400
Received: by mail-wg0-f45.google.com with SMTP id l18so8048691wgh.28
        for <linux-samsung-soc@vger.kernel.org>; Mon, 30 Jun 2014 07:18:08 -0700 (PDT)
In-Reply-To: <53B16F1C.4040206@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <t.figa@samsung.com>
Cc: Ben Dooks <ben-linux@fluff.org>, Kukjin Kim <kgene.kim@samsung.com>, Mike Turquette <mturquette@linaro.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>

On 30 June 2014 16:07:24 Tomasz Figa wrote:
> Hi Vasily,
> 
> On 30.06.2014 16:02, Vasily Khoruzhick wrote:
> > On 30 June 2014 15:49:58 Tomasz Figa wrote:
> >> On 23.06.2014 22:29, Vasily Khoruzhick wrote:
> >>> There's a several typos in a driver: 2410 instead of S3C2410
> >>> and wrong argument to ARRAY_SIZE(). They prevent s3c2410
> >>> from properly booting.
> >>> 
> >>> Signed-off-by: Vasily Khoruzhick <anarsoul@gmail.com>
> >>> ---
> >>> 
> >>>  drivers/clk/samsung/clk-s3c2410.c | 4 ++--
> >>>  1 file changed, 2 insertions(+), 2 deletions(-)
> >> 
> >> Applied as a fix for 3.16.
> > 
> > Hi Tomasz,
> > 
> > I also have clk fixes for s3c24xx touchscreen, framebuffer, adc, usb and
> > nand drivers (to replace clk_enable with clk_prepare_enable and
> > clk_disable with clk_disable_unprepare),
> > 
> > Should they be merged through different trees or it's possible to merge
> > them through a single tree?
> 
> I'd say they should all go through respective subsystem trees, unless
> they directly depend on patches I already applied, which is not the case
> as far as I can see.

Hm, they aren't necessary for compiling the kernel, but system fails to boot 
without these patches due to merge of common clk changes for s3c24xx.

> Best regards,
> Tomasz

P.S. Sorry for 2nd mail, Tomasz, I've occassionally omited MLs.

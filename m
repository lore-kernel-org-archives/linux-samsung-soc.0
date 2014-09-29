From: Pankaj Dubey <pankaj.dubey@samsung.com>
Subject: RE: [PATCH 2/3] clk: samsung: remove unnecessary CONFIG_OF from clk.c
Date: Mon, 29 Sep 2014 13:00:10 +0530
Message-ID: <000101cfdbb7$3f02a5f0$bd07f1d0$@samsung.com>
References: <1411796519-19417-1-git-send-email-pankaj.dubey@samsung.com>
 <1411796519-19417-3-git-send-email-pankaj.dubey@samsung.com>
 <5426B9BB.90606@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:18281 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751439AbaI2Hax (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 29 Sep 2014 03:30:53 -0400
Received: from epcpsbgr3.samsung.com
 (u143.gpu120.samsung.co.kr [203.254.230.143])
 by mailout3.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0NCN000HPJJGVG20@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 29 Sep 2014 16:30:52 +0900 (KST)
In-reply-to: <5426B9BB.90606@gmail.com>
Content-language: en-us
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Tomasz Figa' <tomasz.figa@gmail.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, s.nawrocki@samsung.com, mturquette@linaro.org, naushad@samsung.com

Hi Tomasz,

On Saturday, September 27, 2014 6:51 PM, Tomasz Figa wrote,
> Hi Pankaj,
> 
> On 27.09.2014 07:41, Pankaj Dubey wrote:
> > Signed-off-by: Pankaj Dubey <pankaj.dubey@samsung.com>
> 
> Missing patch description.

OK, will add it.

> 
> > ---
> >  drivers/clk/samsung/clk.c |    2 --
> >  1 file changed, 2 deletions(-)
> >
> > diff --git a/drivers/clk/samsung/clk.c b/drivers/clk/samsung/clk.c
> > index deab84d..31bf391 100644
> > --- a/drivers/clk/samsung/clk.c
> > +++ b/drivers/clk/samsung/clk.c
> > @@ -281,7 +281,6 @@ void __init samsung_clk_register_gate(struct
> samsung_clk_provider *ctx,
> >   * obtain the clock speed of all external fixed clock sources from
device
> >   * tree and register it
> >   */
> > -#ifdef CONFIG_OF
> 
> We still have non-DT platforms which use this code, i.e. s3c24xx and
s3c64xx. Have
> you checked if this compiles fine on them with CONFIG_OF disabled?
> 

Compile tested with s3c2410_defconfig and s3c6400_defconfig, and its
compiled fine.
In both cases CONFIG_OF was disabled.

Thanks,
Pankaj Dubey

> Best regards,
> Tomasz

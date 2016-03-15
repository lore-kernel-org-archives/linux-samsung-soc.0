From: Paul Gortmaker <paul.gortmaker@windriver.com>
Subject: Re: [PATCH 8/8] drivers/pinctrl: clean up samsung modular vs.
 non-modular distinctions
Date: Tue, 15 Mar 2016 09:20:40 -0400
Message-ID: <20160315132039.GE23251@windriver.com>
References: <1456778924-20730-1-git-send-email-paul.gortmaker@windriver.com>
 <1456778924-20730-9-git-send-email-paul.gortmaker@windriver.com>
 <CACRpkdYN_qRUa_hscDma_jRAF=2K7_qaGM+f5DNr-NyA3g_NHg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail1.windriver.com ([147.11.146.13]:37347 "EHLO
	mail1.windriver.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S965244AbcCONWJ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 15 Mar 2016 09:22:09 -0400
Content-Disposition: inline
In-Reply-To: <CACRpkdYN_qRUa_hscDma_jRAF=2K7_qaGM+f5DNr-NyA3g_NHg@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Tomasz Figa <tomasz.figa@gmail.com>, Thomas Abraham <thomas.ab@samsung.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

[Re: [PATCH 8/8] drivers/pinctrl: clean up samsung modular vs. non-modular distinctions] On 15/03/2016 (Tue 09:50) Linus Walleij wrote:

> On Mon, Feb 29, 2016 at 9:48 PM, Paul Gortmaker
> <paul.gortmaker@windriver.com> wrote:
> 
> > Fixups here tend to be more all over the map vs. some of the other
> > repeated/systematic ones we've seen elsewhere.
> >
> > We remove module.h from code that isn't doing anything modular at
> > all;  if they have __init sections, then replace it with init.h
> >
> > A couple drivers have module_exit() code that is essentially orphaned,
> > and so we remove that.
> >
> > There are no module_init replacements, so we have no concerns wrt.
> > initcall ordering changes as per some of the other cleanups.
> >
> > Also note that MODULE_DEVICE_TABLE is a no-op for non-modular code.
> >
> > We also delete the MODULE_LICENSE tag etc. since all that information
> > was (or is now) contained at the top of the file in the comments.
> >
> > Cc: Tomasz Figa <tomasz.figa@gmail.com>
> > Cc: Thomas Abraham <thomas.ab@samsung.com>
> > Cc: Linus Walleij <linus.walleij@linaro.org>
> > Cc: linux-arm-kernel@lists.infradead.org
> > Cc: linux-samsung-soc@vger.kernel.org
> > Cc: linux-gpio@vger.kernel.org
> > Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
> 
> This didn't make it in for v4.6 because noone provided ACKs.
> 
> Please resend the outstanding (rebased) demodularization patches
> after v4.6-rc1 and I will merge them no matter if I get ACKs or not,
> I will not wait for ACKs any longer than that.

Sounds good, will do that in ~2 wks.

Thanks,
Paul.
--

> 
> Yours,
> Linus Walleij

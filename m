From: Tomasz Figa <t.figa@samsung.com>
Subject: Re: [PATCH V3 1/7] ARM: dts: Change i2s compatible string on exynos5250
Date: Wed, 07 Aug 2013 13:17:42 +0200
Message-ID: <1804681.fPhe9eeV1F@amdc1227>
References: <1375866616-5541-1-git-send-email-padma.v@samsung.com>
 <20130807101057.GY6427@sirena.org.uk>
 <CAAgF-Bcezj+QGm78Xpm2ahnMrZMqpcnLJaB5bbFyxJDGMTMrpA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:29680 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757307Ab3HGLRp (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 7 Aug 2013 07:17:45 -0400
In-reply-to: <CAAgF-Bcezj+QGm78Xpm2ahnMrZMqpcnLJaB5bbFyxJDGMTMrpA@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Padma Venkat <padma.kvr@gmail.com>
Cc: Mark Brown <broonie@kernel.org>, Padmavathi Venna <padma.v@samsung.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, devicetree@vger.kernel.org, Kukjin Kim <kgene.kim@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, abrestic@chromium.org

On Wednesday 07 of August 2013 16:02:16 Padma Venkat wrote:
> Hi Mark,
> 
> On Wed, Aug 7, 2013 at 3:40 PM, Mark Brown <broonie@kernel.org> wrote:
> > On Wed, Aug 07, 2013 at 02:40:10PM +0530, Padmavathi Venna wrote:
> >> This patch removes quirks from i2s node and change the i2s
> >> compatible names.
> > 
> > This needs to go along with the driver change otherwise we break
> > bisection.
> 
> some of the patches at dts side are dependent on this patch. So I
> separated it into another set. Should I re-post this patch along with
> other driver side patches?

I fully agree with Mark. There are 2 ways of solving this:

a) Do things in steps that don't break anything, i.e.:
	1) add new bindings to the driver,
	2) update DTS files,
	3) remove old bindings from the driver.

b) Do all the things above atomically, in one patch.

Personally, I'm a fan of method a), but if it requires much effort then 
method b) can be used as a fallback.

Best regards,
Tomasz

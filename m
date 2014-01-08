From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH 6/7] clk/samsung: add support for pll2650xx
Date: Wed, 08 Jan 2014 01:37:27 +0100
Message-ID: <3338407.XGYaxCsdnx@flatron>
References: <1386345391-23482-1-git-send-email-rahul.sharma@samsung.com> <1419145.DZQg0ZkHVU@amdc1227> <CAPdUM4P9tE5ohtAb5heMRj3GGjdYrNYp5iX7u-uZySiaCikA7Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ea0-f169.google.com ([209.85.215.169]:45610 "EHLO
	mail-ea0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754390AbaAHAhd (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 7 Jan 2014 19:37:33 -0500
In-Reply-To: <CAPdUM4P9tE5ohtAb5heMRj3GGjdYrNYp5iX7u-uZySiaCikA7Q@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Rahul Sharma <r.sh.open@gmail.com>
Cc: Tomasz Figa <t.figa@samsung.com>, Rahul Sharma <rahul.sharma@samsung.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Mike Turquette <mturquette@linaro.org>, Kukjin Kim <kgene.kim@samsung.com>, Thomas Abraham <thomas.ab@samsung.com>, sunil joshi <joshi@samsung.com>, PANKAJ KUMAR DUBEY <pankaj.dubey@samsung.com>, Young-Gun Jang <yg1004.jang@samsung.com>, Arun Kumar <arun.kk@samsung.com>

On Monday 06 of January 2014 17:14:48 Rahul Sharma wrote:
> Hi Tomasz,
> 
> On 19 December 2013 17:15, Tomasz Figa <t.figa@samsung.com> wrote:
> > Hi Rahul,
> >
> > On Friday 06 of December 2013 21:26:30 Rahul Sharma wrote:
> >> Add support for pll2650xx in samsung pll file. This pll variant
> >> is close to pll36xx but uses CON2 registers instead of CON1.
> >
> > If the ops are otherwise idential, why not reuse the ops for pll36xx
> > and use CON1 or CON2 register conditionally based on pll->type field?
> > (Just as it is already done for pll4600, 4650 and 4650c.)
> >
> 
> I verified the difference and found that  pll2650xx is fairly
> different in terms of
> Bit Fields, Con2 register, and additional PLL config bits than pll36xx. Due to
> this, I have to add lot of if-else code based on pll type which
> doesn't looks clean.

Fair enough.

Best regards,
Tomasz

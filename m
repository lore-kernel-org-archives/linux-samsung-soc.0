From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH v3 2/8] clk: samsung: pll: Add support for PLL6552 and PLL6553
Date: Sun, 28 Jul 2013 14:38:25 +0200
Message-ID: <3758744.oOA9YxCvpA@flatron>
References: <1374536965-3545-1-git-send-email-tomasz.figa@gmail.com> <11551938.yDBcNngaZN@flatron> <20130728123051.GQ9858@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-bk0-f50.google.com ([209.85.214.50]:60728 "EHLO
	mail-bk0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753446Ab3G1Mia (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 28 Jul 2013 08:38:30 -0400
In-Reply-To: <20130728123051.GQ9858@sirena.org.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Mark Brown <broonie@kernel.org>, Mike Turquette <mturquette@linaro.org>
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, Kukjin Kim <kgene.kim@samsung.com>, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, stern@rowland.harvard.edu, gregkh@linuxfoundation.org, linux-usb@vger.kernel.org, Sylwester Nawrocki <sylvester.nawrocki@gmail.com>, Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>, Thomas Abraham <thomas.abraham@linaro.org>

On Sunday 28 of July 2013 13:30:51 Mark Brown wrote:
> On Wed, Jul 24, 2013 at 01:52:19AM +0200, Tomasz Figa wrote:
> > Changes since v2:
> >  - Reworked to use new PLL registration method introduced by Yadwinder
> >  
> >    Singh Brar's patch series:
> >    ( http://thread.gmane.org/gmane.linux.kernel.samsung-soc/20041 )
> 
> I'm not able to test this series since that lot isn't in -next and I
> didn't get a copy.

Hmm, I wonder what happened with that series, as Mike was supposed to
try applying it to clk tree [1].

Mike, could you shed some light on this?

Best regards,
Tomasz

[1] http://thread.gmane.org/gmane.linux.kernel.samsung-soc/20041/focus=21003

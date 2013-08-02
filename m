From: Mike Turquette <mturquette@linaro.org>
Subject: Re: [PATCH v3 2/8] clk: samsung: pll: Add support for PLL6552 and PLL6553
Date: Fri, 02 Aug 2013 15:53:51 -0700
Message-ID: <20130802225351.6450.12004@quantum>
References: <1374536965-3545-1-git-send-email-tomasz.figa@gmail.com>
 <11551938.yDBcNngaZN@flatron> <20130728123051.GQ9858@sirena.org.uk>
 <3758744.oOA9YxCvpA@flatron>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pd0-f173.google.com ([209.85.192.173]:34582 "EHLO
	mail-pd0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753814Ab3HBWxz convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 2 Aug 2013 18:53:55 -0400
Received: by mail-pd0-f173.google.com with SMTP id p11so1140126pdj.18
        for <linux-samsung-soc@vger.kernel.org>; Fri, 02 Aug 2013 15:53:55 -0700 (PDT)
In-Reply-To: <3758744.oOA9YxCvpA@flatron>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <tomasz.figa@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, Kukjin Kim <kgene.kim@samsung.com>, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, stern@rowland.harvard.edu, gregkh@linuxfoundation.org, linux-usb@vger.kernel.org, Sylwester Nawrocki <sylvester.nawrocki@gmail.com>, =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, Thomas Abraham <thomas.abraham@linaro.org>

Quoting Tomasz Figa (2013-07-28 05:38:25)
> On Sunday 28 of July 2013 13:30:51 Mark Brown wrote:
> > On Wed, Jul 24, 2013 at 01:52:19AM +0200, Tomasz Figa wrote:
> > > Changes since v2:
> > >  - Reworked to use new PLL registration method introduced by Yadwinder
> > >  
> > >    Singh Brar's patch series:
> > >    ( http://thread.gmane.org/gmane.linux.kernel.samsung-soc/20041 )
> > 
> > I'm not able to test this series since that lot isn't in -next and I
> > didn't get a copy.
> 
> Hmm, I wonder what happened with that series, as Mike was supposed to
> try applying it to clk tree [1].
> 
> Mike, could you shed some light on this?

It's merged and available from my tree.

Regards,
Mike

> 
> Best regards,
> Tomasz
> 
> [1] http://thread.gmane.org/gmane.linux.kernel.samsung-soc/20041/focus=21003

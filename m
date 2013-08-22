From: Kukjin Kim <kgene@kernel.org>
Subject: RE: [PATCH v7 3/7] gpio: samsung: Skip initialization if device tree
 is present
Date: Thu, 22 Aug 2013 18:45:01 +0900
Message-ID: <1c7401ce9f1c$45c74130$d155c390$@org>
References: <1377120111-25601-1-git-send-email-tomasz.figa@gmail.com>
 <1377120111-25601-4-git-send-email-tomasz.figa@gmail.com>
 <CACRpkda2ZjPm4nEeDujPWSDCNLk4mr9izPvhqNKx5urVAg_Azg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:44405 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752512Ab3HVJpJ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 22 Aug 2013 05:45:09 -0400
In-reply-to: <CACRpkda2ZjPm4nEeDujPWSDCNLk4mr9izPvhqNKx5urVAg_Azg@mail.gmail.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Linus Walleij' <linus.walleij@linaro.org>, 'Tomasz Figa' <tomasz.figa@gmail.com>
Cc: 'linux-samsung-soc' <linux-samsung-soc@vger.kernel.org>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, 'Ian Campbell' <ian.campbell@citrix.com>, 'Mark Rutland' <mark.rutland@arm.com>, 'Pawel Moll' <pawel.moll@arm.com>, 'Rob Herring' <rob.herring@calxeda.com>, 'Russell King' <linux@arm.linux.org.uk>, 'Stephen Warren' <swarren@wwwdotorg.org>, 'Thomas Gleixner' <tglx@linutronix.de>, 'Olof Johansson' <olof@lixom.net>, 'Arnd Bergmann' <arnd@arndb.de>, 'Marc Zyngier' <marc.zyngier@arm.com>, 'Mark Brown' <broonie@kernel.org>

Linus Walleij wrote:
> 
> On Wed, Aug 21, 2013 at 11:21 PM, Tomasz Figa <tomasz.figa@gmail.com>
> wrote:
> 
> > Since this driver does not handle GPIO on device tree enabled platforms
> > any more, it should be bypassed whenever device tree is available, to
> > not conflict with the new pinctrl-samsung driver.
> >
> > Signed-off-by: Tomasz Figa <tomasz.figa@gmail.com>
> 
> This seems like something I should apply to the GPIO tree
> right now, shall I?
> 
I think so. Feel free to add my ack on this.

Acked-by: Kukjin Kim <kgene.kim@samsung.com>

Thanks,
Kukjin

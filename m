From: Tomasz Figa <t.figa@samsung.com>
Subject: Re: [PATCH] pinctrl: samsung: Allow pin value to be initialized using
 pinfunc.
Date: Thu, 05 Dec 2013 16:11:15 +0100
Message-ID: <1502243.eRBlCfUhTO@amdc1227>
References: <1384881351-10782-1-git-send-email-t.figa@samsung.com>
 <CACRpkdYrPd9tnO48bA_5n+-k=KEDyhY7czkCNhTZfpgF3ar+LQ@mail.gmail.com>
 <20131205150747.GW29268@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:32293 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751247Ab3LEPL0 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 5 Dec 2013 10:11:26 -0500
In-reply-to: <20131205150747.GW29268@sirena.org.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Kevin Bracey <kevin@bracey.fi>, Kyungmin Park <kmpark@infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>, Stephen Warren <swarren@wwwdotorg.org>, Doug Anderson <dianders@chromium.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Kukjin Kim <kgene.kim@samsung.com>, Thomas Abraham <thomas.abraham@linaro.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Marek Szyprowski <m.szyprowski@samsung.com>

On Thursday 05 of December 2013 15:07:47 Mark Brown wrote:
> On Tue, Dec 03, 2013 at 10:29:42AM +0100, Linus Walleij wrote:
> 
> > So a suggested patch to support weak hogs would be interesting
> > to look at. Can you provide details on how you think this would
> > work?
> 
> Or should we be going and applying the default state to all devices on
> init without worrying about a driver appearing?

If a device isn't used, then it's often better to configure the pins for
a different function, such as GPIO, to minimize leakage current.

Best regards,
Tomasz

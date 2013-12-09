From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: samsung: Allow pin value to be initialized using pinfunc.
Date: Mon, 9 Dec 2013 11:22:44 +0100
Message-ID: <CACRpkdZ7YCt7NvDDqgv6CZS07wkfVJ1NRZHFhqKxcYbdW7pXnQ@mail.gmail.com>
References: <1384881351-10782-1-git-send-email-t.figa@samsung.com>
	<528BB1F2.4080107@wwwdotorg.org>
	<CAD=FV=XS0dbE7zfgDGVdp84h4fHH6tfO8aN_HNh1LbOjYy51aQ@mail.gmail.com>
	<528BB913.6080409@wwwdotorg.org>
	<CAH9JG2UjnL5bZzNUuJhWY3GpwPD=rJvR2O4Hcpm33G+prSS=BA@mail.gmail.com>
	<CACRpkdbyjm0X9RX+8WjqQxBPyRjBOAunkqVcO-0KUd1PTdGavA@mail.gmail.com>
	<5293ACA6.7060403@bracey.fi>
	<CACRpkdYrPd9tnO48bA_5n+-k=KEDyhY7czkCNhTZfpgF3ar+LQ@mail.gmail.com>
	<20131205150747.GW29268@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ob0-f176.google.com ([209.85.214.176]:35146 "EHLO
	mail-ob0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1760733Ab3LIKWp (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 9 Dec 2013 05:22:45 -0500
Received: by mail-ob0-f176.google.com with SMTP id va2so3451039obc.7
        for <linux-samsung-soc@vger.kernel.org>; Mon, 09 Dec 2013 02:22:44 -0800 (PST)
In-Reply-To: <20131205150747.GW29268@sirena.org.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: Kevin Bracey <kevin@bracey.fi>, Kyungmin Park <kmpark@infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, =?ISO-8859-1?Q?Heiko_St=FCbner?= <heiko@sntech.de>, Stephen Warren <swarren@wwwdotorg.org>, Tomasz Figa <t.figa@samsung.com>, Doug Anderson <dianders@chromium.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Kukjin Kim <kgene.kim@samsung.com>, Thomas Abraham <thomas.abraham@linaro.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Marek Szyprowski <m.szyprowski@samsung.com>

On Thu, Dec 5, 2013 at 4:07 PM, Mark Brown <broonie@kernel.org> wrote:
> On Tue, Dec 03, 2013 at 10:29:42AM +0100, Linus Walleij wrote:
>
>> So a suggested patch to support weak hogs would be interesting
>> to look at. Can you provide details on how you think this would
>> work?
>
> Or should we be going and applying the default state to all devices on
> init without worrying about a driver appearing?

That doesn't really work: if you have an unused device not in the
DT you usually mark it "disabled", and then the DT core doesn't
even create a platform_device for this node.

So doing this would involve parsing the tree and ... yuck.

Yours,
Linus Walleij

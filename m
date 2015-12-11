From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH 1/3] Device tree binding documentation for gpio-switch
Date: Fri, 11 Dec 2015 08:06:22 -0600
Message-ID: <CAL_JsqJ-dht=rCu2-Unm0yOdFfRoOSXd9fkO7eDeQmvWGkGfsQ@mail.gmail.com>
References: <1449250275-23435-1-git-send-email-martyn.welch@collabora.co.uk>
 <1449250275-23435-2-git-send-email-martyn.welch@collabora.co.uk> <CACRpkdYZ-PK9Fb2uq+EMz5RTrtX-isxYkiNvWm2QqAh5WZhpOw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.136]:54213 "EHLO mail.kernel.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752142AbbLKOGr (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 11 Dec 2015 09:06:47 -0500
In-Reply-To: <CACRpkdYZ-PK9Fb2uq+EMz5RTrtX-isxYkiNvWm2QqAh5WZhpOw@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Martyn Welch <martyn.welch@collabora.co.uk>, Alexandre Courbot <acourbot@nvidia.com>, Michael Welling <mwelling@ieee.org>, Markus Pargmann <mpa@pengutronix.de>, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Olof Johansson <olof@lixom.net>, Johan Hovold <johan@kernel.org>

On Fri, Dec 11, 2015 at 6:39 AM, Linus Walleij <linus.walleij@linaro.org> wrote:
> On Fri, Dec 4, 2015 at 6:31 PM, Martyn Welch
> <martyn.welch@collabora.co.uk> wrote:
>
>> This patch adds documentation for the gpio-switch binding. This binding
>> provides a mechanism to bind named links to gpio, with the primary
>> purpose of enabling standardised access to switches that might be standard
>> across a group of devices but implemented differently on each device.
>>
>> Signed-off-by: Martyn Welch <martyn.welch@collabora.co.uk>
>
> As mentioned in the comment to the second patch, this solves the
> following generic problem:
>
> Expose a GPIO line to userspace using a specific name
>
> That means basically naming GPIO lines and marking them as
> "not used by the operating system".
>
> This is something that has been proposed before, and postponed
> because the kernel lacks the right infrastructure.

That doesn't necessarily mean we can't define a binding.

> Markus Pargmann also did a series that add initial values to
> hogs, which is the inverse usecase of this, where you want to
> *output* something by default, then maybe also make it available
> to userspace.
>
> So what we need to see here is a patch series that does all of these
> things:
>
> - Name lines
>
> - Sets them to initial values
>
> - Mark them as read-only
>
> - Mark them as "not used by the operating system" so that they
>   can be default-exported to userspace.

No! This should not be a DT property.

Whether I want to control a GPIO in the kernel or userspace is not
known and can change over time. It could simply depend on kernel
config. There is also the case that a GPIO has no connection or kernel
driver until some time later when a DT overlay for an expansion board
is applied.

Rob

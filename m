From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: samsung: Allow grouping multiple pinmux/pinconf nodes
Date: Mon, 25 Nov 2013 15:46:12 +0100
Message-ID: <CACRpkdZHUfZinS20OFm+DkziiACxDOvJNhDMvdw3LdDbau1tCA@mail.gmail.com>
References: <1384881034-10520-1-git-send-email-t.figa@samsung.com>
	<528BB789.5020201@wwwdotorg.org>
	<7242109.um7KlGhuI2@amdc1227>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ob0-f180.google.com ([209.85.214.180]:37312 "EHLO
	mail-ob0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754328Ab3KYOqM (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 25 Nov 2013 09:46:12 -0500
Received: by mail-ob0-f180.google.com with SMTP id wo20so4282212obc.11
        for <linux-samsung-soc@vger.kernel.org>; Mon, 25 Nov 2013 06:46:12 -0800 (PST)
In-Reply-To: <7242109.um7KlGhuI2@amdc1227>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <t.figa@samsung.com>
Cc: Stephen Warren <swarren@wwwdotorg.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Doug Anderson <dianders@chromium.org>, Thomas Abraham <thomas.abraham@linaro.org>, Kukjin Kim <kgene.kim@samsung.com>, =?ISO-8859-1?Q?Heiko_St=FCbner?= <heiko@sntech.de>, Kyungmin Park <kyungmin.park@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>

On Wed, Nov 20, 2013 at 3:00 PM, Tomasz Figa <t.figa@samsung.com> wrote:
> Stephen:
>> Is the lifetime of the string "returned" by
>> of_property_read_string_index() really so short that you must copy the
>> string? I'd be tempted just to store the pointer, although perhaps you
>> need to get() the node so that's safe.
>
> Right. I have done it the copy-less way in other places, but missed this
> one. Thanks.

So I guess I'm waiting for a new version of this patch, right?

Yours,
Linus Walleij

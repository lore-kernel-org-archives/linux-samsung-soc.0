From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH] ARM: dts: Add trackpad to exynos5250-snow-rev5
Date: Mon, 20 Feb 2017 21:32:05 +0200
Message-ID: <20170220193205.4tmnjuz3k3s5vkqr@kozik-lap>
References: <CAHd-4wCWykRVHfYz-kqA_bMLzYOsFcva2V6hDpvo+egO6CZ8pw@mail.gmail.com>
 <20170219174625.zct4lzglytmkd6i6@kozik-lap>
 <CAHd-4wCTc5HK1--GK=05A+_DAhMMueY2XE4fwpJ84Vi9kn3vHQ@mail.gmail.com>
 <b15abed0-2119-cf5e-bc80-1adb3ba820a9@osg.samsung.com>
 <CAJKOXPfsQBap8=3jK309Dzh7d8mpci8zc=aCs+Phexym89Ko-Q@mail.gmail.com>
 <ad94d12e-7121-f3ff-4738-70f7b7f08be0@osg.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wr0-f193.google.com ([209.85.128.193]:33436 "EHLO
        mail-wr0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750938AbdBTTcL (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 20 Feb 2017 14:32:11 -0500
Received: by mail-wr0-f193.google.com with SMTP id s27so3909032wrb.0
        for <linux-samsung-soc@vger.kernel.org>; Mon, 20 Feb 2017 11:32:10 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <ad94d12e-7121-f3ff-4738-70f7b7f08be0@osg.samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Javier Martinez Canillas <javier@osg.samsung.com>
Cc: Leandro Santiago <leandrosansilva@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, Kukjin Kim <kgene@kernel.org>, linux-samsung-soc@vger.kernel.org

On Mon, Feb 20, 2017 at 04:11:17PM -0300, Javier Martinez Canillas wrote:
> > (although having many trackpads looks weird). You think this is only
> > for specific revisions of Snows?
> >
> 
> Yes, all Chromebooks have only one trackpad and it varies between revisions.
> 
> The reason the downstream ChromiumOS tree have both I2C devices in the same
> I2C bus was to have a common DTSI file to be used for all Exynos5250 boards.
> 
> This is the downstream commit in the ChromiumOS tree that added both devices
> to the common DTSI file and you can see the intention in the commit [0]:
> 
> "Since we'd now like both defined for exynos5250-snow, move the definition
> up to the cros5250-common device tree file.  This allows snow to work with
> _either_ the cyapa or atmel touch pad dynamically."
> 
> So in the downstream tree both cyapa and atmel_mxt_ts drivers are probed and
> only one succeeds. Obviously that's not the correct approach for doing this.

Indeed, this does not look right. Also meaningless probing of invalid I2C
devices usually takes some time... The trackpad should be added to
DTS for given revision of Snow.

Best regards,
Krzysztof

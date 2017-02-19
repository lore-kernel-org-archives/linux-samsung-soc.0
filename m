From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH] ARM: dts: Add trackpad to exynos5250-snow-rev5
Date: Sun, 19 Feb 2017 22:02:53 +0200
Message-ID: <20170219200253.ukn6unpdmyjaeroo@kozik-lap>
References: <CAHd-4wCWykRVHfYz-kqA_bMLzYOsFcva2V6hDpvo+egO6CZ8pw@mail.gmail.com>
 <20170219174625.zct4lzglytmkd6i6@kozik-lap>
 <CAHd-4wCTc5HK1--GK=05A+_DAhMMueY2XE4fwpJ84Vi9kn3vHQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wm0-f68.google.com ([74.125.82.68]:34300 "EHLO
        mail-wm0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751071AbdBSUJz (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sun, 19 Feb 2017 15:09:55 -0500
Received: by mail-wm0-f68.google.com with SMTP id c85so11120814wmi.1
        for <linux-samsung-soc@vger.kernel.org>; Sun, 19 Feb 2017 12:09:54 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <CAHd-4wCTc5HK1--GK=05A+_DAhMMueY2XE4fwpJ84Vi9kn3vHQ@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Leandro Santiago <leandrosansilva@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, Kukjin Kim <kgene@kernel.org>, Javier Martinez Canillas <javier@osg.samsung.com>, linux-samsung-soc@vger.kernel.org

On Sun, Feb 19, 2017 at 08:11:26PM +0100, Leandro Santiago wrote:
> Thank you for the tips. I have just added linux-samsung-soc@vger.kernel.org
> to cc, even though get_mantainer.pl did not suggested such mailing list.

The scripts suggests it:
linux-samsung-soc@vger.kernel.org (moderated list:ARM/SAMSUNG EXYNOS ARM ARCHITECTURES)

It also suggests other mailing lists...

Maybe you are not using mainline kernel but in that case patch needs
testing on mainline by someone else.

Please send a proper v2 patch (git format-patch -v2) with proper title
(I do not see any change below).

I do not see also any change in the node order.

Please address all of the comments. If you do not agree with some of
them we can discuss but ignoring a comment is a no-go.


> About the interrupts property, on the original chromeos-3.8, it was defined
> as <2 0>, I just replaced the second zero by it by IRQ_TYPE_NONE as it
> evaluates to zero anyways and is compatible with the existing trackpad
> node. I have fixed it by setting it to IRQ_TYPE_EDGE_FALLING as you
> suggested. I have no access to the platform data though, so could not check
> if it's really correct or not. But still works fine on my chromebook.

The platform data is in Linux kernel:
http://lxr.free-electrons.com/source/drivers/platform/chrome/chromeos_laptop.c#L116

Best regards,
Krzysztof

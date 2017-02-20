From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH] ARM: dts: Add trackpad to exynos5250-snow-rev5
Date: Mon, 20 Feb 2017 21:40:18 +0200
Message-ID: <20170220194018.yqfk3k6ubu43e5yw@kozik-lap>
References: <CAHd-4wCWykRVHfYz-kqA_bMLzYOsFcva2V6hDpvo+egO6CZ8pw@mail.gmail.com>
 <20170219174625.zct4lzglytmkd6i6@kozik-lap>
 <CAHd-4wCTc5HK1--GK=05A+_DAhMMueY2XE4fwpJ84Vi9kn3vHQ@mail.gmail.com>
 <b15abed0-2119-cf5e-bc80-1adb3ba820a9@osg.samsung.com>
 <CAJKOXPfsQBap8=3jK309Dzh7d8mpci8zc=aCs+Phexym89Ko-Q@mail.gmail.com>
 <CAHd-4wD0fBUf8vEQrj9G2EFai-t0nMViN0QSGrbttV-d88OxUQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wr0-f196.google.com ([209.85.128.196]:35739 "EHLO
        mail-wr0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751100AbdBTTkX (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 20 Feb 2017 14:40:23 -0500
Received: by mail-wr0-f196.google.com with SMTP id q39so13047964wrb.2
        for <linux-samsung-soc@vger.kernel.org>; Mon, 20 Feb 2017 11:40:23 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <CAHd-4wD0fBUf8vEQrj9G2EFai-t0nMViN0QSGrbttV-d88OxUQ@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Leandro Santiago <leandrosansilva@gmail.com>
Cc: Javier Martinez Canillas <javier@osg.samsung.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, Kukjin Kim <kgene@kernel.org>, linux-samsung-soc@vger.kernel.org

On Mon, Feb 20, 2017 at 08:13:21PM +0100, Leandro Santiago wrote:
> I am sending the v2 of the patch, with the following issues addressed:
> - properties ordering by importance
> - nodes ordering by address
> - fixed commit message
> - fixed interrupts property with edge failing interruption.

You make reading the patches especially difficult. Let me make it clear:
1. The previous one was v2 so this is the same?
2. Changelog goes after --- separator.
3. git format-patch -v2 (or whatever number)
4. scripts/get_maintainer.pl v2-....
5. git send-email --to ..... v2-...

Instead you attached v2 to some old conversation. Also your patch seems
to miss the mailing lists even though you CC-ed one of them here.
Probably you need to subscribe it first.

Missing the mailing list means:
1. It is not public.
2. It is not present on Patchwork which I use to apply the patches:
https://patchwork.kernel.org/project/linux-samsung-soc/list/

The patch's subject is still wrong - no changes here.

Beside the formal stuff, Javier's points remain valid. This should be
added to proper revision.

Best regards,
Krzysztof

> 
> Javier, I really I don't know exactly about the revision of my chromebook,
> but with the chromeos kernel it boots using the revision 5 dtb.
> 
> From a59ffe148a03e9b66918c30a553d564db32b885f Mon Sep 17 00:00:00 2001
> From: Leandro Santiago <leandrosansilva@gmail.com>
> Date: Sun, 19 Feb 2017 16:50:18 +0100
> Subject: [PATCH v2] ARM: dts: Add atmel maxtouch trackpad to
>  exynos5250-snow-rev5

From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v2 0/7] soc: renesas: Identify SoC and register with the
 SoC bus
Date: Thu, 10 Nov 2016 11:56:12 +0100
Message-ID: <CAMuHMdWPk7zZKAHtxcYekS2Ot6j+M8dKJuFe87dxc7U6Z4Ti5w@mail.gmail.com>
References: <1477913455-5314-1-git-send-email-geert+renesas@glider.be>
 <1626072.dpWPnWgGl9@wuerfel> <CAMuHMdVrdjqWruY=dBjWP=jZuZkc=aTBTMijOyTDfZFcaD_jsA@mail.gmail.com>
 <6723536.97ljqcB8tS@wuerfel> <CAMuHMdWox5ksj1xhJ6_n0wNA9j6veX0AzAE0V9Gs26Kvw5C_sw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-it0-f68.google.com ([209.85.214.68]:36548 "EHLO
        mail-it0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754492AbcKJK4P (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 10 Nov 2016 05:56:15 -0500
In-Reply-To: <CAMuHMdWox5ksj1xhJ6_n0wNA9j6veX0AzAE0V9Gs26Kvw5C_sw@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Dirk Behme <dirk.behme@de.bosch.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Simon Horman <horms@verge.net.au>, Yangbo Lu <yangbo.lu@nxp.com>, Pankaj Dubey <pankaj.dubey@samsung.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Arnd Bergmann <arnd@arndb.de>

On Thu, Nov 10, 2016 at 10:22 AM, Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
> Thanks, I've created the branch/tag :
>
>     git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git
>     branch soc-device-match
>     signed tag soc-device-match-tag1

Tested by kbuild test robot:

    https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git
 soc-device-match
    da65a1589dacc7ec44ea0557a14d70a39d991f32  base: soc: Provide a
dummy implementation of soc_device_match()
    elapsed time: 101m
    configs tested: 85

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

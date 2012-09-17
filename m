From: Olof Johansson <olof@lixom.net>
Subject: Re: [GIT PULL] Samsung fixes-3 for v3.6
Date: Mon, 17 Sep 2012 16:17:26 -0700
Message-ID: <CAOesGMgu-me77fj85apd3X9SZvTPU5+EVD2MOWwuZoaCPF9cvQ@mail.gmail.com>
References: <05be01cd9527$b35c3480$1a149d80$%kim@samsung.com>
	<CAOesGMiJGihDWpQbgJo9FYSM8FF0WY-B4PtnbE2uWwJcjWzjUA@mail.gmail.com>
	<05c501cd9528$eb916fe0$c2b44fa0$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-lb0-f174.google.com ([209.85.217.174]:56094 "EHLO
	mail-lb0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754975Ab2IQXR2 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 17 Sep 2012 19:17:28 -0400
Received: by lbbgj3 with SMTP id gj3so4583704lbb.19
        for <linux-samsung-soc@vger.kernel.org>; Mon, 17 Sep 2012 16:17:27 -0700 (PDT)
In-Reply-To: <05c501cd9528$eb916fe0$c2b44fa0$%kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

Hi,

On Mon, Sep 17, 2012 at 4:05 PM, Kukjin Kim <kgene.kim@samsung.com> wrote:

> Well...I don't think so, others also should be fixed before v3.6 because as
> you can see, it can occur unexpected behavior and must be wrong. But last
> one is small thing...

"ARM: EXYNOS: fixed SYSMMU setup definition to mate parameter name" is
a valid cleanup, but it has zero functional impact, it just reorders
two unused arguments to a stub macro.

"ARM: S3C24xx: delete double assignment" is a valid bugfix, but the
bug was introduced in "ARM: S3C2410: H1940: Use leds-gpio driver for
LEDs managing" in 2.6.39 so fixing it in 3.7 seems just as fine as
3.6, in my opinion -- it's gone unnoticed so far and was just found by
tools.

"ARM: S3C24XX: removes unnecessary semicolon" fixes a harmless extra
semicolon after a switch statement. Valid cleanup but definitely not
urgent for 3.6.


-Olof

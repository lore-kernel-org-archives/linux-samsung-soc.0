From: Daniel Drake <drake@endlessm.com>
Subject: Re: [PATCH] phy: phy-samsung-usb2: Change phy power on/power off sequence
Date: Wed, 25 Jun 2014 08:53:54 +0100
Message-ID: <CAD8Lp4468eAGGCi1v17X00342D5aqXHqwE1TY4aLu40DvO_MAg@mail.gmail.com>
References: <1403614495-9291-1-git-send-email-k.debski@samsung.com>
	<CAD8Lp441832-ZVV8FQChEXcLqVpZqygv3iaF95_SfZOH_xkFPg@mail.gmail.com>
	<074a01cf8fc1$e906f0c0$bb14d240$%debski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wg0-f52.google.com ([74.125.82.52]:36825 "EHLO
	mail-wg0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755108AbaFYHx4 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 25 Jun 2014 03:53:56 -0400
Received: by mail-wg0-f52.google.com with SMTP id b13so1549592wgh.23
        for <linux-samsung-soc@vger.kernel.org>; Wed, 25 Jun 2014 00:53:55 -0700 (PDT)
In-Reply-To: <074a01cf8fc1$e906f0c0$bb14d240$%debski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kamil Debski <k.debski@samsung.com>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, linux-usb@vger.kernel.org, kishon@ti.com, Tomasz Figa <t.figa@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, gautam.vivek@samsung.com

On Tue, Jun 24, 2014 at 4:35 PM, Kamil Debski <k.debski@samsung.com> wrote:
> By reboot I guess that you mean typing "reboot" or by using SysRq magic
> and not power cycling?
>
> If so, I had experienced the same symptoms. I guess that the Ethernet
> chip is not reset properly and fails to enumerate without power cycling
> (it's nRESET pin is connected to P3V3).
>
> I found that removing regulator-always-on from buck8_reg: BUCK8 in the
> dts file fixes this problem.

Yes, that fixes the problem. Thanks!

Tested-by: Daniel Drake <drake@endlessm.com>

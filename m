From: Daniel Drake <drake@endlessm.com>
Subject: Re: [PATCH] phy: phy-samsung-usb2: Change phy power on/power off sequence
Date: Tue, 24 Jun 2014 16:09:04 +0100
Message-ID: <CAD8Lp441832-ZVV8FQChEXcLqVpZqygv3iaF95_SfZOH_xkFPg@mail.gmail.com>
References: <1403614495-9291-1-git-send-email-k.debski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wg0-f47.google.com ([74.125.82.47]:59794 "EHLO
	mail-wg0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753242AbaFXPJF (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 24 Jun 2014 11:09:05 -0400
Received: by mail-wg0-f47.google.com with SMTP id k14so521756wgh.6
        for <linux-samsung-soc@vger.kernel.org>; Tue, 24 Jun 2014 08:09:04 -0700 (PDT)
In-Reply-To: <1403614495-9291-1-git-send-email-k.debski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kamil Debski <k.debski@samsung.com>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, linux-usb@vger.kernel.org, kishon@ti.com, Tomasz Figa <t.figa@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, gautam.vivek@samsung.com

On Tue, Jun 24, 2014 at 1:54 PM, Kamil Debski <k.debski@samsung.com> wrote:
> The Exynos4412 USB 2.0 PHY hardware differs from the description provided
> in the documentation. Some register bits have different function. This
> patch fixes the defines of register bits and changes the way how phys are
> powered on and off.

I guess this replaces the patch titled "drivers: phy: exynos4x12-phy:
fix HSIC1 power on/off sequence"

Tested on ODROID-U2. Seems to be working as well as the previous patch:
- Internal SMSC hub works on boot and after reboot, tested with USB mouse
- Internal SMSC ethernet device works on boot, but disappears upon
reboot. (same as previous patch, also reproduced by Marek)

Thanks,
Daniel

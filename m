From: Daniel Drake <drake@endlessm.com>
Subject: Re: [PATCH v2] phy: phy-samsung-usb2: Change phy power on/power off sequence
Date: Mon, 7 Jul 2014 20:42:58 +0100
Message-ID: <CAD8Lp46Q5my3VMwgArtmWdtowJmXixjndO-+Kcjt1Xj3USKgqA@mail.gmail.com>
References: <1404227754-452-1-git-send-email-k.debski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-we0-f171.google.com ([74.125.82.171]:45270 "EHLO
	mail-we0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751077AbaGGTm7 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 7 Jul 2014 15:42:59 -0400
Received: by mail-we0-f171.google.com with SMTP id q58so4935306wes.30
        for <linux-samsung-soc@vger.kernel.org>; Mon, 07 Jul 2014 12:42:58 -0700 (PDT)
In-Reply-To: <1404227754-452-1-git-send-email-k.debski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kamil Debski <k.debski@samsung.com>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, linux-usb@vger.kernel.org, kishon@ti.com, Tomasz Figa <t.figa@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Vivek Gautam <gautam.vivek@samsung.com>

On Tue, Jul 1, 2014 at 4:15 PM, Kamil Debski <k.debski@samsung.com> wrote:
> The Exynos4412 USB 2.0 PHY hardware differs from the description provided
> in the documentation. Some register bits have different function. This
> patch fixes the defines of register bits and changes the way how phys are
> powered on and off.
>
> Signed-off-by: Kamil Debski <k.debski@samsung.com>

Tested on ODROID-U2 with the internal LAN (which is a USB device), and
an external USB mouse connected via the internal USB hub.

Tested-by: Daniel Drake <drake@endlessm.com>

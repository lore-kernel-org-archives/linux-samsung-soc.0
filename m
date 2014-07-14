From: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH 1/1] ARM: exynos_defconfig: Update exynos_defconfig
Date: Mon, 14 Jul 2014 12:24:47 -0700
Message-ID: <CAD=FV=W_XLsyW=k7D4iZn7ogFvf=QqAaZpxL7VyecP3mFv44qA@mail.gmail.com>
References: <1404901353-14806-1-git-send-email-sachin.kamat@samsung.com>
	<CAD=FV=XHFY3OtPg6vttpAkX1he0iS6cFLVC6ESauG+1=gredwA@mail.gmail.com>
	<CAOesGMgyZN8TApVO0Svi65qLBzV6jnzGNg9UP1U+hRw=uXg1Bw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vc0-f176.google.com ([209.85.220.176]:46571 "EHLO
	mail-vc0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756928AbaGNTYu (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 14 Jul 2014 15:24:50 -0400
Received: by mail-vc0-f176.google.com with SMTP id ik5so8035021vcb.7
        for <linux-samsung-soc@vger.kernel.org>; Mon, 14 Jul 2014 12:24:48 -0700 (PDT)
In-Reply-To: <CAOesGMgyZN8TApVO0Svi65qLBzV6jnzGNg9UP1U+hRw=uXg1Bw@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Olof Johansson <olof@lixom.net>
Cc: Sachin Kamat <sachin.kamat@samsung.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Kukjin Kim <kgene.kim@samsung.com>, Sachin Kamat <spk.linux@gmail.com>, Javier Martinez Canillas <javier.martinez@collabora.co.uk>, Kevin Hilman <khilman@linaro.org>

To comment on the snow failures that I know about:

On Mon, Jul 14, 2014 at 11:50 AM, Olof Johansson <olof@lixom.net> wrote:
> [ERR] [    2.118115] cros-ec-i2c-tunnel cros-ec-i2c-tunnel.2: Couldn't
> read remote-bus property

Known issue.  The i2c-tunnel is not present on snow.  This will be
fixed once we send up <http://crosreview.com/173927>.  Work for that
is tracked in <http://crbug.com/391797>.  The errors is harmless and
just annoying till then.


> [WARN] [    2.296011] tps65090-charger tps65090-charger: Unable to get
> charger irq = -22
> [WARN] [    2.313705] tps65090-charger: probe of tps65090-charger
> failed with error -22

I have resent the patch to fix this 4 times with no avail.  I'm
getting a little tired of reposting.  I figure that I'll wait another
month and try again--maybe the charger subsystem will be in better
hands by then.

Until the charger fix lands then the charger in tps65090 will not be
functional, but this isn't a terrible burden on the rest of the
system.  It's hard to tell if your battery is plugged in but otherwise
the EC handles charging.


-Doug

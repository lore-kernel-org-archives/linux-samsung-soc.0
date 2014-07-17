From: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Subject: Re: [PATCH 1/1] ARM: exynos_defconfig: Update exynos_defconfig
Date: Thu, 17 Jul 2014 23:30:57 +0200
Message-ID: <53C84091.5020907@collabora.co.uk>
References: <1404901353-14806-1-git-send-email-sachin.kamat@samsung.com>	<CAD=FV=XHFY3OtPg6vttpAkX1he0iS6cFLVC6ESauG+1=gredwA@mail.gmail.com>	<CAOesGMgyZN8TApVO0Svi65qLBzV6jnzGNg9UP1U+hRw=uXg1Bw@mail.gmail.com> <CAD=FV=W_XLsyW=k7D4iZn7ogFvf=QqAaZpxL7VyecP3mFv44qA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from bhuna.collabora.co.uk ([93.93.135.160]:49202 "EHLO
	bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752507AbaGQVbG (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 17 Jul 2014 17:31:06 -0400
In-Reply-To: <CAD=FV=W_XLsyW=k7D4iZn7ogFvf=QqAaZpxL7VyecP3mFv44qA@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Doug Anderson <dianders@chromium.org>, Olof Johansson <olof@lixom.net>
Cc: Sachin Kamat <sachin.kamat@samsung.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Kukjin Kim <kgene.kim@samsung.com>, Sachin Kamat <spk.linux@gmail.com>, Kevin Hilman <khilman@linaro.org>

Hello,

On 07/14/2014 09:24 PM, Doug Anderson wrote:
> 
>> [WARN] [    2.296011] tps65090-charger tps65090-charger: Unable to get
>> charger irq = -22
>> [WARN] [    2.313705] tps65090-charger: probe of tps65090-charger
>> failed with error -22
> 
> I have resent the patch to fix this 4 times with no avail.  I'm
> getting a little tired of reposting.  I figure that I'll wait another
> month and try again--maybe the charger subsystem will be in better
> hands by then.

FYI, Sebastian Reichel has applied [0] Doug's patch.

Best regards,
Javier

[0]:
https://git.kernel.org/cgit/linux/kernel/git/sre/linux-power-supply.git/commit/?h=dev&id=5a3effdc8877132fd12f97fea0d4756614b911c7

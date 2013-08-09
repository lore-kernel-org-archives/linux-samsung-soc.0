From: Julius Werner <jwerner@chromium.org>
Subject: Re: [PATCH 1/3 v5] usb: phy-samsung-usb: Simplify PMU register handling
Date: Thu, 8 Aug 2013 19:52:09 -0700
Message-ID: <CAODwPW_W9gu+nwNzpq3sfcOCDkyppu6K8C9+S8OZt_A0qHqNEg@mail.gmail.com>
References: <1375812017-6287-1-git-send-email-jwerner@chromium.org>
	<20130808092615.GF14648@e106331-lin.cambridge.arm.com>
	<CAODwPW-j=JjunZU3zewrE1_-WoW-RXLmKVQypzxmo_BOYjc3VA@mail.gmail.com>
	<1729120.r596vOTlMW@flatron>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qa0-f42.google.com ([209.85.216.42]:53858 "EHLO
	mail-qa0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758247Ab3HICwK (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 8 Aug 2013 22:52:10 -0400
Received: by mail-qa0-f42.google.com with SMTP id bv4so684607qab.15
        for <linux-samsung-soc@vger.kernel.org>; Thu, 08 Aug 2013 19:52:09 -0700 (PDT)
In-Reply-To: <1729120.r596vOTlMW@flatron>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <tomasz.figa@gmail.com>
Cc: Julius Werner <jwerner@chromium.org>, Mark Rutland <mark.rutland@arm.com>, "rob.herring@calxeda.com" <rob.herring@calxeda.com>, Pawel Moll <Pawel.Moll@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, Ian Campbell <ian.campbell@citrix.com>, Kukjin Kim <kgene.kim@samsung.com>, Felipe Balbi <balbi@ti.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Tomasz Figa <t.figa@samsung.com>, Vivek Gautam <gautam.vivek@samsung.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Sylwester Nawrocki <sylvester.nawrocki@gmail.com>

> Sorry, I don't understand what is not implemented. Without your patch, the
> PHY driver handles both PMU registers of Exynos4.

I don't have an Exynos4 to actually test this, so please let me know
if I'm missing something here... but in order to hit the right HOST
PHY register in the current upstream code, the Exynos4 code would need
to have a hostphy_reg_offset of 4 somewhere in its
samsung_usbphy_drvdata. In my latest checkout of Linus' tree (6c2580c)
it does not (only Exynos5 sets that attribute), so it would default to
0 (thereby actually hitting the DEVICE register).

If you want I can gladly provide another change on top of my patchset
to fix that in the future... but it looks to me like it had been
broken anyway for now.

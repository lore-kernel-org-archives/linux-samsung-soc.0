From: Julius Werner <jwerner@chromium.org>
Subject: Re: [PATCH 1/3 v5] usb: phy-samsung-usb: Simplify PMU register handling
Date: Tue, 27 Aug 2013 13:27:48 -0700
Message-ID: <CAODwPW8KG2ZxOFf936H233g35KVPjDp+f8e3qgkd4Z7NN9RAtQ@mail.gmail.com>
References: <1375812017-6287-1-git-send-email-jwerner@chromium.org>
	<20130808092615.GF14648@e106331-lin.cambridge.arm.com>
	<CAODwPW-j=JjunZU3zewrE1_-WoW-RXLmKVQypzxmo_BOYjc3VA@mail.gmail.com>
	<1729120.r596vOTlMW@flatron>
	<CAODwPW_W9gu+nwNzpq3sfcOCDkyppu6K8C9+S8OZt_A0qHqNEg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ob0-f172.google.com ([209.85.214.172]:59892 "EHLO
	mail-ob0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753599Ab3H0U1u (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 27 Aug 2013 16:27:50 -0400
Received: by mail-ob0-f172.google.com with SMTP id er7so5585583obc.31
        for <linux-samsung-soc@vger.kernel.org>; Tue, 27 Aug 2013 13:27:48 -0700 (PDT)
In-Reply-To: <CAODwPW_W9gu+nwNzpq3sfcOCDkyppu6K8C9+S8OZt_A0qHqNEg@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Julius Werner <jwerner@chromium.org>
Cc: Tomasz Figa <tomasz.figa@gmail.com>, Mark Rutland <mark.rutland@arm.com>, "rob.herring@calxeda.com" <rob.herring@calxeda.com>, Pawel Moll <Pawel.Moll@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, Ian Campbell <ian.campbell@citrix.com>, Kukjin Kim <kgene.kim@samsung.com>, Felipe Balbi <balbi@ti.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Tomasz Figa <t.figa@samsung.com>, Vivek Gautam <gautam.vivek@samsung.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Sylwester Nawrocki <sylvester.nawrocki@gmail.com>

*Ping!*

Are there still unanswered concerns left with this patch? I hope my
prior mails could clear up why I think that the PMU register
description in the device tree for a specific PHY is represents the
hardware more accurately after my patch, and my analysis of the
Exynos4 situation currently not being implemented (and therefore not
needing to be addressed by this patch) was correct. Please let me know
if you have further objections... and if not, could we agree to have
this picked up somewhere?

Thanks,
Julius

From: Kevin Hilman <khilman@linaro.org>
Subject: Re: [PATCH RFC 04/10] base: power: Add generic OF-based power domain look-up
Date: Tue, 14 Jan 2014 07:42:26 -0800
Message-ID: <87r48a8t99.fsf@linaro.org>
References: <1389469372-17199-1-git-send-email-tomasz.figa@gmail.com>
	<1389469372-17199-5-git-send-email-tomasz.figa@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pd0-f175.google.com ([209.85.192.175]:44980 "EHLO
	mail-pd0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751681AbaANPm3 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 14 Jan 2014 10:42:29 -0500
Received: by mail-pd0-f175.google.com with SMTP id r10so4923370pdi.20
        for <linux-samsung-soc@vger.kernel.org>; Tue, 14 Jan 2014 07:42:29 -0800 (PST)
In-Reply-To: <1389469372-17199-5-git-send-email-tomasz.figa@gmail.com> (Tomasz
	Figa's message of "Sat, 11 Jan 2014 20:42:46 +0100")
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <tomasz.figa@gmail.com>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, Pavel Machek <pavel@ucw.cz>, Len Brown <len.brown@intel.com>, Russell King <linux@arm.linux.org.uk>, Kukjin Kim <kgene.kim@samsung.com>, Kumar Gala <galak@codeaurora.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Mark Rutland <mark.rutland@arm.com>, Pawel Moll <pawel.moll@arm.com>, Rob Herring <robh+dt@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Stephen Warren <swarren@wwwdotorg.org>, Tomasz Figa <t.figa@samsung.com>

Tomasz Figa <tomasz.figa@gmail.com> writes:

> This patch introduces generic code to perform power domain look-up using
> device tree and automatically bind devices to their power domains.
> Generic device tree binding is introduced to specify power domains of
> devices in their device tree nodes.
>
> Backwards compatibility with legacy Samsung-specific power domain
> bindings is provided, but for now the new code is not compiled when
> CONFIG_ARCH_EXYNOS is selected to avoid collision with legacy code. This
> will change as soon as Exynos power domain code gets converted to use
> the generic framework in further patch.
>
> Signed-off-by: Tomasz Figa <tomasz.figa@gmail.com>

I haven't read through this in detail yet, but wanted to make sure that
the DT representation can handle nested power domains.  At least
SH-mobile has a hierarchy of power domains and the genpd code can handle
that, so wanted to make sure that the DT representation can handle it as
well.

Thanks,

Kevin

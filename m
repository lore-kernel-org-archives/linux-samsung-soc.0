From: Kevin Hilman <khilman@kernel.org>
Subject: Re: [PATCH v3 4/9] drivercore / platform: Keep PM domain powered during ->probe()
Date: Thu, 30 Oct 2014 13:47:27 -0700
Message-ID: <7hoast8eu8.fsf@deeprootsystems.com>
References: <1413208930-26019-1-git-send-email-ulf.hansson@linaro.org>
	<1413208930-26019-5-git-send-email-ulf.hansson@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f42.google.com ([209.85.220.42]:61062 "EHLO
	mail-pa0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933386AbaJ3Ura (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 30 Oct 2014 16:47:30 -0400
Received: by mail-pa0-f42.google.com with SMTP id bj1so6206383pad.15
        for <linux-samsung-soc@vger.kernel.org>; Thu, 30 Oct 2014 13:47:30 -0700 (PDT)
In-Reply-To: <1413208930-26019-5-git-send-email-ulf.hansson@linaro.org> (Ulf
	Hansson's message of "Mon, 13 Oct 2014 16:02:05 +0200")
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: "Rafael J. Wysocki" <rjw@rjwysocki.net>, Len Brown <len.brown@intel.com>, Pavel Machek <pavel@ucw.cz>, linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>, Alan Stern <stern@rowland.harvard.edu>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Tomasz Figa <tomasz.figa@gmail.com>, Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, Ben Dooks <ben-linux@fluff.org>, Kukjin Kim <kgene.kim@samsung.com>, Philipp Zabel <philipp.zabel@gmail.com>, Mark Brown <broonie@kernel.org>, Wolfram Sang <wsa@the-dreams.de>, Russell King <linux@arm.linux.org.uk>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Jack Dai <jack.dai@rock-chips.com>, Jinkun Hong <jinkun.hong@rock-chips.com>, Aaron Lu <aaron.lu@intel.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>

Ulf Hansson <ulf.hansson@linaro.org> writes:

> To sucessfully probe some devices their corresponding PM domains may
> need to be powered.

Isn't that what pm_runtime_get*() is supposed to be doing?  Why isn't
that working?

Kevin

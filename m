From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v4 0/8] cpufreq: use cpufreq-cpu0 driver for exynos based platforms
Date: Wed, 14 May 2014 15:16:54 +0200
Message-ID: <10846712.xUGXxPFO6W@wuerfel>
References: <1400029876-5830-1-git-send-email-thomas.ab@samsung.com> <7170433.Ah6fefFrHR@wuerfel> <CAKohponDr4YPvmYShL_OBychgUfFDDAnZxGuEoQpanPs62ABNw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([212.227.126.187]:53846 "EHLO
	mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755203AbaENNRI (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 14 May 2014 09:17:08 -0400
In-Reply-To: <CAKohponDr4YPvmYShL_OBychgUfFDDAnZxGuEoQpanPs62ABNw@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: Viresh Kumar <viresh.kumar@linaro.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Lukasz Majewski <l.majewski@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>, Thomas Abraham <ta.omasab@gmail.com>, Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>, Tomasz Figa <t.figa@samsung.com>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, "cpufreq@vger.kernel.org" <cpufreq@vger.kernel.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Thomas P Abraham <thomas.ab@samsung.com>, Mike Turquette <mturquette@linaro.org>, Shawn Guo <shawn.guo@linaro.org>

On Wednesday 14 May 2014 18:37:13 Viresh Kumar wrote:
> On 14 May 2014 18:21, Arnd Bergmann <arnd@arndb.de> wrote:
> > Thanks a lot for your continued effort. Looks great overall, but I have one
> > comment about the general way the cpu0 cpufreq driver works, not specific
> > to the exynos implementation. See my reply to patch 4.
> 
> I hope you meant 7 here instead of 4 ?

Yes, that's right, sorry for the confusion.

	Arnd

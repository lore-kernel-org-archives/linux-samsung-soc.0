From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
Subject: Re: [PATCH v4 7/8] ARM: Exynos: switch to using generic cpufreq-cpu0 driver
Date: Wed, 14 May 2014 15:11:50 +0200
Message-ID: <1480209.xTrtNKOy7N@phil>
References: <1400029876-5830-1-git-send-email-thomas.ab@samsung.com> <6835645.2kTGeWTa9p@wuerfel> <CAKohpom_zuQoJ9xABJ2nJGbrubR=_iuE7_EtY6b41mhuhEtMsg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from gloria.sntech.de ([95.129.55.99]:48163 "EHLO gloria.sntech.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755317AbaENNIU (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 14 May 2014 09:08:20 -0400
In-Reply-To: <CAKohpom_zuQoJ9xABJ2nJGbrubR=_iuE7_EtY6b41mhuhEtMsg@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: Arnd Bergmann <arnd@arndb.de>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Thomas Abraham <ta.omasab@gmail.com>, "cpufreq@vger.kernel.org" <cpufreq@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Lukasz Majewski <l.majewski@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>, Mike Turquette <mturquette@linaro.org>, Tomasz Figa <t.figa@samsung.com>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Thomas P Abraham <thomas.ab@samsung.com>, Shawn Guo <shawn.guo@linaro.org>

Am Mittwoch, 14. Mai 2014, 18:35:29 schrieb Viresh Kumar:
> On 14 May 2014 18:20, Arnd Bergmann <arnd@arndb.de> wrote:
> > Could we please come up with a way to probe this from DT in the
> > cpufreq-cpu0 driver itself, so we don't have to add a device in every
> > platform using it?
> Its followed that way because DT Maintainers had strong objections
> to creating virtual device nodes and haven't allowed creation of nodes
> for cpufreq drivers.. For which there is no physical device, as CPU already
> has a separate node..

as we already have the "enable-method" property for enabling/disabling cpus, 
would something like a "scaling-method" be feasible?

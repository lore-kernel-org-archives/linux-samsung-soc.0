From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH v4 7/8] ARM: Exynos: switch to using generic cpufreq-cpu0 driver
Date: Wed, 14 May 2014 18:35:29 +0530
Message-ID: <CAKohpom_zuQoJ9xABJ2nJGbrubR=_iuE7_EtY6b41mhuhEtMsg@mail.gmail.com>
References: <1400029876-5830-1-git-send-email-thomas.ab@samsung.com>
	<1400029876-5830-8-git-send-email-thomas.ab@samsung.com>
	<6835645.2kTGeWTa9p@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-oa0-f46.google.com ([209.85.219.46]:34452 "EHLO
	mail-oa0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755466AbaENNFa (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 14 May 2014 09:05:30 -0400
Received: by mail-oa0-f46.google.com with SMTP id i4so2107974oah.5
        for <linux-samsung-soc@vger.kernel.org>; Wed, 14 May 2014 06:05:29 -0700 (PDT)
In-Reply-To: <6835645.2kTGeWTa9p@wuerfel>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Thomas Abraham <ta.omasab@gmail.com>, "cpufreq@vger.kernel.org" <cpufreq@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Lukasz Majewski <l.majewski@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>, Mike Turquette <mturquette@linaro.org>, =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, Tomasz Figa <t.figa@samsung.com>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Thomas P Abraham <thomas.ab@samsung.com>, Shawn Guo <shawn.guo@linaro.org>

On 14 May 2014 18:20, Arnd Bergmann <arnd@arndb.de> wrote:
> Could we please come up with a way to probe this from DT in the cpufreq-cpu0
> driver itself, so we don't have to add a device in every platform using it?

Its followed that way because DT Maintainers had strong objections
to creating virtual device nodes and haven't allowed creation of nodes
for cpufreq drivers.. For which there is no physical device, as CPU already
has a separate node..

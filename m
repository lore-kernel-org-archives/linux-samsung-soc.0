From: Thomas Abraham <ta.omasab@gmail.com>
Subject: Re: [PATCH v4 1/8] cpufreq: cpufreq-cpu0: allow use of optional boost
 mode frequencies
Date: Wed, 14 May 2014 19:48:06 +0530
Message-ID: <CAJuA9ahiOz6heULQLaKZyB=2auXRmKmC6N1oMVTa3RENiPbR7g@mail.gmail.com>
References: <1400029876-5830-1-git-send-email-thomas.ab@samsung.com>
	<1400029876-5830-2-git-send-email-thomas.ab@samsung.com>
	<CAKohpo=-duhJ-4iaqBG+eUCkoV_qwAu93FgUxmYS5erNTpLoMA@mail.gmail.com>
	<20140514081739.0b66587e@amdc2363>
	<CAKohpomdjDDBjuPcAsaCcavvVgcX5977gDWyjeqmULadq_Pw8w@mail.gmail.com>
	<CAJuA9ajtCAGpBkSBH64bpTAbZKqPHTiDBFspuoXE1MSLyOyRPw@mail.gmail.com>
	<CAKohpo=yLtGB=N2BrZuMGOrs_6Y06ULGfMwSkxQHV2r831bVgg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-lb0-f181.google.com ([209.85.217.181]:32872 "EHLO
	mail-lb0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751447AbaENOSI (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 14 May 2014 10:18:08 -0400
In-Reply-To: <CAKohpo=yLtGB=N2BrZuMGOrs_6Y06ULGfMwSkxQHV2r831bVgg@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: Lukasz Majewski <l.majewski@samsung.com>, "cpufreq@vger.kernel.org" <cpufreq@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Mike Turquette <mturquette@linaro.org>, Shawn Guo <shawn.guo@linaro.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Kukjin Kim <kgene.kim@samsung.com>, Tomasz Figa <t.figa@samsung.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>

On Wed, May 14, 2014 at 7:20 PM, Viresh Kumar <viresh.kumar@linaro.org> wrote:
> On 14 May 2014 19:13, Thomas Abraham <ta.omasab@gmail.com> wrote:
>> Okay, so you are suggesting that Kconfig entry used to select
>> cpufreq-cpu0 should also enable CPU_FREQ_BOOST_SW config as well.
>
> I never said that... That should be enabled by your defconfig instead.
> What I said was, don't put code within any #ifdefs in cpufreq-cpu0.

Okay, I get the point about #ifdef in cpufreq-cpu0. What about your
earlier comment about the new Kconfig entry ("Get rid of this.. just
not required.")? The new Kconfig entry would be needed in that case.

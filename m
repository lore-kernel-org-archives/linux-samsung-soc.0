From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH v4 1/8] cpufreq: cpufreq-cpu0: allow use of optional boost
 mode frequencies
Date: Wed, 14 May 2014 19:50:56 +0530
Message-ID: <CAKohpompE8dgE2uePvM52K+99CvRt2Z6kXkgSTi6_Bcd9OC2ZQ@mail.gmail.com>
References: <1400029876-5830-1-git-send-email-thomas.ab@samsung.com>
	<1400029876-5830-2-git-send-email-thomas.ab@samsung.com>
	<CAKohpo=-duhJ-4iaqBG+eUCkoV_qwAu93FgUxmYS5erNTpLoMA@mail.gmail.com>
	<20140514081739.0b66587e@amdc2363>
	<CAKohpomdjDDBjuPcAsaCcavvVgcX5977gDWyjeqmULadq_Pw8w@mail.gmail.com>
	<CAJuA9ajtCAGpBkSBH64bpTAbZKqPHTiDBFspuoXE1MSLyOyRPw@mail.gmail.com>
	<CAKohpo=yLtGB=N2BrZuMGOrs_6Y06ULGfMwSkxQHV2r831bVgg@mail.gmail.com>
	<CAJuA9ahiOz6heULQLaKZyB=2auXRmKmC6N1oMVTa3RENiPbR7g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ob0-f178.google.com ([209.85.214.178]:33254 "EHLO
	mail-ob0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750787AbaENOU4 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 14 May 2014 10:20:56 -0400
Received: by mail-ob0-f178.google.com with SMTP id va2so2187835obc.37
        for <linux-samsung-soc@vger.kernel.org>; Wed, 14 May 2014 07:20:56 -0700 (PDT)
In-Reply-To: <CAJuA9ahiOz6heULQLaKZyB=2auXRmKmC6N1oMVTa3RENiPbR7g@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Thomas Abraham <ta.omasab@gmail.com>
Cc: Lukasz Majewski <l.majewski@samsung.com>, "cpufreq@vger.kernel.org" <cpufreq@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Mike Turquette <mturquette@linaro.org>, Shawn Guo <shawn.guo@linaro.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Kukjin Kim <kgene.kim@samsung.com>, Tomasz Figa <t.figa@samsung.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>

On 14 May 2014 19:48, Thomas Abraham <ta.omasab@gmail.com> wrote:
> Okay, I get the point about #ifdef in cpufreq-cpu0. What about your
> earlier comment about the new Kconfig entry ("Get rid of this.. just
> not required.")? The new Kconfig entry would be needed in that case.

The only place you used that ifdef was in cpufreq-cpu0, which we
already decided should stay without any ifdefs..

Now, you must enable CPU_FREQ_BOOST_SW from your defconfig.

Did I make it clear this time ?

--
viresh

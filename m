From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH v4 1/8] cpufreq: cpufreq-cpu0: allow use of optional boost
 mode frequencies
Date: Wed, 14 May 2014 19:20:58 +0530
Message-ID: <CAKohpo=yLtGB=N2BrZuMGOrs_6Y06ULGfMwSkxQHV2r831bVgg@mail.gmail.com>
References: <1400029876-5830-1-git-send-email-thomas.ab@samsung.com>
	<1400029876-5830-2-git-send-email-thomas.ab@samsung.com>
	<CAKohpo=-duhJ-4iaqBG+eUCkoV_qwAu93FgUxmYS5erNTpLoMA@mail.gmail.com>
	<20140514081739.0b66587e@amdc2363>
	<CAKohpomdjDDBjuPcAsaCcavvVgcX5977gDWyjeqmULadq_Pw8w@mail.gmail.com>
	<CAJuA9ajtCAGpBkSBH64bpTAbZKqPHTiDBFspuoXE1MSLyOyRPw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <CAJuA9ajtCAGpBkSBH64bpTAbZKqPHTiDBFspuoXE1MSLyOyRPw@mail.gmail.com>
Sender: cpufreq-owner@vger.kernel.org
To: Thomas Abraham <ta.omasab@gmail.com>
Cc: Lukasz Majewski <l.majewski@samsung.com>, "cpufreq@vger.kernel.org" <cpufreq@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Mike Turquette <mturquette@linaro.org>, Shawn Guo <shawn.guo@linaro.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Kukjin Kim <kgene.kim@samsung.com>, Tomasz Figa <t.figa@samsung.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>
List-Id: linux-samsung-soc@vger.kernel.org

On 14 May 2014 19:13, Thomas Abraham <ta.omasab@gmail.com> wrote:
> Okay, so you are suggesting that Kconfig entry used to select
> cpufreq-cpu0 should also enable CPU_FREQ_BOOST_SW config as well.

I never said that... That should be enabled by your defconfig instead.
What I said was, don't put code within any #ifdefs in cpufreq-cpu0.

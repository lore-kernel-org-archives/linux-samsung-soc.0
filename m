From: Nishanth Menon <nm@ti.com>
Subject: Re: [PATCH v2 7/7] cpufreq: exynos: remove all exynos specific
 cpufreq driver support
Date: Wed, 5 Feb 2014 07:36:55 -0600
Message-ID: <CAGo_u6r7LApS3sPHeQD3ufunnAm2sA4dW7N+M2v6UYaX8XZY8w@mail.gmail.com>
References: <1390047057-2239-1-git-send-email-thomas.ab@samsung.com>
	<1390047057-2239-8-git-send-email-thomas.ab@samsung.com>
	<20140120090815.39e8c21a@amdc2363>
	<CAJuA9agAQRK8NjkYU7Pr-z2AxyUoD7+NH+Y+6Ar9eCi_tbatgQ@mail.gmail.com>
	<20140205124459.61c7da0e@amdc2363>
	<CAJuA9aiokvq-=a-hK=nJnTkZTGF1Zc2ERXk2rpk-Xv7gUHaVpw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <CAJuA9aiokvq-=a-hK=nJnTkZTGF1Zc2ERXk2rpk-Xv7gUHaVpw@mail.gmail.com>
Sender: cpufreq-owner@vger.kernel.org
To: Thomas Abraham <ta.omasab@gmail.com>
Cc: Lukasz Majewski <l.majewski@samsung.com>, "cpufreq@vger.kernel.org" <cpufreq@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Mike Turquette <mturquette@linaro.org>, Shawn Guo <shawn.guo@linaro.org>, Kukjin Kim <kgene.kim@samsung.com>, Tomasz Figa <t.figa@samsung.com>, Viresh Kumar <viresh.kumar@linaro.org>, thomas.ab@samsung.com, Jaecheol Lee <jc.lee@samsung.com>, t.figa@gmail.com
List-Id: linux-samsung-soc@vger.kernel.org

On Wed, Feb 5, 2014 at 6:43 AM, Thomas Abraham <ta.omasab@gmail.com> wrote:
> Okay, thanks. Initially it looked like adding boost frequencies into
> operating-modes would convolute it but I guess I was wrong. So I will
> add support for looking up "boost-frequencies" property in
> dev_pm_opp_init_cpufreq_table function and mark the frequencies listed
> in this binding as CPUFREQ_BOOST_FREQ.
I wonder if it is high time that we pop the cpufreq stuff out of opp.c
other frameworks such as devfreq might choose to do things
differently.
Regards,
Nishanth Menon

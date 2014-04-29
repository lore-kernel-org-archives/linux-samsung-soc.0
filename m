From: Jonghwan Choi <jhbird.choi@samsung.com>
Subject: RE: [PATCH 2/2] cpufreq: Remove exynos_sort_descend_freq_table in
 exynos5440-cpufreq.c
Date: Tue, 29 Apr 2014 16:05:28 +0900
Message-ID: <001501cf6379$66fea1f0$34fbe5d0$@samsung.com>
References: <000701cf636b$3d1d13c0$b7573b40$@samsung.com>
 <CAKohpo=ei0v69iQtjd6cjmfUCo-+sd1JzNc4RDza92nxaPoiVg@mail.gmail.com>
 <CADGdYn7cA940sxPszP5TA5tMnXD_=QkH3U3Wedy2DoC++rwRkQ@mail.gmail.com>
 <CAKohponkT9o4WVUo=fNmVq+kMjm68Z3hdFVMhe7+8qsKPPc2CQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-owner@vger.kernel.org>
In-reply-to: <CAKohponkT9o4WVUo=fNmVq+kMjm68Z3hdFVMhe7+8qsKPPc2CQ@mail.gmail.com>
Content-language: ko
Sender: cpufreq-owner@vger.kernel.org
To: 'Viresh Kumar' <viresh.kumar@linaro.org>, 'Amit Kachhap' <amit.kachhap@gmail.com>
Cc: 'Kukjin Kim' <kgene.kim@samsung.com>, 'linux-samsung-soc' <linux-samsung-soc@vger.kernel.org>, "'Rafael J. Wysocki'" <rjw@rjwysocki.net>, linux-arm-kernel@lists.infradead.org, "'open list:CPU FREQUENCY DRI...'" <cpufreq@vger.kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org

Thanks to Amit Kachhap & Viresh Kumar


> -----Original Message-----
> From: Viresh Kumar [mailto:viresh.kumar@linaro.org]
> Sent: Tuesday, April 29, 2014 3:21 PM
> To: Amit Kachhap
> Cc: Jonghwan Choi; Kukjin Kim; linux-samsung-soc; Rafael J. Wysocki;
> linux-arm-kernel@lists.infradead.org; open list:CPU FREQUENCY DRI...
> Subject: Re: [PATCH 2/2] cpufreq: Remove exynos_sort_descend_freq_table in
> exynos5440-cpufreq.c
> 
> On 29 April 2014 11:44, Amit Kachhap <amit.kachhap@gmail.com> wrote:
> > In the frequency table dts file, the frequencies are arranged in
> > descending order which maps 1 to 1 with other frequency parameter to
> > be calculated and programmed in some registers.
> > But the OPP library works by generating the frequencies in ascending
> > order which breaks the above logic. Ideally i should expect frequency
> > values in same order as what is supplied.
> > So OPP library should not change the order or should take input flags
> > flags like, dev_pm_opp_init_cpufreq_table(TABLE_ORDER_ASCEND|
> > TABLE_ORDER_DESCEND|TABLE_ORDER_ORIGINAL )
> 
> Looks a good idea :)
> 
> This is what I wrote in another thread:
> 
> What I would recommend is, use .driver_data field to hold what has to be
> written to hardware for any frequency. And then simply use driver_data
> instead of index.


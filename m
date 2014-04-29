From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH 2/2] cpufreq: Remove exynos_sort_descend_freq_table in exynos5440-cpufreq.c
Date: Tue, 29 Apr 2014 11:51:03 +0530
Message-ID: <CAKohponkT9o4WVUo=fNmVq+kMjm68Z3hdFVMhe7+8qsKPPc2CQ@mail.gmail.com>
References: <000701cf636b$3d1d13c0$b7573b40$@samsung.com>
	<CAKohpo=ei0v69iQtjd6cjmfUCo-+sd1JzNc4RDza92nxaPoiVg@mail.gmail.com>
	<CADGdYn7cA940sxPszP5TA5tMnXD_=QkH3U3Wedy2DoC++rwRkQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-oa0-f51.google.com ([209.85.219.51]:37854 "EHLO
	mail-oa0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754901AbaD2GVE (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 29 Apr 2014 02:21:04 -0400
Received: by mail-oa0-f51.google.com with SMTP id l6so732489oag.10
        for <linux-samsung-soc@vger.kernel.org>; Mon, 28 Apr 2014 23:21:03 -0700 (PDT)
In-Reply-To: <CADGdYn7cA940sxPszP5TA5tMnXD_=QkH3U3Wedy2DoC++rwRkQ@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Amit Kachhap <amit.kachhap@gmail.com>
Cc: Jonghwan Choi <jhbird.choi@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "open list:CPU FREQUENCY DRI..." <cpufreq@vger.kernel.org>

On 29 April 2014 11:44, Amit Kachhap <amit.kachhap@gmail.com> wrote:
> In the frequency table dts file, the frequencies are arranged in
> descending order which maps 1 to 1 with other frequency parameter to
> be calculated and programmed in some registers.
> But the OPP library works by generating the frequencies in ascending
> order which breaks the above logic. Ideally i should expect frequency
> values in same order as what is supplied.
> So OPP library should not change the order or should take input flags
> flags like,
> dev_pm_opp_init_cpufreq_table(TABLE_ORDER_ASCEND|
> TABLE_ORDER_DESCEND|TABLE_ORDER_ORIGINAL )

Looks a good idea :)

This is what I wrote in another thread:

What I would recommend is, use .driver_data field to hold what has to
be written to hardware for any frequency. And then simply use
driver_data instead of index.

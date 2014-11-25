From: Kevin Hilman <khilman@kernel.org>
Subject: Re: [PATCH v12 0/6] cpufreq: use generic cpufreq drivers for exynos platforms
Date: Tue, 25 Nov 2014 11:57:47 -0800
Message-ID: <CAMAWPa87AFhtFaCo3RSY_qD+1DSmvhU8idOLvYwadkk5GLwaOQ@mail.gmail.com>
References: <1416576682-5255-1-git-send-email-thomas.ab@samsung.com>
	<7hioi4l92v.fsf@deeprootsystems.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.19.201]:33192 "EHLO mail.kernel.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750809AbaKYT6F (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 25 Nov 2014 14:58:05 -0500
Received: from mail.kernel.org (localhost [127.0.0.1])
	by mail.kernel.org (Postfix) with ESMTP id D223F2011B
	for <linux-samsung-soc@vger.kernel.org>; Tue, 25 Nov 2014 19:57:59 +0000 (UTC)
Received: from mail-wg0-f45.google.com (mail-wg0-f45.google.com [74.125.82.45])
	(using TLSv1 with cipher AES128-SHA (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 2BB4E201FA
	for <linux-samsung-soc@vger.kernel.org>; Tue, 25 Nov 2014 19:57:49 +0000 (UTC)
Received: by mail-wg0-f45.google.com with SMTP id b13so1849002wgh.4
        for <linux-samsung-soc@vger.kernel.org>; Tue, 25 Nov 2014 11:57:47 -0800 (PST)
In-Reply-To: <7hioi4l92v.fsf@deeprootsystems.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Thomas Abraham <thomas.ab@samsung.com>
Cc: "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Mike Turquette <mturquette@linaro.org>, Kukjin Kim <kgene.kim@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, Lukasz Majewski <l.majewski@samsung.com>, Viresh Kumar <viresh.kumar@linaro.org>, =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, Chanwoo Choi <cw00.choi@samsung.com>

Hi Thomas,

On Mon, Nov 24, 2014 at 10:58 AM, Kevin Hilman <khilman@kernel.org> wrote:

[...]

> Second, as with earlier versions of this series, I'm still seeing lots
> of "wait_until_divider_stable: timeout in divider stablization" messages
> coming out when running powertop.

I found a simpler way to reproduce these messages.  If I simply use
the userspace governor and cycle through all the A7 OPPs, I'll hit
this message (script below[1]).  Note that I'm also using my DTS
change that fixes the vdd_arm and vdd_kfc voltages to a voltage that
is high enough for all the OPPs.

Kevin

[1]
#!/bin/sh
cpu=cpu4
reg_name=vdd_kfc
cpu_reg=$(dirname `find /sys/class/regulator/regulator.*/ -name name
-exec grep -l $reg_name {} \;`)
echo $cpu_reg

# Cycle through frequencies (and check voltage)
cd /sys/devices/system/cpu/$cpu/cpufreq
echo userspace > scaling_governor
for freq in `cat scaling_available_frequencies`; do
  echo ${freq} > scaling_setspeed
  echo -n "current freq: "
  cat scaling_cur_freq
  echo -n "current voltage: "
  cat ${cpu_reg}/microvolts
  sleep 1
done

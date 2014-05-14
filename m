From: Abhilash Kesavan <kesavan.abhilash@gmail.com>
Subject: Re: [PATCH v6 0/5] MCPM backend for Exynos5420
Date: Wed, 14 May 2014 13:04:17 +0530
Message-ID: <CAM4voa=6osyXYg_XF=XuGRYmxLDUO+5=-i+cMrNW92fzBZJjfA@mail.gmail.com>
References: <1399982324-27879-1-git-send-email-a.kesavan@samsung.com>
	<alpine.LFD.2.11.1405131325060.980@knanqh.ubzr>
	<CAM4voanvVwj+FuWazTGMHMnM64Cw_qK03D3o=raS43f_zWFfog@mail.gmail.com>
	<alpine.LFD.2.11.1405140031490.980@knanqh.ubzr>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qg0-f53.google.com ([209.85.192.53]:53888 "EHLO
	mail-qg0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751067AbaENHeS (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 14 May 2014 03:34:18 -0400
Received: by mail-qg0-f53.google.com with SMTP id f51so2131476qge.26
        for <linux-samsung-soc@vger.kernel.org>; Wed, 14 May 2014 00:34:17 -0700 (PDT)
In-Reply-To: <alpine.LFD.2.11.1405140031490.980@knanqh.ubzr>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Nicolas Pitre <nicolas.pitre@linaro.org>
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, Kukjin Kim <kgene.kim@samsung.com>, Andrew Bresticker <abrestic@chromium.org>, Thomas P Abraham <thomas.ab@samsung.com>, "inderpal.s@samsung.com" <inderpal.s@samsung.com>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Dave Martin <Dave.Martin@arm.com>, Tomasz Figa <t.figa@samsung.com>

Hi Nicolas,

[...]
>>
>> 1) can't create /sys/devices/system/cpu/cpu//online: nonexistent directory
>
> What do you get if you do:
>
> $ ls -d /sys/devices/system/cpu/cpu?/online
ls: /sys/devices/system/cpu/cpu//online: No such file or directory
>
> ?
>
>> 2) sleep: invalid number '.0026736'
>
> A sufficiently recent coreutils package should have a sleep command that
> accepts fractional values.  Alternatively you may replace it with
> usleep:
>
>         usleep $RANDOM
Looks like my cramfs needs an update, it seems to have old packages.
>
>> For 1) the cpu number is not being appended. if I give a particular
>> cpu in the script then hotplug in/out works fine.
>> For 2) a constant msleep 10 works.
>
> If you have msleep but not usleep then try:
>
>                 msleep $(($RANDOM / 1000))
I have msleep present.
>
>> Is it OK for me to modify the script to hotplug in/off a randomly chosed core ?
>
> No.  They must *all* be hotplugged simultaneously with some random
> timing.
OK.

Regards,
Abhilash

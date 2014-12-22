From: Abhilash Kesavan <kesavan.abhilash@gmail.com>
Subject: Re: [PATCH v2 00/17] thermal: exynos: Thermal code rework to use
 device tree
Date: Mon, 22 Dec 2014 21:20:35 +0530
Message-ID: <CAM4voakxJPjfGu3gkpCbDS+SY1TP39Of+0ed=5jS55ARn95pYg@mail.gmail.com>
References: <1412872737-624-1-git-send-email-l.majewski@samsung.com>
	<1418213396-743-1-git-send-email-l.majewski@samsung.com>
	<20141210102712.GA2919@developer>
	<20141210151925.61a0b091@amdc2363>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qc0-f182.google.com ([209.85.216.182]:41782 "EHLO
	mail-qc0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754588AbaLVPug (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 22 Dec 2014 10:50:36 -0500
In-Reply-To: <20141210151925.61a0b091@amdc2363>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Lukasz Majewski <l.majewski@samsung.com>
Cc: Eduardo Valentin <edubezval@gmail.com>, Zhang Rui <rui.zhang@intel.com>, Linux PM list <linux-pm@vger.kernel.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Lukasz Majewski <l.majewski@majess.pl>, Kukjin Kim <kgene.kim@samsung.com>, Amit Daniel Kachhap <amit.daniel@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>

Hi Lukasz and Eduardo,

[...]
>
> Although, this shouldn't be a problem.
>
>> That is why we had the cycle with cpufreq folks, remember?
>>
>> (I will have a look in your patches)
>
> It would be great if those patches could find their way to therma -next.
> Then also Abhilash could benefit from them.

I have a couple of 5420/5800 based chromebooks that I will test this
series on. Is it OK for me to start basing my Exynos7 TMU support on
this series ? Please let me know if I can help in any other way with
this.

Regards,
Abhilash

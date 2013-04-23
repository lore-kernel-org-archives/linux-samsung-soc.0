From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: Re: [PATCH 2/6] thermal:exynos4: TMU Common clock framework support
 for TMU (Thermal Monitoring Unit)
Date: Tue, 23 Apr 2013 14:12:13 +0530
Message-ID: <CAK9yfHwoa+AhAa+rcO6KbuKavmBkLqe5Lmeb+oF=ufKgEivg+Q@mail.gmail.com>
References: <1366389493-8239-1-git-send-email-l.majewski@samsung.com>
	<1366389493-8239-3-git-send-email-l.majewski@samsung.com>
	<CAK9yfHxWq5CrhY=A2HMZnH3SQww2sPTBM_zQ9hoinyk1zger7g@mail.gmail.com>
	<20130423081724.03b3b422@amdc308.digital.local>
	<CAK9yfHwx_3Lkt_xnzttvBK=0xGqdxL+f=QfdYjuo3mHV8NtNQA@mail.gmail.com>
	<20130423100647.20d80c73@amdc308.digital.local>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-oa0-f50.google.com ([209.85.219.50]:39116 "EHLO
	mail-oa0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754946Ab3DWImO (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 23 Apr 2013 04:42:14 -0400
Received: by mail-oa0-f50.google.com with SMTP id j6so331457oag.9
        for <linux-samsung-soc@vger.kernel.org>; Tue, 23 Apr 2013 01:42:14 -0700 (PDT)
In-Reply-To: <20130423100647.20d80c73@amdc308.digital.local>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Lukasz Majewski <l.majewski@samsung.com>
Cc: Kukjin Kim <kgene.kim@samsung.com>, Mike Turquette <mturquette@linaro.org>, Zhang Rui <rui.zhang@intel.com>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Linux PM list <linux-pm@vger.kernel.org>, Amit Daniel Kachhap <amit.kachhap@linaro.org>, Kyungmin Park <kyungmin.park@samsung.com>, "eduardo.valentin@ti.com" <eduardo.valentin@ti.com>

Hi Lukasz,

On 23 April 2013 13:36, Lukasz Majewski <l.majewski@samsung.com> wrote:

>>
> I just wanted to stick to the common clock new API. It seems to me that
> exynos_tmu_read() might sleep, but I'm quite novice at TMU :-).
>
> If yours patches work, then we shall apply them.
>
> I will do my best to test yours three patches ASAP on my setup.

Thanks. Please let me know if it works for you.


-- 
With warm regards,
Sachin

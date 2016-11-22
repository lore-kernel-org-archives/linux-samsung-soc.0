From: MyungJoo Ham <myungjoo.ham@gmail.com>
Subject: Re: PM / devfreq: exynos-bus: need for suspend OPP?
Date: Tue, 22 Nov 2016 21:39:09 +0900
Message-ID: <CAJ0PZbSMzpr76X8swG7YDFagphjBrE+Fb41pP3cu6=bucFeGSQ@mail.gmail.com>
References: <5832F792.4010308@math.uni-bielefeld.de> <7d5d2c7c-6ebb-b4c1-5f3f-f794c249ca36@fivetechno.de>
 <CAJ0PZbT6FDC382Z7N8ky+MX2auekCGSOuES8O3L3FtnGc6XOWw@mail.gmail.com>
 <58331166.1010403@math.uni-bielefeld.de> <CAJ0PZbSpNFC+0GzNMS=Q2O3qn2=gdxYt=mK=DEMBSBCBXMz-RA@mail.gmail.com>
 <58337215.3090503@math.uni-bielefeld.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-io0-f195.google.com ([209.85.223.195]:36709 "EHLO
        mail-io0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752808AbcKVMj0 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 22 Nov 2016 07:39:26 -0500
Received: by mail-io0-f195.google.com with SMTP id k19so10662812iod.3
        for <linux-samsung-soc@vger.kernel.org>; Tue, 22 Nov 2016 04:39:26 -0800 (PST)
In-Reply-To: <58337215.3090503@math.uni-bielefeld.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
Cc: Markus Reichl <m.reichl@fivetechno.de>, "moderated list:ARM/S5P EXYNOS AR..." <linux-samsung-soc@vger.kernel.org>, Chanwoo Choi <cw00.choi@samsung.com>

On Tue, Nov 22, 2016 at 7:15 AM, Tobias Jakobi
<tjakobi@math.uni-bielefeld.de> wrote:
> OK, I don't think this is as easy implementable as MyungJoo implied.
>
> - exynos_bus_suspend() and exynos_bus_resume() are not called during
> shutdown/reboot.

You don't need them at shutdown/reboot. probe() is going to be called
afterwards anyway.

>
> - devfreq_suspend_device() and devfreq_resume_device() have to be called
> from driver code.

Yes. That's the limitation.

The easiest way is to fix the freq/volt at device driver.

Unless devfreq manages struct device directly at subsystem, it won't
be easy to manage device's suspend/resume directly.


MyungJoo

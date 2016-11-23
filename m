From: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
Subject: Re: PM / devfreq: exynos-bus: need for suspend OPP?
Date: Wed, 23 Nov 2016 14:55:03 +0100
Message-ID: <58359FB7.4010406@math.uni-bielefeld.de>
References: <5832F792.4010308@math.uni-bielefeld.de>
 <7d5d2c7c-6ebb-b4c1-5f3f-f794c249ca36@fivetechno.de>
 <CAJ0PZbT6FDC382Z7N8ky+MX2auekCGSOuES8O3L3FtnGc6XOWw@mail.gmail.com>
 <58331166.1010403@math.uni-bielefeld.de>
 <CAJ0PZbSpNFC+0GzNMS=Q2O3qn2=gdxYt=mK=DEMBSBCBXMz-RA@mail.gmail.com>
 <58337215.3090503@math.uni-bielefeld.de>
 <CAJ0PZbSMzpr76X8swG7YDFagphjBrE+Fb41pP3cu6=bucFeGSQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from smtp.math.uni-bielefeld.de ([129.70.45.10]:58264 "EHLO
        smtp.math.uni-bielefeld.de" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S935089AbcKWNzE (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 23 Nov 2016 08:55:04 -0500
In-Reply-To: <CAJ0PZbSMzpr76X8swG7YDFagphjBrE+Fb41pP3cu6=bucFeGSQ@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: MyungJoo Ham <myungjoo.ham@gmail.com>, Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
Cc: Markus Reichl <m.reichl@fivetechno.de>, "moderated list:ARM/S5P EXYNOS AR..." <linux-samsung-soc@vger.kernel.org>, Chanwoo Choi <cw00.choi@samsung.com>

Hello again,

I've just send a draft for the patch(set) I have in mind.

It's still in bad shape and I would appreciate some comments from the
guys more versed with the DevFreq subsystem than me. In particular I'm
not sure how exactly the various components (exynos-bus, devfreq,
devfreq-event, governor) work together.

- Tobias

MyungJoo Ham wrote:
> On Tue, Nov 22, 2016 at 7:15 AM, Tobias Jakobi
> <tjakobi@math.uni-bielefeld.de> wrote:
>> OK, I don't think this is as easy implementable as MyungJoo implied.
>>
>> - exynos_bus_suspend() and exynos_bus_resume() are not called during
>> shutdown/reboot.
> 
> You don't need them at shutdown/reboot. probe() is going to be called
> afterwards anyway.
> 
>>
>> - devfreq_suspend_device() and devfreq_resume_device() have to be called
>> from driver code.
> 
> Yes. That's the limitation.
> 
> The easiest way is to fix the freq/volt at device driver.
> 
> Unless devfreq manages struct device directly at subsystem, it won't
> be easy to manage device's suspend/resume directly.
> 
> 
> MyungJoo
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsung-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 

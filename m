From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: Re: [PATCH V2 17/17] ARM: exynos: config: Enable cpuidle
Date: Tue, 8 Apr 2014 09:27:04 +0530
Message-ID: <CAK9yfHz_J+NAtxk-Ec-cW6_u0ukssNGi24HZgGRRXb8Hzz2sig@mail.gmail.com>
References: <1396618989-2897-1-git-send-email-daniel.lezcano@linaro.org>
	<5825506.2ErDt1UQ5r@amdc1032>
	<CAOesGMgkbfUX=cJ4rMf+-26Sq_fYUNW8m6unNiCXHKwj83dLbw@mail.gmail.com>
	<3344539.A0GIVp3yPt@amdc1032>
	<CAOesGMgf4owZBCVz4RTgbFVsogws6WKARmA7COkgXVQaG5ky9A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ob0-f178.google.com ([209.85.214.178]:35409 "EHLO
	mail-ob0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755051AbaDHD5G (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 7 Apr 2014 23:57:06 -0400
Received: by mail-ob0-f178.google.com with SMTP id wp18so397554obc.37
        for <linux-samsung-soc@vger.kernel.org>; Mon, 07 Apr 2014 20:57:04 -0700 (PDT)
In-Reply-To: <CAOesGMgf4owZBCVz4RTgbFVsogws6WKARmA7COkgXVQaG5ky9A@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Olof Johansson <olof@lixom.net>
Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, Kukjin Kim <kgene.kim@samsung.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Tomasz Figa <t.figa@samsung.com>, "linaro-kernel@lists.linaro.org" <linaro-kernel@lists.linaro.org>, "Rafael J. Wysocki" <rjw@rjwysocki.net>

On 8 April 2014 00:03, Olof Johansson <olof@lixom.net> wrote:
> On Mon, Apr 7, 2014 at 10:44 AM, Bartlomiej Zolnierkiewicz
> <b.zolnierkie@samsung.com> wrote:
>>
>> Hi,
>>
>> On Monday, April 07, 2014 09:28:39 AM Olof Johansson wrote:
>>> On Fri, Apr 4, 2014 at 9:09 AM, Bartlomiej Zolnierkiewicz
>>> <b.zolnierkie@samsung.com> wrote:
>>>
>>> [...]
>
> Does 5420 even work upstream? I have hardware access but nothing that
> will run an upstream kernel as far as I know. Maybe SLSI has an SMDK
> they can help out with?

By working upstream if you mean being bootable, then yes I am able to boot both
SMDK and Arndale Octa boards based on 5420 with the current upstream kernel.
CPU idle however doesn't work though. I get a crash when I hot plug out all
secondary CPUs on SMDK.

-- 
With warm regards,
Sachin

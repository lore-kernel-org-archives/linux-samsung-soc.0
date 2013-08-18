From: Kukjin Kim <kgene.kim@samsung.com>
Subject: Re: [PATCH v3 0/9] ARM: dts: exynos: add support for hdmi subsystem
Date: Mon, 19 Aug 2013 04:16:13 +0900
Message-ID: <52111D7D.3060108@samsung.com>
References: <1374737677-3215-1-git-send-email-rahul.sharma@samsung.com> <112701ce98d6$aaed8840$00c898c0$@org> <6563414.jg5Jd3ZBY4@amdc1227>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pd0-f176.google.com ([209.85.192.176]:44948 "EHLO
	mail-pd0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751690Ab3HRTQT (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 18 Aug 2013 15:16:19 -0400
Received: by mail-pd0-f176.google.com with SMTP id q10so4171141pdj.21
        for <linux-samsung-soc@vger.kernel.org>; Sun, 18 Aug 2013 12:16:18 -0700 (PDT)
In-Reply-To: <6563414.jg5Jd3ZBY4@amdc1227>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <t.figa@samsung.com>
Cc: Kukjin Kim <kgene@kernel.org>, 'Rahul Sharma' <rahul.sharma@samsung.com>, linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, sw0312.kim@samsung.com, inki.dae@samsung.com, seanpaul@chromium.org, l.stach@pengutronix.de, tomasz.figa@gmail.com, rob.herring@calxeda.com, s.nawrocki@samsung.com, grant.likely@linaro.org, joshi@samsung.com, r.sh.open@gmail.com, 'Russell King' <rmk+kernel@arm.linux.org.uk>

On 08/14/13 20:26, Tomasz Figa wrote:

[...]

>> See my comments about making common stuff for exynos5 SoCs.
>
> I agree.
>
>> And please don't use title like following,
>>
>> 'ARM: dts: exynos0000: ....'.
>>
>> Because the relatively long prefix of title can cover _real_ title, So
>> just 'ARM: dts: .... in exynos000' is better.
>
> Well, I tend to disagree on this. The ARM: dts:<platform name>: prefix is
> commonly used in arch/arm/boot/dts (see git log --oneline
> arch/arm/boot/dts).
>
Hmm...it is not entirely true...

> As long as we don't cross the ~75 characters boundary in patch subject, I
> don't think this is any problem.
>
Let's see.

If we use the 'platform name' in prefixe for dt file,

"ARM: dts: exynos0000: add support for something"
or
"ARM: dts: universal_c210: add support for something"
or
"ARM: dts: exynos0000-pinctrl: add support for something"
...
most of them should spend over half of 75 characters as a prefix 
including 'add support for' in subject and in addition, there is '[PATCH 
v0 00/00]' in the email subject.

(+ Russell)

I remember there were discussions about subject and at that time the 
result was that keyword should be shown ahead as possible in subject. 
But we are still using too long word as a prefix...

One more note, even my e-mail client shows just 40~50 characters for 
subject because of relatively not big enough resolution and pre-read 
window and so on ;)

Kukjin

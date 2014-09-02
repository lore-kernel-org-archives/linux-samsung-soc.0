From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH 05/14] pinctrl: exynos: Add driver data for Exynos7
Date: Tue, 02 Sep 2014 14:41:14 +0200
Message-ID: <5405BAEA.9030100@gmail.com>
References: <1409132889-2080-1-git-send-email-ch.naveen@samsung.com>	<1409132889-2080-5-git-send-email-ch.naveen@samsung.com> <CACRpkdZc=d+pr1ofEEp+1MoZUah8T7_LOfwM8bT-TsT+VoDgwQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wi0-f182.google.com ([209.85.212.182]:41163 "EHLO
	mail-wi0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753264AbaIBMlS (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 2 Sep 2014 08:41:18 -0400
Received: by mail-wi0-f182.google.com with SMTP id z2so7781289wiv.3
        for <linux-samsung-soc@vger.kernel.org>; Tue, 02 Sep 2014 05:41:17 -0700 (PDT)
In-Reply-To: <CACRpkdZc=d+pr1ofEEp+1MoZUah8T7_LOfwM8bT-TsT+VoDgwQ@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Naveen Krishna Chatradhi <ch.naveen@samsung.com>
Cc: Naveen Krishna <naveenkrishna.ch@gmail.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "cpgs ." <cpgs@samsung.com>, Thomas Abraham <thomas.ab@samsung.com>

Hi Linus,

On 02.09.2014 14:38, Linus Walleij wrote:
> On Wed, Aug 27, 2014 at 11:48 AM, Naveen Krishna Chatradhi
> <ch.naveen@samsung.com> wrote:
> 
>> This patch adds driver data for Exynos7
>> to pinctrl-exynos driver. Exynos7 includes 229 multi-functional
>> input/output ports. There are 40 general port groups.
>>
>> Signed-off-by: Naveen Krishna Chatradhi <ch.naveen@samsung.com>
>> Cc: Tomasz Figa <t.figa@samsung.com>
>> Cc: linus.walleij@linaro.org
>> Cc: Thomas Abraham <thomas.ab@samsung.com>
> 
> Tomasz can you have a look at this (from your private mail...)?

Sure. In fact I already took a look last week, and this patch in
particular looks good. However I'm waiting for replies to my other
comments in this thread, as some of them affect also this patch.

Best regards,
Tomasz

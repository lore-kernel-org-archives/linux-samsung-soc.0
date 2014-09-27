From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH 0/5] pinctrl: samsung: Data structure clean-up
Date: Sat, 27 Sep 2014 14:50:17 +0200
Message-ID: <5426B289.7070802@gmail.com>
References: <1411499141-26551-1-git-send-email-tomasz.figa@gmail.com> <CACRpkdZCMD4x+wrvTOrrWK-Dy4_rg6bD2xUAA4jtTGTbT1uDag@mail.gmail.com> <5423C904.60708@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-we0-f179.google.com ([74.125.82.179]:42962 "EHLO
	mail-we0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751783AbaI0MuV (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 27 Sep 2014 08:50:21 -0400
In-Reply-To: <5423C904.60708@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Kukjin Kim <kgene.kim@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>

Hi Linus,

On 25.09.2014 09:49, Tomasz Figa wrote:
> On 25.09.2014 09:47, Linus Walleij wrote:
>> On Tue, Sep 23, 2014 at 9:05 PM, Tomasz Figa <tomasz.figa@gmail.com> wrote:
>>
>>> This series intends to clean up data structures used by pinctrl-samsung driver.
>>> More specifically, it separates initial compile time constants from data used
>>> at runtime, allowing unused variant data to be dropped and selected structures
>>> constified to improve safety.
>>
>> I like the patch set, tried to apply it but patch 3/5 failed to apply to the
>> devel branch for pinctrl.
>>
>> Can you rebase this on my "devel" branch, include Marek's Tested-by
>> tag and resend, and I'll take it for v3.18.
> 
> Sure. Will do that today evening. Probably clashed with some other
> changes queued in the meantime.

Uhm. I went back home and forgot about this series until now. Sorry.

I have rebased it on your "devel" branch, although it seems like this
branch is missing [1], which in turn seems to be already present in your
"for-next" branch and is going to cause a merge conflict with this
series. Should I still proceed with posting the series based on "devel"?

[1] f6a8249f9e55d pinctrl: exynos: Lock GPIOs as interrupts when used as
EINTs

Best regards,
Tomasz

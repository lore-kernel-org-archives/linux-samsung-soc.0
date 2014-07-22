From: Kukjin Kim <kgene.kim@samsung.com>
Subject: Re: [PATCH 1/3] ARM: exynos: remove unused <mach/memory.h>
Date: Wed, 23 Jul 2014 08:37:33 +0900
Message-ID: <53CEF5BD.10307@samsung.com>
References: <1404295043-6661-1-git-send-email-u.kleine-koenig@pengutronix.de> <20140722075138.GB28538@pengutronix.de> <CAOesGMgA0fc0_8JOOE01y=UKv-eAZuWiAkAKHG5iam0Zkhp9TA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pd0-f182.google.com ([209.85.192.182]:61564 "EHLO
	mail-pd0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753024AbaGVXhk (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 22 Jul 2014 19:37:40 -0400
Received: by mail-pd0-f182.google.com with SMTP id fp1so451891pdb.27
        for <linux-samsung-soc@vger.kernel.org>; Tue, 22 Jul 2014 16:37:39 -0700 (PDT)
In-Reply-To: <CAOesGMgA0fc0_8JOOE01y=UKv-eAZuWiAkAKHG5iam0Zkhp9TA@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Olof Johansson <olof@lixom.net>
Cc: =?UTF-8?B?VXdlIEtsZWluZS1Lw7ZuaWc=?= <u.kleine-koenig@pengutronix.de>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Russell King <linux@arm.linux.org.uk>, "arm@kernel.org" <arm@kernel.org>, Sascha Hauer <kernel@pengutronix.de>, Kukjin Kim <kgene.kim@samsung.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>

On 07/23/14 01:14, Olof Johansson wrote:
> On Tue, Jul 22, 2014 at 12:51 AM, Uwe Kleine-K=C3=B6nig
> <u.kleine-koenig@pengutronix.de>  wrote:
>> Hello,
>>
>> who takes care of this series?
>>
>> In fact they are all orthogonal to each other.
>>
>> The first patch
>>
>>          ARM: exynos: remove unused<mach/memory.h>
>>
>> has been reviewed and tested by Tomasz Figa and Sachin Kamat. Can th=
e
>> Samsung people pick it up? Or armsoc?
>
> Kukjin should apply this one.
>
Oh, thanks for gentle reminder and I've applied into 2nd cleanup.

Thanks,
Kukjin


>> Patch 2 (v2!)
>>
>>          ARM: remove remaining definitions of PLAT_PHYS_OFFSET from<=
mach/memory.h>
>>
>> touches several arch/arm/mach-*/include/mach/memory.h and
>> arch/arm/Kconfig. armsoc? Russell?
>
> This can go through either, but Russell has already reviewed it once
> so send it to his patch tracker.
>
>> Patch 3 fixes a warning regarding nommu and touches the Kconfig entr=
y
>> for Integrator and Renesas (non-multiplatform). armsoc?
>
> Don't know without seeing the patch. What's the patch subject so I ca=
n find it?

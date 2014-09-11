From: Naveen Krishna Ch <naveenkrishna.ch@gmail.com>
Subject: Re: [PATCH v3 5/8] arm64: dts: Add initial device tree support for EXYNOS7
Date: Thu, 11 Sep 2014 17:51:18 +0530
Message-ID: <CAHfPSqBCepBTuz8TDUyYSNKcWu1Umii8A4=Ue=eiBn8X7aiunA@mail.gmail.com>
References: <1410430852-3491-1-git-send-email-ch.naveen@samsung.com>
 <1410430852-3491-6-git-send-email-ch.naveen@samsung.com> <27455049.omNFrla0xU@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qg0-f43.google.com ([209.85.192.43]:42126 "EHLO
	mail-qg0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754271AbaIKMVl (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 11 Sep 2014 08:21:41 -0400
In-Reply-To: <27455049.omNFrla0xU@wuerfel>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Naveen Krishna Chatradhi <ch.naveen@samsung.com>, devicetree@vger.kernel.org, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, robh@kernel.org, catalin.marinas@arm.com, tomasz.figa@gmail.com, Kukjin Kim <kgene.kim@samsung.com>

On 11 September 2014 16:11, Arnd Bergmann <arnd@arndb.de> wrote:
> On Thursday 11 September 2014 15:50:49 Naveen Krishna Chatradhi wrote:
>> +       aliases {
>> +               serial0 = &serial_0;
>> +               serial1 = &serial_1;
>> +               serial2 = &serial_2;
>> +               serial3 = &serial_3;
>> +       };
>> +
>
> Please move the aliases from the exynos7.dtsi file into the
> exynos7-espresso.dts file, and only list the ones that are
> present, starting with alias 0, like
>
>         aliases {
>                 serial0 = &serial_2;
>         };
>
> If the machine has only one serial port, it should be the first
> alias.

Okay, will fix this in the next version.

>
>         Arnd

Thanks,
-- 
Shine bright,
(: Nav :)

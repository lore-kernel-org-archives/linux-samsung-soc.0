From: Kukjin Kim <kgene.kim@samsung.com>
Subject: Re: [PATCH v3 07/22] ARM: dts: Remove '0x's from Exynos4210 DTSI
 file
Date: Tue, 06 Aug 2013 02:58:04 +0900
Message-ID: <51FFE7AC.1020801@samsung.com>
References: <1374490361-25769-1-git-send-email-lee.jones@linaro.org> <1374490361-25769-7-git-send-email-lee.jones@linaro.org> <20130724150937.GO26801@laptop> <5075798.2aqxtybhC8@amdc1227> <20130725075215.GA3403@laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pd0-f177.google.com ([209.85.192.177]:49087 "EHLO
	mail-pd0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753725Ab3HER6K (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 5 Aug 2013 13:58:10 -0400
In-Reply-To: <20130725075215.GA3403@laptop>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>
Cc: Tomasz Figa <t.figa@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, arnd@arndb.de, linus.walleij@stericsson.com, Kukjin Kim <kgene.kim@samsung.com>, linux-samsung-soc@vger.kernel.org

On 07/25/13 16:52, Lee Jones wrote:
> On Wed, 24 Jul 2013, Tomasz Figa wrote:
>
>> On Wednesday 24 of July 2013 16:09:37 Lee Jones wrote:
>>> ... for the sake of consistency and assumed convention.
>>>
>>> Cc: Kukjin Kim<kgene.kim@samsung.com>
>>> Cc: linux-samsung-soc@vger.kernel.org
>>> Signed-off-by: Lee Jones<lee.jones@linaro.org>
>>>
>>> diff --git a/arch/arm/boot/dts/exynos4210.dtsi
>>> b/arch/arm/boot/dts/exynos4210.dtsi index b7f358a..53e2527 100644
>>> --- a/arch/arm/boot/dts/exynos4210.dtsi
>>> +++ b/arch/arm/boot/dts/exynos4210.dtsi
>>> @@ -72,7 +72,7 @@
>>>                  };
>>>          };
>>>
>>> -       clock: clock-controller@0x10030000 {
>>> +       clock: clock-controller@10030000 {
>>>                  compatible = "samsung,exynos4210-clock";
>>>                  reg =<0x10030000 0x20000>;
>>>                  #clock-cells =<1>;
>>
>> Acked-by: Tomasz Figa<t.figa@samsung.com>
>
> Thanks Tomasz.
>
Thanks, Lee Jones and Tomasz.

Applied #7 ~ #11 into the cleanup of samsung tree.

- Kukjin

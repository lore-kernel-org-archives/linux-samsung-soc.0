From: Prasanna Kumar <prasannapadubidri@gmail.com>
Subject: Re: [PATCH 0/2] ARM: Exynos5 : Add Power domain device tree support
 for MFC and GSC
Date: Mon, 21 Jan 2013 18:35:29 +0530
Message-ID: <CAPmaG0vduUv+792LFu0TkyyhmvP_GGK5kwhb-NK5Rsn4xgKNnw@mail.gmail.com>
References: <1357733733-18769-1-git-send-email-prasanna.ps@samsung.com>
	<CAPmaG0vQHJbp5tkHTPxEM3Oy1GASbN4asN-x+gtxb77jwpOK0g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vc0-f171.google.com ([209.85.220.171]:37873 "EHLO
	mail-vc0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752612Ab3AUNFa (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 21 Jan 2013 08:05:30 -0500
Received: by mail-vc0-f171.google.com with SMTP id fk10so4198031vcb.2
        for <linux-samsung-soc@vger.kernel.org>; Mon, 21 Jan 2013 05:05:29 -0800 (PST)
In-Reply-To: <CAPmaG0vQHJbp5tkHTPxEM3Oy1GASbN4asN-x+gtxb77jwpOK0g@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: kgene.kim@samsung.com, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org

Hello ,

Any comments for this patch set ?

> On Wed, Jan 9, 2013 at 5:45 PM, Prasanna Kumar <prasanna.ps@samsung.com> wrote:
>>
>> Hello all,
>>
>> This patch set adds device tree support for power domains (Gscaler and
>> MFC) of exynos5
>>
>> Prasanna Kumar (2):
>>   arm: exynos5: Enable PM generic domain support in Kconfig
>>   ARM: dts: exynos5: Set up power domain for  MFC and G-scaler
>>
>>  arch/arm/boot/dts/exynos5250.dtsi |   15 +++++++++++++++
>>  arch/arm/mach-exynos/Kconfig      |    1 +
>>  2 files changed, 16 insertions(+), 0 deletions(-)
>>
>> --
>> 1.7.5.4
>>
>> --
>> To unsubscribe from this list: send the line "unsubscribe linux-samsung-soc" in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
>
>
>
> --
> Thanks
> Prasanna Kumar




--
Thanks
Prasanna Kumar

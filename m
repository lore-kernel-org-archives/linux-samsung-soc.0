From: Pankaj Dubey <pankaj.dubey@samsung.com>
Subject: Re: [RESEND-PATCH] ARM: dts: Add missing irq pinctrl for max77686 on
 smdk5250
Date: Tue, 05 May 2015 10:05:05 +0530
Message-ID: <55484879.3080603@samsung.com>
References: <1430798855-27271-1-git-send-email-pankaj.dubey@samsung.com>
 <CAJKOXPd2x_DiD8EAq202=scTuK0HHH8evvD_TkLn4oO_6hrRhg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:34146 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752707AbbEEEdl (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 5 May 2015 00:33:41 -0400
In-reply-to: <CAJKOXPd2x_DiD8EAq202=scTuK0HHH8evvD_TkLn4oO_6hrRhg@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: =?UTF-8?B?S3J6eXN6dG9mIEtvesWCb3dza2k=?= <k.kozlowski.k@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, robh+dt@kernel.org, kgene@kernel.org, yadi.brar01@gmail.com, Kozik <k.kozlowski@samsung.com>, Yadwinder Singh Brar <yadi.brar@samsung.com>



On Tuesday 05 May 2015 09:44 AM, Krzysztof Koz=C5=82owski wrote:
> 2015-05-05 13:07 GMT+09:00 Pankaj Dubey <pankaj.dubey@samsung.com>:
>> From: Yadwinder Singh Brar <yadi.brar@samsung.com>
>>
>> This patch adds pinctrl configuration for using configuring gpx3-2 a=
s an
>> external interrupt from max77686. Though max77686 RTC is enabled and=
 gets
>> probed by default, it doesnt work as its unable to get interrupt.
>>
>> This patch makes max77686 RTC work and also configures it as wakeup =
source.
>>
>> Signed-off-by: Yadwinder Singh Brar <yadi.brar@samsung.com>
>> Reviewed-by: Javier Martinez Canillas <javier.martinez@collabora.co.=
uk>
>> Tested-by: Pankaj Dubey <pankaj.dubey@samsung.com>
>> ---
>>
>> Initial version of this patch was part of following series, though
>> they are not dependent on each other, resubmitting after rebasing
>> and detaching second one from first patch in the series [1]
>>
>> [1]: http://lists.infradead.org/pipermail/linux-arm-kernel/2014-Nove=
mber/303652.html
>
> Thanks, but now it needs your Signed-off-by because you touched it.
>
> Acked-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
>

Thanks for quick response. Will resubmit it again including my=20
Signed-off-by.

> Best regards,
> Krzysztof
>

Thanks,
Pankaj Dubey

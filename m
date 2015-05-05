From: Kukjin Kim <kgene@kernel.org>
Subject: Re: [RESEND-PATCH] ARM: dts: Add missing irq pinctrl for max77686
 on smdk5250
Date: Wed, 06 May 2015 06:40:57 +0900
Message-ID: <554938E9.10907@kernel.org>
References: <1430798855-27271-1-git-send-email-pankaj.dubey@samsung.com> <CAJKOXPd2x_DiD8EAq202=scTuK0HHH8evvD_TkLn4oO_6hrRhg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.136]:37939 "EHLO mail.kernel.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752209AbbEEVlD (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 5 May 2015 17:41:03 -0400
In-Reply-To: <CAJKOXPd2x_DiD8EAq202=scTuK0HHH8evvD_TkLn4oO_6hrRhg@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: =?UTF-8?B?S3J6eXN6dG9mIEtvesWCb3dza2k=?= <k.kozlowski.k@gmail.com>
Cc: Pankaj Dubey <pankaj.dubey@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, robh+dt@kernel.org, kgene@kernel.org, yadi.brar01@gmail.com, Kozik <k.kozlowski@samsung.com>, Yadwinder Singh Brar <yadi.brar@samsung.com>

On 05/05/15 13:14, Krzysztof Koz=C5=82owski wrote:
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
>=20
> Thanks, but now it needs your Signed-off-by because you touched it.
>=20
Just note, to more clarify, Signed-off-by should be added who wants to
submit anything into mailing-list even no updating and just posting...

> Acked-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
>=20
Thanks,
Kukjin

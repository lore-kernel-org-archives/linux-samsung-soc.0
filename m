From: Rahul Sharma <r.sh.open@gmail.com>
Subject: Re: [PATCH v7 1/3] ARM: EXYNOS: initial board support for exynos5260 SoC
Date: Wed, 9 Apr 2014 14:45:50 +0530
Message-ID: <CAPdUM4OitgCTOT4Eo2Uq-UW95Z1D7yoLrqC_=+==tPAg8kJBtA@mail.gmail.com>
References: <1396519224-18712-1-git-send-email-rahul.sharma@samsung.com>
	<1396519224-18712-2-git-send-email-rahul.sharma@samsung.com>
	<CAK9yfHzuVZh-RhfT+0tEehnF+aWnYHG=X2cv_E6uvzq2aS7UQg@mail.gmail.com>
	<53450D29.7020207@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wg0-f42.google.com ([74.125.82.42]:49669 "EHLO
	mail-wg0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932358AbaDIJPw (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 9 Apr 2014 05:15:52 -0400
In-Reply-To: <53450D29.7020207@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <t.figa@samsung.com>
Cc: Sachin Kamat <sachin.kamat@linaro.org>, Rahul Sharma <rahul.sharma@samsung.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, Kukjin Kim <kgene.kim@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, sunil joshi <joshi@samsung.com>, Pankaj Dubey <pankaj.dubey@samsung.com>

On 9 April 2014 14:34, Tomasz Figa <t.figa@samsung.com> wrote:
> On 07.04.2014 10:38, Sachin Kamat wrote:
>>
>> Hi Rahul,
>>
>> On 3 April 2014 15:30, Rahul Sharma <rahul.sharma@samsung.com> wrote:
>>>
>>> From: Pankaj Dubey <pankaj.dubey@samsung.com>
>>>
>>> This patch add basic arch side support for exynos5260 SoC.
>>
>> <snip>
>>
>>> @@ -374,6 +374,7 @@ static char const *exynos_dt_compat[] __initconst = {
>>>          "samsung,exynos4412",
>>>          "samsung,exynos5",
>>>          "samsung,exynos5250",
>>> +       "samsung,exynos5260",
>>
>>
>> I don't think we should be adding this as we do not yet have any soc
>> specific quirk.
>> Compatibility to generic string, "samsung,exynos5"  should be sufficient.
>>
>
> Yes. Unless a SoC specific quirk that needs to be handled at such low level
> stage emerges, there is no need to add such compatible string to the kernel.
>

Thanks Sachin, Tomasz,

I will change this.

Regards,
Rahul Sharma.

> Best regards,
> Tomasz

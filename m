From: Tomasz Figa <t.figa@samsung.com>
Subject: Re: [PATCH v7 1/3] ARM: EXYNOS: initial board support for exynos5260
 SoC
Date: Wed, 09 Apr 2014 11:04:41 +0200
Message-ID: <53450D29.7020207@samsung.com>
References: <1396519224-18712-1-git-send-email-rahul.sharma@samsung.com>
 <1396519224-18712-2-git-send-email-rahul.sharma@samsung.com>
 <CAK9yfHzuVZh-RhfT+0tEehnF+aWnYHG=X2cv_E6uvzq2aS7UQg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:59655 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758306AbaDIJFL (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 9 Apr 2014 05:05:11 -0400
In-reply-to: <CAK9yfHzuVZh-RhfT+0tEehnF+aWnYHG=X2cv_E6uvzq2aS7UQg@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sachin Kamat <sachin.kamat@linaro.org>, Rahul Sharma <rahul.sharma@samsung.com>
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, Kukjin Kim <kgene.kim@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, sunil joshi <joshi@samsung.com>, Rahul Sharma <r.sh.open@gmail.com>, Pankaj Dubey <pankaj.dubey@samsung.com>

On 07.04.2014 10:38, Sachin Kamat wrote:
> Hi Rahul,
>
> On 3 April 2014 15:30, Rahul Sharma <rahul.sharma@samsung.com> wrote:
>> From: Pankaj Dubey <pankaj.dubey@samsung.com>
>>
>> This patch add basic arch side support for exynos5260 SoC.
> <snip>
>
>> @@ -374,6 +374,7 @@ static char const *exynos_dt_compat[] __initconst = {
>>          "samsung,exynos4412",
>>          "samsung,exynos5",
>>          "samsung,exynos5250",
>> +       "samsung,exynos5260",
>
> I don't think we should be adding this as we do not yet have any soc
> specific quirk.
> Compatibility to generic string, "samsung,exynos5"  should be sufficient.
>

Yes. Unless a SoC specific quirk that needs to be handled at such low 
level stage emerges, there is no need to add such compatible string to 
the kernel.

Best regards,
Tomasz

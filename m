From: Kukjin Kim <kgene.kim@samsung.com>
Subject: Re: [PATCH 2/3] ARM: EXYNOS: Add clkdev lookup entry for lcd clock
Date: Fri, 09 Mar 2012 08:08:54 -0800
Message-ID: <4F5A2B16.9090408@samsung.com>
References: <1322718611-20934-1-git-send-email-tushar.behera@linaro.org> <1322718611-20934-3-git-send-email-tushar.behera@linaro.org> <001701ccf6cc$a83727d0$f8a57770$%han@samsung.com> <076b01ccf760$ad072730$07157590$%kim@samsung.com> <4F4EF845.7050803@linaro.org> <077401ccf76a$4f863010$ee929030$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-yx0-f174.google.com ([209.85.213.174]:59791 "EHLO
	mail-yx0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932200Ab2CIQI7 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 9 Mar 2012 11:08:59 -0500
Received: by yenl12 with SMTP id l12so928475yen.19
        for <linux-samsung-soc@vger.kernel.org>; Fri, 09 Mar 2012 08:08:59 -0800 (PST)
In-Reply-To: <077401ccf76a$4f863010$ee929030$%kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: 'Tushar Behera' <tushar.behera@linaro.org>, 'Jingoo Han' <jg1.han@samsung.com>, linux-samsung-soc@vger.kernel.org, linaro-dev@lists.linaro.org, patches@linaro.org, 'Sylwester Nawrocki' <s.nawrocki@samsung.com>

On 02/29/12 21:15, Kukjin Kim wrote:
> Tushar Behera wrote:

[...]

>>>> Acked-by: Jingoo Han<jg1.han@samsung.com>
>>>>
>>>
>>> OK, I will apply this with Sylwester's 'reviewed-by' I looked at
> before.
>>>
>> Thanks. Do you want me rebase this patch on your latest for-next and
>> resend?
>>
> Thanks but I can do it.
>
>>> BTW, Tushar, what's the [1/3] and [3/3] in this series? If they are
>> still
>>> needed now, could you please re-send? Maybe I missed.
>>>
>> "[PATCH 1/3] ARM: EXYNOS: Increase DMA pool allocator size for
>> framebuffer"
>> 	- It should be dropped.
>>
>> "[PATCH 3/3] ARM: EXYNOS: Invert VCLK polarity for framebuffer on Origen
>> board"
>> 	- It has already been applied.
>
> OK, thanks.

Tushar,

As a note, this will be applied on top of new cleanup-exynos-clock.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.

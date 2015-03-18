From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH] ARM: EXYNOS: Handle of_find_device_by_node and kstrdup failures
Date: Wed, 18 Mar 2015 18:30:34 +0100
Message-ID: <CAJKOXPdWdEx7uhy10EesE0ddTuVY09Fh7RTYkCcemEOGSB-ctQ@mail.gmail.com>
References: <1422984529-17729-1-git-send-email-k.kozlowski@samsung.com>
	<1424792562.6775.3.camel@AMDC1943>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vc0-f182.google.com ([209.85.220.182]:61231 "EHLO
	mail-vc0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754685AbbCRRaf (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 18 Mar 2015 13:30:35 -0400
In-Reply-To: <1424792562.6775.3.camel@AMDC1943>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, Krzysztof Kozlowski <k.kozlowski@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Kyungmin Park <kyungmin.park@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>

2015-02-24 16:42 GMT+01:00 Krzysztof Kozlowski <k.kozlowski@samsung.com>:
> On wto, 2015-02-03 at 18:28 +0100, Krzysztof Kozlowski wrote:
>> Prevent possible NULL pointer dereference of pointer returned by
>> of_find_device_by_node(). Handle this by skipping such power domain.
>>
>> Additionally fail the init on kstrdup() failure. Such case is actually
>> not fatal because the name for power domain allocated by kstrdup() is
>> used only in printk. Still as a precaution handle this as an error
>> condition.
>>
>> Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
>
> Hi Kukjin,
>
> What is the status of this patch and the "ARM: EXYNOS: Handle of
> of_iomap() failure". The latter should be in your tree but I cannot find
> it.
>
> Best regards,
> Krzysztof

Hi Kukjin,

You haven't applied this and the "ARM: EXYNOS: Handle of of_iomap()
failure" yet. Any comments?

Best regards,
Krzysztof

From: Alim Akhtar <alim.akhtar@gmail.com>
Subject: Re: [PATCH 3/4] clk: samsung: exynos7: Correct nr_clk_ids for fsys0
Date: Tue, 25 Aug 2015 21:32:23 +0530
Message-ID: <CAGOxZ51BDHOKCQCH0zkHSYE_=hPof8L8Lf2H_uC1FMs+uNa70Q@mail.gmail.com>
References: <1440414356-1805-1-git-send-email-alim.akhtar@samsung.com>
 <1440414356-1805-4-git-send-email-alim.akhtar@samsung.com> <55DC1641.3050602@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-io0-f175.google.com ([209.85.223.175]:34175 "EHLO
	mail-io0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751816AbbHYQDD (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 25 Aug 2015 12:03:03 -0400
Received: by iodb91 with SMTP id b91so191320566iod.1
        for <linux-samsung-soc@vger.kernel.org>; Tue, 25 Aug 2015 09:03:02 -0700 (PDT)
In-Reply-To: <55DC1641.3050602@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Cc: Alim Akhtar <alim.akhtar@samsung.com>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, kgene <kgene@kernel.org>, mturquette@baylibre.com, "amit.daniel@samsung.com" <amit.daniel@samsung.com>

Hello Krzysztof,

On Tue, Aug 25, 2015 at 12:46 PM, Krzysztof Kozlowski
<k.kozlowski@samsung.com> wrote:
> On 24.08.2015 20:05, Alim Akhtar wrote:
>> This patch correct the nr_clk_ids for fsys0 block
> s/correct/corrects/
>
>> which is wrongly set to TOP1 clk numbers.
>> This also adjust the a gate clock order.
> s/adjust the a/adjusts the/
>
will update
> Reviewed-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
>
Thanks!

> Best regards,
> Krzysztof
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsung-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html



-- 
Regards,
Alim

From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH 1/1] clk: exynos-5420: Fix VPLL lock offset
Date: Thu, 01 May 2014 19:19:10 +0200
Message-ID: <5362820E.6040101@gmail.com>
References: <1394681222-27882-1-git-send-email-sachin.kamat@linaro.org> <53219C1C.1030501@samsung.com> <CAK9yfHyVVjfip2p6gDM8ghJ301NH9kTtVK1La53WPFfxxLD9nQ@mail.gmail.com> <CAK9yfHxg4CbfrpwwqO=xzCDeeoSWVXu4CU4haZEhvj1YszRCTA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qa0-f44.google.com ([209.85.216.44]:53063 "EHLO
	mail-qa0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751212AbaEARTL (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 1 May 2014 13:19:11 -0400
Received: by mail-qa0-f44.google.com with SMTP id k15so3204292qaq.17
        for <linux-samsung-soc@vger.kernel.org>; Thu, 01 May 2014 10:19:10 -0700 (PDT)
In-Reply-To: <CAK9yfHxg4CbfrpwwqO=xzCDeeoSWVXu4CU4haZEhvj1YszRCTA@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sachin Kamat <sachin.kamat@linaro.org>, Tomasz Figa <t.figa@samsung.com>
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Mike Turquette <mturquette@linaro.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>

Hi Sachin,

On 01.05.2014 13:10, Sachin Kamat wrote:
> Hi Tomasz,
>
> On 13 March 2014 20:27, Sachin Kamat <sachin.kamat@linaro.org> wrote:
>> On 13 March 2014 17:23, Tomasz Figa <t.figa@samsung.com> wrote:
>>> Hi Sachin,
>>>
>>>
>>> On 13.03.2014 04:27, Sachin Kamat wrote:
>>>>
>>>> Set it as per the user manual.
>>>>
>>>> Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
>>>> ---
>>
>>>
>>> Looks fine. Will queue for 3.15, since ATM there is no support for PLL rate
>>> setting on Exynos 5420 (no rate tables registered).
>>
>> Yes, that is correct. Thanks Tomasz.
>
> Looks like this patch hasn't made it to mainline yet.
>

Unfortunately that's right. Due to problems with cross tree dependencies 
there was some fall out and I needed to requeue some patches for 3.16. 
Sorry for this.

Best regards,
Tomasz

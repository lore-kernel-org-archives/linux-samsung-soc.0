From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: Power domain clock warnings on recent next
Date: Wed, 17 Jan 2018 08:44:01 +0100
Message-ID: <CAJKOXPe-xCra5DFh-u2-FvkRwUZyoQbb8P5bK=MHq-9WdnhJWw@mail.gmail.com>
References: <CGME20180116200735epcas4p4455aea99ad21c4c45260d4752d789add@epcas4p4.samsung.com>
 <20180116200728.tjad7tzz3uvsmgg3@kozik-lap> <f1bf1c15-0bba-4cf6-42a2-80a3982dbae1@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:39898 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751261AbeAQHoE (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 17 Jan 2018 02:44:04 -0500
In-Reply-To: <f1bf1c15-0bba-4cf6-42a2-80a3982dbae1@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, Tomasz Figa <tomasz.figa@gmail.com>

On Wed, Jan 17, 2018 at 7:25 AM, Marek Szyprowski
<m.szyprowski@samsung.com> wrote:
> Hi Krzysztof,
>
> On 2018-01-16 21:07, Krzysztof Kozlowski wrote:
>>
>> Hi everyone,
>>
>> Anyone already noticed or started bisecting warnings coming from
>> clk_core_disable_lock/exynos_pd_power on recent linux-next?
>
>
> Yes, I've noticed it early this week and prepared a patch:
> https://www.spinics.net/lists/arm-kernel/msg628881.html

Thanks!

Best regards,
Krzysztof

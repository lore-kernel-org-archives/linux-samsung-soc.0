From: Rahul Sharma <r.sh.open@gmail.com>
Subject: Re: [PATCH 6/7] clk/samsung: add support for pll2650xx
Date: Mon, 6 Jan 2014 17:14:48 +0530
Message-ID: <CAPdUM4P9tE5ohtAb5heMRj3GGjdYrNYp5iX7u-uZySiaCikA7Q@mail.gmail.com>
References: <1386345391-23482-1-git-send-email-rahul.sharma@samsung.com>
	<1386345391-23482-7-git-send-email-rahul.sharma@samsung.com>
	<1419145.DZQg0ZkHVU@amdc1227>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wi0-f181.google.com ([209.85.212.181]:61286 "EHLO
	mail-wi0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752672AbaAFLou (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 6 Jan 2014 06:44:50 -0500
In-Reply-To: <1419145.DZQg0ZkHVU@amdc1227>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <t.figa@samsung.com>
Cc: Rahul Sharma <rahul.sharma@samsung.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Mike Turquette <mturquette@linaro.org>, Kukjin Kim <kgene.kim@samsung.com>, Thomas Abraham <thomas.ab@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, sunil joshi <joshi@samsung.com>, PANKAJ KUMAR DUBEY <pankaj.dubey@samsung.com>, Young-Gun Jang <yg1004.jang@samsung.com>, Arun Kumar <arun.kk@samsung.com>

Hi Tomasz,

On 19 December 2013 17:15, Tomasz Figa <t.figa@samsung.com> wrote:
> Hi Rahul,
>
> On Friday 06 of December 2013 21:26:30 Rahul Sharma wrote:
>> Add support for pll2650xx in samsung pll file. This pll variant
>> is close to pll36xx but uses CON2 registers instead of CON1.
>
> If the ops are otherwise idential, why not reuse the ops for pll36xx
> and use CON1 or CON2 register conditionally based on pll->type field?
> (Just as it is already done for pll4600, 4650 and 4650c.)
>

I verified the difference and found that  pll2650xx is fairly
different in terms of
Bit Fields, Con2 register, and additional PLL config bits than pll36xx. Due to
this, I have to add lot of if-else code based on pll type which
doesn't looks clean.

Regards,
Rahul Sharma.

> Best regards,
> Tomasz
>

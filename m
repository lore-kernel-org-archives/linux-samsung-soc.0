From: Thomas Abraham <thomas.abraham@linaro.org>
Subject: Re: [RE-SEND] [PATCH 3/4] s3c-fb: Add support EXYNOS4 FIMD
Date: Wed, 15 Jun 2011 15:52:05 +0530
Message-ID: <BANLkTin1-D3en-ZpOKw2jZB0TKYt5OLsPw@mail.gmail.com>
References: <1307693723-14971-1-git-send-email-anand.kn@samsung.com>
	<1307693723-14971-4-git-send-email-anand.kn@samsung.com>
	<4DF39A92.5050609@gmail.com>
	<BANLkTinuAnaoo2hA6MLBDncXxXtL8NO2pg@mail.gmail.com>
	<4DF866D9.7090406@samsung.com>
	<BANLkTi=K6SJ-Scnr6wBojFaWQMZQK6YT3w@mail.gmail.com>
	<20110615100814.GD28989@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qw0-f46.google.com ([209.85.216.46]:52092 "EHLO
	mail-qw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751680Ab1FOKWG convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 15 Jun 2011 06:22:06 -0400
Received: by qwk3 with SMTP id 3so111464qwk.19
        for <linux-samsung-soc@vger.kernel.org>; Wed, 15 Jun 2011 03:22:05 -0700 (PDT)
In-Reply-To: <20110615100814.GD28989@n2100.arm.linux.org.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Russell King - ARM Linux <linux@arm.linux.org.uk>
Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>, Sylwester Nawrocki <snjw23@gmail.com>, Anand Kumar N <anand.kn@samsung.com>, lethal@linux-sh.org, kgene.kim@samsung.com, linux-samsung-soc@vger.kernel.org, jg1.han@samsung.com, jonghun.han@samsung.com, thomas.ab@samsung.com

On 15 June 2011 15:38, Russell King - ARM Linux <linux@arm.linux.org.uk=
> wrote:
> On Wed, Jun 15, 2011 at 03:34:40PM +0530, Thomas Abraham wrote:
>> Ok. Thanks for clarifying this point. In this case, maybe we could u=
se
>> the clk_add_alias API. With this API, we can have a instance of cloc=
k
>> by name 'fimd' and then create a clkdev alias by name 'lcd' in the
>> machine code. The driver can then continue to lookup with 'lcd' as t=
he
>> con_id.
>
> That's additional needless complexity. =A0If you don't embed the clk_=
lookup
> structure in your struct clk but list out the dev/con/clk stuff separ=
ately
> like OMAP does, you can easily assign the dev/con pairs to multiple
> clks without hastle - and then it really doesn't matter what the clk
> itself is called.
>

Thanks for your suggestion Russell. The limitation in doing it the
OMAP way is, in all Samsung machine code, all the clock instances are
put into a array and then registered. So there is no separately named
instance for each clock to build a dev/con/clk omap-type table.

Thanks,
Thomas.

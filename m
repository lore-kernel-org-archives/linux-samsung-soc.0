From: Rahul Sharma <r.sh.open@gmail.com>
Subject: Re: [PATCH v4 5/5] clk/exynos5260: add clock file for exynos5260
Date: Mon, 10 Mar 2014 07:40:08 +0530
Message-ID: <CAPdUM4O-PKy+A_-2gSbKzfuX4qDGjc=Q1=ExEhWH5sKzCn7xPA@mail.gmail.com>
References: <1394113551-2134-1-git-send-email-rahul.sharma@samsung.com>
	<CAGcde9Hqs92bri0Fu3y7rvMhiFMYe+N7YWT-mxL2HTsnJTvz2w@mail.gmail.com>
	<5319D3E5.4000001@gmail.com>
	<CAGcde9GetFjdRxqJfPY_1qdxzKb+4cqjsc+ALnN0PxSrApjyxg@mail.gmail.com>
	<5319E445.9000409@gmail.com>
	<CAPdUM4Pt0Ofh=M5pwdj+0NwSvfK4JvZbpWUS6JfD3vnTi2JaGg@mail.gmail.com>
	<531AE1CD.2070203@samsung.com>
	<531D007F.4030800@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wg0-f51.google.com ([74.125.82.51]:63164 "EHLO
	mail-wg0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752442AbaCJCKJ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 9 Mar 2014 22:10:09 -0400
In-Reply-To: <531D007F.4030800@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <tomasz.figa@gmail.com>
Cc: Pankaj Dubey <pankaj.dubey@samsung.com>, Rahul Sharma <rahul.sharma@samsung.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Mike Turquette <mturquette@linaro.org>, sunil joshi <joshi@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>

Hi Tomasz,

On 10 March 2014 05:29, Tomasz Figa <tomasz.figa@gmail.com> wrote:
> On 08.03.2014 10:24, Pankaj Dubey wrote:
>>
>> Hi Rahul,
>
>
>> I modified code as per our discussion and addressed all comments
>> including moving fixed clock to DT
>> and found it's working well, so we can now finalize which way to  go
>> ahead.
>> Following is some data between V4 and probable next version, which might
>> help in making decision.
>>
>> drivers/clk/samsung/exynos5260-clock.c
>>
>> Before Change
>> LoC: 1890
>> size drivers/clk/samsung/clk-exynos5260.o
>>     text       data        bss        dec        hex    filename
>>    14226      14956          0      29182       71fe
>> drivers/clk/samsung/clk-exynos5260.o
>>
>> After Change:
>> LoC: 1806
>> size drivers/clk/samsung/clk-exynos5260.o
>>     text       data        bss        dec        hex    filename
>>    15446      14544          0      29990       7526
>> drivers/clk/samsung/clk-exynos5260.o
>
>
> Well, somehow I've been under impression that the change would bring more
> significant results. Here we can see slight reduction in lines of code, but
> also slight increase of kernel image size. Still, in general, nothing
> extreme.
>
> In this case I'd probably go with Rahul's original code, as it doesn't
> require second matching and separate match table, which adds redundant
> compatible strings used just for this extra matching pass.
>
> I guess this is all just bike shedding, though.

yea. I understand. Will proceed as you said.

Regards,
Rahul Sharma

>
> Best regards,
> Tomasz

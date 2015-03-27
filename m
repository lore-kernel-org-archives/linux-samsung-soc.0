From: Abhilash Kesavan <kesavan.abhilash@gmail.com>
Subject: Re: exynos5800-peach-pi: suspend/resume (still) broken
Date: Fri, 27 Mar 2015 19:36:02 +0530
Message-ID: <CAM4voanJNJPMdBx5okcVYhqKyzKTctZddvV-XpWzPrA8Og_7oA@mail.gmail.com>
References: <CAMAWPa_r04tAXAXosmLk+DfwvQV0qpD+=8O7T_pwFTAozcjOgQ@mail.gmail.com>
	<550953ED.10508@collabora.co.uk>
	<CAM4voakvhHuVXLY2DmdGexfrqSYUqhXhg1krLwO4CCxjHQ1NCw@mail.gmail.com>
	<550C47ED.3010301@collabora.co.uk>
	<CAM4voamLt=6dSY-DwDb+c=KRwDWAvjvzUUnno+=+1svDqf41Qg@mail.gmail.com>
	<CAM4voanUg87=Ya6azGCRz8r2=WJ0wi4ktqdn6GD6ULJsnLUMmw@mail.gmail.com>
	<55155B3F.2010704@collabora.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qg0-f47.google.com ([209.85.192.47]:33315 "EHLO
	mail-qg0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752970AbbC0OGD (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 27 Mar 2015 10:06:03 -0400
Received: by qgfa8 with SMTP id a8so126954216qgf.0
        for <linux-samsung-soc@vger.kernel.org>; Fri, 27 Mar 2015 07:06:03 -0700 (PDT)
In-Reply-To: <55155B3F.2010704@collabora.co.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Cc: Kevin Hilman <khilman@deeprootsystems.com>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Vikas Sajjan <vikas.sajjan@samsung.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Pankaj Dubey <pankaj.dubey@samsung.com>

Hello Javier,

On Fri, Mar 27, 2015 at 6:59 PM, Javier Martinez Canillas
<javier.martinez@collabora.co.uk> wrote:
> Hello Abhilash,
>
> On 03/20/2015 06:40 PM, Abhilash Kesavan wrote:
>>
>> Regarding the mdma0 disablement, it looks like for the system to
>> suspend properly the mdma0 pclk needs to stay on.
>>
>
> I had time today again to work on this issue and the best
> place I found to enable and disable the mdma0 clock is in
> exynos5420_pm_{prepare,resume}. Please let me know if you
> have a better idea of where the clock should be managed.
>

Modifying exynos5420_clk_suspend in
drivers/clk/samsung/clk-exynos5420.c would be another way to go,
however I have not tested if this actually works.

> I'll send a RFC patch-set soon.

Thanks for the effort.

Regards,
Abhilash

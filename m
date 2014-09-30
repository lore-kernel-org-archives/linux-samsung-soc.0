From: Javier Martinez Canillas <javier@dowhile0.org>
Subject: Re: [PATCH v8 0/2] Adds PMU and S2R support for exynos5420
Date: Tue, 30 Sep 2014 16:42:56 +0200
Message-ID: <CABxcv=ndW1j6FfE5a-6jHKjPVsSsp4Hjjz5YK8su8DCjG11-sA@mail.gmail.com>
References: <1412074969-12704-1-git-send-email-vikas.sajjan@samsung.com>
	<CABxcv=kEVma+Ho6PPy+4t+zYH67sAWbbvJvrviPop-MBqktbjw@mail.gmail.com>
	<CAM4voa=TYhF_x7WnM=rkUevuKkt5jqVgjuo7ABa92+bziG+uJw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ob0-f175.google.com ([209.85.214.175]:46405 "EHLO
	mail-ob0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751068AbaI3Om5 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 30 Sep 2014 10:42:57 -0400
Received: by mail-ob0-f175.google.com with SMTP id m8so15092799obr.20
        for <linux-samsung-soc@vger.kernel.org>; Tue, 30 Sep 2014 07:42:56 -0700 (PDT)
In-Reply-To: <CAM4voa=TYhF_x7WnM=rkUevuKkt5jqVgjuo7ABa92+bziG+uJw@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Abhilash Kesavan <kesavan.abhilash@gmail.com>
Cc: Vikas Sajjan <vikas.sajjan@samsung.com>, Vikas Sajjan <sajjan.linux@gmail.com>, Kukjin Kim <kgene.kim@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, sunil joshi <joshi@samsung.com>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Douglas Anderson <dianders@chromium.org>, Olof Johansson <olof@lixom.net>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>

Hello Abhilash,

Thanks a lot for your quick reply.

On Tue, Sep 30, 2014 at 4:24 PM, Abhilash Kesavan
<kesavan.abhilash@gmail.com> wrote:
> Hi Javier,
>
> On Tue, Sep 30, 2014 at 7:00 PM, Javier Martinez Canillas
> <javier@dowhile0.org> wrote:
>> Hello Vikas,
>>
>> Thanks a lot for the re-spin.
>>
>> On Tue, Sep 30, 2014 at 1:02 PM, Vikas Sajjan <vikas.sajjan@samsung.com> wrote:
>>>
>>> Tested on Kukjin Kim's tree, for-next branch +
>>> 1] http://www.spinics.net/lists/linux-samsung-soc/msg33750.html
>>> 2] https://lkml.org/lkml/2014/9/30/156
>>
>> I wanted to test your series but I noticed that Abhilash's patch:
>>
>> "[PATCH v7] ARM: EXYNOS: Use MCPM call-backs to support S2R on Exynos5420"
>>
>> does not apply cleanly on Kukjin's for-next branch. I see that all the
>> dependencies mentioned (modulo $subject or course) have already been
>> merged though.
>
> If you are looking to test this series right now then I can post an
> untested rebased version. Otherwise, I will test it tomorrow and post.
>

Up to you. If is easy for you to post an untested version, that would
be great and I can test it. But is OK if you prefer to do it tomorrow
too.

> Regards,
> Abhilash
>>

Best regards,
Javier

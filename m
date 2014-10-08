From: Vikas Sajjan <vikas.sajjan@samsung.com>
Subject: Re: [PATCH v9 2/2] ARM: exynos5: Add Suspend-to-RAM support for 5420
Date: Wed, 8 Oct 2014 14:08:29 +0545
Message-ID: <CAGm_ybgAQyrJ4ni2BJPcwf72ftT4eQOJO6jeP20hKmXttn6Ltw@mail.gmail.com>
References: <1412673723-15551-1-git-send-email-vikas.sajjan@samsung.com>
	<1412673723-15551-3-git-send-email-vikas.sajjan@samsung.com>
	<CABxcv=k5=F7Ln2XoFtNmogOuGupWex+7V2t-TVYadah-XA8Qtg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wi0-f169.google.com ([209.85.212.169]:59204 "EHLO
	mail-wi0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753639AbaJHIXb (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 8 Oct 2014 04:23:31 -0400
Received: by mail-wi0-f169.google.com with SMTP id cc10so11656547wib.2
        for <linux-samsung-soc@vger.kernel.org>; Wed, 08 Oct 2014 01:23:29 -0700 (PDT)
In-Reply-To: <CABxcv=k5=F7Ln2XoFtNmogOuGupWex+7V2t-TVYadah-XA8Qtg@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Javier Martinez Canillas <javier@dowhile0.org>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Kukjin Kim <kgene.kim@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, sunil joshi <joshi@samsung.com>, Douglas Anderson <dianders@chromium.org>, Olof Johansson <olof@lixom.net>

On Tue, Oct 7, 2014 at 6:19 PM, Javier Martinez Canillas
<javier@dowhile0.org> wrote:
> Hello Vikas,
>
> On Tue, Oct 7, 2014 at 11:22 AM, Vikas Sajjan <vikas.sajjan@samsung.com> wrote:
>> Adds Suspend-to-RAM support for EXYNOS5420
>>
>> Signed-off-by: Vikas Sajjan <vikas.sajjan@samsung.com>
>> Signed-off-by: Abhilash Kesavan <a.kesavan@samsung.com>
>> ---
>>  arch/arm/mach-exynos/suspend.c |  151 +++++++++++++++++++++++++++++++++++++++-
>>  1 file changed, 149 insertions(+), 2 deletions(-)
>>
>
> Tested-by: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
>

Thank you, Javier.


> Best regards,
> Javier

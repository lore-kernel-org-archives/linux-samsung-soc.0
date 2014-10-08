From: Vikas Sajjan <vikas.sajjan@samsung.com>
Subject: Re: [PATCH v9 1/2] ARM: exynos5: Add PMU support for 5420
Date: Wed, 8 Oct 2014 14:07:52 +0545
Message-ID: <CAGm_ybgMUy7Y7v1HksCeaTJ0oMXGK+Csc3AL=4yJEaCH2HyFBw@mail.gmail.com>
References: <1412673723-15551-1-git-send-email-vikas.sajjan@samsung.com>
	<1412673723-15551-2-git-send-email-vikas.sajjan@samsung.com>
	<CABxcv==38sEFnpXaWoL6pvzyF7XH+DA55cP2MDPgfY=zBwxVUQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wi0-f170.google.com ([209.85.212.170]:43632 "EHLO
	mail-wi0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753639AbaJHIWy (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 8 Oct 2014 04:22:54 -0400
Received: by mail-wi0-f170.google.com with SMTP id hi2so11630321wib.5
        for <linux-samsung-soc@vger.kernel.org>; Wed, 08 Oct 2014 01:22:53 -0700 (PDT)
In-Reply-To: <CABxcv==38sEFnpXaWoL6pvzyF7XH+DA55cP2MDPgfY=zBwxVUQ@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Javier Martinez Canillas <javier@dowhile0.org>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Kukjin Kim <kgene.kim@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, sunil joshi <joshi@samsung.com>, Douglas Anderson <dianders@chromium.org>, Olof Johansson <olof@lixom.net>

Hi Javier,

On Tue, Oct 7, 2014 at 6:17 PM, Javier Martinez Canillas
<javier@dowhile0.org> wrote:
> Hellos Vikas,
>
> On Tue, Oct 7, 2014 at 11:22 AM, Vikas Sajjan <vikas.sajjan@samsung.com> wrote:
>> From: Abhilash Kesavan <a.kesavan@samsung.com>
>>
>> Adds intial PMU settings for exynos5420. This is required for
>> future S2R and Switching support.
>>
>> Signed-off-by: Thomas Abraham <thomas.ab@samsung.com>
>> Signed-off-by: Abhilash Kesavan <a.kesavan@samsung.com>
>> Signed-off-by: Vikas Sajjan <vikas.sajjan@samsung.com>
>> ---
>>  arch/arm/mach-exynos/pmu.c      |  287 +++++++++++++++++++++++++++++++++++++++
>>  arch/arm/mach-exynos/regs-pmu.h |  227 +++++++++++++++++++++++++++++++
>>  2 files changed, 514 insertions(+)
>
> S2R is working on my Exynos5420 Peach Pit Chromebook with your series:
>
> Tested-by: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
>


Thanks for testing.



> Best regards,
> Javier

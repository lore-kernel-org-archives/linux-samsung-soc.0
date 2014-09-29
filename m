From: Javier Martinez Canillas <javier@dowhile0.org>
Subject: Re: [PATCH v7 0/2] Adds PMU and S2R support for exynos5420
Date: Mon, 29 Sep 2014 15:22:15 +0200
Message-ID: <CABxcv==E9h_V8_YmcvuxRORg7tbnc9uDT-rwqKJeXb_bNr0xXw@mail.gmail.com>
References: <1408625982-3267-1-git-send-email-vikas.sajjan@samsung.com>
	<CAGm_ybh-R1GsHF-BRhRYQKkCpQFQSE6Mem=A3kz=H3Bemor9xA@mail.gmail.com>
	<CABxcv=kHwCCYhit20qO1q=Nn3KVj8U=8cpCu=DQRuy+R86N0kQ@mail.gmail.com>
	<CAGm_ybgFfnS=bhz2yWUt_b_95Wg=eDNxadzfy7WF+VNFx+pO6Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wi0-f173.google.com ([209.85.212.173]:58185 "EHLO
	mail-wi0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753403AbaI2NWQ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 29 Sep 2014 09:22:16 -0400
Received: by mail-wi0-f173.google.com with SMTP id bs8so1906696wib.0
        for <linux-samsung-soc@vger.kernel.org>; Mon, 29 Sep 2014 06:22:15 -0700 (PDT)
In-Reply-To: <CAGm_ybgFfnS=bhz2yWUt_b_95Wg=eDNxadzfy7WF+VNFx+pO6Q@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Vikas Sajjan <vikas.sajjan@samsung.com>
Cc: Pankaj Dubey <pankaj.dubey@samsung.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Kukjin Kim <kgene.kim@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, Doug Anderson <dianders@chromium.org>, Olof Johansson <olof@lixom.net>

Hello Vikas,

On Mon, Sep 29, 2014 at 2:59 PM, Vikas Sajjan <vikas.sajjan@samsung.com> wrote:
> Hi Javier,
>
>
> On Thu, Sep 25, 2014 at 10:45 PM, Javier Martinez Canillas
>>
>> The mentioned patches from the PMU series depend on the patch to
>> decouple the syscon interface from syscon drivers. The latest version
>> of that patch is Pankaj's "[PATCH v5] mfd: syscon: Decouple syscon
>> interface from platform devices" [0].
>>
>
>  Since Arnd has given "Reviewed-by" to Pankaj's MFD syscon patch now,
> Pankaj can rebase his PMU patchset [1],  so that I can re-spin my 5420
> S2R patchset on top his PMU patchset.
>

Indeed, that would be great. Thanks a lot!

>
> Regards
> Vikas Sajjan

Best regards,
Javier

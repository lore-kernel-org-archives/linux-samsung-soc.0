From: Vikas Sajjan <vikas.sajjan@samsung.com>
Subject: Re: [PATCH v7 0/2] Adds PMU and S2R support for exynos5420
Date: Mon, 29 Sep 2014 18:29:00 +0530
Message-ID: <CAGm_ybgFfnS=bhz2yWUt_b_95Wg=eDNxadzfy7WF+VNFx+pO6Q@mail.gmail.com>
References: <1408625982-3267-1-git-send-email-vikas.sajjan@samsung.com>
	<CAGm_ybh-R1GsHF-BRhRYQKkCpQFQSE6Mem=A3kz=H3Bemor9xA@mail.gmail.com>
	<CABxcv=kHwCCYhit20qO1q=Nn3KVj8U=8cpCu=DQRuy+R86N0kQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wg0-f49.google.com ([74.125.82.49]:37587 "EHLO
	mail-wg0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752885AbaI2M7B (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 29 Sep 2014 08:59:01 -0400
Received: by mail-wg0-f49.google.com with SMTP id x12so409297wgg.8
        for <linux-samsung-soc@vger.kernel.org>; Mon, 29 Sep 2014 05:59:00 -0700 (PDT)
In-Reply-To: <CABxcv=kHwCCYhit20qO1q=Nn3KVj8U=8cpCu=DQRuy+R86N0kQ@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Javier Martinez Canillas <javier@dowhile0.org>
Cc: Pankaj Dubey <pankaj.dubey@samsung.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Kukjin Kim <kgene.kim@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, Doug Anderson <dianders@chromium.org>, Olof Johansson <olof@lixom.net>

Hi Javier,


On Thu, Sep 25, 2014 at 10:45 PM, Javier Martinez Canillas
<javier@dowhile0.org> wrote:
> [adding Pankaj Dubey to cc list]
>
> Hello Vikas,
>
> On Sun, Sep 14, 2014 at 4:57 PM, Vikas Sajjan <vikas.sajjan@samsung.com> wrote:
>> Hi All,
>>
>>
>> On Thu, Aug 21, 2014 at 6:29 PM, Vikas Sajjan <vikas.sajjan@samsung.com> wrote:
>>> Rebased on
>>> 1] Kukjin Kim's tree, master branch
>>> http://git.kernel.org/cgit/linux/kernel/git/kgene/linux-samsung.git/log/
>>> 2] Pankaj Dubey's v7 PMU patchset
>>> https://lkml.org/lkml/2014/7/9/2
>>> http://lists.infradead.org/pipermail/linux-arm-kernel/2014-July/270655.html
>
> The mentioned patches from the PMU series depend on the patch to
> decouple the syscon interface from syscon drivers. The latest version
> of that patch is Pankaj's "[PATCH v5] mfd: syscon: Decouple syscon
> interface from platform devices" [0].
>

 Since Arnd has given "Reviewed-by" to Pankaj's MFD syscon patch now,
Pankaj can rebase his PMU patchset [1],  so that I can re-spin my 5420
S2R patchset on top his PMU patchset.

[1]  https://lkml.org/lkml/2014/7/9/2
      http://lists.infradead.org/pipermail/linux-arm-kernel/2014-July/270655.html

> There is still an ongoing discussion about the implementation details
> since errors were reported (debugfs regmap dir failing to be created
> due a NULL device name) so this won't be a definite version.
>
> But I tested that patch on an Exynos5420 Peach Pit and it works so
> maybe Pankaj can re-spin his PMU series on top of his latest syscon
> patch so at least the dependencies for your series are sorted and
> people can try it?
>
> Best regards,
> Javier
>
> [0]: https://patchwork.kernel.org/patch/4945481/


Regards
Vikas Sajjan

From: Arun Kumar K <arun.kk@samsung.com>
Subject: Re: [PATCH v2 1/3] clk: exynos5420: Add 5800 specific clocks
Date: Thu, 15 May 2014 10:19:04 +0530
Message-ID: <CALt3h7-gvPZvmv2mhS7EdSQxo6+94DzYBWPeOW6bPUFUc6fuJw@mail.gmail.com>
References: <1399638303-32600-1-git-send-email-arun.kk@samsung.com>
	<1399638303-32600-2-git-send-email-arun.kk@samsung.com>
	<5373D608.5020404@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ve0-f170.google.com ([209.85.128.170]:50134 "EHLO
	mail-ve0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750941AbaEOEtG (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 15 May 2014 00:49:06 -0400
In-Reply-To: <5373D608.5020404@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <tomasz.figa@gmail.com>
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Kukjin Kim <kgene.kim@samsung.com>, Doug Anderson <dianders@chromium.org>, Alim Akhtar <alim.akhtar@samsung.com>, olof@lixom.net

Hi Tomasz,

On Thu, May 15, 2014 at 2:16 AM, Tomasz Figa <tomasz.figa@gmail.com> wrote:
> Hi Arun, Alim,
>
> On 09.05.2014 14:25, Arun Kumar K wrote:
>> From: Alim Akhtar <alim.akhtar@samsung.com>
>>
>> Exynos5800 clock structure is mostly similar to 5420 with only
>> a small delta changes. So the 5420 clock file is re-used for
>> 5800 also. The common clocks for both are seggreagated and few
>> clocks which are different for both are separately initialized.
>>
>> Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
>> Signed-off-by: Arun Kumar K <arun.kk@samsung.com>
>> ---
>> Changes from v1
>> ---------------
>> - Rebased on clock cleanup by Shaik
>
> This still isn't using correct base and won't compile with current
> sources, even if it applies fine. This is partially my fault as we had a
> lot of issues with cross-tree dependencies and it was not clear what to
> base clock patches on, but I'll try to keep samsung-clk-next branch of
> samsung-clk [1] tree up to date, so it should be safe to base on.
>
> [1] git://git.kernel.org/pub/scm/linux/kernel/git/tfiga/samsung-clk.git

Ok I will rebase the 5800 clock patch on this branch and resend it.

Thanks & Regards
Arun

>
> Best regards,
> Tomasz

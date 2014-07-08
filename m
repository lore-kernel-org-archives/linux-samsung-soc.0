From: Vikas Sajjan <vikas.sajjan@samsung.com>
Subject: Re: [PATCH v5 3/3] clk: samsung: exynos5420: Setup clocks before
 system suspend
Date: Tue, 8 Jul 2014 10:04:31 +0530
Message-ID: <CAGm_ybgLdPrXX-kZJdTeFZxxNZ-Ehtn7M3JxYb0ZYfDZnfszUw@mail.gmail.com>
References: <1403781135-6538-1-git-send-email-vikas.sajjan@samsung.com>
	<1403781135-6538-4-git-send-email-vikas.sajjan@samsung.com>
	<53B1A562.6000300@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-we0-f178.google.com ([74.125.82.178]:55510 "EHLO
	mail-we0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751610AbaGHEec (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 8 Jul 2014 00:34:32 -0400
Received: by mail-we0-f178.google.com with SMTP id x48so5285373wes.23
        for <linux-samsung-soc@vger.kernel.org>; Mon, 07 Jul 2014 21:34:31 -0700 (PDT)
In-Reply-To: <53B1A562.6000300@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Tomasz Figa <tomasz.figa@gmail.com>, sunil joshi <joshi@samsung.com>, Doug Anderson <dianders@chromium.org>, Abhilash Kesavan <a.kesavan@samsung.com>, Tomasz Figa <t.figa@samsung.com>

Hi Kukjin,

On Mon, Jun 30, 2014 at 11:28 PM, Tomasz Figa <t.figa@samsung.com> wrote:
> Hi Vikas, Abhilash,
>
> On 26.06.2014 13:12, Vikas Sajjan wrote:
>> Prior to suspending the system, we need to ensure that certain
>> clock source and gate registers are unmasked.
>>
>> while at it, add these clks to save/restore list also.
>>
>> Signed-off-by: Vikas Sajjan <vikas.sajjan@samsung.com>
>> Signed-off-by: Abhilash Kesavan <a.kesavan@samsung.com>
>> ---
>>  drivers/clk/samsung/clk-exynos5420.c |   29 +++++++++++++++++++++++++++++
>>  1 file changed, 29 insertions(+)
>
> Looks good. Will apply.
>

Can you apply this patch.


> Best regards,
> Tomasz

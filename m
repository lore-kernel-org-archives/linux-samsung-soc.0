From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH v5 3/3] clk: samsung: exynos5420: Setup clocks before
 system suspend
Date: Tue, 08 Jul 2014 10:43:07 +0200
Message-ID: <53BBAF1B.9080309@gmail.com>
References: <1403781135-6538-1-git-send-email-vikas.sajjan@samsung.com>	<1403781135-6538-4-git-send-email-vikas.sajjan@samsung.com>	<53B1A562.6000300@samsung.com> <CAGm_ybgLdPrXX-kZJdTeFZxxNZ-Ehtn7M3JxYb0ZYfDZnfszUw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wi0-f174.google.com ([209.85.212.174]:42601 "EHLO
	mail-wi0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752058AbaGHIn2 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 8 Jul 2014 04:43:28 -0400
Received: by mail-wi0-f174.google.com with SMTP id bs8so537988wib.1
        for <linux-samsung-soc@vger.kernel.org>; Tue, 08 Jul 2014 01:43:26 -0700 (PDT)
In-Reply-To: <CAGm_ybgLdPrXX-kZJdTeFZxxNZ-Ehtn7M3JxYb0ZYfDZnfszUw@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Vikas Sajjan <vikas.sajjan@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, sunil joshi <joshi@samsung.com>, Doug Anderson <dianders@chromium.org>, Abhilash Kesavan <a.kesavan@samsung.com>, Tomasz Figa <t.figa@samsung.com>

Vikas,

On 08.07.2014 06:34, Vikas Sajjan wrote:
> Hi Kukjin,
> 
> On Mon, Jun 30, 2014 at 11:28 PM, Tomasz Figa <t.figa@samsung.com> wrote:
>> Hi Vikas, Abhilash,
>>
>> On 26.06.2014 13:12, Vikas Sajjan wrote:
>>> Prior to suspending the system, we need to ensure that certain
>>> clock source and gate registers are unmasked.
>>>
>>> while at it, add these clks to save/restore list also.
>>>
>>> Signed-off-by: Vikas Sajjan <vikas.sajjan@samsung.com>
>>> Signed-off-by: Abhilash Kesavan <a.kesavan@samsung.com>
>>> ---
>>>  drivers/clk/samsung/clk-exynos5420.c |   29 +++++++++++++++++++++++++++++
>>>  1 file changed, 29 insertions(+)
>>
>> Looks good. Will apply.
>>
> 
> Can you apply this patch.

As I said, I will take this through the samsung-clk tree. The patch
should appear there soon.

Best regards,
Tomasz

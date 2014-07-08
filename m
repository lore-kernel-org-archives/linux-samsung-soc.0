From: Vikas Sajjan <vikas.sajjan@samsung.com>
Subject: Re: [PATCH v5 3/3] clk: samsung: exynos5420: Setup clocks before
 system suspend
Date: Tue, 8 Jul 2014 14:22:24 +0530
Message-ID: <CAGm_ybgg+CTPLrPNepLdZwDcpevKPU_qgSyhvAFXLPiiGmM22Q@mail.gmail.com>
References: <1403781135-6538-1-git-send-email-vikas.sajjan@samsung.com>
	<1403781135-6538-4-git-send-email-vikas.sajjan@samsung.com>
	<53B1A562.6000300@samsung.com>
	<CAGm_ybgLdPrXX-kZJdTeFZxxNZ-Ehtn7M3JxYb0ZYfDZnfszUw@mail.gmail.com>
	<53BBAF1B.9080309@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-we0-f177.google.com ([74.125.82.177]:56838 "EHLO
	mail-we0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751842AbaGHIwZ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 8 Jul 2014 04:52:25 -0400
Received: by mail-we0-f177.google.com with SMTP id u56so5561943wes.22
        for <linux-samsung-soc@vger.kernel.org>; Tue, 08 Jul 2014 01:52:24 -0700 (PDT)
In-Reply-To: <53BBAF1B.9080309@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <tomasz.figa@gmail.com>
Cc: Kukjin Kim <kgene.kim@samsung.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, sunil joshi <joshi@samsung.com>, Doug Anderson <dianders@chromium.org>, Abhilash Kesavan <a.kesavan@samsung.com>, Tomasz Figa <t.figa@samsung.com>

On Tue, Jul 8, 2014 at 2:13 PM, Tomasz Figa <tomasz.figa@gmail.com> wrote:
> Vikas,
>
> On 08.07.2014 06:34, Vikas Sajjan wrote:
>> Hi Kukjin,
>>
>> On Mon, Jun 30, 2014 at 11:28 PM, Tomasz Figa <t.figa@samsung.com> wrote:
>>> Hi Vikas, Abhilash,
>>>
>>> On 26.06.2014 13:12, Vikas Sajjan wrote:
>>>> Prior to suspending the system, we need to ensure that certain
>>>> clock source and gate registers are unmasked.
>>>>
>>>> while at it, add these clks to save/restore list also.
>>>>
>>>> Signed-off-by: Vikas Sajjan <vikas.sajjan@samsung.com>
>>>> Signed-off-by: Abhilash Kesavan <a.kesavan@samsung.com>
>>>> ---
>>>>  drivers/clk/samsung/clk-exynos5420.c |   29 +++++++++++++++++++++++++++++
>>>>  1 file changed, 29 insertions(+)
>>>
>>> Looks good. Will apply.
>>>
>>
>> Can you apply this patch.
>
> As I said, I will take this through the samsung-clk tree. The patch
> should appear there soon.


OK, Thanks.


>
> Best regards,
> Tomasz
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsung-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH/RFC 0/2] serial: samsung: add support for early console
Date: Tue, 23 Sep 2014 15:25:51 +0200
Message-ID: <542174DF.8000703@gmail.com>
References: <1411391655-6291-1-git-send-email-m.szyprowski@samsung.com> <CAGOxZ51aghOqbZuv34TuBuQdKjmHdkhaYJvH=VxNjxb-pZKE8w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wi0-f179.google.com ([209.85.212.179]:36613 "EHLO
	mail-wi0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753996AbaIWNZ5 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 23 Sep 2014 09:25:57 -0400
Received: by mail-wi0-f179.google.com with SMTP id d1so5057319wiv.6
        for <linux-samsung-soc@vger.kernel.org>; Tue, 23 Sep 2014 06:25:54 -0700 (PDT)
In-Reply-To: <CAGOxZ51aghOqbZuv34TuBuQdKjmHdkhaYJvH=VxNjxb-pZKE8w@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Alim Akhtar <alim.akhtar@gmail.com>, Marek Szyprowski <m.szyprowski@samsung.com>
Cc: "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Alim Akhtar <alim.akhtar@samsung.com>, Thomas P Abraham <thomas.ab@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Rob Herring <robherring2@gmail.com>

On 23.09.2014 14:53, Alim Akhtar wrote:
> Hi Marek,
> 
> On Mon, Sep 22, 2014 at 6:44 PM, Marek Szyprowski
> <m.szyprowski@samsung.com> wrote:
>> Hello,
>>
>> This patchset adds support for early console defined in device tree. As
>> an example, DTS files for all Exynos4 based machines are updated with
>> the correct value for common chosen/sdtout property.
>>
>> To get it fully functional additional improvements (support for
>> early_ioremap) are needed in early console code.
>>
> Is these really tested?
> So that mean we need to wait till __ioremap__ support available for ARM.

This was originally tested by creating a fixed mapping for all UART
ports on respective platforms in .map_io() callback of machine
descriptor. This might be the way to support this on 32-bit ARM
platforms until early ioremap is available.

However if no mapping is available, the earlycon will simply not
register and won't break anything, so it should be safe to keep.

> How to take this forward then? Here is a platform (exynos7) which
> needs earlycon support for debugging some of the early core things and
> ARM64 has ioremap support as well. There is no reason why we should
> hold earlycon support for exyons7.
> I see two solution here:
> 1> How about re-spin patch-1 which will just add ealrycon support for
> __exynos4210__ serial type only? And rest of the types can be added as
> incremental patches, as and when ioremap for ARM available.
> Atleast this approch will solve exynos7 problem of not having earlycon support.
> And This patch can be tested on exynos7 (I can do that).

I don't really think there is a need to remove support for other
variants. As I mentioned, they can be supported without early_ioremap()
by static IO mapping.

> 2> Take  my patch which is working and tested for exynos7 and can be
> easily extended and generalized when ioremap for ARM is available.
> 
> My preference would be the the first one.
> Let me know your thoughts please.
> In case you are ok with 1st approach, can you please re-spin patch1
> with needed changes?

I'd say this patch could be merged as is. For 32-bit platforms
additional patches might be posted separately to add early static
mapping or just wait until early ioremap becomes availabl.e

Best regards,
Tomasz

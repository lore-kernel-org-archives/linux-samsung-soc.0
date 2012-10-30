From: Amit Daniel Kachhap <amit.daniel@samsung.com>
Subject: Re: [PATCH v2 1/2] ARM: exynos4: Add devicetree node for TMU driver
Date: Tue, 30 Oct 2012 11:23:26 +0530
Message-ID: <CAK44p21udhZWexYkCmoFv_rPdYb0HYd1wxw1gpOQb69_OE2LGQ@mail.gmail.com>
References: <1351243746-4173-1-git-send-email-amit.daniel@samsung.com>
	<1351243746-4173-2-git-send-email-amit.daniel@samsung.com>
	<508E74FE.7090900@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ob0-f174.google.com ([209.85.214.174]:40361 "EHLO
	mail-ob0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753346Ab2J3Fx0 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 30 Oct 2012 01:53:26 -0400
Received: by mail-ob0-f174.google.com with SMTP id uo13so5377409obb.19
        for <linux-samsung-soc@vger.kernel.org>; Mon, 29 Oct 2012 22:53:26 -0700 (PDT)
In-Reply-To: <508E74FE.7090900@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

On 29 October 2012 17:52, Kukjin Kim <kgene.kim@samsung.com> wrote:
> On 10/26/12 18:29, Amit Daniel Kachhap wrote:
>>
>> From: Amit Daniel Kachhap<amit.daniel@samsung.com>
>>
>> This patch adds necessary source definations needed for TMU driver and
>> adds devicetree node for exynos4210.
>>
>> Signed-off-by: Amit Daniel Kachhap<amit.daniel@samsung.com>
>> ---
>
>
> [...]
>
>
>> +               .name           = "tmu_apbif",
>> +               .enable         = exynos4_clk_ip_perir_ctrl,
>> +               .ctrlbit        = (1<<  17),
>
>
> tab instead of white spaces?
>
> I fixed them when I applied.
Thanks Mr Kim.
>
> [...]
>
>
>> +#define EXYNOS4_IRQ_TMU_TRIG0          COMBINER_IRQ(2, 4)
>> +#define EXYNOS4_IRQ_TMU_TRIG1          COMBINER_IRQ(3, 4)
>
>
> BTW, where are above definitions used?

They are not used currently but might be useful for non DT support.

Thanks,
Amit Daniel
>
> Thanks.
>
> Best regards,
> Kgene.
> --
> Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
> SW Solution Development Team, Samsung Electronics Co., Ltd.

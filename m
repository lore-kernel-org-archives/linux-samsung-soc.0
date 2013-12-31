From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: Re: [PATCH 1/1] mtd: s3c2410: Move plat/regs-nand.h to drivers/mtd
Date: Tue, 31 Dec 2013 12:21:42 +0530
Message-ID: <CAK9yfHws5BqAVPHkY7Lnqz8zpXb9LsrB9YxmAunwhRLO=mLrgg@mail.gmail.com>
References: <1388466690-16435-1-git-send-email-sachin.kamat@linaro.org>
	<001801cf05f4$1d573f90$5805beb0$%han@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ob0-f175.google.com ([209.85.214.175]:55150 "EHLO
	mail-ob0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751099Ab3LaGvo (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 31 Dec 2013 01:51:44 -0500
Received: by mail-ob0-f175.google.com with SMTP id uz6so12390638obc.34
        for <linux-samsung-soc@vger.kernel.org>; Mon, 30 Dec 2013 22:51:44 -0800 (PST)
In-Reply-To: <001801cf05f4$1d573f90$5805beb0$%han@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Jingoo Han <jg1.han@samsung.com>
Cc: Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Kukjin Kim <kgene.kim@samsung.com>, Patch Tracking <patches@linaro.org>

Hi Jingoo,

On 31 December 2013 12:17, Jingoo Han <jg1.han@samsung.com> wrote:
> On Tuesday, December 31, 2013 2:12 PM, Sachin Kamat wrote:
>>
>> plat/regs-nand.h is used only by s3c2410 nand driver.
>> Move this file to the drivers folder to remove platform
>> dependency.
>>
>> Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
>
> Reviewed-by: Jingoo Han <jg1.han@samsung.com>

Thanks.

> However, how about consolidating this header into 's3c2410.c'?
> This comment also applies to the patch "ata: pata_samsung_cf: Move
> plat/regs-ata.h to drivers/ata".

That was an option. However considering the size of the header files, I chose to
keep them separate. Either way is fine with me though.

-- 
With warm regards,
Sachin

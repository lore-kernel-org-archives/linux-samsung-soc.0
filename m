From: Rajeshwari Birje <rajeshwari.birje@gmail.com>
Subject: Re: [PATCH 0/3] ARM: Add SDMMC support for S5P64X0
Date: Thu, 21 Jul 2011 11:05:58 +0530
Message-ID: <CAPs=JDeU5w_4iuvGyF8bad6tNO4HQpunsbS8_oFhi+oLb5TK0A@mail.gmail.com>
References: <1308571049-4412-1-git-send-email-rajeshwari.s@samsung.com>
	<003601cc4746$61b27570$25176050$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vx0-f174.google.com ([209.85.220.174]:60535 "EHLO
	mail-vx0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750960Ab1GUFf7 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 21 Jul 2011 01:35:59 -0400
Received: by vxh35 with SMTP id 35so664511vxh.19
        for <linux-samsung-soc@vger.kernel.org>; Wed, 20 Jul 2011 22:35:58 -0700 (PDT)
In-Reply-To: <003601cc4746$61b27570$25176050$%kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: Rajeshwari Shinde <rajeshwari.s@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, sbkim73@samsung.com

Hi Kukjin Kim,

Currently working on updating the SDMMC patches.
Working on rebasing the SDMMC patches for the Clkdev support.
Will update the same and send the patches for review.

Regards,
Rajeshwari Shinde.


On Thu, Jul 21, 2011 at 7:04 AM, Kukjin Kim <kgene.kim@samsung.com> wro=
te:
> Rajeshwari Shinde wrote:
>>
>> From: rajeshwari.s <rajeshwari.s@samsung.com>
>>
>> S5P64X0 supports 3 Channel MMC/SDHC/SDIO.
>>
>> This patchset adds the setup files, gpio configs and enables the HSM=
MC
> device
>> for S5P64X0.
>>
>> =A0o To Kukjin Kim and Sangbeom Kim
>> [PATCH 1/3] ARM: S5P64X0: Add HSMMC setup for host Controller
>> [PATCH 2/3] ARM: S5P64X0: Initialize default SDHCI devices and platf=
orm
> data
>> [PATCH 3/3] ARM: S5P64X0: Enable SDHCI support
>> ---
>
> As I know, I got your reply on my comments like following.
>
> --
> Hi Kukjin Kim,
>
> Thank you for your comments.
> Will modify the patches as per comments and resend the same.
>
> Regards,
> Rajeshwari Shinde.
> --
> Hi Russell,
>
> Thank you for the comment will do the change as specified.
>
> Regards,
> Rajeshwari Shinde.
> --
>
> But I didn't get any updated patch and unfortunately, we don't have m=
uch
> time for upcoming merge window.
>
> One more, please don't use html type e-mail in mailing list.
>
> Thanks.
>
> Best regards,
> Kgene.
> --
> Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
> SW Solution Development Team, Samsung Electronics Co., Ltd.
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsu=
ng-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>

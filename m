From: Darius Augulis <augulis.darius@gmail.com>
Subject: Re: S3C2416 fixes (gpiolib, SDHCI, compilation without FB device)
Date: Mon, 18 Oct 2010 16:00:02 +0300
Message-ID: <AANLkTi=3Zqbr=fuDVtXc3hdKkhcNvL_UJDq45v-2Utja@mail.gmail.com>
References: <1277212585-25605-1-git-send-email-jekhor@gmail.com>
	<4C248B23.7060905@gmail.com>
	<000001cb1687$638b2310$2aa16930$%szyprowski@samsung.com>
	<4C3361BC.2040204@gmail.com>
	<000201cb1e6e$8b3f7a20$a1be6e60$%szyprowski@samsung.com>
	<4C360613.1000506@gmail.com>
	<049b01cb6ec0$31dd3d30$9597b790$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wy0-f174.google.com ([74.125.82.174]:39423 "EHLO
	mail-wy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753939Ab0JRNAE (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 18 Oct 2010 09:00:04 -0400
Received: by wyb28 with SMTP id 28so1223560wyb.19
        for <linux-samsung-soc@vger.kernel.org>; Mon, 18 Oct 2010 06:00:02 -0700 (PDT)
In-Reply-To: <049b01cb6ec0$31dd3d30$9597b790$%kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Vasily Khoruzhick <anarsoul@gmail.com>, linux-samsung-soc@vger.kernel.org, Ben Dooks <ben-linux@fluff.org>, linux-arm-kernel@lists.infradead.org, Yauhen Kharuzhy <jekhor@gmail.com>

Hi,

actually, no. I moved my work from S3C24xx to S3C64xx and didn't test
it anymore.

Regards,
Darius

On Mon, Oct 18, 2010 at 3:30 PM, Kukjin Kim <kgene.kim@samsung.com> wrote:
> Darius Augulis wrote:
>>
>> On 07/08/2010 10:23 AM, Marek Szyprowski wrote:
>> > Hello,
>> >
>> > On Tuesday, July 06, 2010 7:03 PM Darius Augulis wrote:
>> >
>> >> On 06/28/2010 09:01 AM, Marek Szyprowski wrote:
>> >>> Hello,
>> >>>
>> >>> On Friday, June 25, 2010 12:56 PM Darius Augulis wrote:
>> >>>
>> >>>> On 06/22/2010 04:16 PM, Yauhen Kharuzhy wrote:
>> >>>>> This patch series fixes SDHCI on S3C2416. I got SD card working with
>> >> this
>> >>>> patches
>> >>>>> and with patches for GPIO card detection support by Marek
> Szyprowski.
>> >>>>>
>> >>>>
>> >>>> Unfortunately I did not get SD card working with these patches. I'm
>> >>>> using custom board, not SMDK2416, but SD slot connection and
> schematics
>> >>>> are the same like in SMDK2416. I've tried to debug a bit this problem
>> >>>> and this is what I got: kernel do detection of card insert/remove,
>> >>>> driver prints messages:
>> >>>>
>> >>>> s3c-sdhci s3c-sdhci.1: card inserted.
>> >>>> s3c-sdhci s3c-sdhci.1: card removed.
>> >>>>
>> >>>> Then I put some printk in s3c-sdhci driver and MMC core and found
> that
>> >>>> mmc_rescan() is called only once at startup and no more when
>> >>>> inserting/removing SD card. Also mmc_rescan() stops at that point
> where
>> >>>> mmc_power_up() is called and does not return. And mmc_power_up()
> stops
>> >>>> where mmc_delay(10) is called and does not return too.
>> >>>> Every time when inserting/removing SD card only functions
>> >>>> sdhci_tasklet_card() and mmc_detect_change() are called, and nothing
>> >>>> happens. Kernel doesn't detect the card inserted.
>> >>>> Maybe this info could help to debug where the problem is - in my
> custom
>> >>>> board or in your patches?
>> >>>
>> >>> Have you tried with polled card detection method (SDHCI_CD_NONE)? If
> it
>> >>> doesn't work I suspect something with the hardware. Checking with mmc
>> >> debug
>> >>> enabled might also help figuring this issue out.
>> >>
>> >> yes, I've tried that, but didn't get sd card working. I got schematics
>> >> from China manufacturer, SD card connection is the same like in
>> >> smdk2416. with mmc debug enabled I found that SD card is detected when
>> >> inserted or removed, but after detection card initialisation is not
>> >> performed.
>> >
>> > Does it work without my patches or with other Linux kernel? You can try
> to
>> > check the custom Linux 2.6.29 from
>> >
> git://git.kernel.org/pub/scm/linux/kernel/git/kki_ap/linux-2.6-samsung.git
>>
>> I did try with and without your patches. First, I applied only s3c2416
>> realated patches from Yauhen, then I've added your patches, but nothing
>> changed.
>>
>> >
>> > I would like to know whether my patches cause the problem or there is
> some
>> > kind of hardware issue with your board.
>> >
>
> Hi Darius,
>
> Was there any progress about above issue?
>
> Thanks.
>
> Best regards,
> Kgene.
> --
> Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
> SW Solution Development Team, Samsung Electronics Co., Ltd.
>
>

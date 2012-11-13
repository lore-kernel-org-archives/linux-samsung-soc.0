From: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [oselas] Mini2440 boot failure on kernel 3.7-rc1
Date: Mon, 12 Nov 2012 23:54:14 -0800
Message-ID: <CAN8TOE_5ra-yJwoFmy7qvA80iGYkSNe2gAW6nYnc8vtpvi5+1w@mail.gmail.com>
References: <5082B755.1070109@gmail.com>
	<201210220928.19538.jbe@pengutronix.de>
	<50A183DF.1000304@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ia0-f174.google.com ([209.85.210.174]:35971 "EHLO
	mail-ia0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753134Ab2KMHyP (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 13 Nov 2012 02:54:15 -0500
Received: by mail-ia0-f174.google.com with SMTP id y25so474512iay.19
        for <linux-samsung-soc@vger.kernel.org>; Mon, 12 Nov 2012 23:54:15 -0800 (PST)
In-Reply-To: <50A183DF.1000304@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sylwester Nawrocki <sylvester.nawrocki@gmail.com>
Cc: Juergen Beisert <jbe@pengutronix.de>, oselas@community.pengutronix.de, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>

Hi Sylwester,

On Mon, Nov 12, 2012 at 3:18 PM, Sylwester Nawrocki
<sylvester.nawrocki@gmail.com> wrote:
> On 10/22/2012 09:28 AM, Juergen Beisert wrote:
>> Sylwester Nawrocki wrote:
>>>
>>> [...]
>>> [    2.455000] NAND device: Manufacturer ID: 0xec, Chip ID: 0xf1 (Samsung
>>> NAND 128MiB 3,3V 8-bit), 8
>>> [    2.460000] 4 cmdlinepart partitions found on MTD device nand
>>> [    2.465000] Creating 4 MTD partitions on "nand":
>>> [    2.470000] 0x000000000000-0x000000080000 : "barebox"
>>> [    2.475000] mtd: partition "barebox" doesn't end on an erase block --
>>> force read-only
>>> ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>>> This "force read-only" doesn't happen with v3.6.
>>
>> This looks to me the NAND database uses a wrong block size for this NAND
>> device. This device has 128 kiB block sizes. So, a 512 kiB partition
>> *is* block aligned.
>>
>> Maybe you should take a look into the generic code, what block size the
>> 3.7-rc1 uses for this NAND.
>
> Thanks a lot for these pointers. I've found that the commit causing this
> regression is this one:
>
> commit e2d3a35ee427aaba99b6c68a56609ce276c51270
> Author: Brian Norris <computersforpeace@gmail.com>
> Date:   Mon Sep 24 20:40:55 2012 -0700
>
>     mtd: nand: detect Samsung K9GBG08U0A, K9GAG08U0F ID

Yes, this patch is already known to cause at least one type of
regression. There's been a fix for a while but David still has
neglected to send it to Linus. It seems that you have quoted it below,
though, and it may not fix your particular regression.

> When I revert it the crash is gone and everything works well. The Flash
> chip is K9F1G08U0C and according to the datasheet it has 5 byte ID.
> However nand_id_len() returns 6 and id_data[] is: ec, f1, 00, 95, 40, ec.

Samsung seems to have created some problems by under-specifying the ID
on their NAND. Your NAND is not detected as 5-byte ID for good reason:
the ID wraps around after 6 bytes, not 5. But that's partly
speculation, as you have not provided the full ID.

Can you please list a full 8-byte string of id_data[]? This will be
very helpful. I know of at least one solution that will fix your
problem, but I need to know your full ID to help lay this issue to
rest for good.

> I've found a mail thread where similar issue has been discussed [1]. It
> seems
> the mentioned chunk in commit
> "mtd: nand: add generic READ ID length calculation functions"
>
> is missing. Still it doesn't fix the problem for me.
>
> diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
> index ec6841d..93d6df3 100644
> --- a/drivers/mtd/nand/nand_base.c
> +++ b/drivers/mtd/nand/nand_base.c
> @@ -2989,7 +2989,8 @@ static void nand_decode_ext_id(struct mtd_info *mtd,
> struct nand_chip *chip,
>          * Check for ID length, cell type, and Hynix/Samsung ID to decide
> what
>          * to do.
>          */
> -       if (id_len == 6 && id_data[0] == NAND_MFR_SAMSUNG) {
> +       if (id_len == 6 && id_data[0] == NAND_MFR_SAMSUNG &&
> +           id_data[5] != 0x00) {
>                 /* Calc pagesize */
>                 mtd->writesize = 2048 << (extid & 0x03);
>                 extid >>= 2;
>
...
> The following change eliminates the problem for this particular chip,
> however it will likely break others.
>
> From efab2f7d0a9049588c8b155fab21f8f8c2433b19 Mon Sep 17 00:00:00 2001
> From: Sylwester Nawrocki <sylvester.nawrocki@gmail.com>
> Date: Tue, 13 Nov 2012 00:10:06 +0100
> Subject: [PATCH] mtd: Change calculation of length of nand id with repeated
> pattern
>
> Corrects ID length calculation for Samsung K9F1G08U0C NAND Flash,
> ID: [ec, f1, 00, 95, 40], ec.
>
> Signed-off-by: Sylwester Nawrocki <sylvester.nawrocki@gmail.com>
> ---
>  drivers/mtd/nand/nand_base.c |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
> index ec6841d..884e951 100644
> --- a/drivers/mtd/nand/nand_base.c
> +++ b/drivers/mtd/nand/nand_base.c
> @@ -2954,7 +2954,7 @@ static int nand_id_len(u8 *id_data, int arrlen)
>
>         /* There's a repeated pattern */
>         if (period < arrlen)
> -               return period;
> +               return period - 1;
>
>         /* There are trailing zeros */
>         if (last_nonzero < arrlen - 1)

You're right, this patch is not correct. The period of repetition
*should* be equal to the ID length, but it seems in your case that
your NAND repeats at 'period + 1'. So we have to figure out something
else.

Thanks,
Brian

From: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [oselas] Mini2440 boot failure on kernel 3.7-rc1
Date: Wed, 14 Nov 2012 00:26:58 -0800
Message-ID: <50A355D2.6080406@gmail.com>
References: <5082B755.1070109@gmail.com> <201210220928.19538.jbe@pengutronix.de> <50A183DF.1000304@gmail.com> <CAN8TOE_5ra-yJwoFmy7qvA80iGYkSNe2gAW6nYnc8vtpvi5+1w@mail.gmail.com> <50A2BBAC.1030506@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-da0-f46.google.com ([209.85.210.46]:51821 "EHLO
	mail-da0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932730Ab2KNI1A (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 14 Nov 2012 03:27:00 -0500
Received: by mail-da0-f46.google.com with SMTP id n41so93125dak.19
        for <linux-samsung-soc@vger.kernel.org>; Wed, 14 Nov 2012 00:27:00 -0800 (PST)
In-Reply-To: <50A2BBAC.1030506@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sylwester Nawrocki <sylvester.nawrocki@gmail.com>
Cc: Juergen Beisert <jbe@pengutronix.de>, oselas@community.pengutronix.de, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>


On 11/13/2012 01:29 PM, Sylwester Nawrocki wrote:
> On 11/13/2012 08:54 AM, Brian Norris wrote:
>> On Mon, Nov 12, 2012 at 3:18 PM, Sylwester Nawrocki
>> Can you please list a full 8-byte string of id_data[]? This will be
>> very helpful. I know of at least one solution that will fix your
>> problem, but I need to know your full ID to help lay this issue to
>> rest for good.
> 
> Indeed, I wish there was good hardware documentation, still it seems
> an exception rather than a rule for some hardware vendors...
> 
> Here is my id_data[] dump:
> 
> ec, f1, 00, 95, 40, ec, ec, f1
> 
> Looks a bit strange, I hope you know how to handle this. :)

Well, sort of. I could add yet another quirk: that some "5-byte" IDs
have the manufacturer ID repeated twice (0xEC 0xEC). In fact, I just got
another report of a similar (stupid) ID.

But I have a more reasonable change. It's disappointing, but I'll have to
do a partial revert of my previous commits, dropping support for some of
the newest SLC in favor of not breaking the old. I'll have to try to get
in contact with Samsung if I'm ever going to support the newest stuff.

Please try my diff (below), on top of the patch from:

http://lists.infradead.org/pipermail/linux-mtd/2012-October/044356.html

> OK. BTW, is this comment in drivers/mtd/nand_base.c
> 
> /*
>   * nand_id_has_period - Check if an ID string has a given wraparound 
> period
>   ...
>   * specific repetition interval period (e.g., {0x20,0x01,0x7F,0x20} has a
>   * period of 2). This is a helper function for nand_id_len(). Returns 
> non-zero
>   ...
> 
> correct ? Shouldn't it be "has a period of 3" ? Since there are 3 different
> values and then it repeats starting with 0x20 ?

Yes, good eye. I also noticed my typo when re-reviewing this code just now. I'll fix this for the 3.8 cycle.

Brian

---
 drivers/mtd/nand/nand_base.c |    1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index d5ece6e..1a03b7f 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -2990,6 +2990,7 @@ static void nand_decode_ext_id(struct mtd_info *mtd, struct nand_chip *chip,
 	 * ID to decide what to do.
 	 */
 	if (id_len == 6 && id_data[0] == NAND_MFR_SAMSUNG &&
+			(chip->cellinfo & NAND_CI_CELLTYPE_MSK) &&
 			id_data[5] != 0x00) {
 		/* Calc pagesize */
 		mtd->writesize = 2048 << (extid & 0x03);

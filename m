From: Sergio Prado <sergio.prado@e-labworks.com>
Subject: Re: [PATCH] mtd: s3c2410: add device tree support
Date: Sun, 25 Sep 2016 14:42:57 -0300
Message-ID: <20160925174257.GA20238@sprado-desktop>
References: <1474125760-28168-1-git-send-email-sergio.prado@e-labworks.com>
 <20160917193123.762587d0@bbrezillon>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qk0-f193.google.com ([209.85.220.193]:34716 "EHLO
        mail-qk0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754948AbcIYRnJ (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sun, 25 Sep 2016 13:43:09 -0400
Received: by mail-qk0-f193.google.com with SMTP id b204so10315359qkc.1
        for <linux-samsung-soc@vger.kernel.org>; Sun, 25 Sep 2016 10:43:08 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <20160917193123.762587d0@bbrezillon>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: dwmw2@infradead.org, computersforpeace@gmail.com, robh+dt@kernel.org, mark.rutland@arm.com, kgene@kernel.org, k.kozlowski@samsung.com, richard@nod.at, linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

Hi Boris,

> > +Optional properties:
> > +- samsung,tacls : time for active CLE/ALE to nWE/nOE
> > +- samsung,twrph0 : active time for nWE/nOE
> > +- samsung,twrph1 : time for release CLE/ALE from nWE/nOE inactive
> 
> Can you try to extract these information from the nand_sdr_timings
> struct instead of passing it in your DT?

I've tested and the nand chip I'm working on is not ONFI or JEDEC
compatible, so looks like it is not possible to extract the timing
information from nand_sdr_timings. Am I right?

> > +	samsung,ignore_unset_ecc;
> 
> Just discovered this ->ignore_unset_ecc property, and I don't
> understand why it's here for...
> Either you don't want to have ECC, and in this case you should set
> NAND_ECC_NONE, or you want to have ECC calculated, and in this case,
> the only valid situation where ECC bytes are 0xff is when the page is
> erased.
> 
> If I'm right, please fix the driver instead of adding this DT property.
> If I'm wrong, could you explain in more detail when you have ECC bytes
> set to 0xff?

I think you are right but I am not an expert on flash devices and the
MTD sub-system. The commit message of this code says "If a block's ecc
field is all 0xff, then ignore the ECC correction. This is for systems
where some of the blocks, such as the initial cramfs are written without
ECC and need to be loaded on start.". Does it make sense?

> > +	for_each_available_child_of_node(np, child) {
> > +
> > +		sets->name = (char *)child->name;
> > +		sets->of_node = child;
> > +		sets->nr_chips = 1;
> > +
> > +		if (!of_property_match_string(child, "nand-ecc-mode", "none"))
> > +			sets->disable_ecc = 1;
> > +
> > +		if (of_get_property(child, "nand-on-flash-bbt", NULL))
> > +			sets->flash_bbt = 1;
> > +
> 
> These properties are automatically extracted in nand_scan_ident(), why
> do you need to parse them twice?
> 

You are right, there is no need to parse them twice. But taking a look
at the code I found a problem. Right now enabling hardware ECC is done
at compile time by enabling CONFIG_MTD_NAND_S3C2410_HWECC in the
menuconfig. Looks like this config option should be removed so we can
select ECC mode using nand-ecc-mode property in the device tree. But
this would break current boards that are not using a device tree. So it
would be necessary to add a ecc_mode field in the platform_data of these
boards and set them all to the default ECC mode (NAND_ECC_SOFT). Is this
the right approach?

Thanks!

-- 
Sergio Prado
Embedded Labworks
Office: +55 11 2628-3461
Mobile: +55 11 97123-3420

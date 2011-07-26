From: Grant Likely <grant.likely@secretlab.ca>
Subject: Re: [PATCH] Improve slave/cyclic DMA engine documentation (was:
 [PATCH V4 04/14] DMA: PL330: Add DMA_CYCLIC capability)
Date: Tue, 26 Jul 2011 12:03:53 -0600
Message-ID: <CACxGe6vCNkGZYKdT3Gmf_GD84dZTiYsmOYa-V4ztZZmZCNrNCA@mail.gmail.com>
References: <002001cc4ab6$0d7cd590$287680b0$%kim@samsung.com>
 <20110725103629.GF9653@n2100.arm.linux.org.uk> <1311590884.29703.2.camel@vkoul-mobl4>
 <20110725105754.GG9653@n2100.arm.linux.org.uk> <1311591717.29703.7.camel@vkoul-mobl4>
 <20110725113926.GH9653@n2100.arm.linux.org.uk> <1311595303.29703.31.camel@vkoul-mobl4>
 <20110726075720.GL9653@n2100.arm.linux.org.uk> <1311672933.24316.1.camel@vkoul-mobl4>
 <CABb+yY1P21hbMD2mG_cCvW3N5WqWzc2ZVt-HTOrC1J3dc5RbhA@mail.gmail.com>
 <20110726172027.GD1655@n2100.arm.linux.org.uk> <CABb+yY31N6ubWcjQnMqze5hH66eoSxPQCaRVqf7=jZ3L_h+P6Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-gw0-f46.google.com ([74.125.83.46]:61005 "EHLO
	mail-gw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751459Ab1GZSEP convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 26 Jul 2011 14:04:15 -0400
Received: by gwaa18 with SMTP id a18so443181gwa.19
        for <linux-samsung-soc@vger.kernel.org>; Tue, 26 Jul 2011 11:04:14 -0700 (PDT)
In-Reply-To: <CABb+yY31N6ubWcjQnMqze5hH66eoSxPQCaRVqf7=jZ3L_h+P6Q@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Jassi Brar <jassisinghbrar@gmail.com>
Cc: Russell King - ARM Linux <linux@arm.linux.org.uk>, Vinod Koul <vkoul@infradead.org>, vinod.koul@intel.com, linux-samsung-soc@vger.kernel.org, Boojin Kim <boojin.kim@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>, Mark Brown <broonie@opensource.wolfsonmicro.com>, Dan Williams <dan.j.williams@intel.com>, linux-arm-kernel@lists.infradead.org

On Tue, Jul 26, 2011 at 11:55 AM, Jassi Brar <jassisinghbrar@gmail.com>=
 wrote:
> On Tue, Jul 26, 2011 at 10:50 PM, Russell King - ARM Linux
> <linux@arm.linux.org.uk> wrote:
>> On Tue, Jul 26, 2011 at 08:07:44PM +0530, Jassi Brar wrote:
>>> Dear Vinod,
>>>
>>> =A0Since it came from the RMK, most probably it'll be the best.
>>>
>>> But applying patches upon personal timeout seems very dangerous.
>>
>> Ehh what? =A0Is there any contention over this documentation patch?
> I haven't yet read it... even after reading I would object only if I =
found
> your patch disturbing enough to disrupt my bowel movements. Which
> I don't think would be the case.
>
> I just observed it is second time that Vinod applied a patch without =
any
> ack or prior alert.

Applying patches without waiting for other Acks is absolutely a
reasonable thing for a maintainer to do.  The job of maintainership is
to apply good judgement on when patches can immediately be applied
(and therefore no longer consuming limited attention) and when patches
need further acks.

g.

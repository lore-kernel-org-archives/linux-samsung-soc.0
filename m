From: Jassi Brar <jassisinghbrar@gmail.com>
Subject: Re: [PATCH] Improve slave/cyclic DMA engine documentation (was:
 [PATCH V4 04/14] DMA: PL330: Add DMA_CYCLIC capability)
Date: Tue, 26 Jul 2011 23:25:13 +0530
Message-ID: <CABb+yY31N6ubWcjQnMqze5hH66eoSxPQCaRVqf7=jZ3L_h+P6Q@mail.gmail.com>
References: <002001cc4ab6$0d7cd590$287680b0$%kim@samsung.com>
	<20110725103629.GF9653@n2100.arm.linux.org.uk>
	<1311590884.29703.2.camel@vkoul-mobl4>
	<20110725105754.GG9653@n2100.arm.linux.org.uk>
	<1311591717.29703.7.camel@vkoul-mobl4>
	<20110725113926.GH9653@n2100.arm.linux.org.uk>
	<1311595303.29703.31.camel@vkoul-mobl4>
	<20110726075720.GL9653@n2100.arm.linux.org.uk>
	<1311672933.24316.1.camel@vkoul-mobl4>
	<CABb+yY1P21hbMD2mG_cCvW3N5WqWzc2ZVt-HTOrC1J3dc5RbhA@mail.gmail.com>
	<20110726172027.GD1655@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ey0-f171.google.com ([209.85.215.171]:48208 "EHLO
	mail-ey0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751426Ab1GZRzO convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 26 Jul 2011 13:55:14 -0400
Received: by eye22 with SMTP id 22so950081eye.2
        for <linux-samsung-soc@vger.kernel.org>; Tue, 26 Jul 2011 10:55:13 -0700 (PDT)
In-Reply-To: <20110726172027.GD1655@n2100.arm.linux.org.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Russell King - ARM Linux <linux@arm.linux.org.uk>
Cc: Vinod Koul <vkoul@infradead.org>, vinod.koul@intel.com, linux-samsung-soc@vger.kernel.org, Boojin Kim <boojin.kim@samsung.com>, Grant Likely <grant.likely@secretlab.ca>, Kukjin Kim <kgene.kim@samsung.com>, Mark Brown <broonie@opensource.wolfsonmicro.com>, Dan Williams <dan.j.williams@intel.com>, linux-arm-kernel@lists.infradead.org

On Tue, Jul 26, 2011 at 10:50 PM, Russell King - ARM Linux
<linux@arm.linux.org.uk> wrote:
> On Tue, Jul 26, 2011 at 08:07:44PM +0530, Jassi Brar wrote:
>> Dear Vinod,
>>
>> =C2=A0Since it came from the RMK, most probably it'll be the best.
>>
>> But applying patches upon personal timeout seems very dangerous.
>
> Ehh what? =C2=A0Is there any contention over this documentation patch=
?
I haven't yet read it... even after reading I would object only if I fo=
und
your patch disturbing enough to disrupt my bowel movements. Which
I don't think would be the case.

I just observed it is second time that Vinod applied a patch without an=
y
ack or prior alert.

>
>> People not responding doesn't mean only either people agree complete=
ly
>> or they don't care. Some might be interested but too busy with curre=
nt tasks
>> that they need time to check... please make some policy for such cas=
es.
>>
>> It already happened with the patch from Rob, which you probably have=
 to
>> revert.
>>
>> IMHO, if nobody replied, maybe you could first ack the patch and wai=
t
>> for, say a week, before applying?
>> That way people will know they have to hurry if they care otherwise
>> the patch is going upstream as such.
>
> A week is far too long. =C2=A0That's how patches get lost and missed.
>
He may decide to wait shorter, but imho a week after the first ack
isn't that long.

From: Thomas Abraham <thomas.abraham@linaro.org>
Subject: Re: [PATCH v3 1/2] mfd: add irq domain support for max8997 interrupts
Date: Tue, 13 Mar 2012 13:45:24 +0530
Message-ID: <CAJuYYwSQ-HRBU31=nWyzwqEBxj9LeAMOLQQVcAdf89dO9U0-sQ@mail.gmail.com>
References: <1330000688-11226-1-git-send-email-thomas.abraham@linaro.org>
	<1330000688-11226-2-git-send-email-thomas.abraham@linaro.org>
	<20120313032832.655983E07E4@localhost>
	<CAJuYYwTKMWgits6xd0UUvRPwr40NwJfO2HncUOW9J=EZbFs8=Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wi0-f178.google.com ([209.85.212.178]:46594 "EHLO
	mail-wi0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756828Ab2CMIPZ convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 13 Mar 2012 04:15:25 -0400
Received: by wibhq7 with SMTP id hq7so396766wib.1
        for <linux-samsung-soc@vger.kernel.org>; Tue, 13 Mar 2012 01:15:24 -0700 (PDT)
In-Reply-To: <CAJuYYwTKMWgits6xd0UUvRPwr40NwJfO2HncUOW9J=EZbFs8=Q@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Grant Likely <grant.likely@secretlab.ca>
Cc: linux-kernel@vger.kernel.org, k.lewandowsk@samsung.com, devicetree-discuss@lists.ozlabs.org, rob.herring@calxeda.com, kgene.kim@samsung.com, broonie@opensource.wolfsonmicro.com, myungjoo.ham@samsung.com, kyungmin.park@samsung.com, dg77.kim@samsung.com, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

On 13 March 2012 11:35, Thomas Abraham <thomas.abraham@linaro.org> wrot=
e:
> On 13 March 2012 08:58, Grant Likely <grant.likely@secretlab.ca> wrot=
e:
>> On Thu, 23 Feb 2012 18:08:07 +0530, Thomas Abraham <thomas.abraham@l=
inaro.org> wrote:
>>> Add irq domain support for max8997 interrupts. The reverse mapping =
method
>>> used is linear mapping since the sub-drivers of max8997 such as reg=
ulator
>>> and charger drivers can use the max8997 irq_domain to get the linux=
 irq
>>> number for max8997 interrupts. All uses of irq_base in platform dat=
a and
>>> max8997 driver private data are removed.
>>>
>>> Cc: Grant Likely <grant.likely@secretlab.ca>
>>> Cc: MyungJoo Ham <myungjoo.ham@samsung.com>
>>> Signed-off-by: Thomas Abraham <thomas.abraham@linaro.org>
>>> ---
>>> =A0arch/arm/mach-exynos/mach-nuri.c =A0 =A0| =A0 =A04 --
>>> =A0arch/arm/mach-exynos/mach-origen.c =A0| =A0 =A01 -
>>> =A0drivers/mfd/max8997-irq.c =A0 =A0 =A0 =A0 =A0 | =A0 60 +++++++++=
+++++++++++--------------
>>> =A0drivers/mfd/max8997.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =A0 =A01 -
>>> =A0include/linux/mfd/max8997-private.h | =A0 =A04 ++-
>>> =A0include/linux/mfd/max8997.h =A0 =A0 =A0 =A0 | =A0 =A01 -
>>> =A06 files changed, 38 insertions(+), 33 deletions(-)

[...]

>>
>> Hahaha. =A0The max8997_irqs table is kind of overdone when the group=
 and mask values
>> can be arithmetically derived from the hwirq number..
>
> Yes, I agree. Each group could have maximum of 8 interrupts. Then,
> data->hwirq % 8 will be the group number and data->hwirq & 7 would be

Typo here. group number =3D data->hwirq >> 3 and mask =3D data->hwirq &=
 7.

Thanks,
Thomas.

From: MyungJoo Ham <myungjoo.ham@samsung.com>
Subject: Re: [PATCH 2/3] Samsung SoC: ready to use NTC value inside kernel
Date: Fri, 1 Jul 2011 09:28:23 +0900
Message-ID: <BANLkTikC2zUPamzactXLdLb8Szgs2o9V7w@mail.gmail.com>
References: <1309422387-11546-1-git-send-email-myungjoo.ham@samsung.com>
	<1309422387-11546-3-git-send-email-myungjoo.ham@samsung.com>
	<20110630090013.GP21898@n2100.arm.linux.org.uk>
Reply-To: myungjoo.ham@gmail.com
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-bw0-f46.google.com ([209.85.214.46]:46410 "EHLO
	mail-bw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753986Ab1GAA2Z convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 30 Jun 2011 20:28:25 -0400
Received: by bwd5 with SMTP id 5so2236234bwd.19
        for <linux-samsung-soc@vger.kernel.org>; Thu, 30 Jun 2011 17:28:23 -0700 (PDT)
In-Reply-To: <20110630090013.GP21898@n2100.arm.linux.org.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Russell King - ARM Linux <linux@arm.linux.org.uk>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Kukjin Kim <kgene.kim@samsung.com>, Mark Brown <broonie@opensource.wolfsonmicro.com>, dg77.kim@samsung.com, Kyungmin Park <kyungmin.park@samsung.com>, Changhwan Youn <chaos.youn@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>

On Thu, Jun 30, 2011 at 6:00 PM, Russell King - ARM Linux
<linux@arm.linux.org.uk> wrote:
> On Thu, Jun 30, 2011 at 05:26:26PM +0900, MyungJoo Ham wrote:
>> diff --git a/arch/arm/plat-samsung/dev-adc.c b/arch/arm/plat-samsung=
/dev-adc.c
>> index 622972c..526097a 100644
>> --- a/arch/arm/plat-samsung/dev-adc.c
>> +++ b/arch/arm/plat-samsung/dev-adc.c
>> @@ -22,6 +22,8 @@
>> =C2=A0#include <plat/devs.h>
>> =C2=A0#include <plat/cpu.h>
>>
>> +#include "../../../fs/sysfs/sysfs.h"
>
> That is a big hint that you're doing something wrong.
>
[]
>
> This is wrong on just about every level. =C2=A0It needs to be rewritt=
en to
> avoid poking about in subsystem internal data structures, and you rea=
lly
> should not be sprint-ing a value to only sscanf it later.
>
> Plus, container_of doesn't return a pointer-error code.
>
> You need to come up with a far better way of doing this altogether.
>

Um.. is there any clean and nice way to read values that are exported t=
o sysfs?

Or if the values are only exported through sysfs (HWMON), is the only
clean way to read such values (w/o extending HWMON itself) to seperate
the HWMON device driver into two pieces: a platform driver that
provide values to somewhere sharable in kernel and a HWMON driver that
reads the values and exports them to sysfs?



Thanks.

- MyungJoo

--=20
MyungJoo Ham (=ED=95=A8=EB=AA=85=EC=A3=BC), Ph.D.
Mobile Software Platform Lab,
Digital Media and Communications (DMC) Business
Samsung Electronics
cell: 82-10-6714-2858

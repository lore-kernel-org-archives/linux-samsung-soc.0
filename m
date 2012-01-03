From: KyongHo Cho <pullip.cho@samsung.com>
Subject: Re: [PATCH v8 0/2] ommu/exynos: Add IOMMU/System MMU driver for
 Samsung Exynos
Date: Tue, 3 Jan 2012 17:15:45 +0900
Message-ID: <CAHQjnOP6==YL-XE17LRnBymLsFDOiS52HKo4mfGMQUMmqU=xbg@mail.gmail.com>
References: <000e01ccc624$c9349310$5b9db930$%cho@samsung.com>
	<20120102134229.GZ29877@amd.com>
	<CAHQjnON3XYZ9cAK0kqsY4QzMzESD1wOzxt-fiQCq3TJfDObFiw@mail.gmail.com>
	<20120102155820.GB29877@amd.com>
	<005a01ccc9b3$6b6a2870$423e7950$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-lpp01m010-f46.google.com ([209.85.215.46]:48140 "EHLO
	mail-lpp01m010-f46.google.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1752106Ab2ACIPr convert rfc822-to-8bit
	(ORCPT <rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 3 Jan 2012 03:15:47 -0500
In-Reply-To: <005a01ccc9b3$6b6a2870$423e7950$%kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: Joerg Roedel <joerg.roedel@amd.com>, linux-samsung-soc@vger.kernel.org, Subash Patel <subash.ramaswamy@linaro.org>, iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org, Younglak Kim <younglak1004.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Sanghyun Lee <sanghyun75.lee@samsung.com>, linux-arm-kernel@lists.infradead.org

On Tue, Jan 3, 2012 at 10:02 AM, Kukjin Kim <kgene.kim@samsung.com> wro=
te:
> Joerg Roedel wrote:
>>
>> On Tue, Jan 03, 2012 at 12:21:30AM +0900, KyongHo Cho wrote:
>> > > I still get
>> > >
>> > > =A0LD =A0 =A0 =A0.tmp_vmlinux1
>> > > /data/cross/gcc-4.6.0-nolibc/arm-unknown-linux-gnueabi/bin/arm-
>> unknown-linux-gnueabi-ld: no machine record defined
>> > > /data/cross/gcc-4.6.0-nolibc/arm-unknown-linux-gnueabi/bin/arm-
>> unknown-linux-gnueabi-ld: no machine record defined
>> > > /data/cross/gcc-4.6.0-nolibc/arm-unknown-linux-gnueabi/bin/arm-
>> unknown-linux-gnueabi-ld: no machine record defined
>> > > make[1]: *** [.tmp_vmlinux1] Error 1
>> > >
>> > > when trying to compile ARM/Exynos with 3.2-rc7. Am I doing somet=
hing
>> > > wrong or is this not expected to work?
>> > >
>> > Do you?
>> > Ok. I will check my configuration with linux-next git.
>>
>> Compiling my exynos-config with linux-next gives me:
>>
>> =A0 CC =A0 =A0 =A0arch/arm/kernel/process.o
>> In file included from /data/lemmy/linux.trees.git/arch/arm/mach-
>> exynos/include/mach/system.h:16:0,
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0from
> /data/lemmy/linux.trees.git/arch/arm/kernel/process.c:64:
>> /data/lemmy/linux.trees.git/arch/arm/plat-samsung/include/plat/syste=
m-
>> reset.h:19:2: error: #error Fix me up
>>
>> I better not ask the question how such an #error statement can come
>> through to linux-next. But what I can say is that I will not merge
>> your code until you guys make sure that your upstream platform code =
has
>> enough quality so that it at least compiles.
>>
> Hi Joerg,
>
> I already knew that, Russell added it so that I can take the ARM rest=
art
> changes seriously.
>
> Since I pushed exynos restart patches to Russell's patch system so pl=
ease
> kindly ignore it.
>
>> I attach the config I used for my compile-test.
>>
> OK, let me check and if any updates, let you know.
>

Hi.

Thank you Kukjin.
I am also going to check about the problem.

Regards,

KyongHo.

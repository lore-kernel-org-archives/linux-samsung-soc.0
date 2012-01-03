From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH v8 0/2] ommu/exynos: Add IOMMU/System MMU driver for
 Samsung Exynos
Date: Tue, 03 Jan 2012 10:02:52 +0900
Message-ID: <005a01ccc9b3$6b6a2870$423e7950$%kim@samsung.com>
References: <000e01ccc624$c9349310$5b9db930$%cho@samsung.com>
 <20120102134229.GZ29877@amd.com>
 <CAHQjnON3XYZ9cAK0kqsY4QzMzESD1wOzxt-fiQCq3TJfDObFiw@mail.gmail.com>
 <20120102155820.GB29877@amd.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:27349 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752109Ab2ACBDB convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 2 Jan 2012 20:03:01 -0500
In-reply-to: <20120102155820.GB29877@amd.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Joerg Roedel' <joerg.roedel@amd.com>, 'KyongHo Cho' <pullip.cho@samsung.com>
Cc: 'Subash Patel' <subash.ramaswamy@linaro.org>, linux-kernel@vger.kernel.org, 'Younglak Kim' <younglak1004.kim@samsung.com>, iommu@lists.linux-foundation.org, linux-samsung-soc@vger.kernel.org, 'Kyungmin Park' <kyungmin.park@samsung.com>, 'Sanghyun Lee' <sanghyun75.lee@samsung.com>, linux-arm-kernel@lists.infradead.org

Joerg Roedel wrote:
>=20
> On Tue, Jan 03, 2012 at 12:21:30AM +0900, KyongHo Cho wrote:
> > > I still get
> > >
> > > =A0LD =A0 =A0 =A0.tmp_vmlinux1
> > > /data/cross/gcc-4.6.0-nolibc/arm-unknown-linux-gnueabi/bin/arm-
> unknown-linux-gnueabi-ld: no machine record defined
> > > /data/cross/gcc-4.6.0-nolibc/arm-unknown-linux-gnueabi/bin/arm-
> unknown-linux-gnueabi-ld: no machine record defined
> > > /data/cross/gcc-4.6.0-nolibc/arm-unknown-linux-gnueabi/bin/arm-
> unknown-linux-gnueabi-ld: no machine record defined
> > > make[1]: *** [.tmp_vmlinux1] Error 1
> > >
> > > when trying to compile ARM/Exynos with 3.2-rc7. Am I doing someth=
ing
> > > wrong or is this not expected to work?
> > >
> > Do you?
> > Ok. I will check my configuration with linux-next git.
>=20
> Compiling my exynos-config with linux-next gives me:
>=20
>   CC      arch/arm/kernel/process.o
> In file included from /data/lemmy/linux.trees.git/arch/arm/mach-
> exynos/include/mach/system.h:16:0,
>                  from
/data/lemmy/linux.trees.git/arch/arm/kernel/process.c:64:
> /data/lemmy/linux.trees.git/arch/arm/plat-samsung/include/plat/system=
-
> reset.h:19:2: error: #error Fix me up
>=20
> I better not ask the question how such an #error statement can come
> through to linux-next. But what I can say is that I will not merge
> your code until you guys make sure that your upstream platform code h=
as
> enough quality so that it at least compiles.
>=20
Hi Joerg,

I already knew that, Russell added it so that I can take the ARM restar=
t
changes seriously.

Since I pushed exynos restart patches to Russell's patch system so plea=
se
kindly ignore it.

> I attach the config I used for my compile-test.
>=20
OK, let me check and if any updates, let you know.

Happy New Year.
Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.

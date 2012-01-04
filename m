From: Joerg Roedel <joerg.roedel@amd.com>
Subject: Re: [PATCH v8 0/2] ommu/exynos: Add IOMMU/System MMU driver for
 Samsung Exynos
Date: Wed, 4 Jan 2012 16:01:01 +0100
Message-ID: <20120104150101.GA3492@amd.com>
References: <000e01ccc624$c9349310$5b9db930$%cho@samsung.com>
 <20120102134229.GZ29877@amd.com>
 <CAHQjnON3XYZ9cAK0kqsY4QzMzESD1wOzxt-fiQCq3TJfDObFiw@mail.gmail.com>
 <20120102155820.GB29877@amd.com>
 <20120103095527.GI2914@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from db3ehsobe001.messaging.microsoft.com ([213.199.154.139]:49660
	"EHLO DB3EHSOBE001.bigfish.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1755835Ab2ADPBN convert rfc822-to-8bit
	(ORCPT <rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 4 Jan 2012 10:01:13 -0500
Content-Disposition: inline
In-Reply-To: <20120103095527.GI2914@n2100.arm.linux.org.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Russell King - ARM Linux <linux@arm.linux.org.uk>
Cc: KyongHo Cho <pullip.cho@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org, Younglak Kim <younglak1004.kim@samsung.com>, Subash Patel <subash.ramaswamy@linaro.org>, Kukjin Kim <kgene.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Sanghyun Lee <sanghyun75.lee@samsung.com>, linux-arm-kernel@lists.infradead.org

On Tue, Jan 03, 2012 at 09:55:27AM +0000, Russell King - ARM Linux wrot=
e:
> On Mon, Jan 02, 2012 at 04:58:20PM +0100, Joerg Roedel wrote:
> > On Tue, Jan 03, 2012 at 12:21:30AM +0900, KyongHo Cho wrote:
> > > > I still get
> > > >
> > > > =A0LD =A0 =A0 =A0.tmp_vmlinux1
> > > > /data/cross/gcc-4.6.0-nolibc/arm-unknown-linux-gnueabi/bin/arm-=
unknown-linux-gnueabi-ld: no machine record defined
> > > > /data/cross/gcc-4.6.0-nolibc/arm-unknown-linux-gnueabi/bin/arm-=
unknown-linux-gnueabi-ld: no machine record defined
> > > > /data/cross/gcc-4.6.0-nolibc/arm-unknown-linux-gnueabi/bin/arm-=
unknown-linux-gnueabi-ld: no machine record defined
> > > > make[1]: *** [.tmp_vmlinux1] Error 1
> > > >
> > > > when trying to compile ARM/Exynos with 3.2-rc7. Am I doing some=
thing
> > > > wrong or is this not expected to work?
> > > >
> > > Do you?
> > > Ok. I will check my configuration with linux-next git.
> >=20
> > Compiling my exynos-config with linux-next gives me:
> >=20
> >   CC      arch/arm/kernel/process.o
> > In file included from /data/lemmy/linux.trees.git/arch/arm/mach-exy=
nos/include/mach/system.h:16:0,
> >                  from /data/lemmy/linux.trees.git/arch/arm/kernel/p=
rocess.c:64:
> > /data/lemmy/linux.trees.git/arch/arm/plat-samsung/include/plat/syst=
em-reset.h:19:2: error: #error Fix me up
> >=20
> > I better not ask the question how such an #error statement can come
> > through to linux-next.
>=20
> It comes through when I stick it in my tree because of a month of ask=
ing
> for help to fix something and getting zero response from the maintain=
ers.
>=20
> It's a way to flag to them that they're doing something wrong - and i=
n
> fact something is broken, and that that brokenness will happen at the
> next merge window unless they get off their butt and do something abo=
ut
> it.

Okay, fine with me if it really will be fixed in 3.3-rc1 :)

Thanks,

	Joerg

--=20
AMD Operating System Research Center

Advanced Micro Devices GmbH Einsteinring 24 85609 Dornach
General Managers: Alberto Bozzo, Andrew Bowd
Registration: Dornach, Landkr. Muenchen; Registerger. Muenchen, HRB Nr.=
 43632

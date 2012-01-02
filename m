From: KyongHo Cho <pullip.cho@samsung.com>
Subject: Re: [PATCH v8 0/2] ommu/exynos: Add IOMMU/System MMU driver for
 Samsung Exynos
Date: Tue, 3 Jan 2012 00:21:30 +0900
Message-ID: <CAHQjnON3XYZ9cAK0kqsY4QzMzESD1wOzxt-fiQCq3TJfDObFiw@mail.gmail.com>
References: <000e01ccc624$c9349310$5b9db930$%cho@samsung.com>
	<20120102134229.GZ29877@amd.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20120102134229.GZ29877@amd.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Joerg Roedel <joerg.roedel@amd.com>
Cc: Kukjin Kim <kgene.kim@samsung.com>, Subash Patel <subash.ramaswamy@linaro.org>, linux-kernel@vger.kernel.org, Younglak Kim <younglak1004.kim@samsung.com>, iommu@lists.linux-foundation.org, linux-samsung-soc@vger.kernel.org, Kyungmin Park <kyungmin.park@samsung.com>, Sanghyun Lee <sanghyun75.lee@samsung.com>, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

Hi
On Mon, Jan 2, 2012 at 10:42 PM, Joerg Roedel <joerg.roedel@amd.com> wr=
ote:
> Hi,
>
> On Thu, Dec 29, 2011 at 09:24:18PM +0900, KyongHo Cho wrote:
>> Changes since v7:
>> - Rebased with the recent commits of the following git branches
>> =A0 * git.kernel.org/pub/scm/linux/kernel/git/joro/iommu.git/next
>> =A0 * git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.gi=
t/for-next
>> - Changed magic numbers into macros
>> - Setting owner of a System MMU in 'iommu' field of dev_archdata
>> - Verbose message in the default fault handler
>> - Some bug fixes.
>
> I still get
>
> =A0LD =A0 =A0 =A0.tmp_vmlinux1
> /data/cross/gcc-4.6.0-nolibc/arm-unknown-linux-gnueabi/bin/arm-unknow=
n-linux-gnueabi-ld: no machine record defined
> /data/cross/gcc-4.6.0-nolibc/arm-unknown-linux-gnueabi/bin/arm-unknow=
n-linux-gnueabi-ld: no machine record defined
> /data/cross/gcc-4.6.0-nolibc/arm-unknown-linux-gnueabi/bin/arm-unknow=
n-linux-gnueabi-ld: no machine record defined
> make[1]: *** [.tmp_vmlinux1] Error 1
>
> when trying to compile ARM/Exynos with 3.2-rc7. Am I doing something
> wrong or is this not expected to work?
>
Do you?
Ok. I will check my configuration with linux-next git.

Thank you.

KyongHo

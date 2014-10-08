From: Abhilash Kesavan <kesavan.abhilash@gmail.com>
Subject: Re: [PATCH v5 0/8] arch: arm64: Enable support for Samsung Exynos7 SoC
Date: Wed, 8 Oct 2014 11:16:55 +0530
Message-ID: <CAM4voamDLS1fAfHq1ry0AHDKzUtXYnPyOVfAEUiJLJTFBDa7nA@mail.gmail.com>
References: <1411361228-18279-1-git-send-email-a.kesavan@samsung.com>
	<013001cfd702$feb42900$fc1c7b00$@samsung.com>
	<CAM4voa=Gsp6EqzeDFPEvCPKSVfOXHzj8dsXZ6bmNA25qATbzfg@mail.gmail.com>
	<CAM4voanWfc1FPsQ4QCTLAoqoW9isAO8cO8Dtq1o+C+r0UTfiKw@mail.gmail.com>
	<20140930155013.GE12702@e104818-lin.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qa0-f50.google.com ([209.85.216.50]:43908 "EHLO
	mail-qa0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750737AbaJHFq4 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 8 Oct 2014 01:46:56 -0400
In-Reply-To: <20140930155013.GE12702@e104818-lin.cambridge.arm.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: Chanho Park <chanho61.park@samsung.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, devicetree <devicetree@vger.kernel.org>, Naveen Krishna <naveenkrishna.ch@gmail.com>, Tomasz Figa <tomasz.figa@gmail.com>, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>

Hi Arnd and Olof,

On Tue, Sep 30, 2014 at 9:20 PM, Catalin Marinas
<catalin.marinas@arm.com> wrote:
> On Tue, Sep 30, 2014 at 04:15:21PM +0100, Abhilash Kesavan wrote:
>> On Tue, Sep 23, 2014 at 2:18 PM, Abhilash Kesavan
>> <kesavan.abhilash@gmail.com> wrote:
>> >>> This patchset supports the new Exynos7 Samsung SoC based on Cortex-A57.
>> >>> Exynos7 is a System-On-Chip (SoC) that is based on 64-bit ARMv8 RISC
>> >>> processor.
>> >>>
>> >>> The following patches are tested based on linux-next tree (20140919).
>> >>> https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git/
>> >>>
>> >>> Following patches are required for this series:
>> >>> 1- "tty/serial: fix config dependencies for samsung serial"
>> >>>    https://www.mail-archive.com/linux-samsung-soc@vger.kernel.org/msg36208.html
>> >>> 2- "dts, kbuild: Implement support for dtb vendor subdirs" patchset
>> >>>    http://comments.gmane.org/gmane.linux.kbuild.devel/12131
>> >
>> > Thanks for your comments. I have mentioned Robert's patchset as being
>> > a dependency for my series here.
>>
>> Do you have any comments on the arch and dts changes ?
>
> The arch changes look fine to me (not much in there, just Kconfig,
> defconfig, Makefile). Regarding the dts, I'd like to see some acks from
> the DT or arm-soc maintainers.
>
> BTW, the arch/arm64/ patches in your series should be merged via the
> arm-soc tree (Arnd/Olof, cc'ing them now).

Do you have any comments on this series ?

Abhilash
>
> --
> Catalin

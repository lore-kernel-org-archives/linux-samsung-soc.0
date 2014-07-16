From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 13/19] ARM: s5pv210: move debug-macro.S into the common
 space
Date: Wed, 16 Jul 2014 09:53:11 +0900
Message-ID: <046101cfa090$51757260$f4605720$@samsung.com>
References: <1404496099-26708-1-git-send-email-t.figa@samsung.com>
 <1404496099-26708-14-git-send-email-t.figa@samsung.com>
 <53C5BF24.9030302@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:37979 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753940AbaGPAxL (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 15 Jul 2014 20:53:11 -0400
In-reply-to: <53C5BF24.9030302@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Tomasz Figa' <t.figa@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, =?ISO-8859-1?Q?'Heiko_St=FCbner'?= <heiko@sntech.de>, 'Arnd Bergmann' <arnd@arndb.de>, linux-kernel@vger.kernel.org, 'Tomasz Figa' <tomasz.figa@gmail.com>, 'Mark Brown' <broonie@kernel.org>, 'Olof Johansson' <olof@lixom.net>, linux-arm-kernel@lists.infradead.org, 'Marek Szyprowski' <m.szyprowski@samsung.com>

Kukjin Kim wrote:
> 
> On 07/05/14 02:48, Tomasz Figa wrote:
> > Move debug-macro.S from mach/include to include/debug where
> > all other common debug macros are.
> >
> > Signed-off-by: Tomasz Figa<t.figa@samsung.com>
> > ---
> >   arch/arm/Kconfig.debug                           | 12 +++++--
> >   arch/arm/include/debug/s5pv210.S                 | 34 ++++++++++++++++++++
> >   arch/arm/mach-s5pv210/include/mach/debug-macro.S | 41 ------------------------
> >   3 files changed, 44 insertions(+), 43 deletions(-)
> >   create mode 100644 arch/arm/include/debug/s5pv210.S
> >   delete mode 100644 arch/arm/mach-s5pv210/include/mach/debug-macro.S

[...]

> Tomasz,
> 
> I couldn't apply this one from this your series because of conflict with
> others. Can you please respin this one?
> 
One more note, since I didn't apply this, there is a build breakage for
s5pv210_defconfig now...

arch/arm/kernel/debug.S:24:33: fatal error: mach/debug-macro.S: No such file or directory
compilation terminated.
make[2]: *** [arch/arm/kernel/debug.o] Error 1
make[1]: *** [arch/arm/kernel] Error 2
make[1]: *** Waiting for unfinished jobs....

- Kukjin

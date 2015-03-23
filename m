From: Valentin Rothberg <valentinrothberg@gmail.com>
Subject: Renaming ARM_CCI
Date: Mon, 23 Mar 2015 16:10:14 +0100
Message-ID: <CAD3Xx4+ECHuri6nT7=gpM5EnAqZM2zW8TK4T0yjW+aMMz=pwdA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wg0-f49.google.com ([74.125.82.49]:35807 "EHLO
	mail-wg0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752106AbbCWPKq (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 23 Mar 2015 11:10:46 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: suzuki.poulose@arm.com, linux@arm.linux.org.uk
Cc: sudeep.holla@arm.com, nicolas.pitre@linaro.org, punit.agrawal@arm.com, will.deacon@arm.com, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Paul Bolle <pebolle@tiscali.nl>, Andreas Ruprecht <rupran@einserver.de>, hengelein Stefan <stefan.hengelein@fau.de>

Hi Suzuki,

your commit c9966c98697a ("arm-cci: Split the code for PMU vs driver
support") renames the Kconfig option ARM_CCI to ARM_CCI400_PORT_CTRL.
However, the commit does not rename all references on ARM_CCI:

drivers/bus/Kconfig:29: select ARM_CCI
drivers/bus/Makefile:6:obj-$(CONFIG_ARM_CCI)            += arm-cci.o
include/linux/arm-cci.h:31:#ifdef CONFIG_ARM_CCI

Is this intentional or is there a patch scheduled somewhere to fix this issue?

I detected your commit with scripts/checkkconfigsymbols.py.  A recent
patch added support to make the script git aware, so that it lets you
check git commits.  It's added to Greg's misc tree and should arrive
soon in linux-next.

[linux-next]$ ./checkkconfigsymbols.py --diff next-20150320..next-20150323
ARM_CCI drivers/bus/Makefile, include/linux/arm-cci.h, drivers/bus/Kconfig

Kind regards,
 Valentin

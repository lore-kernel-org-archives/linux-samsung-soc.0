From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v4 15/19] ARM: samsung: remove unused tick.h
Date: Thu, 3 Jan 2013 21:51:32 +0000
Message-ID: <201301032151.32337.arnd@arndb.de>
References: <1357235668-9450-1-git-send-email-robherring2@gmail.com> <1357235668-9450-16-git-send-email-robherring2@gmail.com>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from moutng.kundenserver.de ([212.227.17.10]:63708 "EHLO
	moutng.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753737Ab3ACVvu (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 3 Jan 2013 16:51:50 -0500
In-Reply-To: <1357235668-9450-16-git-send-email-robherring2@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Rob Herring <robherring2@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, Russell King <linux@arm.linux.org.uk>, Olof Johansson <olof@lixom.net>, thomas.petazzoni@free-electrons.com, Rob Herring <rob.herring@calxeda.com>, Ben Dooks <ben-linux@fluff.org>, Kukjin Kim <kgene.kim@samsung.com>, linux-samsung-soc@vger.kernel.org

On Thursday 03 January 2013, Rob Herring wrote:
> From: Rob Herring <rob.herring@calxeda.com>
> 
> Remove tick.h on s5p64x0 and s5pv210 as they are unused.
> 
> Signed-off-by: Rob Herring <rob.herring@calxeda.com>
> Cc: Ben Dooks <ben-linux@fluff.org>
> Cc: Kukjin Kim <kgene.kim@samsung.com>
> Cc: linux-samsung-soc@vger.kernel.org
> ---
>  arch/arm/mach-s5pv210/include/mach/tick.h |   26 --------------------------
>  arch/arm/plat-samsung/s5p-irq-eint.c      |    1 +
>  2 files changed, 1 insertion(+), 26 deletions(-)
>  delete mode 100644 arch/arm/mach-s5pv210/include/mach/tick.h

The second half of the patch does not relate to the description,
and the first half looks correct but out of place here.

Did you accidentally fold another patch into the one you wanted,
or am I just misreading the intention of the patch?

	Arnd

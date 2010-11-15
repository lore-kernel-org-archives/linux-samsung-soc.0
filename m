From: Darius Augulis <augulis.darius@gmail.com>
Subject: Re: [GIT PULL] Samsung fixes for 2.6.37-rc2
Date: Mon, 15 Nov 2010 17:32:53 +0200
Message-ID: <4CE152A5.9050408@gmail.com>
References: <007901cb84c2$7f465a30$7dd30e90$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from darkstar.wilibox.com ([195.14.175.138]:41042 "EHLO
	darkstar.wilibox.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752259Ab0KOPc5 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 15 Nov 2010 10:32:57 -0500
In-Reply-To: <007901cb84c2$7f465a30$7dd30e90$%kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org

Hi Kukjin,

you have missed "serial: samsung: fix device name" which is hanging here 
for a long time and was decided to merge in 2.6.37-rc1.
Please, pick it up.

thanks,
Darius


On 11/15/2010 02:41 PM, Kukjin Kim wrote:
> Hi Linus,
>
> Please pull Samsung fixes from:
>
> git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git
> s5p-fixes-for-linus
>
> These things are for fix build warnings on 2.6.37-rc2.
> If any problems, please let me know.
>
> Thanks.
>
> Best regards,
> Kgene.
> --
> Kukjin Kim<kgene.kim@samsung.com>, Senior Engineer,
> SW Solution Development Team, Samsung Electronics Co., Ltd.
>
>
> The following changes since commit c8ddb2713c624f432fa5fe3c7ecffcdda46ea0d4:
>
>    Linux 2.6.37-rc1 (2010-11-01 07:54:12 -0400)
>
> are available in the git repository at:
>     git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git
> s5p-fixes-for-linus
>
> Kukjin Kim (2):
>        ARM: SAMSUNG: Fix HAVE_S3C2410_I2C warnings
>        ARM: SAMSUNG: Fix HAVE_S3C_RTC warnings
>
> Kyungmin Park (1):
>        ARM: SAMSUNG: Fix HAVE_S3C2410_WATCHDOG warnings
>
>   arch/arm/Kconfig              |   32 ++++++++++++++++----------------
>   arch/arm/mach-s3c64xx/Kconfig |    2 +-
>   2 files changed, 17 insertions(+), 17 deletions(-)
>

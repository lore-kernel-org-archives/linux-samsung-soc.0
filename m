From: Kyungmin Park <kmpark@infradead.org>
Subject: Re: [GIT PULL] Samsung fixes for 2.6.39-rc4
Date: Mon, 18 Apr 2011 17:43:00 +0900
Message-ID: <BANLkTik=-YbSD3D+9twqDm3uKR3tm+V+=g@mail.gmail.com>
References: <008701cbfd45$94dd8f70$be98ae50$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ew0-f46.google.com ([209.85.215.46]:33513 "EHLO
	mail-ew0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752566Ab1DRInE convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 18 Apr 2011 04:43:04 -0400
In-Reply-To: <008701cbfd45$94dd8f70$be98ae50$%kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org

Hi,

Can you check this patch also?
http://lists.arm.linux.org.uk/lurker/message/20110329.064902.fb2f620c.e=
n.html

=46ix cpuinit section mismatch(es).

WARNING: modpost: Found 2 section mismatch(es).
To see full details build your kernel with:
'make CONFIG_DEBUG_SECTION_MISMATCH=3Dy'

Thank you,
Kyungmin Park

On Mon, Apr 18, 2011 at 6:22 AM, Kukjin Kim <kgene.kim@samsung.com> wro=
te:
> Hi Linus,
>
> Please pull Samsung fixes from:
>
> git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git
> s5p-fixes-for-linus
>
> These things are small fixes for 2.6.39-rc4.
> If any problems, please let me know.
>
> Thanks.
>
> Best regards,
> Kgene.
> --
> Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
> SW Solution Development Team, Samsung Electronics Co., Ltd.
>
> The following changes since commit a6360dd37e1a144ed11e6548371bade559=
a1e4df:
>
> =A0Linux 2.6.39-rc3 (2011-04-11 17:21:51 -0700)
>
> are available in the git repository at:
> =A0 git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung=
=2Egit
> s5p-fixes-for-linus
>
> Abhilash Kesavan (2):
> =A0 =A0 =A0ARM: S5P: Remove unused s3c_pm_check_resume_pin
> =A0 =A0 =A0ARM: SAMSUNG: Fix build failure in PM CRC check code
>
> Maurus Cuelenaere (1):
> =A0 =A0 =A0ARM: SAMSUNG: Fix warning 's3c_pm_show_resume_irqs' define=
d but not
> used
>
> =A0arch/arm/plat-s5p/pm.c =A0 =A0 =A0 =A0 =A0 | =A0 11 -----------
> =A0arch/arm/plat-samsung/pm-check.c | =A0 =A06 ------
> =A0arch/arm/plat-samsung/pm.c =A0 =A0 =A0 | =A0 =A05 +++--
> =A03 files changed, 3 insertions(+), 19 deletions(-)
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsu=
ng-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>

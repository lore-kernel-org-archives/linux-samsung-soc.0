From: MyungJoo Ham <myungjoo.ham@gmail.com>
Subject: Re: [PATCH 1/3] ARM: EXYNOS: Add ASV feature for Exynos4 series
Date: Thu, 10 Nov 2011 14:52:24 +0900
Message-ID: <CAJ0PZbTHmgAkLuSRJfmkKr_uTCD+YqAj3q10SMg9XkziR6i_ww@mail.gmail.com>
References: <1319677938-25732-1-git-send-email-boyko.lee@samsung.com>
	<1319677938-25732-2-git-send-email-boyko.lee@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-bw0-f46.google.com ([209.85.214.46]:43586 "EHLO
	mail-bw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752184Ab1KJFw0 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 10 Nov 2011 00:52:26 -0500
Received: by bke11 with SMTP id 11so1977809bke.19
        for <linux-samsung-soc@vger.kernel.org>; Wed, 09 Nov 2011 21:52:25 -0800 (PST)
In-Reply-To: <1319677938-25732-2-git-send-email-boyko.lee@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Jongpill Lee <boyko.lee@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, Kyungmin Park <kyungmin.park@samsung.com>

On Thu, Oct 27, 2011 at 10:12 AM, Jongpill Lee <boyko.lee@samsung.com> =
wrote:
> This patch adds ASV feature for exynos4 seires.
> Asv(Adoptive support voltage) feature support to get spec of SoC.
> And we can use to adjust voltage for operation SoC usign by ASV resul=
t.
>
> Signed-off-by: Jongpill Lee <boyko.lee@samsung.com>
> ---
> =A0arch/arm/mach-exynos4/Makefile =A0 =A0 =A0 =A0 =A0 | =A0 =A02 +-
> =A0arch/arm/mach-exynos4/asv.c =A0 =A0 =A0 =A0 =A0 =A0 =A0| =A0 78 ++=
++++++++++++++++++++++++++++
> =A0arch/arm/mach-exynos4/include/mach/asv.h | =A0 42 ++++++++++++++++
> =A03 files changed, 121 insertions(+), 1 deletions(-)
> =A0create mode 100644 arch/arm/mach-exynos4/asv.c
> =A0create mode 100644 arch/arm/mach-exynos4/include/mach/asv.h
>

Hello,


As long as we have <mach/asv.h> in our hands, we can have the ASV
value stored at the common place declared by this asv.h rather than at
INFORM2 as I've mentioned before at another thread. This location
<mach/asv.h> seems the perfect location for the purpose. Besides, now,
with Exynos4x12s, I start to hear cases where all the INFORMx
registers are fully used; thus, it seems that it's time to remove
unnecessary usage of the registers.



Cheers!
MyungJoo

--=20
MyungJoo Ham, Ph.D.
Mobile Software Platform Lab, DMC Business, Samsung Electronics

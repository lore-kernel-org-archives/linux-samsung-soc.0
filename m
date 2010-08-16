From: Kyungmin Park <kmpark@infradead.org>
Subject: Re: [PATCH] ARM: Update number of VIC
Date: Mon, 16 Aug 2010 10:01:09 +0900
Message-ID: <AANLkTikyZHX-PmPx8DjyP6ar7wmyiP7Cf9-ttZQJXttZ@mail.gmail.com>
References: <1281697788-18018-1-git-send-email-kgene.kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ww0-f44.google.com ([74.125.82.44]:64524 "EHLO
	mail-ww0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751775Ab0HPBBK convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 15 Aug 2010 21:01:10 -0400
Received: by wwj40 with SMTP id 40so5760630wwj.1
        for <linux-samsung-soc@vger.kernel.org>; Sun, 15 Aug 2010 18:01:09 -0700 (PDT)
In-Reply-To: <1281697788-18018-1-git-send-email-kgene.kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org, Russell King <rmk@arm.linux.org.uk>

Even though it required. I still think ben's patch is better approaches=
=2E
Talk to Ben again.
And there's no answer from Russell this approaches can be accepted.

And if you want to apply this patch, please apply my previous patch
and then add other SoCs.
http://marc.info/?l=3Dlinux-arm-kernel&m=3D127555986709819&w=3D2

Thank you,
Kyungmin Park

On Fri, Aug 13, 2010 at 8:09 PM, Kukjin Kim <kgene.kim@samsung.com> wro=
te:
> Update the number of VIC to handle the 3 or 4 VICs of
> the S5PV210, S5P6442 and S5PC100.
>
> Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
> Cc: Ben Dooks <ben-linux@fluff.org>
> Cc: Russell King <rmk@arm.linux.org.uk>
> ---
> =A0arch/arm/common/Kconfig | =A0 =A04 +++-
> =A01 files changed, 3 insertions(+), 1 deletions(-)
>
> diff --git a/arch/arm/common/Kconfig b/arch/arm/common/Kconfig
> index 0a34c81..b7c76a9 100644
> --- a/arch/arm/common/Kconfig
> +++ b/arch/arm/common/Kconfig
> @@ -6,8 +6,10 @@ config ARM_VIC
>
> =A0config ARM_VIC_NR
> =A0 =A0 =A0 =A0int
> - =A0 =A0 =A0 default 2
> =A0 =A0 =A0 =A0depends on ARM_VIC
> + =A0 =A0 =A0 default 4 if ARCH_S5PV210
> + =A0 =A0 =A0 default 3 if ARCH_S5P6442 || ARCH_S5PC100
> + =A0 =A0 =A0 default 2
> =A0 =A0 =A0 =A0help
> =A0 =A0 =A0 =A0 =A0The maximum number of VICs available in the system=
, for
> =A0 =A0 =A0 =A0 =A0power management.
> --
> 1.6.2.5
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsu=
ng-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>

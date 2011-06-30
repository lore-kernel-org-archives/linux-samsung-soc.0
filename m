From: MyungJoo Ham <myungjoo.ham@gmail.com>
Subject: Re: [PATCH 1/7] ARM: EXYNOS4: Add external GIC io memory mapping
Date: Thu, 30 Jun 2011 14:14:28 +0900
Message-ID: <BANLkTi=nQEe_JaoBvi6iPSDpR7F4QMsi9g@mail.gmail.com>
References: <1308555258-4322-1-git-send-email-chaos.youn@samsung.com>
	<1308555258-4322-2-git-send-email-chaos.youn@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-bw0-f46.google.com ([209.85.214.46]:36380 "EHLO
	mail-bw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750958Ab1F3FOa convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 30 Jun 2011 01:14:30 -0400
Received: by bwd5 with SMTP id 5so1536037bwd.19
        for <linux-samsung-soc@vger.kernel.org>; Wed, 29 Jun 2011 22:14:28 -0700 (PDT)
In-Reply-To: <1308555258-4322-2-git-send-email-chaos.youn@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Changhwan Youn <chaos.youn@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, ben-linux@fluff.org

On Mon, Jun 20, 2011 at 4:34 PM, Changhwan Youn <chaos.youn@samsung.com=
> wrote:
> This patch adds external GIC io memory mapping
> to support external GIC on EXYNOS4.
>
> Signed-off-by: Changhwan Youn <chaos.youn@samsung.com>
> ---
> =A0arch/arm/mach-exynos4/cpu.c =A0 =A0 =A0 =A0 =A0 =A0 =A0| =A0 10 ++=
++++++++
> =A0arch/arm/mach-exynos4/include/mach/map.h | =A0 =A05 +++--
> =A0arch/arm/plat-s5p/include/plat/map-s5p.h | =A0 =A05 +++--
> =A03 files changed, 16 insertions(+), 4 deletions(-)
>

Hello,

It appears that something is missing in the patch series.
A patch related with "AUDSS" is required before applying this patch.
I get patch fail errors at cpu.c and map-s5p.h.


Cheers!

- MyungJoo

--=20
MyungJoo Ham, Ph.D.
Mobile Software Platform Lab,
Digital Media and Communications (DMC) Business
Samsung Electronics
cell: 82-10-6714-2858

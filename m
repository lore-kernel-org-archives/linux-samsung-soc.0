From: Kyungmin Park <kmpark@infradead.org>
Subject: Re: [PATCH 0/3] ARM: SAMSUNG: register the second instance of PL330 DMAC
Date: Wed, 17 Aug 2011 14:37:01 +0900
Message-ID: <CAH9JG2XPA3zAT9A6-2N0CqYC__ac4krW5gTM271qfxJD8DHETQ@mail.gmail.com>
References: <1313553969-14639-1-git-send-email-alim.akhtar@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qw0-f46.google.com ([209.85.216.46]:35876 "EHLO
	mail-qw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750813Ab1HQFhE convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 17 Aug 2011 01:37:04 -0400
Received: by qwk3 with SMTP id 3so392250qwk.19
        for <linux-samsung-soc@vger.kernel.org>; Tue, 16 Aug 2011 22:37:02 -0700 (PDT)
In-Reply-To: <1313553969-14639-1-git-send-email-alim.akhtar@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: alim akhtar <alim.akhtar@samsung.com>
Cc: kgene.kim@samsung.com, boojin.kim@samsung.com, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org

Does it also need to provide the mdma?

On Wed, Aug 17, 2011 at 1:06 PM, alim akhtar <alim.akhtar@samsung.com> =
wrote:
> From: Alim Akhtar <alim.akhtar@samsung.com>
>
> Two instance of platform data is provided for PL330 but only one PL33=
0 DMAC
> instance is registered with amba_device.
> These patch sets registers the second instance with amba_device.
>
> These patches are based on kgene's tree next/topic-dma-pl330 branch.
> http://git.kernel.org/?p=3Dlinux/kernel/git/kgene/linux-samsung.git;;=
a=3Dsummary
>
> Alim Akhtar (3):
> =A0ARM: EXYNOS4: register the second instance of pl330 DMAC
> =A0ARM: S5PV210: register the second instance of pl330 DMAC
> =A0ARM: S5PC100: register the second instance of pl330 DMAC
>
> =A0arch/arm/mach-exynos4/dma.c | =A0 =A01 +
> =A0arch/arm/mach-s5pc100/dma.c | =A0 =A01 +
> =A0arch/arm/mach-s5pv210/dma.c | =A0 =A01 +
> =A03 files changed, 3 insertions(+), 0 deletions(-)
>
> --
> 1.7.2.3
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsu=
ng-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>

From: Kyungmin Park <kmpark@infradead.org>
Subject: Re: [PATCH 0/7] ARM: EXYNOS4: Adds External GIC
Date: Tue, 21 Jun 2011 09:01:01 +0900
Message-ID: <BANLkTiksfkfzs1nQS0C5uE=pizoOWcnPzA@mail.gmail.com>
References: <1308555258-4322-1-git-send-email-chaos.youn@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-gy0-f174.google.com ([209.85.160.174]:35781 "EHLO
	mail-gy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756399Ab1FUABE convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 20 Jun 2011 20:01:04 -0400
Received: by gyh3 with SMTP id 3so1615565gyh.19
        for <linux-samsung-soc@vger.kernel.org>; Mon, 20 Jun 2011 17:01:03 -0700 (PDT)
In-Reply-To: <1308555258-4322-1-git-send-email-chaos.youn@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Changhwan Youn <chaos.youn@samsung.com>, Marc Zyngier <Marc.Zyngier@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org, kgene.kim@samsung.com

Hi,

There are some boards which use the EVT0 chip. some SMDKV310 and
Universal-C210.
With this changes, it can't use these boards.

Do you want to remove EVT0 based boards?

Thank you,
Kyungmin Park

On Mon, Jun 20, 2011 at 4:34 PM, Changhwan Youn <chaos.youn@samsung.com=
> wrote:
> This patch adds implementation External GIC on EXYNOS4 SoC.
>
> Note: need to update timer codes for supporting old type of
> EXYNOS4 SoCs.
>
> [PATCH 1/7] ARM: EXYNOS4: Add external GIC io memory mapping
> [PATCH 2/7] ARM: EXYNOS4: modify interrupt mappings for external GIC
> [PATCH 3/7] ARM: EXYNOS4: set the affinity of mct1 interrupt using IR=
Q_MCT_L1
> [PATCH 4/7] ARM: GIC: move gic_chip_data structure declaration to hea=
der
> [PATCH 5/7] ARM: EXYNOS4: Add support external GIC
> [PATCH 6/7] ARM: EXYNOS4: Remove clock event timers using ARM private=
 timers
> [PATCH 7/7] ARM: EXYNOS4: Add chained enrty/exit function to uart int=
errupt handler
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsu=
ng-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>

From: Jingoo Han <jg1.han@samsung.com>
Subject: Re: [PATCH v3 0/4] ARM: dts: enable display for peach-pit and snow
 boards
Date: Mon, 12 May 2014 13:37:33 +0900
Message-ID: <001101cf6d9b$e4cea4a0$ae6bede0$%han@samsung.com>
References: <1399630186-22610-1-git-send-email-rahul.sharma@samsung.com>
 <CAPdUM4M52Au-D0O14ak053bqwTgNtPq7ozdzz3a+Z317SucrjQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:12429 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750717AbaELEhg (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 12 May 2014 00:37:36 -0400
In-reply-to: <CAPdUM4M52Au-D0O14ak053bqwTgNtPq7ozdzz3a+Z317SucrjQ@mail.gmail.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Rahul Sharma' <rahul.sharma@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 'linux-samsung-soc' <linux-samsung-soc@vger.kernel.org>, 'Kukjin Kim' <kgene.kim@samsung.com>, 'Inki Dae' <inki.dae@samsung.com>, 'Tomasz Figa' <tomasz.figa@gmail.com>, 'sunil joshi' <joshi@samsung.com>, 'Rahul Sharma' <r.sh.open@gmail.com>, 'Jingoo Han' <jg1.han@samsung.com>

On Friday, May 09, 2014 7:16 PM, Rahul Sharma wrote:
> 
> + Jingoo Han.

If you want to get Acked-by from maintainer, please add the
maintainer to CC list for all patches.

Anyway, I will review this patch. However, if you don't add me
to CC list in the future, I am not sure that I will review
your patches.

Best regards,
Jingoo Han

> 
> On 9 May 2014 15:39, Rahul Sharma <rahul.sharma@samsung.com> wrote:
> > From: Rahul Sharma <Rahul.Sharma@samsung.com>
> >
> > Add nodes for fimd and dp controller for exynos5250 based snow
> > and exynos5420 based peach-pit board.
> >
> > This series is based on Kukjin Kims, for-next branch.
> >
> > V3:
> > 1) Dropped 1 patch "ARM: dts: move dp hpd line to the board file for
> >  exynos5420".
> > 2) Extra blank lines for readability.
> > 3) dp hpd gpio name change (dp_hpd -> dp_hpd_gpio)
> >
> > V2:
> > 1) Rebase on Peach-pit dependent patches.
> >
> > It is dependent on
> > 1) Andrew Bresticker's patch for hpd gpio addition, avilable at
> > http://www.spinics.net/lists/linux-samsung-soc/msg28827.html [Patch is 'ACK'ed.]
> > 2) Arun's patch for adding peach-pit board dts file at
> > http://www.spinics.net/lists/linux-samsung-soc/msg30103.html. [Patch is 'ACK'ed.]
> >
> > Rahul Sharma (4):
> >   ARM: dts: enable fimd for exynos5250 based snow board
> >   ARM: dts: enable dp-controller for exynos5250 based snow board
> >   ARM: dts: enable fimd for exynos5420 based peach-pit board
> >   ARM: dts: enable dp-controller for exynos5420 based peach-pit board
> >
> >  arch/arm/boot/dts/exynos5250-snow.dts      |   35 ++++++++++++++++++++++++
> >  arch/arm/boot/dts/exynos5420-peach-pit.dts |   41 ++++++++++++++++++++++++++++
> >  2 files changed, 76 insertions(+)
> >
> > --
> > 1.7.9.5
> >

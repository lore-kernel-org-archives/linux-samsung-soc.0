From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 2/3] arm64: Add Kconfig option for Samsung GH7 SoC family
Date: Fri, 14 Feb 2014 18:06:12 +0100
Message-ID: <201402141806.12711.arnd@arndb.de>
References: <1392100183-30930-1-git-send-email-kgene.kim@samsung.com> <52F99056.6010906@samsung.com> <CAOesGMgdDnSc=Y8i6JYeGewCh1RPYZ_AxocxKzSD265fa2-yrA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from moutng.kundenserver.de ([212.227.126.187]:63703 "EHLO
	moutng.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752253AbaBNRG1 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 14 Feb 2014 12:06:27 -0500
In-Reply-To: <CAOesGMgdDnSc=Y8i6JYeGewCh1RPYZ_AxocxKzSD265fa2-yrA@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Olof Johansson <olof@lixom.net>
Cc: Kukjin Kim <kgene.kim@samsung.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Ilho Lee <ilho215.lee@samsung.com>, Thomas Abraham <thomas.ab@samsung.com>, Kumar Gala <galak@codeaurora.org>

On Thursday 13 February 2014, Olof Johansson wrote:
> On Mon, Feb 10, 2014 at 6:52 PM, Kukjin Kim <kgene.kim@samsung.com> wrote:
> > On 02/13/14 04:14, Arnd Bergmann wrote:
> >> On Wednesday 12 February 2014 13:04:40 Kumar Gala wrote:
> > Basically, I agreed with Arnd's suggestion to use ARCH_SBSA. Or we need to
> > define level in Kconfig like ARCH_SBSA_L1 for level1. BTW, how about
> > compliant with SBSA Level1 and having some specific features?

My feeling is that we don't need to use the levels for Kconfig, although
we might want to use them DT compatible strings, even if it ends up looking
a little funny when you do 

	compatible = "arm,sbsa-l3", "arm,sbsa-l2", "arm,sbsa-l1";

> What kind of features are you expecting though? More IP
> blocks/devices? Those are just kernel config options to enable,
> ideally as modules.

Right, I think we can just put them into defconfig. No need to
"select" them from Kconfig since the extra options wouldn't be
required for booting or using the system.

	Arnd

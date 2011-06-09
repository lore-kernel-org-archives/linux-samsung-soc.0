From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: RE: [PATCH] ARM: S5PV210: Fix build breakage due to renaming of
 S3C_VA_USB_HSPHY
Date: Thu, 09 Jun 2011 09:05:50 +0200
Message-ID: <000001cc2673$aa7cc560$ff765020$%szyprowski@samsung.com>
References: <1307532337-29348-1-git-send-email-thomas.ab@samsung.com>
 <005501cc25e3$7df601e0$79e205a0$%szyprowski@samsung.com>
 <BANLkTi=c1p7yxswvymBWS1PQeqW=+weKbQ@mail.gmail.com>
 <BANLkTinP=J07jsprzGO=+hsjMQ9C6_VBcw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:29130 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752894Ab1FIHFy (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 9 Jun 2011 03:05:54 -0400
Received: from spt2.w1.samsung.com ([210.118.77.14]) by mailout4.w1.samsung.com
 (Sun Java(tm) System Messaging Server 6.3-8.04 (built Jul 29 2009; 32bit))
 with ESMTP id <0LMI00DB6H1SXG20@mailout4.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 09 Jun 2011 08:05:52 +0100 (BST)
Received: from linux.samsung.com ([106.116.38.10])
 by spt2.w1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
 2004)) with ESMTPA id <0LMI00JSYH1RUV@spt2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 09 Jun 2011 08:05:51 +0100 (BST)
In-reply-to: <BANLkTinP=J07jsprzGO=+hsjMQ9C6_VBcw@mail.gmail.com>
Content-language: pl
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Thomas Abraham' <thomas.abraham@linaro.org>, 'Kyungmin Park' <kmpark@infradead.org>
Cc: 'arm-linux' <linux-arm-kernel@lists.infradead.org>, 'Thomas Abraham' <thomas.ab@samsung.com>, linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com

Hello,

On Wednesday, June 08, 2011 4:55 PM Thomas Abraham wrote:

> On 8 June 2011 19:43, Kyungmin Park <kmpark@infradead.org> wrote:
> > On Wed, Jun 8, 2011 at 10:53 PM, Marek Szyprowski
> > <m.szyprowski@samsung.com> wrote:
> >> Hello,
> >>
> >> There is already the patch that fixes this issue available on
> >> kgene/s5p_fixes_for_linus branch. Please check commit 08115a139 from
> >> git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git
> >>
> >> On Wednesday, June 08, 2011 1:26 PM Thomas Abraham wrote:
> >>
> >>> Commit 8f1d169f999fea892c3fcbf5a79ae8525a477572
> >>> ("ARM: EXYNOS4: Add usb host phy control") renamed S3C_VA_USB_HSPHY
> >>> to S5P_VA_USB_HSPHY in s5p-map.h file. Fix build for S5PV210 platform.
> >
> > Hi Thomas & Marek,
> 
> Hi Mr. Park,
> 
> >
> > We lived for long time with mismatch prefix.
> > So how about to clean up the mismatch prefix, S3C_* and S5P_* at this
> time?
> >
> > One method is that it just passes the physical address and driver
> > should ioremap at driver instead of static mapping.
> >
> > How do you think?
> 
> USB Phy region static mapping could be moved to driver

It's not that easy as it might look at first sight. Please note that
USBPHY registers are shared between host usb controller (PHY1 interface)
and device usb controller (PHY0 interface). You need to provide some
global arbitration mechanism for accessing usb phy registers to avoid 
registers trashing between the OHCI/EHCI and OTG drivers. That's why
having it mapped globally with some helper functions that perform 
serialization is really convenient.

> but how do we
> have handle SROMC? There is no particular driver as such for SROMC.

SROMC area is something really different. It is used only by SMDK
machines for creating a iospace for external ethernet ship. IMHO this
area should be mapped by the SMDK board startup code not the core
Exynos4 cpu code. 

> There are others such as COREPERI_BASE and DMC that do not have any
> driver.
>
> And most of the platform data and code are reusable across SoC since
> we use common macros. For example, arch/arm/plat-samsung/dev-hsmmc.c.
> If we use physical address in such cases, we will have to duplicate
> it.
> 
> As long as we can reuse s3c prefix for s5p plaforms, probably we
> should continue using them. Any new additions for S5P platforms should
> use the s5p prefix. Or we could arrive at a common consensus and stick
> to it. I prefer not to rename s3c prefixes which are reusable for s5p
> platforms.

I'm also against renaming, it will just create more confusion and
problems with rebasing patches.

Best regards
-- 
Marek Szyprowski
Samsung Poland R&D Center

From: Nicola Johnsen <nicolajohnsen@yahoo.co.uk>
Subject: Exynos5 DRM/DRI
Date: Wed, 16 Jan 2013 08:23:26 +0000 (GMT)
Message-ID: <1358324606.64464.YahooMailNeo@web133101.mail.ir2.yahoo.com>
Reply-To: Nicola Johnsen <nicolajohnsen@yahoo.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from nm21-vm0.bullet.mail.ird.yahoo.com ([212.82.108.204]:46579 "EHLO
	nm21-vm0.bullet.mail.ird.yahoo.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1754122Ab3API3p convert rfc822-to-8bit
	(ORCPT <rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 16 Jan 2013 03:29:45 -0500
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>

Hi everyone,

I'm using the latest DRM drivers for the exynos5. My code is pulling fr=
om git://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos
I have enabled Exynos FIMD and IOMMU support in the kernel configuratio=
n under DRM settings.

I'm using libdrm-2.4.40 in user space and I run Ubuntu 12. As I read th=
rough the manual of libdrm, this version has exynos support. I also loo=
ked into the source code and found exynos related code. However, it see=
ms as if libdrm and the kernel DRM framework are not communicating. Can=
 you give me any information on how I can debug the problem? Should lib=
drm-2.4.40 not be working with the latest kernel code?=A0

Many thanks for any pointers.

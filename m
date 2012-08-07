From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH V4 1/2] include/video: move fimd register headers from platform to include/video
Date: Tue, 7 Aug 2012 14:28:56 +0000
Message-ID: <201208071428.56290.arnd@arndb.de>
References: <1344342872-7904-1-git-send-email-l.krishna@samsung.com> <1344342872-7904-2-git-send-email-l.krishna@samsung.com>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from moutng.kundenserver.de ([212.227.17.9]:59074 "EHLO
	moutng.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754881Ab2HGO27 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 7 Aug 2012 10:28:59 -0400
In-Reply-To: <1344342872-7904-2-git-send-email-l.krishna@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: Leela Krishna Amudala <l.krishna@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-fbdev@vger.kernel.org, kgene.kim@samsung.com, ben-linux@fluff.org, dri-devel@lists.freedesktop.org, m.szyprowski@samsung.com

On Tuesday 07 August 2012, Leela Krishna Amudala wrote:
> 
> This patch moves the contents from regs-fb-v4.h and regs-fb.h to
> include/video/samsung_fimd.h. Also updates the header inclusion in
> machine files and driver files accordingly.
> 
> Signed-off-by: Leela Krishna Amudala <l.krishna@samsung.com>

You are missing an explanation here about why the file is moved.
It does seem like a good idea but please say why you do this.

More importantly, I don't understany why you move regs-fb-v4.h
but not regs-fb.h, which is included by the former. Also, the
only identifiers used in arch/arm from either of the two headers
are

	VIDCON0_VIDOUT_RGB
	VIDCON0_PNRMODE_RGBV
	VIDCON0_CLKSEL_LCD

	VIDCON1_INV_HSYNC
	VIDCON1_INV_VSYNC
	VIDCON1_INV_VCLK
	VIDCON1_INV_VDEN

and they are all in plat/regs-fb.h, so there is no need to
include the entire header file.

	Arnd

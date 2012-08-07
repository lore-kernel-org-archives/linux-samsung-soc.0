From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH V4 1/2] include/video: move fimd register headers from platform to include/video
Date: Tue, 7 Aug 2012 15:25:14 +0000
Message-ID: <201208071525.15032.arnd@arndb.de>
References: <1344342872-7904-1-git-send-email-l.krishna@samsung.com> <1344342872-7904-2-git-send-email-l.krishna@samsung.com> <201208071428.56290.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from moutng.kundenserver.de ([212.227.17.9]:65529 "EHLO
	moutng.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755424Ab2HGTPx (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 7 Aug 2012 15:15:53 -0400
In-Reply-To: <201208071428.56290.arnd@arndb.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: linux-fbdev@vger.kernel.org, kgene.kim@samsung.com, Leela Krishna Amudala <l.krishna@samsung.com>, dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org, m.szyprowski@samsung.com

On Tuesday 07 August 2012, Arnd Bergmann wrote:
> On Tuesday 07 August 2012, Leela Krishna Amudala wrote:
> > 
> > This patch moves the contents from regs-fb-v4.h and regs-fb.h to
> > include/video/samsung_fimd.h. Also updates the header inclusion in
> > machine files and driver files accordingly.
> > 
> > Signed-off-by: Leela Krishna Amudala <l.krishna@samsung.com>
> 
> You are missing an explanation here about why the file is moved.
> It does seem like a good idea but please say why you do this.
> 
> More importantly, I don't understany why you move regs-fb-v4.h
> but not regs-fb.h, which is included by the former.

Nevermind, I should have read your text better.

	Arnd

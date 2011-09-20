From: Baruch Siach <baruch@tkos.co.il>
Subject: Re: [PATCH 1/3] include: fb: Add definiton for window positioning
 structure
Date: Tue, 20 Sep 2011 14:24:28 +0300
Message-ID: <20110920112427.GB19695@sapphire.tkos.co.il>
References: <1316532641-2657-1-git-send-email-ajaykumar.rs@samsung.com>
 <1316532641-2657-2-git-send-email-ajaykumar.rs@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from tango.tkos.co.il ([62.219.50.35]:53424 "EHLO tango.tkos.co.il"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751623Ab1ITLZH (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 20 Sep 2011 07:25:07 -0400
Content-Disposition: inline
In-Reply-To: <1316532641-2657-2-git-send-email-ajaykumar.rs@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Ajay Kumar <ajaykumar.rs@samsung.com>
Cc: FlorianSchandinat@gmx.de, linux-samsung-soc@vger.kernel.org, linux-fbdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kgene.kim@samsung.com, banajit.g@samsung.com, jg1.han@samsung.com, lethal@linux-sh.org, ben-linux@fluff.org, m.szyprowski@samsung.com

Hi Ajay,

On Tue, Sep 20, 2011 at 11:30:39AM -0400, Ajay Kumar wrote:
> This patch adds a data structure definiton to hold framebuffer windows/planes.
> An ioctl number is also added to provide user access
> to change window position dynamically.

[snip]

> +/* Window overlaying */
> +struct fb_overlay_win_pos {
> +	__u32 win_pos_x;	/* x-offset from LCD(0,0) where window starts */
> +	__u32 win_pos_y;	/* y-offset from LCD(0,0) where window starts */
> +};

Why not allow negative offsets where the left or upper part of the framebuffer 
is hidden?

baruch

-- 
                                                     ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch@tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -

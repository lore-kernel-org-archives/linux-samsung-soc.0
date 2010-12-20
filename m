From: Paul Mundt <lethal@linux-sh.org>
Subject: Re: [PATCH] s3c-fb: add support for runtime pm
Date: Tue, 21 Dec 2010 00:58:47 +0900
Message-ID: <20101220155847.GB26766@linux-sh.org>
References: <1292571946-13595-1-git-send-email-jg1.han@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from 124x34x33x190.ap124.ftth.ucom.ne.jp ([124.34.33.190]:57729 "EHLO
	master.linux-sh.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758034Ab0LTQAS (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 20 Dec 2010 11:00:18 -0500
Content-Disposition: inline
In-Reply-To: <1292571946-13595-1-git-send-email-jg1.han@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Jingoo Han <jg1.han@samsung.com>
Cc: linux-fbdev@vger.kernel.org, linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org, Ilho Lee <ilho215.lee@samsung.com>

On Fri, Dec 17, 2010 at 04:45:46PM +0900, Jingoo Han wrote:
> This patch adds support for runtime pm using the functions.
>  - pm_runtime_get_sync()
>  - pm_runtime_put_sync()
> 
> pm_runtime_get_sync() and pm_runtime_put_sync() are called when
> open or release function of framebufer driver is called to inform
> the system if hardware is idle or not.
> 
> Signed-off-by: Jingoo Han <jg1.han@samsung.com>

Barring any objections, I'll apply it, thanks.

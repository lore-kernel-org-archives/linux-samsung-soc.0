From: Vasily Khoruzhick <anarsoul@gmail.com>
Subject: Re: [PATCH v2] ARM: s3c2442: Setup gpio {set,get}_pull callbacks
Date: Mon, 8 Nov 2010 11:08:11 +0200
Message-ID: <201011081108.12516.anarsoul@gmail.com>
References: <1285020052-20020-1-git-send-email-lars@metafoo.de> <1289030074-5233-1-git-send-email-anarsoul@gmail.com> <4CD57DC1.4050403@embtoolkit.org>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ey0-f174.google.com ([209.85.215.174]:36869 "EHLO
	mail-ey0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754166Ab0KHJIs (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 8 Nov 2010 04:08:48 -0500
Received: by eye27 with SMTP id 27so2625554eye.19
        for <linux-samsung-soc@vger.kernel.org>; Mon, 08 Nov 2010 01:08:47 -0800 (PST)
In-Reply-To: <4CD57DC1.4050403@embtoolkit.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, Vasily Khoruzhick <anarsoul@gmail.com>, Lars-Peter Clausen <lars@metafoo.de>, linux-samsung-soc@vger.kernel.org
Cc: Abdoulaye Walsimou GAYE <awg@embtoolkit.org>, ben-linux@fluff.org

On Saturday 06 November 2010 18:09:37 Abdoulaye Walsimou GAYE wrote:

Restored CC list, please don't clean it next time.

> > -	.set_pull	= s3c_gpio_setpull_1up,
> > -	.get_pull	= s3c_gpio_getpull_1up,
> > 
> >   };
> 
> This part of your patch will prevent s3c2440 based boards to boot see [1]

Well, your patch breaks compilation for s3c2442 at all (see comment from my 
patch)

Ben, why machine-specific init is called before cpu init?

Regards
Vasily

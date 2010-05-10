From: Yauhen Kharuzhy <jekhor@gmail.com>
Subject: Re: S3C6410 power management support status
Date: Mon, 10 May 2010 17:27:22 +0300
Message-ID: <20100510142721.GA32413@jeknote.loshitsa1.net>
References: <20100429124509.GA11290@jeknote.loshitsa1.net>
 <20100504002420.GQ6684@trinity.fluff.org>
 <20100506144955.GA24641@jeknote.loshitsa1.net>
 <20100510023537.GW26401@trinity.fluff.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-fx0-f46.google.com ([209.85.161.46]:42788 "EHLO
	mail-fx0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751397Ab0EJO1p (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 10 May 2010 10:27:45 -0400
Received: by fxm7 with SMTP id 7so138013fxm.19
        for <linux-samsung-soc@vger.kernel.org>; Mon, 10 May 2010 07:27:43 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <20100510023537.GW26401@trinity.fluff.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Ben Dooks <ben-linux@fluff.org>
Cc: Yauhen Kharuzhy <yauhen.kharuzhy@promwad.com>, linux-arm-kernel@lists.infradead.org, Viktar Palstsiuk <viktar.palstsiuk@promwad.com>, linux-samsung-soc@vger.kernel.org, Vladimir Davydov <vladimir.davydov@promwad.com>

On Mon, May 10, 2010 at 03:35:37AM +0100, Ben Dooks wrote:
> > Can anybody check suspend mode with SMDK6410 and confirm that StR works
> > on it? If it works, we will stop to ask stupid questions and will find
> > our hardware bugs :)
> 
> It does seem to work on this SMDK, and the XPWRTGON line on TP7 definetly
> goes low during sleep.
> 
> Note, not sure if I will post the buttons patches as the SMDK's single
> buttons share interrupts with the LAN and other devices, making them
> rather useless (my SMDK6410 has EINT10 held permanently active by the
> unused network devices...)

Thanks for your help. Last question: which U-Boot (or another
bootloader) you use?

-- 
Yauhen Kharuzhy		jekhor _at_ gmail.com
			JID: jek@jabber.ru

A: No
Q: Should I quote below my post?

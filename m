From: Ben Dooks <ben-linux@fluff.org>
Subject: Re: S3C6410 power management support status
Date: Tue, 11 May 2010 01:20:01 +0100
Message-ID: <20100511002001.GZ26401@trinity.fluff.org>
References: <20100429124509.GA11290@jeknote.loshitsa1.net> <20100504002420.GQ6684@trinity.fluff.org> <20100506144955.GA24641@jeknote.loshitsa1.net> <20100510023537.GW26401@trinity.fluff.org> <20100510142721.GA32413@jeknote.loshitsa1.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from trinity.fluff.org ([89.16.178.74]:38109 "EHLO trinity.fluff.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751417Ab0EKAUH (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 10 May 2010 20:20:07 -0400
Content-Disposition: inline
In-Reply-To: <20100510142721.GA32413@jeknote.loshitsa1.net>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Yauhen Kharuzhy <jekhor@gmail.com>
Cc: Ben Dooks <ben-linux@fluff.org>, Yauhen Kharuzhy <yauhen.kharuzhy@promwad.com>, linux-arm-kernel@lists.infradead.org, Viktar Palstsiuk <viktar.palstsiuk@promwad.com>, linux-samsung-soc@vger.kernel.org, Vladimir Davydov <vladimir.davydov@promwad.com>

On Mon, May 10, 2010 at 05:27:22PM +0300, Yauhen Kharuzhy wrote:
> On Mon, May 10, 2010 at 03:35:37AM +0100, Ben Dooks wrote:
> > > Can anybody check suspend mode with SMDK6410 and confirm that StR works
> > > on it? If it works, we will stop to ask stupid questions and will find
> > > our hardware bugs :)
> > 
> > It does seem to work on this SMDK, and the XPWRTGON line on TP7 definetly
> > goes low during sleep.
> > 
> > Note, not sure if I will post the buttons patches as the SMDK's single
> > buttons share interrupts with the LAN and other devices, making them
> > rather useless (my SMDK6410 has EINT10 held permanently active by the
> > unused network devices...)
> 
> Thanks for your help. Last question: which U-Boot (or another
> bootloader) you use?

The uboot supplied on this SMDK.

-- 
Ben

Q:      What's a light-year?
A:      One-third less calories than a regular year.

From: Ben Dooks <ben-linux@fluff.org>
Subject: Re: Revised patches for PCM Controller driver
Date: Wed, 4 Nov 2009 09:33:15 +0000
Message-ID: <20091104093314.GM23772@trinity.fluff.org>
References: <1257323264-18363-1-git-send-email-jassisinghbrar@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from trinity.fluff.org ([89.16.178.74]:45967 "EHLO trinity.fluff.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750732AbZKDJdL (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 4 Nov 2009 04:33:11 -0500
Content-Disposition: inline
In-Reply-To: <1257323264-18363-1-git-send-email-jassisinghbrar@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: jassisinghbrar@gmail.com
Cc: linux-samsung-soc@vger.kernel.org, Jassi Brar <jassi.brar@samsung.com>

On Wed, Nov 04, 2009 at 05:27:44PM +0900, jassisinghbrar@gmail.com wrote:
> From: Jassi Brar <jassi.brar@samsung.com>
> 
> Acting upon the inputs given by Mark and Ben, I have revised the code.
> A few points to be noted:-
> 
> 1) The prefix s3c24xx_pcm_ in the platform driver has been changed to
>    more neutral s3c_audio_

Not a fan of renaming, but I suppose this has some merit. I'll make
some comments about this in the series, I think life could be made
enater if some of these are cleaned up.

It may be worth opening a discussion on the alsa list about renaming the
entire directory to samsung instead of s3c.
 
> 2) ALSA platform driver s3c24xx-pcm.c/h have been renamed s3c-audio.c/h
>    since the 'pcm' part will cause ambiguity once PCM Controller driver
>    is added. Also, since it is not just for 24xx, the part is dropped
>    from the prefix.
>    Ofcourse, evey dependent code has been modified to include differently
>    named, otherwise same, header s3c-audio.h

ok.
 
> 3) arch/arm/plat-s3c/include/plat/audio.h has been restored by with only
>    necessary data structures.
>    Having callbacks to configure controller pins appropriately is necessary
>    if the driver is to handle more than one SoC type.
>    Currently only callback to configure gpios has been defined, the data
>    structure will grow as and when needed.

This seems ok, the old one wasn't being used.
 
> 4) The PCM controller platform devices have been defined in the apparently
>    common arch/arm/plat-s3c64xx/dev-audio.c rather than a new PCM specific one.

This'll be shaken up by my dev changes... will try and take into account
of these patches before this change is done.
 
> 5) Here comes the tricky one.
>    Breaking away from S3C convention, I have defined PCM controller register
>    offsets and bit fields in sound/soc/s3c24xx/s3c-pcm.h instead of some
>    platform/arch specific header.
>    The reason for the move is that usually the device controllers depend upon
>    platform type only as far as their base mapping address goes. Otherwise
>    just one or two 'types' of same devices serve most SoCs.
>    Having those definitions besides the driver helps avoid copyng the same
>    definitions for each platform that essentially have the same device controller.

I'll have a look at that one.

Can you ensure that you send patches with rename detection enabled, it
would make it easier working out what has been changed.

-- 
Ben

Q:      What's a light-year?
A:      One-third less calories than a regular year.

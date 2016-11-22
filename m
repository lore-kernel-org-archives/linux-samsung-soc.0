From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: commit 4dd1837d7589f468ed109556513f476e7a7f9121 breaks build
Date: Tue, 22 Nov 2016 12:11:41 +0100
Message-ID: <11556597.ehuL0N36ia@wuerfel>
References: <58310EC6.4020402@math.uni-bielefeld.de> <alpine.LFD.2.20.1611201131300.1814@knanqh.ubzr> <20161120172248.GW1041@n2100.armlinux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([212.227.126.135]:61994 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932708AbcKVLMM (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 22 Nov 2016 06:12:12 -0500
In-Reply-To: <20161120172248.GW1041@n2100.armlinux.org.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: Russell King - ARM Linux <linux@armlinux.org.uk>, Nicolas Pitre <nicolas.pitre@linaro.org>, Tobias Jakobi <tjakobi@math.uni-bielefeld.de>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, viro@zeniv.linux.org.uk, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Sunday, November 20, 2016 5:22:48 PM CET Russell King - ARM Linux wrote:
> - not touching:
>         arch/arm/lib/csumpartialcopy.S
>         arch/arm/lib/csumpartialcopygeneric.S
>         arch/arm/lib/csumpartialcopyuser.S
> 
> other than that, it's doing the same thing.
> 
> I think Arnd's changes to the csumpartial code are unnecessary, and
> yours is, although larger, puts the asm/export.h include in the right
> place.  So please drop yours into the patch system so we can move
> forward fixing some of the problems created during the last merge
> window.

Right, the csumpartialcopy*.S changes are no longer needed after
commit cc6acc11cad1 ("kbuild: be more careful about matching
preprocessed asm ___EXPORT_SYMBOL") solves the problem more
generally.

I've submitted a new version of my patch, now just adding the
one header file that is needed to get MODVERSIONS back working,
plus the second patch for mmiocpy/mmioset to partially revert
Al's original change.

	Arnd

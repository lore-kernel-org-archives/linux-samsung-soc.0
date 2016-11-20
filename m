From: Russell King - ARM Linux <linux@armlinux.org.uk>
Subject: Re: commit 4dd1837d7589f468ed109556513f476e7a7f9121 breaks build
Date: Sun, 20 Nov 2016 11:30:08 +0000
Message-ID: <20161120113007.GS1041@n2100.armlinux.org.uk>
References: <58310EC6.4020402@math.uni-bielefeld.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from pandora.armlinux.org.uk ([78.32.30.218]:38058 "EHLO
        pandora.armlinux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753366AbcKTLaU (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sun, 20 Nov 2016 06:30:20 -0500
Content-Disposition: inline
In-Reply-To: <58310EC6.4020402@math.uni-bielefeld.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
Cc: viro@zeniv.linux.org.uk, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>

None of the autobuilders are finding this problem, and they build a
wide range of configurations.  Maybe it's something specific to how
you're building the kernel - can you give step by step instructions
how to reproduce this please?

On Sun, Nov 20, 2016 at 03:47:34AM +0100, Tobias Jakobi wrote:
> Hello,
> 
> this is a resend of my initial mail, see below, to Al Viro (which sadly
> was ignored).
> 
> It's rc5 now, and this issue still remains. Putting some more lists on
> the Cc now.
> 
> Reverting the commit still works for me.
> 
> 
> With best wishes,
> Tobias
> 
> ----------------
> 
> 
> Hello Al,
> 
> compiled a kernel on armv7 with torvalds/master today and getting some
> errors during the modpost phase.
> 
> > ERROR: "_set_bit" [sound/usb/snd-usbmidi-lib.ko] undefined!
> > ERROR: "_test_and_set_bit" [sound/usb/snd-usbmidi-lib.ko] undefined!
> > ERROR: "_clear_bit" [sound/usb/snd-usbmidi-lib.ko] undefined!
> > ERROR: "_test_and_clear_bit" [sound/usb/snd-usb-audio.ko] undefined!
> > ERROR: "_set_bit" [sound/usb/snd-usb-audio.ko] undefined!
> > ERROR: "_test_and_set_bit" [sound/usb/snd-usb-audio.ko] undefined!
> > ERROR: "_clear_bit" [sound/usb/snd-usb-audio.ko] undefined!
> > ERROR: "_test_and_clear_bit" [sound/core/seq/snd-seq.ko] undefined!
> <snip>
> 
> It seems like the commit 'arm: move exports to definitions' introduces
> this issue.
> 
> I quickly went over the commit and I noticed that while it removes the
> EXPORT_SYMBOL()s for the bitops from armksyms.c, it doesn't move them
> anywhere.
> 
> Maybe you can take a look at this?
> 
> With best wishes,
> Tobias
> 
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

-- 
RMK's Patch system: http://www.armlinux.org.uk/developer/patches/
FTTC broadband for 0.8mile line: currently at 9.6Mbps down 400kbps up
according to speedtest.net.

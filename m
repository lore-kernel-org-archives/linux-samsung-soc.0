From: "Steinar H. Gunderson" <sgunderson@bigfoot.com>
Subject: Re: Endless "supply vcc not found, using dummy regulator"
Date: Tue, 24 May 2016 17:26:38 +0200
Message-ID: <20160524152638.GA20341@sesse.net>
References: <20160521144308.GA13960@sesse.net>
 <20160523134737.GA21683@sesse.net>
 <20160523144047.GA36908@sesse.net>
 <20160523162455.GW8206@sirena.org.uk>
 <20160523170617.GA8997@sesse.net>
 <CAJKOXPds5PgVmcYLEOriyL-a6tp0jkg7x0GTjPZaN9YLL_gO_A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from cassarossa.samfundet.no ([193.35.52.29]:39049 "EHLO
	cassarossa.samfundet.no" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752518AbcEXP0s (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 24 May 2016 11:26:48 -0400
Content-Disposition: inline
In-Reply-To: <CAJKOXPds5PgVmcYLEOriyL-a6tp0jkg7x0GTjPZaN9YLL_gO_A@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Cc: Mark Brown <broonie@debian.org>, linux-samsung-soc@vger.kernel.org, 823552@bugs.debian.org

On Tue, May 24, 2016 at 05:06:43PM +0200, Krzysztof Kozlowski wrote:
> I looked quickly through the thread and I am not sure what is exactly
> your problem.

My immediate problem is that the repeated (deferred) probing is causing so
much logging that the system doesn't actually boot. The root causes are a bit
more complex and muddy (see my previous email for a breakdown).

> I understood that the Exynos dwc3 driver is leaking the
> PHY. That is a good catch but your patch is not sufficient. You should
> clean up starting from devm_clk_get() error. Unless you are fixing
> this for different kernel version.

I have zero idea how all of this is supposed to be connected, much less how
DWC3 works or what the driver is supposed to do. I'm just an end user trying
to figure out why my system didn't boot. :-)

Which devm_clk_get() error are you talking about? The one with susp_clk?
That's an interesting case because a) nothing actually uses susp_clk
(it's dead code, presumably waiting for further patches), and b) there was a
commit not too long ago (42f69a02) upgrading the message from dev_dbg to
dev_info for reasons I don't understand, making the problem worse.
(The commit message had an argument that I could accept for changing _to_
dbg, but not the other way round.)

> Please send an appropriate separate patch for fixing this. Your email
> did not reach people, I think.

I only sent one patch so far, namely the leak fix.

> What other problems exactly do you have? Late binding of S2MPS11
> regulator driver? That does not look like a problem. If it is built as
> a module then it should be loaded, probably from initramfs because
> these are regulators.

In this specific case, Debian's initramfs has neglected to include the i2c
driver in the initramfs, so the regulator doesn't come up until the boot is
out of the initramfs. That's probably a bug in its own right, and fixing it
reduces the amount of messages by a _lot_, but even so, it sounds to me like
the kernel should be able to boot without that fix.

/* Steinar */
-- 
Homepage: https://www.sesse.net/

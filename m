From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [PATCH V4 1/4] ASoC: Samsung: I2S: Add quirks as driver data
 in I2S
Date: Tue, 13 Aug 2013 09:42:28 -0600
Message-ID: <520A53E4.309@wwwdotorg.org>
References: <1376300994-1679-1-git-send-email-padma.v@samsung.com> <1376300994-1679-2-git-send-email-padma.v@samsung.com> <52096871.4030703@wwwdotorg.org> <20130812231327.GK6427@sirena.org.uk> <52096D4A.5070903@wwwdotorg.org> <20130812234603.GM6427@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from avon.wwwdotorg.org ([70.85.31.133]:37149 "EHLO
	avon.wwwdotorg.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758237Ab3HMPuQ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 13 Aug 2013 11:50:16 -0400
In-Reply-To: <20130812234603.GM6427@sirena.org.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: Padmavathi Venna <padma.v@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, alsa-devel@alsa-project.org, devicetree@vger.kernel.org, padma.kvr@gmail.com, kgene.kim@samsung.com, tomasz.figa@gmail.com, abrestic@chromium.org, Mark Rutland <Mark.Rutland@arm.com>, Ian Campbell <ian.campbell@citrix.com>, Pawel Moll <pawel.moll@arm.com>, Rob Herring <rob.herring@calxeda.com>, Kumar Gala <galak@codeaurora.org>

On 08/12/2013 05:46 PM, Mark Brown wrote:
> On Mon, Aug 12, 2013 at 05:18:34PM -0600, Stephen Warren wrote:
>> On 08/12/2013 05:13 PM, Mark Brown wrote:
> 
>>>> (although I dare say that at least samsung,supports-rstclr
>>>> should be modified to use the new reset controller bindings)
> 
>>> Really?  That doesn't seem terribly sane - I had thought that
>>> was for bodging resets on the side of things that don't
>>> normally have them or need board specific logic.  Also note
>>> that this is actually a magic register write done to reset the
>>> IP on some specific IPs.
> 
>> I believe that's exactly what the reset subsystem and associated
>> DT bindings were designed for.
> 
> That seems...  interesting.  It seems like this is fairly core
> device functionality I'd expect the driver to just be able to
> understand;  the main thing this property was doing was deciding if
> the reset was needed. I'm not sure I see the benefit here?

Sorry, I'm confused here. In this case, the reset is something
internal to the IP module, not sourced by an external reset
controller, so there's no need to involve the reset controller
bindings or subsystem.

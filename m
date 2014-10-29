From: Kevin Hilman <khilman@kernel.org>
Subject: Re: [PATCH 3/4] PM / Domains: Improve error handling while adding/removing devices
Date: Wed, 29 Oct 2014 16:53:50 -0700
Message-ID: <7h8ujy5t69.fsf@deeprootsystems.com>
References: <1414507090-516-1-git-send-email-ulf.hansson@linaro.org>
	<1414507090-516-4-git-send-email-ulf.hansson@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-pm-owner@vger.kernel.org>
In-Reply-To: <1414507090-516-4-git-send-email-ulf.hansson@linaro.org> (Ulf
	Hansson's message of "Tue, 28 Oct 2014 15:38:09 +0100")
Sender: linux-pm-owner@vger.kernel.org
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: "Rafael J. Wysocki" <rjw@rjwysocki.net>, Len Brown <len.brown@intel.com>, Pavel Machek <pavel@ucw.cz>, linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>, Alan Stern <stern@rowland.harvard.edu>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Tomasz Figa <tomasz.figa@gmail.com>, Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, Ben Dooks <ben-linux@fluff.org>, Kukjin Kim <kgene.kim@samsung.com>, Philipp Zabel <philipp.zabel@gmail.com>, Mark Brown <broonie@kernel.org>, Wolfram Sang <wsa@the-dreams.de>, Russell King <linux@arm.linux.org.uk>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Jack Dai <jack.dai@rock-chips.com>, Jinkun Hong <jinkun.hong@rock-chips.com>, Aaron Lu <aaron.lu@intel.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

Ulf Hansson <ulf.hansson@linaro.org> writes:

> To improve error handling while adding/removing devices from their PM
> domains, we need to restructure the code a bit. Let's do this by moving
> the device specific parts into a separate function.
>
> Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>

This looks like just restructuring, but with these kinds of patches, its
hard to be sure that it's just refactoring, with no functional changes,
so it's nice to be clear in the changelog whether there are (meant to
be) any functional changes.

Kevin

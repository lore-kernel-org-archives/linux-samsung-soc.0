From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: [alsa-devel] [PATCHv2 05/10] ASoC: AC97: SMDK: Add wm9713
	machine driver
Date: Fri, 29 Jan 2010 09:55:58 +0000
Message-ID: <20100129095558.GB19270@sirena.org.uk>
References: <1264571959-15115-1-git-send-email-jassisinghbrar@gmail.com> <20100128120020.GA19270@sirena.org.uk> <1b68c6791001281708ve324caaoa52581e3ebce09bd@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from cassiel.sirena.org.uk ([80.68.93.111]:38639 "EHLO
	cassiel.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754593Ab0A2J4B (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 29 Jan 2010 04:56:01 -0500
Content-Disposition: inline
In-Reply-To: <1b68c6791001281708ve324caaoa52581e3ebce09bd@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: jassi brar <jassisinghbrar@gmail.com>
Cc: alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org, Jassi Brar <jassi.brar@samsung.com>, ben-linux@fluff.org, linux-arm-kernel@lists.infradead.org, lrg@slimlogic.co.uk

On Fri, Jan 29, 2010 at 10:08:04AM +0900, jassi brar wrote:

> I will submit a patch for it, though I used exact control names and their
> values before every command.

Normally the renumbering happens as a result of a source code change
such as the addition of a new control or some change in ALSA core.

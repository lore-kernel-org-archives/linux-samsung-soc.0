From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: [PATCH 4/4] S3C64XX DSP: Added the CPU driver for PCM
	controllers
Date: Mon, 2 Nov 2009 11:56:55 +0000
Message-ID: <20091102115654.GH29351@sirena.org.uk>
References: <1257127791-5595-1-git-send-email-jassisinghbrar@gmail.com> <1257127791-5595-2-git-send-email-jassisinghbrar@gmail.com> <1257127791-5595-3-git-send-email-jassisinghbrar@gmail.com> <1257127791-5595-4-git-send-email-jassisinghbrar@gmail.com> <20091102111753.GB29351@sirena.org.uk> <20091102113932.GB23772@trinity.fluff.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from cassiel.sirena.org.uk ([80.68.93.111]:53897 "EHLO
	cassiel.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754297AbZKBL4v (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 2 Nov 2009 06:56:51 -0500
Content-Disposition: inline
In-Reply-To: <20091102113932.GB23772@trinity.fluff.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Ben Dooks <ben@trinity.fluff.org>
Cc: jassisinghbrar@gmail.com, linux-samsung-soc@vger.kernel.org, Jassi Brar <jassi.brar@samsung.com>

On Mon, Nov 02, 2009 at 11:39:32AM +0000, Ben Dooks wrote:

> I would like to see platform_devices with their proper resources being
> mandatory for new drivers. We could do with this lot proplerly following
> the device driver model.

Actually, from that point of view the whole probe function should just
be rolled into one anyway - there is exactly one caller of the sub
function.

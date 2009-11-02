From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: S3C64XX DSP support added
Date: Mon, 2 Nov 2009 10:42:13 +0000
Message-ID: <20091102104211.GA29351@sirena.org.uk>
References: <1257127774-5564-1-git-send-email-jassisinghbrar@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from cassiel.sirena.org.uk ([80.68.93.111]:60197 "EHLO
	cassiel.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754257AbZKBKmJ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 2 Nov 2009 05:42:09 -0500
Content-Disposition: inline
In-Reply-To: <1257127774-5564-1-git-send-email-jassisinghbrar@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: jassisinghbrar@gmail.com
Cc: linux-samsung-soc@vger.kernel.org, Jassi Brar <jassi.brar@samsung.com>

On Mon, Nov 02, 2009 at 11:09:34AM +0900, jassisinghbrar@gmail.com wrote:
> From: Jassi Brar <jassi.brar@samsung.com>
> 
> next coming are patches for review before I submit them mainline.
> thanks.

If nothing else these need a better name - the name suggests that
they're a DSP when in fact they are actually implementing support for
the PCM interface.  You might want to rename the existing PCM driver to
DMA.

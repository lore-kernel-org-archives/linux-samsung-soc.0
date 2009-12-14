From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: [PATCH 2/7] ARM: S5P6440: CPU initialization
Date: Mon, 14 Dec 2009 11:49:19 +0000
Message-ID: <20091214114919.GB1250@sirena.org.uk>
References: <1260525250-4160-1-git-send-email-kgene.kim@samsung.com> <1b68c6790912122347p6fa6cf99jf4c733e666a15f8f@mail.gmail.com> <001001ca7cb1$ce63e7f0$6b2bb7d0$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from cassiel.sirena.org.uk ([80.68.93.111]:52628 "EHLO
	cassiel.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757002AbZLNLtX (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 14 Dec 2009 06:49:23 -0500
Content-Disposition: inline
In-Reply-To: <001001ca7cb1$ce63e7f0$6b2bb7d0$%kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: 'jassi brar' <jassisinghbrar@gmail.com>, linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org, 'Adityapratap Sharma' <aditya.ps@samsung.com>, 'Thomas Abraham' <thomas.ab@samsung.com>, 'Atul Dahiya' <atul.dahiya@samsung.com>

On Mon, Dec 14, 2009 at 08:37:24PM +0900, Kukjin Kim wrote:

> Ok, as I already reply another posting, I couldn't consider patch
> atomicity. And all(almost?) my patches need so that can support
> s5p6440. Of course they can be modified.

Normally what's done for things like that is to arrange to put the
Makefile and Kconfig patches in a separate patch at the end of the
series, that way it doesn't matter if the code in the earlier part of
the series won't build since it won't get picked up by the build system.

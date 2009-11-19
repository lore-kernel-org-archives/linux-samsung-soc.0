From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: [PATCH 09/19] drivers: serial: add support for Samsung S5PC110
	SoC uart
Date: Thu, 19 Nov 2009 10:33:36 +0000
Message-ID: <20091119103336.GB15460@sirena.org.uk>
References: <1258551194-16018-1-git-send-email-m.szyprowski@samsung.com> <1258551194-16018-10-git-send-email-m.szyprowski@samsung.com> <1b68c6790911180614y355f656fs828177ecc845ec8e@mail.gmail.com> <20091118221345.GB4808@trinity.fluff.org> <1b68c6790911181844p3fb32525h11f79f942afb2d64@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from cassiel.sirena.org.uk ([80.68.93.111]:38894 "EHLO
	cassiel.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753469AbZKSKdd (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 19 Nov 2009 05:33:33 -0500
Content-Disposition: inline
In-Reply-To: <1b68c6790911181844p3fb32525h11f79f942afb2d64@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: jassi brar <jassisinghbrar@gmail.com>
Cc: Ben Dooks <ben-linux@fluff.org>, kyungmin.park@samsung.com, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Marek Szyprowski <m.szyprowski@samsung.com>

On Thu, Nov 19, 2009 at 11:44:14AM +0900, jassi brar wrote:

> Let each platform code(SoC specific) define names of all possible
> source clocks and let the board init code pass on the potential source
> clocks by some bit-mask(or some other mechanism) while setting the
> platform data.

This is going to set off warnings from a clock API point of view -
passing clock names around in platform data is usually a sign that
something is very wrong.  Keeping the mapping inside the clock API
(still controlled by the board driver but by telling the clock API that
device X should use clock Y).

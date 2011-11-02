From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: [PATCH v2] gpio/samsung: Add device tree support for Exynos4
Date: Wed, 2 Nov 2011 13:11:12 +0000
Message-ID: <20111102131112.GD27100@sirena.org.uk>
References: <1320108227-2693-1-git-send-email-thomas.abraham@linaro.org>
 <4EAFAC42.5080607@gmail.com>
 <CAJuYYwSfjg04gaJUgNkUzFNgs5d_7PL9nio-1RwrPizyShTxGQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from cassiel.sirena.org.uk ([80.68.93.111]:59944 "EHLO
	cassiel.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753105Ab1KBNLW (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 2 Nov 2011 09:11:22 -0400
Content-Disposition: inline
In-Reply-To: <CAJuYYwSfjg04gaJUgNkUzFNgs5d_7PL9nio-1RwrPizyShTxGQ@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Thomas Abraham <thomas.abraham@linaro.org>
Cc: Sylwester Nawrocki <snjw23@gmail.com>, kgene.kim@samsung.com, arnd@arndb.de, devicetree-discuss@lists.ozlabs.org, rob.herring@calxeda.com, grant.likely@secretlab.ca, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org

On Wed, Nov 02, 2011 at 06:35:05PM +0530, Thomas Abraham wrote:
> On 1 November 2011 13:52, Sylwester Nawrocki <snjw23@gmail.com> wrote:

> > It doesn't give as much advantage, and introduces an overhead of doing
> > an additional remapping. However I find current mapping of the DT specifier
> > values to real driver strength slightly confusing.
> > Perhaps unlikely, the future SoCs could have different meaning of the
> > register values.

> The dts file describes the hardware and the drive strength values
> listed above are as per the Exynos4 SoC user manual. I would prefer to
> do it the way you suggested, but that would mean dts is not exactly
> matching the hardware manual.

On the other hand it does mean that the user can directly read the
values - there's nothing that obviously tells the user that the binding
is using datasheet register values rather than the actual driver
strength numbers and given that software is supposed to provide an
abstraction to make things easier it seems reasonably natural to assume
the latter.

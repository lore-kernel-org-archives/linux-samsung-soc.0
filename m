From: Russell King - ARM Linux <linux@arm.linux.org.uk>
Subject: Re: [RFC PATCH 01/11] dma: amba-pl08x: Use bitmap to pass variant
	specific quirks
Date: Mon, 17 Jun 2013 19:48:56 +0100
Message-ID: <20130617184856.GN2718@n2100.arm.linux.org.uk>
References: <1371416058-22047-1-git-send-email-tomasz.figa@gmail.com> <1371416058-22047-2-git-send-email-tomasz.figa@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from caramon.arm.linux.org.uk ([78.32.30.218]:43150 "EHLO
	caramon.arm.linux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751090Ab3FQStR (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 17 Jun 2013 14:49:17 -0400
Content-Disposition: inline
In-Reply-To: <1371416058-22047-2-git-send-email-tomasz.figa@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <tomasz.figa@gmail.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org, alsa-devel@alsa-project.org, Kukjin Kim <kgene.kim@samsung.com>, Vinod Koul <vinod.koul@intel.com>, Dan Williams <djbw@fb.com>, Linus Walleij <linus.walleij@linaro.org>, Alessandro Rubini <rubini@gnudd.com>, Giancarlo Asnaghi <giancarlo.asnaghi@st.com>, Mark Brown <broonie@kernel.org>, Grant Likely <grant.likely@linaro.org>, Sangbeom Kim <sbkim73@samsung.com>, Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.de>, Padmavathi Venna <padma.v@samsung.com>, Thomas Abraham <thomas.abraham@linaro.org>, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, Heiko =?iso-8859-1?Q?St=FCbner?= <heiko@sntech.de>, Sylwester Nawrocki <sylvester.nawrocki@gmail.com>, Alban Bedel <alban.bedel@avionic->

On Sun, Jun 16, 2013 at 10:54:08PM +0200, Tomasz Figa wrote:
> Instead of defining new bool field in vendor_data struct for each quirk,
> it is more reasonable to use a single flags field and make each quirk
> use single bits.

Please explain why this is better over the existing system, and why it is
not just churn for code modification's sake.

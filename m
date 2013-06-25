From: Vinod Koul <vinod.koul@intel.com>
Subject: Re: [RFC PATCH v2 02/12] dmaengine: PL08x: Add support for
 different offset of CONFIG register
Date: Tue, 25 Jun 2013 21:04:40 +0530
Message-ID: <20130625153440.GP23141@intel.com>
References: <1371933764-24875-1-git-send-email-tomasz.figa@gmail.com>
 <1371933764-24875-3-git-send-email-tomasz.figa@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mga14.intel.com ([143.182.124.37]:32229 "EHLO mga14.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751274Ab3FYQPI (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 25 Jun 2013 12:15:08 -0400
Content-Disposition: inline
In-Reply-To: <1371933764-24875-3-git-send-email-tomasz.figa@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <tomasz.figa@gmail.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org, alsa-devel@alsa-project.org, Kukjin Kim <kgene.kim@samsung.com>, Dan Williams <djbw@fb.com>, Linus Walleij <linus.walleij@linaro.org>, Alessandro Rubini <rubini@gnudd.com>, Giancarlo Asnaghi <giancarlo.asnaghi@st.com>, Mark Brown <broonie@kernel.org>, Grant Likely <grant.likely@linaro.org>, Sangbeom Kim <sbkim73@samsung.com>, Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.de>, Padmavathi Venna <padma.v@samsung.com>, Thomas Abraham <thomas.abraham@linaro.org>, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, Heiko =?iso-8859-1?Q?St=FCbner?= <heiko@sntech.de>, Sylwester Nawrocki <sylvester.nawrocki@gmail.com>, Russell King - ARM Linux <linux@arm.linux.org.uk>, Alban Bedel <alba>

On Sat, Jun 22, 2013 at 10:42:34PM +0200, Tomasz Figa wrote:
> Some variants of PL08x (namely PL080S, found in Samsung S3C64xx SoCs)
> have CONFIG register at different offset. This patch makes the driver
> use offset from vendor data struct.
> 
> Signed-off-by: Tomasz Figa <tomasz.figa@gmail.com>
Acked-by: Vinod Koul <vinod.koul@intel.com>

--
~Vinod

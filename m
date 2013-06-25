From: Vinod Koul <vinod.koul@intel.com>
Subject: Re: [RFC PATCH v2 05/12] dmaengine: PL08x: Add support for
 different maximum transfer size
Date: Tue, 25 Jun 2013 21:40:04 +0530
Message-ID: <20130625161003.GQ23141@intel.com>
References: <1371933764-24875-1-git-send-email-tomasz.figa@gmail.com>
 <1371933764-24875-6-git-send-email-tomasz.figa@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1371933764-24875-6-git-send-email-tomasz.figa@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Tomasz Figa <tomasz.figa@gmail.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org, alsa-devel@alsa-project.org, Kukjin Kim <kgene.kim@samsung.com>, Dan Williams <djbw@fb.com>, Linus Walleij <linus.walleij@linaro.org>, Alessandro Rubini <rubini@gnudd.com>, Giancarlo Asnaghi <giancarlo.asnaghi@st.com>, Mark Brown <broonie@kernel.org>, Grant Likely <grant.likely@linaro.org>, Sangbeom Kim <sbkim73@samsung.com>, Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.de>, Padmavathi Venna <padma.v@samsung.com>, Thomas Abraham <thomas.abraham@linaro.org>, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, Heiko =?iso-8859-1?Q?St=FCbner?= <heiko@sntech.de>, Sylwester Nawrocki <sylvester.nawrocki@gmail.com>, Russell King - ARM Linux <linux@arm.linux.org.uk>, Alban Bedel <alba>
List-Id: linux-samsung-soc@vger.kernel.org

On Sat, Jun 22, 2013 at 10:42:37PM +0200, Tomasz Figa wrote:
> PL080S has separate register to store transfer size in, allowing single
> transfer to be much larger than in standard PL080.
> 
> This patch makes the amba-pl08x driver aware of this and removes writing
> transfer size to reserved bits of CH_CONTROL register on PL080S, which
> was not a problem witn transfer sizes fitting the original bitfield
> of PL080, but now would overwrite other fields.
> 
> Signed-off-by: Tomasz Figa <tomasz.figa@gmail.com>
Acked by: Vinod Koul <vinod.koul@intel.com>

--
~Vinod

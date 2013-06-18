From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [RFC PATCH 01/11] dma: amba-pl08x: Use bitmap to
	pass variant specific quirks
Date: Tue, 18 Jun 2013 15:33:46 +0200
Message-ID: <201306181533.46905.arnd@arndb.de>
References: <1371416058-22047-1-git-send-email-tomasz.figa@gmail.com>
 <12368941.dQe8bcScGj@flatron>
 <CACRpkdbt4fAdnDKuP8bVpwrWoJ-oGNuSbiDZDz5J12ix2qijfQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <alsa-devel-bounces@alsa-project.org>
In-Reply-To: <CACRpkdbt4fAdnDKuP8bVpwrWoJ-oGNuSbiDZDz5J12ix2qijfQ@mail.gmail.com>
List-Unsubscribe: <http://mailman.alsa-project.org/mailman/options/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <http://mailman.alsa-project.org/mailman/listinfo/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: alsa-devel-bounces@alsa-project.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>, Heiko =?iso-8859-1?q?St=FCbner?= <heiko@sntech.de>, Padmavathi Venna <padma.v@samsung.com>, Takashi Iwai <tiwai@suse.de>, Alessandro Rubini <rubini@gnudd.com>, Tomasz Figa <tomasz.figa@gmail.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Giancarlo Asnaghi <giancarlo.asnaghi@st.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Russell King - ARM Linux <linux@arm.linux.org.uk>, Vinod Koul <vinod.koul@intel.com>, Thomas Abraham <thomas.abraham@linaro.org>, Grant Likely <grant.likely@linaro.org>, Kukjin Kim <kgene.kim@samsung.com>, Sylwester Nawrocki <sylvester.nawrocki@gmail.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Sangbeom Kim <sbkim73@samsung.com>, Liam Girdwood <lgirdwood@gmail.com>, linux-spi@vger.kernel.org, Mark Brown <broonie@kerne>
List-Id: linux-samsung-soc@vger.kernel.org

On Tuesday 18 June 2013, Linus Walleij wrote:
> I thought about it yesterday and it basically looks to me that
> it tries to outsmart the compiler on how to stuff the flags to save
> struct space on the heap and hint that they can be determined
> quickly by a & operation, this is like premature optimization.
> 
> So please go back to the old system.

Note that a 'bool' is typically stored as a 32-bit field, so there
would be some space saving if there are a lot of flags.

I agree with the conclusion though, the previous state was more
readable, which outweighs any benefits.

	Arnd

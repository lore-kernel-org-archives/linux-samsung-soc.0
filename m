From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [RFC PATCH 07/11] dmaengine: PL08x: Fix reading the byte count in
 cctl
Date: Mon, 17 Jun 2013 20:32:38 +0200
Message-ID: <2846792.ysBnunQQWS@flatron>
References: <1371416058-22047-1-git-send-email-tomasz.figa@gmail.com>
 <1371416058-22047-8-git-send-email-tomasz.figa@gmail.com>
 <CACRpkdZW0+wcVGrj1fD-1-UigjVQA7Wad7wEQ2CxFoyod2-YpQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CACRpkdZW0+wcVGrj1fD-1-UigjVQA7Wad7wEQ2CxFoyod2-YpQ@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>, Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>, Padmavathi Venna <padma.v@samsung.com>, Takashi Iwai <tiwai@suse.de>, Alessandro Rubini <rubini@gnudd.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Giancarlo Asnaghi <giancarlo.asnaghi@st.com>, Kukjin Kim <kgene.kim@samsung.com>, Russell King - ARM Linux <linux@arm.linux.org.uk>, Vinod Koul <vinod.koul@intel.com>, Thomas Abraham <thomas.abraham@linaro.org>, Grant Likely <grant.likely@linaro.org>, Arnd Bergmann <arnd@arndb.de>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Sylwester Nawrocki <sylvester.nawrocki@gmail.com>, Jaroslav Kysela <perex@perex.cz>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Sangbeom Kim <sbkim73@samsung.com>, Liam Girdwood <lgirdwood@gmail.com>, linux-spi@vger.kernel.
List-Id: linux-samsung-soc@vger.kernel.org

On Monday 17 of June 2013 15:53:14 Linus Walleij wrote:
> On Sun, Jun 16, 2013 at 10:54 PM, Tomasz Figa <tomasz.figa@gmail.com> 
wrote:
> > From: Alban Bedel <alban.bedel@avionic-design.de>
> > 
> > There are more fields than just SWIDTH in CH_CONTROL register, so read
> > register value must be masked in addition to shifting.
> > 
> > Signed-off-by: Alban Bedel <alban.bedel@avionic-design.de>
> > Signed-off-by: Tomasz Figa <tomasz.figa@gmail.com>
> 
> Acked-by: Linus Walleij <linus.walleij@linaro.org>
> 
> Are we just lucky on current variants such that all unmasked bits
> happen to be zero on them?

This is really interesting, because if you look at the bit layout, there 
is a lot of other bitfields above the SWIDTH field, like DWIDTH, src and 
dest AHB master selection, src and dest incerement setting, protection and 
terminal count interrupt enable bits.

Best regards,
Tomasz

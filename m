From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [RFC PATCH 05/11] dma: amba-pl08x: Add support for different
 maximum transfer size
Date: Mon, 17 Jun 2013 20:27:20 +0200
Message-ID: <5634002.KI4n5O8hcE@flatron>
References: <1371416058-22047-1-git-send-email-tomasz.figa@gmail.com>
 <1371416058-22047-6-git-send-email-tomasz.figa@gmail.com>
 <CACRpkdaHpNVXueXy0HRnKTshn4ZZSPFh-pgav6B0UAU1xqsNCg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CACRpkdaHpNVXueXy0HRnKTshn4ZZSPFh-pgav6B0UAU1xqsNCg@mail.gmail.com>
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

On Monday 17 of June 2013 15:42:15 Linus Walleij wrote:
> On Sun, Jun 16, 2013 at 10:54 PM, Tomasz Figa <tomasz.figa@gmail.com> 
wrote:
> > PL080S has separate register to store transfer size in, allowing
> > single
> > transfer to be much larger than in standard PL080.
> > 
> > This patch makes the amba-pl08x driver aware of this and removes
> > writing transfer size to reserved bits of CH_CONTROL register on
> > PL080S, which was not a problem witn transfer sizes fitting the
> > original bitfield of PL080, but now would overwrite other fields.
> > 
> > Signed-off-by: Tomasz Figa <tomasz.figa@gmail.com>
> 
> Very straight-forward.
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Thanks.

Actually today I found another way of doing this, which wouldn't require 
checking PL08X_IS_PL080S flag at all.

Simply masking the transfer size in pl08x_cctl_bits() with mask of the 
original bitfield would be enough I think, as writes to those bits seem to 
be ignored on PL080S.

Best regards,
Tomasz

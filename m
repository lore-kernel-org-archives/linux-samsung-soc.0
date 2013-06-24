From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [RFC PATCH v2 08/12] ASoC: Samsung: Do not queue
 cyclic buffers multiple times
Date: Tue, 25 Jun 2013 00:35:23 +0200
Message-ID: <CACRpkdZVn_jeEYatRRH2abbeWAeoCBf0-cgY2sTiG8cyAbzhkQ@mail.gmail.com>
References: <1371933764-24875-1-git-send-email-tomasz.figa@gmail.com>
 <1371933764-24875-9-git-send-email-tomasz.figa@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <alsa-devel-bounces@alsa-project.org>
In-Reply-To: <1371933764-24875-9-git-send-email-tomasz.figa@gmail.com>
List-Unsubscribe: <http://mailman.alsa-project.org/mailman/options/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <http://mailman.alsa-project.org/mailman/listinfo/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: alsa-devel-bounces@alsa-project.org
To: Tomasz Figa <tomasz.figa@gmail.com>
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>, =?ISO-8859-1?Q?Heiko_St=FCbner?= <heiko@sntech.de>, Padmavathi Venna <padma.v@samsung.com>, Takashi Iwai <tiwai@suse.de>, Alessandro Rubini <rubini@gnudd.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Giancarlo Asnaghi <giancarlo.asnaghi@st.com>, Kukjin Kim <kgene.kim@samsung.com>, Russell King - ARM Linux <linux@arm.linux.org.uk>, Vinod Koul <vinod.koul@intel.com>, Thomas Abraham <thomas.abraham@linaro.org>, Grant Likely <grant.likely@linaro.org>, Arnd Bergmann <arnd@arndb.de>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Sylwester Nawrocki <sylvester.nawrocki@gmail.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Sangbeom Kim <sbkim73@samsung.com>, Liam Girdwood <lgirdwood@gmail.com>, linux-spi@vger.kernel.org, Mark Brown <broonie@kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org

On Sat, Jun 22, 2013 at 10:42 PM, Tomasz Figa <tomasz.figa@gmail.com> wrote:

> The legacy S3C-DMA API required every period of a cyclic buffer to be
> queued separately. After conversion of Samsung ASoC to Samsung DMA
> wrappers somebody made an assumption that the same is needed for DMA
> engine API, which is not true.
>
> In effect, Samsung ASoC DMA code was queuing the whole cyclic buffer
> multiple times with a shift of one period per iteration, leading to:
>   a) severe memory waste - up to 13x times more DMA transfer descriptors
>      are allocated than needed,
>   b) possible memory corruption, because further cyclic buffers were out
>      of the original buffers, due to the offset.
>
> This patch fixes this problem by making the legacy S3C-DMA API use the
> same semantics as DMA engine (the whole cyclic buffer is enqueued at
> once) and modifying users of Samsung DMA wrappers in cyclic mode to
> behave appropriately.
>
> Signed-off-by: Tomasz Figa <tomasz.figa@gmail.com>

Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

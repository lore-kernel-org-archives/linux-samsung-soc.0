From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [RFC PATCH 06/11] dma: amba-pl08x: Keep LLIs
	aligned to 4-word boundary
Date: Mon, 17 Jun 2013 15:51:20 +0200
Message-ID: <CACRpkdYzag=sKo87i6H3M_fSQuRiTX3_2-ZhQA+4S7ejZN5j4A@mail.gmail.com>
References: <1371416058-22047-1-git-send-email-tomasz.figa@gmail.com>
 <1371416058-22047-7-git-send-email-tomasz.figa@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <alsa-devel-bounces@alsa-project.org>
In-Reply-To: <1371416058-22047-7-git-send-email-tomasz.figa@gmail.com>
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

On Sun, Jun 16, 2013 at 10:54 PM, Tomasz Figa <tomasz.figa@gmail.com> wrote:

> PL080 reference manual states that to LLI entries should be aligned
> to 4-word boundary to make LLI fetches more efficient. This patch adds
> a 3-word padding to the LLi struct to make this condition true.
>
> Signed-off-by: Tomasz Figa <tomasz.figa@gmail.com>
> ---
>  drivers/dma/amba-pl08x.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/dma/amba-pl08x.c b/drivers/dma/amba-pl08x.c
> index eb10eb8..0da5539 100644
> --- a/drivers/dma/amba-pl08x.c
> +++ b/drivers/dma/amba-pl08x.c
> @@ -127,6 +127,7 @@ struct pl08x_lli {
>         u32 lli;
>         u32 cctl;
>         u32 cctl1;
> +       u32 dummy[3];

Atleast put a comment into the code explaining what this is all
about. Or someone will add another member to the struct and
all is lost. Call it "padding" rather than dummy.

>  };

So it used to be like this before you added cctl1:

struct pl08x_lli {
        u32 src;
        u32 dst;
        u32 lli;
        u32 cctl;
};

Meaning it was 3 words.

And now you make it take 8 words for everyone.

Atleast this patch should be squashed into the patch
adding cctl1.

But I really don't like this fragile way of casting structs right
into memory, and I don't like that teh other PL080's also have
to waste 8 words when their LLIs fit so nicely into 4.

I would have solved this problem by creating a
marshalling function that just allocate the number of bytes the
LLI entry shall have and fill it in by assigning directly to the
precise target memory cell. This way the LLIs will take
4 words on the original variants and you can use some
nice logic to pad out to 8 words on the PL080S variant.

Yours,
Linus Walleij

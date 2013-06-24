From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [RFC PATCH v2 04/12] dmaengine: PL08x: Add support
	for PL080S variant
Date: Tue, 25 Jun 2013 00:26:21 +0200
Message-ID: <CACRpkdbLr4Au_WeGU1xM7H4cW70udVjZN-zQKe1+grYyqkyBsA@mail.gmail.com>
References: <1371933764-24875-1-git-send-email-tomasz.figa@gmail.com>
 <1371933764-24875-5-git-send-email-tomasz.figa@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <alsa-devel-bounces@alsa-project.org>
In-Reply-To: <1371933764-24875-5-git-send-email-tomasz.figa@gmail.com>
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

> @@ -96,7 +96,11 @@ enum {
>         PL080_LLI_LLI,
>         PL080_LLI_CCTL,
>
> -       PL080_LLI_WORDS
> +       PL080_LLI_WORDS,
> +
> +       PL080S_LLI_CCTL2 = PL080_LLI_WORDS,
> +
> +       PL080S_LLI_WORDS = 8
>  };

I still think it's better to just #define these and write
some comments. Now I have to think backwards that
I am the compiler enumerating these things and it's all
a bit confusing.

Apart from that it looks nice.

Yours,
Linus Walleij

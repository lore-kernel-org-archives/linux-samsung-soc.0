From: Liam Girdwood <lrg@ti.com>
Subject: Re: [PATCH 2/4] ASoC: SAMSUNG: Add I2S0 internal dma
 driver
Date: Thu, 9 Jun 2011 10:50:58 +0100
Message-ID: <4DF09782.1090901@ti.com>
References: <1307606950-8310-1-git-send-email-sbkim73@samsung.com>
	<1307606950-8310-3-git-send-email-sbkim73@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <alsa-devel-bounces@alsa-project.org>
In-Reply-To: <1307606950-8310-3-git-send-email-sbkim73@samsung.com>
List-Unsubscribe: <http://mailman.alsa-project.org/mailman/listinfo/alsa-devel>,
	<mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <http://mailman.alsa-project.org/mailman/listinfo/alsa-devel>,
	<mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Sender: alsa-devel-bounces@alsa-project.org
Errors-To: alsa-devel-bounces@alsa-project.org
To: Sangbeom Kim <sbkim73@samsung.com>
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>, "kgene.kim@samsung.com" <kgene.kim@samsung.com>, "jassisinghbrar@gmail.com" <jassisinghbrar@gmail.com>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, "ben-linux@fluff.org" <ben-linux@fluff.org>, "broonie@opensource.wolfsonmicro.com" <broonie@opensource.wolfsonmicro.com>, "lrg@slimlogic.co.uk" <lrg@slimlogic.co.uk>
List-Id: linux-samsung-soc@vger.kernel.org

On 09/06/11 09:09, Sangbeom Kim wrote:
> I2S in Exynos4 and S5PC110(S5PV210) has a internal dma.
> It can be used low power audio mode and 2nd channel transfer.
> 
> Signed-off-by: Sangbeom Kim <sbkim73@samsung.com>

Looks fine to me, but needs one fix before it can be applied.

Acked-by: Liam Girdwood <lrg@ti.com>

> ---
>  sound/soc/samsung/Makefile |    2 +
>  sound/soc/samsung/idma.c   |  492 ++++++++++++++++++++++++++++++++++++++++++++
>  sound/soc/samsung/idma.h   |   28 +++
>  3 files changed, 522 insertions(+), 0 deletions(-)
>  create mode 100644 sound/soc/samsung/idma.c
>  create mode 100644 sound/soc/samsung/idma.h
> 

snip

> +
> +static int idma_new(struct snd_card *card,
> +       struct snd_soc_dai *dai, struct snd_pcm *pcm)
> +{

This call API has changed in -next.

Thanks

Liam

From: Liam Girdwood <lrg@ti.com>
Subject: Re: [PATCH V2 0/4] Add Samsung internal dma driver
	support
Date: Thu, 16 Jun 2011 09:34:35 +0100
Message-ID: <4DF9C01B.5040607@ti.com>
References: <1308127407-22458-1-git-send-email-sbkim73@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <alsa-devel-bounces@alsa-project.org>
In-Reply-To: <1308127407-22458-1-git-send-email-sbkim73@samsung.com>
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
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>, "kgene.kim@samsung.com" <kgene.kim@samsung.com>, "jassisinghbrar@gmail.com" <jassisinghbrar@gmail.com>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, "broonie@opensource.wolfsonmicro.com" <broonie@opensource.wolfsonmicro.com>, "lrg@slimlogic.co.uk" <lrg@slimlogic.co.uk>
List-Id: linux-samsung-soc@vger.kernel.org

On 15/06/11 09:43, Sangbeom Kim wrote:
> I2S in samsung audio subsytem has a small internal dma(idma).
> IDMA can be used in low power audio mode and I2S0 secondary fifo
> data tranfer.
> In this patchsets, idma driver is added.
> Original code is made by jassi brar on SMDKV210
> After idma driver merge, I will submit low power audio support
> with idma driver and samsung dsp driver.
> 
> Changes since v1:
> 1. Change idma_new by new pcm_new api
> 2. Add handling different idma address
> 3. As jassi comments, Modify the idma driver
> 
> This patchset contains followings
> 
>  o To Jassi Brar, Mark Brown and Liam Girdwood,
> [PATCH V2 1/4] ASoC: SAMSUNG: Modify I2S driver to support idma
> [PATCH V2 2/4] ASoC: SAMSUNG: Add I2S0 internal dma driver

Acked-by: Liam Girdwood <lrg@ti.com>

but you have left #define DEBUG enabled in 1/4. 

This could be fixed incrementally if you don't have to do a V3 for any other reasons.

Liam

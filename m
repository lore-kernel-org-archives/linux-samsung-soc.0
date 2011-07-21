From: Kukjin Kim <kgene.kim@samsung.com>
Subject: Re: [PATCH V2 0/4] Add Samsung internal dma driver
	support
Date: Thu, 21 Jul 2011 16:53:26 +0900
Message-ID: <006701cc477b$490e5f90$db2b1eb0$%kim@samsung.com>
References: <1308127407-22458-1-git-send-email-sbkim73@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <alsa-devel-bounces@alsa-project.org>
In-reply-to: <1308127407-22458-1-git-send-email-sbkim73@samsung.com>
Content-language: ko
List-Unsubscribe: <http://mailman.alsa-project.org/mailman/listinfo/alsa-devel>,
	<mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <http://mailman.alsa-project.org/mailman/listinfo/alsa-devel>,
	<mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Sender: alsa-devel-bounces@alsa-project.org
Errors-To: alsa-devel-bounces@alsa-project.org
To: 'Sangbeom Kim' <sbkim73@samsung.com>, alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org
Cc: jassisinghbrar@gmail.com, broonie@opensource.wolfsonmicro.com, lrg@slimlogic.co.uk
List-Id: linux-samsung-soc@vger.kernel.org

Sangbeom Kim wrote:
> 
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
> 
>  o To Kukjin Kim
> [PATCH V2 3/4] ARM: SAMSUNG: Add platform device for idma
> [PATCH V2 4/4] ARM: SAMSUNG: Add IRQ_I2S0 definition
> 
OK, applied 3rd and 4th.
Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.

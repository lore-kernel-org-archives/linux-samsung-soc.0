From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCHv2 3/3] ASoC: samsung: pass filter function
	as pointer
Date: Wed, 18 Nov 2015 10:31:20 +0100
Message-ID: <4007784.QRStAbUhLz@wuerfel>
References: <6346833.MfUC71I3uD@wuerfel> <6346833.dgFksO4fT8@wuerfel>
 <564BDEBE.2080706@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <alsa-devel-bounces@alsa-project.org>
In-Reply-To: <564BDEBE.2080706@samsung.com>
List-Unsubscribe: <http://mailman.alsa-project.org/mailman/options/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <http://mailman.alsa-project.org/mailman/listinfo/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: alsa-devel-bounces@alsa-project.org
To: linux-arm-kernel@lists.infradead.org
Cc: Krzysztof Kozlowski <k.kozlowski@samsung.com>, linux-samsung-soc@vger.kernel.org, Heiko Stuebner <heiko@sntech.de>, Liam Girdwood <lgirdwood@gmail.com>, Sangbeom Kim <sbkim73@samsung.com>, alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org, Vinod Koul <vinod.koul@intel.com>, Mark Brown <broonie@kernel.org>, Kukjin Kim <kgene@kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org

On Wednesday 18 November 2015 11:13:18 Krzysztof Kozlowski wrote:
> 
> I also tested entire patchset on Exynos4412/Trats2 board (custom kernel
> with audio working) for regressions and it worked fine. However, since
> this was not a S3C24xx/S3C64xx board, I don't find that testing
> sufficient for a tag. So only:
> 
> Reviewed-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
> 

Thanks!

Mark, can you take the three patches through the ASoC tree?

	Arnd

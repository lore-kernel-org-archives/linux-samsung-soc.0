From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCHv2] ASoC: samsung: pass DMA channels as
	pointers
Date: Wed, 18 Nov 2015 10:33:41 +0900
Message-ID: <564BD575.3070702@samsung.com>
References: <6346833.MfUC71I3uD@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <alsa-devel-bounces@alsa-project.org>
In-reply-to: <6346833.MfUC71I3uD@wuerfel>
List-Unsubscribe: <http://mailman.alsa-project.org/mailman/options/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <http://mailman.alsa-project.org/mailman/listinfo/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: alsa-devel-bounces@alsa-project.org
To: Arnd Bergmann <arnd@arndb.de>, Mark Brown <broonie@kernel.org>, alsa-devel@alsa-project.org
Cc: linux-samsung-soc@vger.kernel.org, Heiko Stuebner <heiko@sntech.de>, Sangbeom Kim <sbkim73@samsung.com>, linux-kernel@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>, Vinod Koul <vinod.koul@intel.com>, Kukjin Kim <kgene@kernel.org>, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

On 18.11.2015 00:53, Arnd Bergmann wrote:
> ARM64 allmodconfig produces a bunch of warnings when building the
> samsung ASoC code:
> 
> sound/soc/samsung/dmaengine.c: In function 'samsung_asoc_init_dma_data':
> sound/soc/samsung/dmaengine.c:53:32: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
>    playback_data->filter_data = (void *)playback->channel;
> sound/soc/samsung/dmaengine.c:60:31: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
>    capture_data->filter_data = (void *)capture->channel;
> 
> We could easily shut up the warning by adding an intermediate cast,
> but there is a bigger underlying problem: The use of IORESOURCE_DMA
> to pass data from platform code to device drivers is dubious to start
> with, as what we really want is a pointer that can be passed into
> a filter function.
> 
> Note that on s3c64xx, the pl08x DMA data is already a pointer, but
> gets cast to resource_size_t so we can pass it as a resource, and it
> then gets converted back to a pointer. In contrast, the data we pass
> for s3c24xx is an index into a device specific table, and we artificially
> convert that into a pointer for the filter function.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
> v2:
> 
> - no longer clash with SPI patch
> - don't reference platform data that might be NULL
> 

Looks good:

Reviewed-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>

Best regards,
Krzysztof

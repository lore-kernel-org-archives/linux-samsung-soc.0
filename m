From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCHv2 2/3] ASoC: s3c24xx-i2s: pass DMA channels
	as platform data
Date: Wed, 18 Nov 2015 14:20:32 +0100
Message-ID: <4029229.ZxVVfeA0q2@wuerfel>
References: <6346833.MfUC71I3uD@wuerfel> <4020501.kQLt6nnIEv@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <alsa-devel-bounces@alsa-project.org>
In-Reply-To: <4020501.kQLt6nnIEv@wuerfel>
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
Cc: alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org, Heiko Stuebner <heiko@sntech.de>, Sangbeom Kim <sbkim73@samsung.com>, linux-kernel@vger.kernel.org, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Liam Girdwood <lgirdwood@gmail.com>, Vinod Koul <vinod.koul@intel.com>, Mark Brown <broonie@kernel.org>, Kukjin Kim <kgene@kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org

On Tuesday 17 November 2015 16:54:16 Arnd Bergmann wrote:
> +#include <linux/platform_data/asoc-s3c.h.h>
> 

My randconfig test setup has now found the typo above. Resending the
fixed version.

	Arnd

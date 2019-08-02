From: Herbert Xu <herbert@gondor.apana.org.au>
Subject: Re: [PATCH] hwrng: Use device-managed registration API
Date: Fri, 2 Aug 2019 14:55:37 +1000
Message-ID: <20190802045537.GG18077@gondor.apana.org.au>
References: <20190725080155.19875-1-hslester96@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20190725080155.19875-1-hslester96@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Chuhong Yuan <hslester96@gmail.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, Deepak Saxena <dsaxena@plexity.net>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, =?utf-8?Q?=C5=81ukasz?= Stelmach <l.stelmach@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Patrice Chotard <patrice.chotard@st.com>, linux-samsung-soc@vger.kernel.org, Ludovic Desroches <ludovic.desroches@microchip.com>, Kukjin Kim <kgene@kernel.org>, Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, Matt Mackall <mpm@selenic.com>, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, linux-crypto@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

On Thu, Jul 25, 2019 at 04:01:55PM +0800, Chuhong Yuan wrote:
> Use devm_hwrng_register to simplify the implementation.
> Manual unregistration and some remove functions can be
> removed now.
> 
> Signed-off-by: Chuhong Yuan <hslester96@gmail.com>
> ---
>  drivers/char/hw_random/atmel-rng.c     |  3 +--
>  drivers/char/hw_random/cavium-rng-vf.c | 11 +----------
>  drivers/char/hw_random/exynos-trng.c   |  3 +--
>  drivers/char/hw_random/n2-drv.c        |  4 +---
>  drivers/char/hw_random/nomadik-rng.c   |  3 +--
>  drivers/char/hw_random/omap-rng.c      |  3 +--
>  drivers/char/hw_random/powernv-rng.c   | 10 +---------
>  drivers/char/hw_random/st-rng.c        |  4 +---
>  drivers/char/hw_random/xgene-rng.c     |  4 +---
>  9 files changed, 9 insertions(+), 36 deletions(-)

Patch applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

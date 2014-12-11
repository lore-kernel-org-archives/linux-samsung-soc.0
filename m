From: Mike Turquette <mturquette@linaro.org>
Subject: Re: [GIT PULL] samsung clk cleanups and fixes for v3.19
Date: Thu, 11 Dec 2014 12:17:57 -0800
Message-ID: <20141211201757.20398.64771@quantum>
References: <54819F54.1060705@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <54819F54.1060705@samsung.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Kukjin Kim <kgene.kim@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
List-Id: linux-samsung-soc@vger.kernel.org

Quoting Sylwester Nawrocki (2014-12-05 04:04:36)
> 
> Hi Mike,
> 
> This includes a few bug fix and cleanup patches for clk/samsung.
> Please pull for 3.19 if it looks OK.
> 
> The following changes since commit 2e41b9fc11f2d242f39b36ceba833471629ba3d5:
> 
>   clk: samsung: Spelling s/bwtween/between/ (2014-12-02 12:28:20 +0100)
> 
> are available in the git repository at:
> 
>   git://linuxtv.org/snawrocki/samsung.git tags/for-v3.19-exynos-clk-2
> 
> for you to fetch changes up to c31844ffdbd4e73a16c66e9d7df8ec290ab4b159:
> 
>   clk: samsung: Fix double add of syscore ops after driver rebind (2014-12-02
> 16:22:59 +0100)

Pulled.

Regards,
Mike

> 
> ----------------------------------------------------------------
> - exynos4415 and exynos audio subsystem clk driver (build
>   with PM_SLEEP disabled, resource release) fixes
> - minor cleanups in drivers/clk/samsung/clk.c (spelling,
>   includes)
> - modification of the exynos4 HDMI PHY clock definition to
>   model dependency of "sclk_hdmiphy" on the "hdmi" clock
> 
> ----------------------------------------------------------------
> Andrzej Hajda (1):
>       clk: samsung: exynos4: set parent of sclk_hdmiphy to hdmi
> 
> Krzysztof Kozlowski (2):
>       clk: samsung: exynos4415: Fix build with PM_SLEEP disabled
>       clk: samsung: Fix double add of syscore ops after driver rebind
> 
> Pankaj Dubey (2):
>       clk: samsung: remove unnecessary CONFIG_OF from clk.c
>       clk: samsung: remove unnecessary inclusion of header files from clk.h
> 
>  drivers/clk/samsung/clk-exynos-audss.c |    4 ++++
>  drivers/clk/samsung/clk-exynos4.c      |    2 +-
>  drivers/clk/samsung/clk-exynos4415.c   |    6 ++++--
>  drivers/clk/samsung/clk.c              |    4 ++--
>  drivers/clk/samsung/clk.h              |    4 ----
>  5 files changed, 11 insertions(+), 9 deletions(-)
> 
> --
> Thanks,
> Sylwester

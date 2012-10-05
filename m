From: Sangbeom Kim <sbkim73@samsung.com>
Subject: Re: [PATCH] ASoC: SAMSUNG: pcm: use clk_prepare_enable
 and	clk_disable_unprepare
Date: Fri, 05 Oct 2012 13:48:16 +0900
Message-ID: <012301cda2b4$a21dfe20$e659fa60$@com>
References: <1349221636-2976-1-git-send-email-thomas.abraham@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <alsa-devel-bounces@alsa-project.org>
In-reply-to: <1349221636-2976-1-git-send-email-thomas.abraham@linaro.org>
Content-language: ko
List-Unsubscribe: <http://mailman.alsa-project.org/mailman/options/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <http://mailman.alsa-project.org/mailman/listinfo/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: alsa-devel-bounces@alsa-project.org
To: 'Thomas Abraham' <thomas.abraham@linaro.org>, alsa-devel@alsa-project.org
Cc: jassisinghbrar@gmail.com, kgene.kim@samsung.com, lrg@ti.com, linux-samsung-soc@vger.kernel.org, broonie@opensource.wolfsonmicro.com
List-Id: linux-samsung-soc@vger.kernel.org

On Wednesday, Oct 03, 2012 at 8:47 AM, Thomas Abraham wrote:

> Subject: [alsa-devel] [PATCH] ASoC: SAMSUNG: pcm: use clk_prepare_enable and clk_disable_unprepare
> 
> Convert clk_enable/clk_disable to clk_prepare_enable/clk_disable_unprepare
> calls as required by common clock framework.
> 
> Signed-off-by: Thomas Abraham <thomas.abraham@linaro.org>

Acked-by: Sangbeom Kim <sbkim73@samsung.com>

Thanks,
Sangbeom.

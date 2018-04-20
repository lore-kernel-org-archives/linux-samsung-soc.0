From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: [PATCH] media: s5p-jpeg: don't return a value on a void function
Date: Fri, 20 Apr 2018 21:10:17 +0200
Message-ID: <4376a97a-bb22-056b-4a63-8838c0c2d3f8@gmail.com>
References: <180af45d9964a4d9855066b8f74a8629625acfa2.1524250913.git.mchehab@s-opensource.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <180af45d9964a4d9855066b8f74a8629625acfa2.1524250913.git.mchehab@s-opensource.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Mauro Carvalho Chehab <mchehab@s-opensource.com>
Cc: linux-samsung-soc@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, Mauro Carvalho Chehab <mchehab@infradead.org>, Kukjin Kim <kgene@kernel.org>, Andrzej Pietrasiewicz <andrzej.p@samsung.com>, linux-arm-kernel@lists.infradead.org, Linux Media Mailing List <linux-media@vger.kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org

Hi Mauro,

Thank you for the patch.

On 04/20/2018 09:01 PM, Mauro Carvalho Chehab wrote:
> Building this driver on arm64 gives this warning:
> 	drivers/media/platform/s5p-jpeg/jpeg-hw-exynos3250.c:430:16: error: return expression in void function
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab@s-opensource.com>
> ---
>  drivers/media/platform/s5p-jpeg/jpeg-hw-exynos3250.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/platform/s5p-jpeg/jpeg-hw-exynos3250.c b/drivers/media/platform/s5p-jpeg/jpeg-hw-exynos3250.c
> index 0974b9a7a584..0861842b2dfc 100644
> --- a/drivers/media/platform/s5p-jpeg/jpeg-hw-exynos3250.c
> +++ b/drivers/media/platform/s5p-jpeg/jpeg-hw-exynos3250.c
> @@ -425,9 +425,9 @@ unsigned int exynos3250_jpeg_get_int_status(void __iomem *regs)
>  }
>  
>  void exynos3250_jpeg_clear_int_status(void __iomem *regs,
> -						unsigned int value)
> +				      unsigned int value)
>  {
> -	return writel(value, regs + EXYNOS3250_JPGINTST);
> +	writel(value, regs + EXYNOS3250_JPGINTST);
>  }
>  
>  unsigned int exynos3250_jpeg_operating(void __iomem *regs)
> 

Reviewed-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>

-- 
Best regards,
Jacek Anaszewski

From: Ben Dooks <ben@fluff.org>
Subject: Re: [PATCH] ARM: plat-samsung: using vsnprintf instead of vsprintf
 for the limit buffer length 256
Date: Mon, 21 Jan 2013 13:56:26 +0000
Message-ID: <20130121135626.GP1095@trinity.fluff.org>
References: <50FD178E.9090105@asianux.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <50FD178E.9090105@asianux.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Chen Gang <gang.chen@asianux.com>
Cc: linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, linux@arm.linux.org.uk, linux-arm-kernel@lists.infradead.org, ben-linux@fluff.org
List-Id: linux-samsung-soc@vger.kernel.org

On Mon, Jan 21, 2013 at 06:25:18PM +0800, Chen Gang wrote:
> 
>   the buff size is 256, so need use vsnprintf instead of vsprintf.
> 
> Signed-off-by: Chen Gang <gang.chen@asianux.com>
> ---
>  arch/arm/plat-samsung/pm.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm/plat-samsung/pm.c b/arch/arm/plat-samsung/pm.c
> index 1507028..8d07b45 100644
> --- a/arch/arm/plat-samsung/pm.c
> +++ b/arch/arm/plat-samsung/pm.c
> @@ -51,7 +51,7 @@ void s3c_pm_dbg(const char *fmt, ...)
>  	char buff[256];
>  
>  	va_start(va, fmt);
> -	vsprintf(buff, fmt, va);
> +	vsnprintf(buff, 256, fmt, va);

How about: vsnprintf(buff, sizeof(buff), fmt, va);

It means we do not end up assuming the size of 'buff' and will be correct
if the code is changed to declare 'buff' to be a different size.

-- 
Ben Dooks, ben@fluff.org, http://www.fluff.org/ben/

Large Hadron Colada: A large Pina Colada that makes the universe disappear.

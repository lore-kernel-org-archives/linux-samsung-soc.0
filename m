From: Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [PATCH 1/2] misc: add sii9234 driver
Date: Sat, 3 May 2014 19:17:54 -0400
Message-ID: <20140503231754.GB20212@kroah.com>
References: <1397216910-15904-1-git-send-email-t.stanislaws@samsung.com>
 <1397216910-15904-2-git-send-email-t.stanislaws@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces@lists.freedesktop.org>
Content-Disposition: inline
In-Reply-To: <1397216910-15904-2-git-send-email-t.stanislaws@samsung.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Tomasz Stanislawski <t.stanislaws@samsung.com>
Cc: devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, arnd@arndb.de, linux-doc@vger.kernel.org, rdunlap@infradead.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, kyungmin.park@samsung.com, robh+dt@kernel.org, ben-linux@fluff.org, grant.likely@linaro.org, kgene.kim@samsung.com, m.szyprowski@samsung.com, linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

On Fri, Apr 11, 2014 at 01:48:29PM +0200, Tomasz Stanislawski wrote:
> diff --git a/drivers/misc/Kconfig b/drivers/misc/Kconfig
> index 1cb7408..3b7f266 100644
> --- a/drivers/misc/Kconfig
> +++ b/drivers/misc/Kconfig
> @@ -515,6 +515,14 @@ config SRAM
>  	  the genalloc API. It is supposed to be used for small on-chip SRAM
>  	  areas found on many SoCs.
>  
> +config SII9234
> +	tristate "Silicon Image SII9234 Driver"
> +	depends on I2C

I doubt this is the only dependency, right?

thanks,

greg k-h

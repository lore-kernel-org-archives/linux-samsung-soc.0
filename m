From: Javier Martinez Canillas <javier.martinez-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>
Subject: Re: [PATCH v3] ARM: dts: Add cros_ec to exynos5420-peach-pit and
 exynos5800-peach-pi
Date: Fri, 18 Jul 2014 00:42:23 +0200
Message-ID: <53C8514F.4040606@collabora.co.uk>
References: <1403627332-4688-1-git-send-email-dianders@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1403627332-4688-1-git-send-email-dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kukjin Kim <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Tomasz Figa <tomasz.figa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org, ch.naveen-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, khilman-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, ajaynumb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, rahul.sharma-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, tushar.b-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

Hello Kukjin,

On 06/24/2014 06:28 PM, Doug Anderson wrote:
> This adds cros_ec to exynos5420-peach-pit and exynos5800-peach-pi,
> including:
> * The keyboard
> * The i2c tunnel
> * The tps65090 under the i2c tunnel
> * The battery under the i2c tunnel
> 
> To add extra motivation, it should be noted that tps65090 is one of
> the things needed to get display-related FETs turned on for pit and
> pi.
> 
> Note that this relies on a few outstanding changes:
> * Needs (spi: s3c64xx: fix broken "cs_gpios" usage in the driver) and
>   (spi: s3c64xx: for DT platofrms always get the chipselect info from
>   DT node) to work properly and match the documented bindings.  See
>   <https://patchwork.kernel.org/patch/4346701/> and
>   <https://patchwork.kernel.org/patch/4346711/>
> 
> Signed-off-by: Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> Tested-by: Javier Martinez Canillas <javier.martinez-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>
> Tested-by: Tushar Behera <tushar.b-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> 

Mark Brown as already applied the SPI DT binding fix from Naveen [0] which was
the dependency for this patch and he said that will try to send the whole series
to Torvalds before the 3.16-rc cycle ends.

So I think that it's safe now if you want to pick this patch.

Thanks a lot!

Best regards,
Javier

[0]:
https://git.kernel.org/cgit/linux/kernel/git/broonie/spi.git/commit/?h=for-next&id=306972cedfdedc662dd8e32a6397d0e29f2ac90e
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

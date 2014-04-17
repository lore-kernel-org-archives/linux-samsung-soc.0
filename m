From: Russell King - ARM Linux <linux@arm.linux.org.uk>
Subject: Re: [PATCH RFC 3/3] drm/exynos: use pending_components for
 components tracking
Date: Thu, 17 Apr 2014 22:47:09 +0100
Message-ID: <20140417214709.GY24070@n2100.arm.linux.org.uk>
References: <1397734130-21019-1-git-send-email-a.hajda@samsung.com>
 <1397734130-21019-4-git-send-email-a.hajda@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces@lists.freedesktop.org>
Content-Disposition: inline
In-Reply-To: <1397734130-21019-4-git-send-email-a.hajda@samsung.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Andrzej Hajda <a.hajda@samsung.com>
Cc: "moderated list:ARM/S5P EXYNOS AR..." <linux-samsung-soc@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, open list <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org, Kyungmin Park <kyungmin.park@samsung.com>, "moderated list:ARM/S5P EXYNOS AR..." <linux-arm-kernel@lists.infradead.org>, Marek Szyprowski <m.szyprowski@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

On Thu, Apr 17, 2014 at 01:28:50PM +0200, Andrzej Hajda wrote:
> +out:
> +	if (ret != -EPROBE_DEFER)
> +		exynos_drm_dev_ready(&pdev->dev);

So we end up with everyone needing a "ready" call in each sub-driver
back into the main driver... this makes it impossible to write a
generic subcomponent driver which is not tied in any way to the
main driver.

That is quite some restriction, and would prevent, for example, the
TDA998x driver being used both with Armada DRM, tilcdc and any other
driver.

So, while your solution may work for exynos, it's not suitable for
general use.

-- 
FTTC broadband for 0.8mile line: now at 9.7Mbps down 460kbps up... slowly
improving, and getting towards what was expected from it.

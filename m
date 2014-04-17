From: Russell King - ARM Linux <linux@arm.linux.org.uk>
Subject: Re: [PATCH RFC 3/3] drm/exynos: use pending_components for
 components tracking
Date: Thu, 17 Apr 2014 23:04:12 +0100
Message-ID: <20140417220412.GZ24070@n2100.arm.linux.org.uk>
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
> +static int exynos_drm_add_blocker(struct device *dev, void *data)
> +{
> +	struct device_driver *drv = data;
> +
> +	if (!platform_bus_type.match(dev, drv))
> +		return 0;
> +
> +	device_lock(dev);
> +	if (!dev->driver)
> +		exynos_drm_dev_busy(dev);
> +	device_unlock(dev);
> +
> +	return 0;
> +}
> +
> +static void exynos_drm_init_blockers(struct device_driver *drv)
> +{
> +	bus_for_each_dev(&platform_bus_type, NULL, drv, exynos_drm_add_blocker);
> +}

This feels very wrong to be dumping the above code into every driver which
wants to make use of some kind of componentised support.

You also appear to need to know the struct device_driver's for every
component.  While that may work for exynos, it doesn't work elsewhere
where the various components of the system are very real separate
kernel modules - for example, a separate I2C driver such as the TDA998x
case I mentioned in my first reply.

I can't see how your solution would be usable in that circumstance.

The third issue I have is that you're still needing to have internal
exynos sub-device management - you're having to add the individual
devices to some kind of list, array or static data, and during DRM
probe you're having to then walk these lists/arrays/static data to
locate these sub-devices and finish each of their individual
initialisations.  So you're ending up with a two-tier initialisation.

That's not particularly good because it means you're exposed to
problems where the state is different between two initialisations -
when the device is recreated, your component attempts to re-finalise
the initialisation a second time.  It wouldn't take much for a field
to be assumed to be zero at init time somewhere for a bug to creep
in.

-- 
FTTC broadband for 0.8mile line: now at 9.7Mbps down 460kbps up... slowly
improving, and getting towards what was expected from it.

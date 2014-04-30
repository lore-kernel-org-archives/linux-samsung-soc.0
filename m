From: Russell King - ARM Linux <linux@arm.linux.org.uk>
Subject: Re: [RFC PATCH 0/4] drivers/base: Generic framework for tracking
 internal interfaces
Date: Wed, 30 Apr 2014 23:28:39 +0100
Message-ID: <20140430222839.GE26756@n2100.arm.linux.org.uk>
References: <1398866574-27001-1-git-send-email-a.hajda@samsung.com>
 <20140430154914.GA898@kroah.com> <53616E31.3050404@wp.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces@lists.freedesktop.org>
Content-Disposition: inline
In-Reply-To: <53616E31.3050404@wp.pl>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Andrzej Hajda <andrzej.hajda@wp.pl>
Cc: Tomasz Stansislawski <t.stanislaws@samsung.com>, "moderated list:ARM/S5P EXYNOS AR..." <linux-samsung-soc@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, open list <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org, Andrzej Hajda <a.hajda@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, linux-media@vger.kernel.org, "moderated list:ARM/S5P EXYNOS AR..." <linux-arm-kernel@lists.infradead.org>, Marek Szyprowski <m.szyprowski@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

On Wed, Apr 30, 2014 at 11:42:09PM +0200, Andrzej Hajda wrote:
> The main problem with component framework is that componentization  
> significantly changes every driver and changes it in a way which is not  
> compatible with traditional drivers, so devices which are intended to  
> work with different DRM masters are hard to componentize if some of DRMs  
> are componentized and some not.

Many of the problems which the component helpers are designed to solve
are those where you need the drm_device structure (or snd_card, or whatever
subsystem specific card/device representation structure) pre-created in
order to initialise the components.

In the case of DRM, you can't initialise encoders or connectors without
their drm_device structure pre-existing - because these components are
attached to the drm_device.

Your solution to that is to delay those calls, but the DRM subsystem is
not designed to cope like that - it's designed such that when the
connector or encoder initialisation functions are called, it is assumed
that the driver is initialising its state. (I've raised this point before
but you've just fobbed it off in the past.)

Another issue here is that the order of initialisation matters greatly.
Take CRTCs for example.  In DRM, the order of attachment of CRTCs defines
their identity, changing the order changes their identity, and changes
how they are bound to their respective connectors.

-- 
FTTC broadband for 0.8mile line: now at 9.7Mbps down 460kbps up... slowly
improving, and getting towards what was expected from it.

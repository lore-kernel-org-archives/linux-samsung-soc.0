From: Russell King - ARM Linux <linux@arm.linux.org.uk>
Subject: Re: [PATCH RFC 0/4] drm/core: restore suspend/resume calbacks in
 KMS drm drivers
Date: Fri, 3 Oct 2014 16:22:44 +0100
Message-ID: <20141003152244.GV5182@n2100.arm.linux.org.uk>
References: <1412324653-30677-1-git-send-email-a.hajda@samsung.com>
 <20141003083121.GC16117@phenom.ffwll.local> <542E6F9D.2090005@samsung.com>
 <CAKMK7uGec2yV89n-RLsg+HqXoXvXBMBVZ6py3Z7puFe+KR6e7A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces@lists.freedesktop.org>
Content-Disposition: inline
In-Reply-To: <CAKMK7uGec2yV89n-RLsg+HqXoXvXBMBVZ6py3Z7puFe+KR6e7A@mail.gmail.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Daniel Vetter <daniel@ffwll.ch>
Cc: Kukjin Kim <kgene.kim@samsung.com>, "open list:INTEL DRM DRIVERS..." <intel-gfx@lists.freedesktop.org>, Seung-Woo Kim <sw0312.kim@samsung.com>, open list <linux-kernel@vger.kernel.org>, "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>, Andrzej Hajda <a.hajda@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, "moderated list:ARM/S5P EXYNOS AR..." <linux-samsung-soc@vger.kernel.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Daniel Vetter <daniel.vetter@intel.com>, Marek Szyprowski <m.szyprowski@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

On Fri, Oct 03, 2014 at 01:39:21PM +0200, Daniel Vetter wrote:
> On Fri, Oct 3, 2014 at 11:42 AM, Andrzej Hajda <a.hajda@samsung.com> wrote:
> > But this is an issue closely connected with component framework.
> > Component framework separates master component probe and drm device
> > initialization. As a result PM ops which are synchronized with probe
> > (via device_lock)
> > are no more synchronized with drm initialization which is usually called
> > from
> > .bind callback.
> 
> Now I'm confused. component->bind and drm initialization is about
> driver load, but all this code here is about system suspend/resume
> really. So I'm rather confused what problem you actually want to fix
> ..

The component *helper* will disconnect the bind of the master device
from its probe if the components aren't already known.  If all the
components are known at the point the master device probes, the
master device lock will be held (since we'll be operating within the
master device's probe function.)

The issue here is that while the master device is being probed, the
per-device lock is held.  Beneath that lock there are locks in the
component helper which will be taken, and thus will end up depending
upon the per-device lock.

This means that we pretty much can not guarantee synchronisation between
PM on the master device and the component helper calling the bind
callback - if we tried to take the per-device lock here, we would either
deadlock, or we would end up with AB-BA lock dependencies.

What we /could/ do is expose lock/unlock functions from the component
helper so that PM implementations can synchronise with binds - or I could
look at whether we could integrate the component helper into the device
model.  I suspect the latter would not be met with enthusiasm as it would
mean adding bloat to the driver core structures, which would not be needed
in 99% of cases.

-- 
FTTC broadband for 0.8mile line: currently at 9.5Mbps down 400kbps up
according to speedtest.net.

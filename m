From: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH RFC 0/4] drm/core: restore suspend/resume
 calbacks in KMS drm drivers
Date: Fri, 3 Oct 2014 10:31:22 +0200
Message-ID: <20141003083121.GC16117@phenom.ffwll.local>
References: <1412324653-30677-1-git-send-email-a.hajda@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <intel-gfx-bounces@lists.freedesktop.org>
Content-Disposition: inline
In-Reply-To: <1412324653-30677-1-git-send-email-a.hajda@samsung.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/intel-gfx>
List-Post: <mailto:intel-gfx@lists.freedesktop.org>
List-Help: <mailto:intel-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=subscribe>
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>
To: Andrzej Hajda <a.hajda@samsung.com>
Cc: Kukjin Kim <kgene.kim@samsung.com>, "open list:INTEL DRM DRIVERS..." <intel-gfx@lists.freedesktop.org>, Seung-Woo Kim <sw0312.kim@samsung.com>, open list <linux-kernel@vger.kernel.org>, "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>, Kyungmin Park <kyungmin.park@samsung.com>, "moderated list:ARM/S5P EXYNOS AR..." <linux-samsung-soc@vger.kernel.org>, Daniel Vetter <daniel.vetter@intel.com>, Marek Szyprowski <m.szyprowski@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

On Fri, Oct 03, 2014 at 10:24:09AM +0200, Andrzej Hajda wrote:
> The main intent of this patchset is to allow use of suspend/resume drm driver
> callbacks in KMS drivers, as these callbacks seems to me the best place
> to implement suspend/resume functionality in drm driver.
> Implementing this functionality in master component driver PM ops is problematic
> as those callbacks can be called asynchronously regardless of state/existence of
> drm device, thus it would require additional synchronization mechanism.
> 
> Callbacks re-enabling requires small changes in i915 and exynos driver.
> The patchset contains also fix of exynos resume callback.

Nack.

Like completely and totally. The drm core has really no business doing
hardware stuff, which includes runtime pm, system suspend and all that
nonsense. It' an interface between userspace and drivers, with a big
library to back it all up. Everything else just repeats the old midlayer
mistake.

If you driver needs this, do it there. Also, the component framework is
probably the solution you're looking for. And if there are synchronization
issues with that then we need to fix those instead of reinventing yet
another half-assed broken wheel.

Aside: With David Herrmann's latest patches to de-midlayer the drm
init/teardown sequence the driver is in full control of when the drm data
structures get allocate, initialized and registered. If you convert to
that plus the component framework I'm pretty sure your problem is solved.

Thanks, Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
+41 (0) 79 365 57 48 - http://blog.ffwll.ch

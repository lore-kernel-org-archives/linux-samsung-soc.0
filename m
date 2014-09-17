From: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH] drm/exynos: fix plane-framebuffer linkage
Date: Wed, 17 Sep 2014 15:45:36 +0200
Message-ID: <CAKMK7uFuo_Sq8cjaiTopSmex6c4hMcAFrD7Ya+R059v=ThurXA@mail.gmail.com>
References: <1410807137-8323-1-git-send-email-drake@endlessm.com>
 <20140916063501.GT4740@phenom.ffwll.local>
 <54192BB1.8060606@samsung.com> <54192EF0.5000705@samsung.com>
 <54193BCD.3090003@samsung.com>
 <CAD8Lp47-ho47WF-te15NZ=JHTd-zt1JxPXwQsTh_Ta_G89zrTA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <CAD8Lp47-ho47WF-te15NZ=JHTd-zt1JxPXwQsTh_Ta_G89zrTA@mail.gmail.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Daniel Drake <drake@endlessm.com>
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Seung-Woo Kim <sw0312.kim@samsung.com>, dri-devel <dri-devel@lists.freedesktop.org>, Andrzej Hajda <a.hajda@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

On Wed, Sep 17, 2014 at 2:19 PM, Daniel Drake <drake@endlessm.com> wrote:
>> Chip specific drm driver internally doesn't have to care fb reference count if
>> there is no special case. We should have switched to universal plane at that
>> time.
>
> To me it seems like the chip-specific DRM drivers do need to add a
> reference in the crtc_mode_set and crtc page flip paths otherwise
> framebuffer removal crashes (expecting to remove 3 references), as
> noted by my testing and also in commit 25c8b5c304.

I think fb refcounting in exynos is just plain busted. If you look at
other drivers the only place the refcount framebuffers or backing
storage objects is for pageflips to make sure the memory doesn't go
away while the hw is still scanning out the old framebuffer. If you
refcount anywhere else you either do something really crazy or your
driver is broken.

> However, I'll be happy if universal planes means the driver does not
> have to care about this any more. Andrej, please go ahead if you are
> interested, I'll be happy to test your results.

universal planes will fix up the mess with 2 drm plane objects
(primary plane + exonys internal primary). So should help to untangle
this not, but it will not magically fix the refcounting bugs itself.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
+41 (0) 79 365 57 48 - http://blog.ffwll.ch

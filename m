From: Joonyoung Shim <jy0922.shim@samsung.com>
Subject: Re: [PATCH] drm/exynos: fix plane-framebuffer linkage
Date: Thu, 18 Sep 2014 09:42:42 +0900
Message-ID: <541A2A82.1070405@samsung.com>
References: <1410807137-8323-1-git-send-email-drake@endlessm.com>
 <20140916063501.GT4740@phenom.ffwll.local> <54192BB1.8060606@samsung.com>
 <54192EF0.5000705@samsung.com> <54193BCD.3090003@samsung.com>
 <CAD8Lp47-ho47WF-te15NZ=JHTd-zt1JxPXwQsTh_Ta_G89zrTA@mail.gmail.com>
 <CAKMK7uFuo_Sq8cjaiTopSmex6c4hMcAFrD7Ya+R059v=ThurXA@mail.gmail.com>
 <CAD8Lp458rPEAtDdZDs5KtcbP_kRUF6nTKZhk4S+q5m_41BUagA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-reply-to: <CAD8Lp458rPEAtDdZDs5KtcbP_kRUF6nTKZhk4S+q5m_41BUagA@mail.gmail.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Daniel Drake <drake@endlessm.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Seung-Woo Kim <sw0312.kim@samsung.com>, dri-devel <dri-devel@lists.freedesktop.org>, Andrzej Hajda <a.hajda@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

Hi,

On 09/18/2014 01:41 AM, Daniel Drake wrote:
> On Wed, Sep 17, 2014 at 7:45 AM, Daniel Vetter <daniel@ffwll.ch> wrote:
>> I think fb refcounting in exynos is just plain busted. If you look at
>> other drivers the only place the refcount framebuffers or backing
>> storage objects is for pageflips to make sure the memory doesn't go
>> away while the hw is still scanning out the old framebuffer. If you
>> refcount anywhere else you either do something really crazy or your
>> driver is broken.
> 
> With my patch actually the behaviour is much more similar to omapdrm,

Your patch will occur fb reference count problem when setplane.

> which also doesn't quite match your description of "other drivers".
> See omap_plane.c.
> 
> There is a fb reference taken for "pinning" in update_pin() which
> presumably is what you describe - avoid destroying the fb while it is
> being scanned out. (Maybe exynos should have something equivalent too,
> but thats a separate issue)
> 
> However there is *another* fb reference taken in
> omap_plane_mode_set(). And my patch is modelled to do the same in
> exynos-drm.
> 
> I believe this is necessary under the current model. At least, when
> drm_mode_rmfb() is running for the last user of the active
> framebuffer, it expects to drop 3 references from the framebuffer
> before dropping the 4th causes the object to be destroyed, as follows:
> 
> 1. drm_mode_rmfb explicitly drops a reference - it calls
> __drm_framebuffer_unregister which then calls
> __drm_framebuffer_unreference
>     /* Mark fb as reaped, we still have a ref from fpriv->fbs. */
>     __drm_framebuffer_unregister(dev, fb);
> 
> 2. drm_mode_rmfb then calls drm_framebuffer_remove, which calls
> drm_mode_set_config_internal() in order to turn off the CRTC, dropping
> another reference in the process.
>         if (tmp->old_fb)
>             drm_framebuffer_unreference(tmp->old_fb);
> 
> 3. drm_framebuffer_remove calls drm_plane_force_disable() which drops
> another reference:
>     /* disconnect the plane from the fb and crtc: */
>     __drm_framebuffer_unreference(old_fb);

This call is new path, before universal planes merged, private plane of
exynos crtc wasn't included in dev->mode_config.plane_list because
private plane wasn't exposed to userspace so this path wasn't called.

> 
> 4. drm_framebuffer drops the final reference itself, to cause freeing
> of the object:
>     drm_framebuffer_unreference(fb);
> 
> 
> So ordinarily, after a fb is created by drm core (with refcnt at 1),
> there would have to be 3 references added to it by the time it is the
> primary fb so that when we do rmfb, it has a refcnt of 4, and gets
> freed correctly.
> (The second bug I was seeing with pageflips was that refcnt was 3,
> which means that the final reference was dropped in (3) above, but
> __drm_framebuffer_unreference doesn't like that at all - it calls
> drm_framebuffer_free_bug)
> 
> Not being overly familiar with DRM internals I tried to go backwards
> to find out where these 3 references would be created during normal
> operation. 2 are clear:
> 
> 1. drm_framebuffer_init() explicitly grabs one:
>     /* Grab the idr reference. */
>     drm_framebuffer_reference(fb)
> 
> 2. drm_mode_set_config_internal() takes one:
>         if (tmp->primary->fb)
>             drm_framebuffer_reference(tmp->primary->fb);
> 
> Where should the 3rd one be created? I don't know, but looking at
> previous exynos commit 25c8b5c304 and omapdrm, I assumed that the drm
> driver should take one, both on crtc mode set and crtc page flip.

So Andrzej added fb reference count increasing in crtc modeset path, but
i think we can take away this workaround if remove private plane for
exynos crtc.

Thanks.

> 
>>> However, I'll be happy if universal planes means the driver does not
>>> have to care about this any more. Andrej, please go ahead if you are
>>> interested, I'll be happy to test your results.
>>
>> universal planes will fix up the mess with 2 drm plane objects
>> (primary plane + exonys internal primary). So should help to untangle
>> this not, but it will not magically fix the refcounting bugs itself.
> 
> So even when we move to universal planes (fixing 1 of the issues), its
> good that we're having this refcount discussion (which we need to
> understand to confidently solve the 2nd issue). Thanks for your input!
> 
> Daniel
> 

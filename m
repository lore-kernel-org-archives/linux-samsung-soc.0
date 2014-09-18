From: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH] drm/exynos: fix plane-framebuffer linkage
Date: Thu, 18 Sep 2014 08:33:58 +0200
Message-ID: <CAKMK7uF0ksYDrSB43RJ3B2k+iMt2fpFRbXcq3JYbvN1=iRY=Mw@mail.gmail.com>
References: <1410807137-8323-1-git-send-email-drake@endlessm.com>
 <20140916063501.GT4740@phenom.ffwll.local>
 <54192BB1.8060606@samsung.com> <54192EF0.5000705@samsung.com>
 <54193BCD.3090003@samsung.com>
 <CAD8Lp47-ho47WF-te15NZ=JHTd-zt1JxPXwQsTh_Ta_G89zrTA@mail.gmail.com>
 <CAKMK7uFuo_Sq8cjaiTopSmex6c4hMcAFrD7Ya+R059v=ThurXA@mail.gmail.com>
 <CAD8Lp458rPEAtDdZDs5KtcbP_kRUF6nTKZhk4S+q5m_41BUagA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <CAD8Lp458rPEAtDdZDs5KtcbP_kRUF6nTKZhk4S+q5m_41BUagA@mail.gmail.com>
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

On Wed, Sep 17, 2014 at 6:41 PM, Daniel Drake <drake@endlessm.com> wrote:
> However there is *another* fb reference taken in
> omap_plane_mode_set(). And my patch is modelled to do the same in
> exynos-drm.

This is because omapdrm does _everything_ asynchrously, even plain
modesets. Unfortunately that async modeset support is broken, so the
latest omapdrm patches insert a synchronization point.

So picking omap's mode_set logic as a reference because it also does
fb refcounting is not a good idea - that code does something crazy and
gets it wrong. And really, if you do modeset synchronously the drm
core will take care of your refcounting needs.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
+41 (0) 79 365 57 48 - http://blog.ffwll.ch

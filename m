From: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH V2 7/9] drm/bridge: ptn3460: add drm_panel controls
Date: Sun, 27 Apr 2014 14:55:04 +0200
Message-ID: <CAKMK7uEOo=0hhgmqztVG+nZEXLrYvg4fWFmjrUUHj+tRPhfm7A@mail.gmail.com>
References: <1398119958-32005-1-git-send-email-ajaykumar.rs@samsung.com>
 <1398119958-32005-8-git-send-email-ajaykumar.rs@samsung.com>
 <CAF6AEGtEa6rBarSXEkmZrreEKGcwTOCWhhx-OT9JmAhBhAk_Zw@mail.gmail.com>
 <CAEC9eQPiUdR_0gKVxmA8KhHD7z2AehRGOUU25e5zQz=PQyDqpA@mail.gmail.com>
 <CAEC9eQPPoU3wWgzOi6DQP=Lxq8EC-AOpRJS20uTjwZa=vfY_Rw@mail.gmail.com>
 <CAF6AEGuL3=bvBPGCDW5_db58ie23enY8VwNG7wCeQTn+JM4-Rw@mail.gmail.com>
 <CAEC9eQPtBCtUtRsHsJ4u_58PX7_UrcVJRkL4XOoM9M1sT1eiCQ@mail.gmail.com>
 <CAF6AEGspP6itAuioyQSQapvbG95MzFvJABg2UrgvNaX7hempsg@mail.gmail.com>
 <CAEC9eQOtDtwswxBV_qCmm_23TYY74PuiYt=SS+Z=vPw0ZOFijg@mail.gmail.com>
 <CAEC9eQPxsdtKZdFx91gkNbbrQM+Ch9TpguzPe55-YUFM0=zOVw@mail.gmail.com>
 <CAEC9eQPvYQqU2Xem2sCYW0tM9+d68+4WLfC47G79NUXE4kzpMg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <CAEC9eQPvYQqU2Xem2sCYW0tM9+d68+4WLfC47G79NUXE4kzpMg@mail.gmail.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Ajay kumar <ajaynumb@gmail.com>
Cc: "moderated list:ARM/S5P EXYNOS AR..." <linux-samsung-soc@vger.kernel.org>, Sean Paul <seanpaul@google.com>, sunil joshi <joshi@samsung.com>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, Prashanth G <prashanth.g@samsung.com>, Ajay Kumar <ajaykumar.rs@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

On Fri, Apr 25, 2014 at 8:17 AM, Ajay kumar <ajaynumb@gmail.com> wrote:
> We can call panel_enable/disable at the right point. Even the bridge chips
> expect the same. So, I am not ok with combining the bridge and panel and
> calling the fxn pointers from crtc_helpers.
> So, either we leave it the way it is in this patch (call drm_panel
> functions at right points) or
> we don't use drm_panel to control the panel sequence and instead use few DT
> properties and regulators, inside the bridge chip driver.

That wasn't really suggested, but instead the idea was to provide a
default drm_bridge which wraps the drm_panel so that you could more
easily chain them up.

Also I'm not really happy that the bridge callbacks have been added to
the drm helpers (I'd prefer if driver callbacks would bear that
responsibility). But you can always create your own drm_bridge
integration. In any case your concern that drivers need to control
when certain callbacks are called is shared by everyone here afaics.
And I also don't see any issues with Rob's proposal in this regard.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
+41 (0) 79 365 57 48 - http://blog.ffwll.ch

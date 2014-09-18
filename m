From: Daniel Drake <drake@endlessm.com>
Subject: Re: [PATCH] drm/exynos: fix plane-framebuffer linkage
Date: Thu, 18 Sep 2014 07:21:41 -0600
Message-ID: <CAD8Lp45NRL79jZxXda=hrdNwpa3zsTFntqW8kt5gaAXPdc9ZOw@mail.gmail.com>
References: <1410807137-8323-1-git-send-email-drake@endlessm.com>
 <20140916063501.GT4740@phenom.ffwll.local>
 <54192BB1.8060606@samsung.com> <54192EF0.5000705@samsung.com>
 <54193BCD.3090003@samsung.com>
 <CAD8Lp47-ho47WF-te15NZ=JHTd-zt1JxPXwQsTh_Ta_G89zrTA@mail.gmail.com>
 <CAKMK7uFuo_Sq8cjaiTopSmex6c4hMcAFrD7Ya+R059v=ThurXA@mail.gmail.com>
 <CAD8Lp458rPEAtDdZDs5KtcbP_kRUF6nTKZhk4S+q5m_41BUagA@mail.gmail.com>
 <CAKMK7uFGyYfwTx7+Xt2ng74QD+jUwA-tv-aW+jLsLMtk2uw3_g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <CAKMK7uFGyYfwTx7+Xt2ng74QD+jUwA-tv-aW+jLsLMtk2uw3_g@mail.gmail.com>
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
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Seung-Woo Kim <sw0312.kim@samsung.com>, dri-devel <dri-devel@lists.freedesktop.org>, Andrzej Hajda <a.hajda@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

On Thu, Sep 18, 2014 at 12:39 AM, Daniel Vetter <daniel@ffwll.ch> wrote:
> On Wed, Sep 17, 2014 at 6:41 PM, Daniel Drake <drake@endlessm.com> wrote:
>> 2. drm_mode_rmfb then calls drm_framebuffer_remove, which calls
>> drm_mode_set_config_internal() in order to turn off the CRTC, dropping
>> another reference in the process.
>>         if (tmp->old_fb)
>>             drm_framebuffer_unreference(tmp->old_fb);
>>
>> 3. drm_framebuffer_remove calls drm_plane_force_disable() which drops
>> another reference:
>>     /* disconnect the plane from the fb and crtc: */
>>     __drm_framebuffer_unreference(old_fb);
>
> If 3. here is about the primary plane then this won't happen, since
> the primary plane pointer&reference has already been cleared in step
> 2.

I just checked - as Joonyoung suspects, the plane being force disabled
in step 3 is the private exynos-drm plane. So thats an issue - but at
least now I have a complete understanding of the problem.

Sounds like that will also be fixed by moving to universal planes.
I'll wait for Andrzej's patch.

Thanks!
Daniel

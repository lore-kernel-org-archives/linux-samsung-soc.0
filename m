From: Jingoo Han <jg1.han@samsung.com>
Subject: Re: [PATCH 4/7] drm/exynos: add exynos_dp_panel driver registration to
 drm driver
Date: Mon, 21 Apr 2014 09:29:40 +0900
Message-ID: <003f01cf5cf8$c873a2a0$595ae7e0$%han@samsung.com>
References: <1397658786-26138-1-git-send-email-ajaykumar.rs@samsung.com>
 <1397658786-26138-5-git-send-email-ajaykumar.rs@samsung.com>
 <000201cf5ae4$2b073650$8115a2f0$%han@samsung.com>
 <CAEC9eQNR++vy+Hjp2Li9jBM8NgQFLAbE+8uCULqyX=+emMZRaQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-reply-to: <CAEC9eQNR++vy+Hjp2Li9jBM8NgQFLAbE+8uCULqyX=+emMZRaQ@mail.gmail.com>
Content-language: ko
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: 'Ajay kumar' <ajaynumb@gmail.com>
Cc: linux-samsung-soc@vger.kernel.org, 'Sean Paul' <seanpaul@google.com>, abrestic@chromium.org, 'sunil joshi' <joshi@samsung.com>, dri-devel@lists.freedesktop.org, a.hajda@samsung.com, 'Kyungmin Park' <kyungmin.park@samsung.com>, treding@nvidia.com, 'Prashanth G' <prashanth.g@samsung.com>, 'Ajay Kumar' <ajaykumar.rs@samsung.com>, 'Rahul Sharma' <rahul.sharma@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

On Saturday, April 19, 2014 4:51 AM, Ajay Kumar wrote:
> On Fri, Apr 18, 2014 at 2:27 PM, Jingoo Han <jg1.han@samsung.com> wrote:
> > On Wednesday, April 16, 2014 11:33 PM, Ajay Kumar wrote:

[.....]

> > > +#ifdef CONFIG_DRM_PANEL_EXYNOS_DP
> > > +     platform_driver_unregister(&exynos_dp_panel_driver);
> > > +err_unregister_dp_panel:
> > > +#endif
> > Please add platform_driver_unregister() to exynos_drm_platform_remove(),
> Right, I have missed adding it in exynos_drm_platform_remove().
> > as well as exynos_drm_platform_probe().
> I have already added for this case!

What I wanted to say is that
"Please add platform_driver_unregister() to exynos_drm_platform_remove(),
as you added it to exynos_drm_platform_probe()."

Best regards,
Jingoo Han
